<cftry>
    <cfif NOT structKeyExists(session, "userId")>
        <cflocation  url="/login.cfm">
    </cfif>
    <cfinvoke  method="getOrderDetails" component="component.component" returnVariable="order">
    <cfdump  var="#order#">
<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>
<cftry>
    <cfdocument format="PDF"
        name="pdfDoc" 
        overwrite="yes" 
        pagetype="legal" 
        marginbottom="1.0" 
        margintop="1.0" 
        marginleft="0.5" 
        marginright="0.5">

        <cfoutput>
            <h1>Invoice</h1>
            <cfloop array="#order#" index="ord">
                <cfset ordercode = ord.OrderCode>
            </cfloop>
            <h3>Order Id ###ordercode#</h3>
            <table border="2">
                <thead>
                    <tr>
                        <th>Sl No.</th>
                        <th>Product Name</th>
                        <th>Date of Purchase</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Product Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <cfset serialNumber = 1>
                    <cfloop array="#order#" index="order">
                        <tr>
                            <td>#serialNumber#</td>
                            <td>#order.productName#</td>
                            <td>#order.orderDate#</td>
                            <td>#order.productPrice#</td>
                            <td>#order.quantity#</td>
                            <td>#order.productQuantityPrice#</td>
                        </tr>
                        <cfset serialNumber += 1>
                    </cfloop>    
                </tbody>
            </table>

            <h5>Address: #order.userName#, #order.Address#</h5>
            <h5>Email Address: #order.userEmail#</h5>
            <h3>Total Amount: #order.TotalAmount#</h3>
        </cfoutput>
    </cfdocument>
<cfcatch type="any">
    <cfdump  var="#cfcatch#">
</cfcatch>
</cftry>

<cfheader name="Content-Disposition" value="attachment; filename=Invoice#url.ord#.pdf">
<cfcontent type="application/pdf" variable="#toBinary(pdfDoc)#">
<cfcontent reset="true">