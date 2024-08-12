<cfcomponent>

    <cffunction  name="signUp" access="public" returnType="struct" hint="For user SignUp">
        <cfargument  name="form" type="any" required="true">

        <cfset local.signUpReturn = {
            "success" : 0,
            "message" : ''
        }>

        <cfquery name="local.checkEmailExists" datasource="#application.db#">
            SELECT
                Email
            FROM
                User
            WHERE
                Email = <cfqueryparam value="#arguments.form.email#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cftry>
            <cfif NOT queryRecordCount(local.checkEmailExists)>
                <cfif arguments.form.password EQ arguments.form.confirmPassword>
                    <cfquery name="local.insertAddress" datasource="ecom" result="local.getAddressPK">
                        INSERT INTO
                            Address (
                                Address,
                                address_is_active,
                                createdDate
                            )
                        VALUES (
                            <cfqueryparam value="#arguments.form.address#" cfsqltype="cf_sql_varchar">,
                            1,
                            <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                        )
                    </cfquery>

                    <cfset local.addressId = local.getAddressPK.GENERATEDKEY>
                    <cfset local.salt = createUUID()>
                    <cfset local.saltedPassword = arguments.form.password & local.salt>
                    <cfset local.hashedPassword = hash(local.saltedPassword, "SHA-256")>

                    <cfset uploadDirectory = expandpath('./uploads')>
                    <cffile action="upload"
                            destination="#uploadDirectory#" 
                            fileField="profilePicture" 
                            nameConflict="makeunique">
                    <cfset local.photo = cffile.serverfile>

                    <cfquery name="local.insertUser" datasource="#application.db#">
                        INSERT INTO 
                            User (
                                Name,
                                Email,
                                Phone,
                                imageName,
                                Password,
                                Salt,
                                user_is_active,
                                Address_idAddress,
                                createdDate
                            )
                        VALUES (
                            <cfqueryparam value="#arguments.form.fullname#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#arguments.form.email#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#arguments.form.phone#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#local.photo#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#local.hashedPassword#" cfsqltype="cf_sql_varchar">,
                            <cfqueryparam value="#local.salt#" cfsqltype="cf_sql_varchar">,
                            1,
                            <cfqueryparam value="#local.addressId#" cfsqltype="cf_sql_integer">,
                            <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                        )
                    </cfquery>

                    <cfset local.signUpReturn["message"] = "SignUp Completed Successfully...">
                    <cfset local.signUpReturn["success"] = 1>
                <cfelse>
                    <cfset local.signUpReturn["message"] = "Passwords Not matching. Try again...">
                </cfif>
            <cfelse>
                <cfset local.signUpReturn["message"] = "Email Exists. Try again with another email...">
            </cfif>
        
        <cfcatch type="any">
            <!--- <cfdump  var="#cfcatch#"> --->
            <cfset local.signUpReturn["message"] = "Unexpected Error. Try Again...">
        </cfcatch>
        </cftry>

        <cfreturn local.signUpReturn>
    </cffunction>


    <cffunction  name="logIn" access="public" returnType="struct" hint="For login">
        <cfargument  name="form" type="any" required="true">

        <cfset local.loginReturn = {
            "success" : 0,
            "message" : ''
        }>
        <cfif structKeyExists(form, "adminLogin")>    <!--- Admin login --->
            <cfquery name="local.getAdmin" datasource="#application.db#">
                SELECT
                    idAdmin,
                    AdminUserName,
                    AdminPassword
                FROM 
                    Admin
                WHERE
                    AdminUserName = <cfqueryparam value="#arguments.form.username#" cfsqltype="cf_sql_varchar">
                    AND AdminPassword = <cfqueryparam value="#arguments.form.password#" cfsqltype="cf_sql_varchar">
            </cfquery>

            <cfif queryRecordCount(local.getAdmin)>
                <cfset session.adminid = local.getAdmin.idAdmin>
                <cfset local.loginReturn["success"] = 1>
                <cfset local.loginReturn["message"] = "Admin login Successful...">
            <cfelse>
                <cfset local.loginReturn["success"] = 0>
                <cfset local.loginReturn["message"] = "Invalid Username or Password...">
            </cfif>

        <cfelse>                        <!--- User Login --->

            <cfquery name="local.getUser" datasource="#application.db#">
                SELECT 
                    Salt,
                    Password,
                    idUser
                FROM 
                    User 
                WHERE
                    Email = <cfqueryparam value="#arguments.form.email#" cfsqltype="cf_sql_varchar">
            </cfquery>

            <cfif queryRecordCount(local.getUser)>
                <cfset local.saltedPassword = arguments.form.password & local.getUser.Salt>
                <cfset local.hashedPassword = hash(local.saltedPassword, "SHA-256")>

                <cfif local.hashedPassword EQ local.getUser.Password>
                    <cfset session.userId = local.getUser.idUser>
                    <cfset local.loginReturn["success"] = 1>
                    <cfset local.loginReturn["message"] = "Password matching">
                <cfelse>
                    <cfset local.loginReturn["message"] = "Invalid Password. Try Again...">
                </cfif>
            <cfelse>
                <cfset local.loginReturn["message"] = "Invalid Email. Try Again....">
            </cfif>
        </cfif>
        
        <cfreturn local.loginReturn>
    </cffunction>


    <cffunction  name="logout" returnType="string" access="public" hint="For logout">
        <cfset local.return = "0" />
        <cfif structKeyExists(url, "logout") AND url.logout EQ "true">
            <cfset structClear(session) />
            <cfset local.return = "1" />
        </cfif>
        
        <cfreturn local.return />
    </cffunction>


    <cffunction  name="userProfile" access="public" returnType="struct" hint="for profile picture">

        <cfquery name="local.getUserProfile" datasource="#application.db#">
            SELECT 
                Usr.idUser AS idUser,
                Adr.idAddress AS idAddress,
                Usr.Name AS Name,
                Usr.Email AS Email,
                Usr.Phone AS Phone,
                Usr.imageName AS imageName,
                Adr.Address AS Address,
                Usr.Address_idAddress AS Address_idAddress
            FROM 
                User AS Usr
            INNER JOIN 
                Address AS Adr 
                ON Usr.Address_idAddress = Adr.idAddress
            WHERE
                Usr.idUser = <cfqueryparam value="#session.userId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfset local.userProfileStruct = {
            "idUser" : local.getUserProfile.idUser,
            "idAddress" : local.getUserProfile.idAddress,
            "Name" : local.getUserProfile.Name,
            "Email" : local.getUserProfile.Email,
            "Phone" : local.getUserProfile.Phone,
            "imageName" : local.getUserProfile.imageName,
            "Address" : local.getUserProfile.Address
        }>
        <cfreturn local.userProfileStruct>
    </cffunction>

</cfcomponent>