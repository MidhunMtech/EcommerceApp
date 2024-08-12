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


    <cffunction  name="addProducts" access="public" returnType="void">
        <cfargument  name="form" type="any" required="true">

        <cfif structKeyExists(form, "categoryName")>
            <cfquery name="local.addCategory" datasource="#application.db#">
                INSERT INTO
                    Category(
                        nameCategory,
                        Admin_created,
                        createdDate
                    )
                VALUES (
                    <cfqueryparam value="#arguments.form.categoryName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                )
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "subCategoryName")>
            <cfquery name="local.addsubCategory" datasource="#application.db#">
                INSERT INTO 
                    Sub_Category (
                        nameSubCategory,
                        Category_idCategory,
                        Admin_isCreated,
                        createdDate
                    )
                VALUES (
                    <cfqueryparam value="#arguments.form.subCategoryName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.form.categoryId#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                )
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "productName")>
            <cfquery name="local.addProducts" datasource="#application.db#">
                INSERT INTO 
                    Products (
                        nameProduct,
                        Description,
                        Price,
                        Sub_Category_idSubcategory,
                        admin_Created

                    )
                VALUES (
                    <cfqueryparam value="#arguments.form.productName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.form.productDesc#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.form.productPrice#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#arguments.form.subcat#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">
                )
            </cfquery>
        </cfif>
    </cffunction>


    <cffunction  name="getCategories" access="remote" returnformat="JSON">
        <cfargument  name="catid" type="numeric" required="false">
        <cfargument  name="subid" type="numeric" required="false">

        <cfset local.CategoryArray = []>
        <cfset local.ProductArray = []>
        <cfset local.return = []>
        <cfquery name="local.getCategory" datasource="#application.db#">
            SELECT 
                ctr.nameCategory AS categoryName,
                ctr.idCategory AS categoryId,
                sub.nameSubCategory AS subCategoryName,
                sub.idSubcategory AS subCategoryId
                <!---pdt.idProducts AS productId,
                pdt.nameProduct AS productName,
                pdt.Description AS productDescription,
                pdt.Price AS productPrice--->
            FROM
                Category AS ctr
            LEFT JOIN 
                Sub_Category AS sub
                ON
                    ctr.idCategory = sub.Category_idCategory
            <!---LEFT JOIN 
                Products AS pdt
                ON 
                    sub.idSubcategory = pdt.Sub_Category_idSubcategory--->
            WHERE 
                <cfif structKeyExists(arguments, "catid")>
                    ctr.idCategory = <cfqueryparam value="#arguments.catid#" cfsqltype="cf_sql_integer">
                    AND 
                <cfelseif structKeyExists(arguments, "subid")>
                    sub.idSubcategory = <cfqueryparam value="#arguments.subid#" cfsqltype="cf_sql_integer">
                    AND 
                </cfif>
                (ctr.category_is_active = 1
                OR sub.Sub_Category_is_delete = 0)
            ORDER BY 
                categoryId
        </cfquery>
        <cfloop query="local.getCategory" group="categoryId">
            <cfset local.structCategory = {
                "categoryName" : local.getCategory.categoryName,
                "categoryId" : local.getCategory.categoryId,
                "subCategory" : []
            }>
            <cfloop>
                <cfset arrayAppend(local.structCategory.subCategory, {
                    "Id" : local.getCategory.subCategoryId,
                    "Name" : local.getCategory.subCategoryName
                })>
            </cfloop>
            <cfset arrayAppend(local.CategoryArray, local.structCategory)>
        </cfloop>
        <cfset arrayAppend(local.return, local.CategoryArray)>

        <cfquery name="local.getProducts" datasource="#application.db#">
            SELECT
                pdt.idProducts AS productId,
                pdt.nameProduct AS productName,
                pdt.Description AS productDescription,
                pdt.Price AS productPrice
            FROM 
                Products AS pdt
            WHERE
                pdt.product_is_active = 1
        </cfquery>

        <cfloop query="local.getProducts">
            <cfset local.structProduct = {
                "productId" : local.getProducts.productId,
                "productName" : local.getProducts.productName,
                "productDescription" : local.getProducts.productDescription,
                "productPrice" : local.getProducts.productPrice
            }>
            <cfset arrayAppend(local.ProductArray, local.structProduct)>
        </cfloop>
        <cfset arrayAppend(local.return, local.ProductArray)>
        <cfreturn local.return>
    </cffunction>

</cfcomponent>