
<%@page import="com.ecom.shop.entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav_css_js.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sneakare- shoe care</title>
        
        <style>
            .container
            {
            
                width: 40%;
                margin-top: 100px;
                border-radius: 5px;
               font-family: 'Poppins',sans-serif;
               
            }
            #center
            {
                text-align: center;   
                margin: 10px 0;
                letter-spacing: 2px;
            }

            .tr {
                margin-bottom: 15px;
            }

            .form-control {
                width: 100%; 
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            select {
                width: 100%; 
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            #save-form {
                display: block; 
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
    </style>

        
    </head>
    <body>
        <%
               Product p= (Product)request.getAttribute("product");
               
        %>
    <div class="container">
        <form action="updateProductServlet" method="post">
            <table>
                <h3 id="center">Edit Product</h3>
                <tr class="tr">
                    <th scope="row">Product Id : </th>
                    <td><input name="newpid" type="hidden" value="<%= p.getpId() %>" ></td>
                    
                </tr>
                <tr class="tr">
                    <th scope="row">Change Title :  </th>
                    <td><input name="newptitle" placeholder="Product Title" type="text" class="form-control" value="<%= p.getpName() %>" ></td>

                </tr>
                <tr class="tr">
                    <th scope="row">Change Description :</th>
                    <td><input name="newpdesc" placeholder="Product Description" type="text" class="form-control" value="<%= p.getpDesc() %>" ></td>

                </tr>

                <tr class="tr">
                    <th scope="row">New Price :  </th>
                    <td><input name="newpprice" type="number" value="<%= p.getpPrice() %>" ></td>
                </tr>
                
                <tr class="tr">
                    <th scope="row">Change Product Image :  </th>
                    <input type="file" id="image" name="newpimage" accept="image/*">
                </tr>

            </table>

            <div class="modal-footer">

                <button id="save-form" type="submit" class="btn btn-primary">Save</button> 
            </div>               
        </form> 
    </div>
   
    </body>
</html>
