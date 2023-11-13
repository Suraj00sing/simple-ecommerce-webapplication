
<%@page import="com.ecom.shop.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
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
            User u= (User)request.getAttribute("user");
            
            %>
    <div class="container">
        <form action="updateUserServlet" method="post">
            <table>
                <h3 id="center">Edit Profile</h3>
                <tr class="tr">
                    <th scope="row">User Id : </th>
                    <td><input name="userId" type="hidden" value="<%= u.getUserId() %>" ></td>
                    
                </tr>
                <tr class="tr">
                    <th scope="row">Change Username : </th>
                    <td><input name="newUsername" type="text" class="form-control" value="<%= u.getUserName() %>" ></td>

                </tr>
                <tr class="tr">
                    <th scope="row">Change Email :</th>
                    <td><input name="newEmail" type="text" class="form-control" value="<%= u.getUserEmail() %>" ></td>

                </tr>

                <tr class="tr">
                    <th scope="row">Change Phone no. :</th>
                    <td><input name="newPhone" type="text" value="<%= u.getUserPhone() %>" ></td>
                <a href="../java/com/ecom/shop/servlets/updateUserServlet.java"></a>

                </tr>
                
                <tr class="tr">
                    <th scope="row">Change User Type :</th>
                    <td>
                        <select name="userType">
                            <option value="normal">normal</option>
                            <option value="admin">admin</option>
                        </select>
                    </td>

                </tr>


            </table>

            <div class="modal-footer">

                <button id="save-form" type="submit" class="btn btn-primary">Save</button> 
            </div>               
        </form> 
    </div>
                    
    </body>
</html>
