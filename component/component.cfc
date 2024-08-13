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


    <cffunction  name="addAndEditProducts" access="public" returnType="void">
        <cfargument  name="form" type="any" required="true">

        <cfif structKeyExists(form, "categoryName")>            <!--- Adding category Name --->
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

        <cfif structKeyExists(form, "cat_categoryName") AND structKeyExists(form, "cat_categoryId")>        <!--- Edit category --->
            <cfquery name="local.editCategory" datasource="#application.db#">
                UPDATE 
                    Category
                SET 
                    nameCategory = <cfqueryparam value="#arguments.form.cat_categoryName#" cfsqltype="cf_sql_varchar">,
                    Admin_edited = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">
                WHERE
                    idCategory = <cfqueryparam value="#arguments.form.cat_categoryId#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "subCategoryName")>             <!--- Adding subcategory --->
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

        <cfif structKeyExists(form, "sub_subCategoryName") AND structKeyExists(form, "sub_subCategoryId")>      <!--- Edit Subcategory --->
            <cfquery name="local.editSubCategory" datasource="#application.db#">
                UPDATE 
                    Sub_Category
                SET 
                    nameSubCategory = <cfqueryparam value="#arguments.form.sub_subCategoryName#" cfsqltype="cf_sql_varchar">,
                    Category_idCategory = <cfqueryparam value="#arguments.form.sub_mainCategory#" cfsqltype="cf_sql_integer">,
                    Admin_isEdited = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">
                WHERE
                    idSubcategory = <cfqueryparam value="#arguments.form.sub_subCategoryId#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "productName")>             <!--- Adding Products --->
            <cfset uploadDirectory = expandpath('/images/thumbnail')>
            <cffile  action="upload"
                destination="#uploadDirectory#" 
                fileField="form.thumbnail" 
                nameConflict="makeunique">
            <cfset local.thumbnail = cffile.serverfile>

            <cfquery name="local.addProducts" datasource="#application.db#">
                INSERT INTO 
                    Products (
                        nameProduct,
                        Description,
                        Price,
                        Sub_Category_idSubcategory,
                        admin_Created,
                        thumbnail

                    )
                VALUES (
                    <cfqueryparam value="#arguments.form.productName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.form.productDesc#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.form.productPrice#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#arguments.form.subcat#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#local.thumbnail#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "pro_productName") AND structKeyExists(form, "pro_productId")>      <!--- Edit Products --->
            <cfquery name="local.editProducts" datasource="#application.db#">
                UPDATE 
                    Products
                SET 
                    nameProduct = <cfqueryparam value="#arguments.form.pro_productName#" cfsqltype="cf_sql_varchar">,
                    Description = <cfqueryparam value="#arguments.form.pro_productDesc#" cfsqltype="cf_sql_varchar">,
                    Price = <cfqueryparam value="#arguments.form.pro_productPrice#" cfsqltype="cf_sql_integer">,
                    Sub_Category_idSubcategory = <cfqueryparam value="#arguments.form.pro_subcategory#" cfsqltype="cf_sql_integer">
                WHERE
                    idProducts = <cfqueryparam value="#arguments.form.pro_productId#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "productImage")>            <!--- Adding Image for products --->
            <cfset uploadDirectory = expandpath('/images/products')>
            <cffile  action="upload"
                destination="#uploadDirectory#" 
                fileField="form.productImage" 
                nameConflict="makeunique">
            <cfset local.proImage = cffile.serverfile>

            <cfquery name="local.addImages" datasource="#application.db#">
                INSERT INTO 
                    productImage (
                        imageName,
                        Products_idProducts
                    )
                VALUES (
                    <cfqueryparam value="#local.proImage#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.form.productId#" cfsqltype="cf_sql_integer">
                )
            </cfquery>
        </cfif>

        <cfif structKeyExists(form, "img_imageName") AND structKeyExists(form, "img_imageId")>      <!--- Edit Images --->
            <cfif len(arguments.form.img_imageName)>
                <cfset uploadDirectory = expandpath('/images/products')>
                <cffile  action="upload"
                    destination="#uploadDirectory#" 
                    fileField="form.img_imageName" 
                    nameConflict="makeunique">
                <cfset local.proImage = cffile.serverfile>
            <cfelse>
                <cfset local.proImage = arguments.form.img_oldImage>
            </cfif>
            
            <cfquery name="local.editImages" datasource="#application.db#">
                UPDATE 
                    productImage
                SET 
                    imageName = <cfqueryparam value="#local.proImage#" cfsqltype="cf_sql_varchar">,
                    Products_idProducts = <cfqueryparam value="#arguments.form.img_productId#" cfsqltype="cf_sql_integer">
                WHERE
                    idproductImage = <cfqueryparam value="#arguments.form.img_imageId#" cfsqltype="cf_sql_integer">
            </cfquery>

        </cfif>
    </cffunction>


    <cffunction  name="deleteProduct" access="remote" returnformat="JSON" hint="for Delete items">
        <cfargument  name="imgid" type="numeric" required="false">
        <cfargument  name="proid" type="numeric" required="false">

        <cfif structKeyExists(arguments, "imgid")>      <!--- imgage delete --->
            <cfquery name="local.deleteImage" datasource="#application.db#">
                UPDATE 
                    productImage
                SET 
                    image_is_delete = 1
                WHERE 
                    idproductImage = <cfqueryparam value="#arguments.imgid#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfif> 

        <cfif structKeyExists(arguments, "proid")>        <!--- product delete --->
            <cfquery name="local.deleteProduct" datasource="#application.db#">
                UPDATE 
                    Products
                SET 
                    product_is_active = 0,
                    admin_deleted = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    deletedDate = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE 
                    idProducts = <cfqueryparam value="#arguments.proid#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfquery name="local.deleteImage" datasource="#application.db#">
                UPDATE 
                    productImage
                SET 
                    image_is_delete = 1
                WHERE 
                    Products_idProducts = <cfqueryparam value="#arguments.proid#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfif> 

        <cfif structKeyExists(arguments, "subid")>      <!--- sub category delete --->
            <cfquery name="local.deletesubCategory" datasource="#application.db#">
                UPDATE 
                    Sub_Category
                SET 
                    Sub_Category_is_delete = 1,
                    Admin_isDeleted = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    deletedDate = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE 
                    idSubcategory = <cfqueryparam value="#arguments.subid#" cfsqltype="cf_sql_integer">
            </cfquery>

            <cfquery name="local.deleteProduct" datasource="#application.db#">
                UPDATE 
                    Products
                SET 
                    product_is_active = 0,
                    admin_deleted = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    deletedDate = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE 
                    Sub_Category_idSubcategory = <cfqueryparam value="#arguments.subid#" cfsqltype="cf_sql_integer">
            </cfquery>
        </cfif> 

        <cfif structKeyExists(arguments, "catid")>
            <cfquery name="local.deleteCategory" datasource="#application.db#">
                UPDATE 
                    Category
                SET 
                    category_is_active = 0,
                    Admin_deleted = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    deletedDate = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE 
                    idCategory = <cfqueryparam value="#arguments.catid#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfquery name="local.deletesubCategory" datasource="#application.db#">
                UPDATE 
                    Sub_Category
                SET 
                    Sub_Category_is_delete = 1,
                    Admin_isDeleted = <cfqueryparam value="#session.adminid#" cfsqltype="cf_sql_integer">,
                    deletedDate = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                WHERE 
                    Category_idCategory = <cfqueryparam value="#arguments.catid#" cfsqltype="cf_sql_integer">
            </cfquery>

        </cfif>
        
    </cffunction>


    <cffunction  name="getCategories" access="remote" returnformat="JSON">
        <cfargument  name="catid" type="numeric" required="false">
        <cfargument  name="subid" type="numeric" required="false">
        <cfargument  name="proid" type="numeric" required="false">
        <cfargument  name="img" type="numeric" required="false">

        <cfset local.CategoryArray = []>
        <cfset local.ProductArray = []>
        <cfset local.return = []>
        <cfquery name="local.getCategory" datasource="#application.db#">
            SELECT 
                ctr.nameCategory AS categoryName,
                ctr.idCategory AS categoryId,
                sub.nameSubCategory AS subCategoryName,
                sub.idSubcategory AS subCategoryId,
                sub.Sub_Category_is_delete AS sub_is_delete
            FROM
                Category AS ctr
            LEFT JOIN 
                Sub_Category AS sub
                ON
                    ctr.idCategory = sub.Category_idCategory
            WHERE 
                <cfif structKeyExists(arguments, "catid")>
                    ctr.idCategory = <cfqueryparam value="#arguments.catid#" cfsqltype="cf_sql_integer">
                    AND 
                <cfelseif structKeyExists(arguments, "subid")>
                    sub.idSubcategory = <cfqueryparam value="#arguments.subid#" cfsqltype="cf_sql_integer">
                    AND 
                </cfif>
                (ctr.category_is_active = 1)
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
                    "Name" : local.getCategory.subCategoryName,
                    "is_delete" : local.getCategory.sub_is_delete
                })>
            </cfloop>
            <cfset arrayAppend(local.CategoryArray, local.structCategory)>
        </cfloop>
        <cfset arrayAppend(local.return, local.CategoryArray)>

        <cfquery name="local.getProducts" datasource="#application.db#">
            SELECT
                distinct(pdt.idProducts) AS productId,
                pdt.nameProduct AS productName,
                pdt.Description AS productDescription,
                pdt.Price AS productPrice,
                pdt.thumbnail AS thumbnail,
                sub.nameSubCategory AS subCategoryName,
                sub.idSubcategory AS subCategoryId,
                img.idproductImage AS imageId,
                img.imageName AS imageName,
                img.image_is_delete AS image_is_delete,
                sub.Sub_Category_is_delete AS sub_is_delete
            FROM 
                Products AS pdt
            INNER JOIN 
                Sub_Category AS sub 
                ON sub.idSubcategory = pdt.Sub_Category_idSubcategory
            LEFT JOIN 
                productImage AS img
                ON img.Products_idProducts = pdt.idProducts
            WHERE
                pdt.product_is_active = 1
                <cfif structKeyExists(arguments, "proid")>
                    AND pdt.idProducts = <cfqueryparam value="#arguments.proid#" cfsqltype="cf_sql_integer">
                </cfif>
                <cfif structKeyExists(arguments, "imgid")>
                    AND img.idproductImage = <cfqueryparam value="#arguments.imgid#" cfsqltype="cf_sql_integer">
                </cfif>
                <cfif structKeyExists(url, "subid")>
                    AND sub.idSubcategory = <cfqueryparam value="#url.subid#" cfsqltype="cf_sql_integer">
                </cfif>
                <cfif structKeyExists(url, "id")>
                    AND pdt.idProducts = <cfqueryparam value="#url.id#" cfsqltype="cf_sql_integer">
                </cfif>
            ORDER BY productId
        </cfquery>

        <cfloop query="local.getProducts" group="productId">
            <cfset local.structProduct = {
                "productId" : local.getProducts.productId,
                "productName" : local.getProducts.productName,
                "productDescription" : local.getProducts.productDescription,
                "productPrice" : local.getProducts.productPrice,
                "subCategoryName" : local.getProducts.subCategoryName,
                "subCategoryId" : local.getProducts.subCategoryId,
                "sub_is_delete" : local.getProducts.sub_is_delete,
                "thumbnail" : local.getProducts.thumbnail,
                "image" : []
            }>
            <cfloop>
                <cfset local.imageStruct ={
                    "imageId" : local.getProducts.imageId,
                    "imageName" : local.getProducts.imageName,
                    "is_delete" : local.getProducts.image_is_delete
                }>
                <cfset arrayAppend(local.structProduct.image, local.imageStruct)>
            </cfloop>
            <cfset arrayAppend(local.ProductArray, local.structProduct)>
        </cfloop>
        <cfset arrayAppend(local.return, local.ProductArray)>
        <cfreturn local.return>
    </cffunction>

</cfcomponent>