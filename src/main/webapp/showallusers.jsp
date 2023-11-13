
<%@page import="java.util.List"%>
<%@page import="com.ecom.shop.entities.User"%>
<%@page import="com.ecom.shop.helper.FactoryProvider"%>
<%@page import="com.ecom.shop.dao.Userdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .container
            {
                font-family: 'Poppins',sans-serif;
                margin-top: 80px;
                
            }
            .container .table
            {
                text-align: center;
                background-color: #fff;
            }
            #editicon
            {
                font-size: 1.3rem;
                
            }
            
            #deleteicon
            {
                font-size: 1.3rem;
                color: red;
            }
            
            
            
        </style>
        
    </head>
    <body style="background-color: #f5f5f5">
        <%
            Userdao dao= new Userdao(FactoryProvider.getFactory());
            List<User> list= dao.getAllUser();
            
            %>
           
        <div class="container">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone no.</th>
                        <th scope="col">User Type</th>
                        <th scope="col">Edit /Update</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(User u: list)
                        {
                                                                 
                        %>
                    <tr>
                        <td><%= u.getUserName() %></td>
                        <td><%= u.getUserEmail() %>
                        <td><%= u.getUserPhone() %></td>
                        <td><%= u.getUserType() %></td>
                        <td><a id= "editicon" href="EditUserServlet?id=<%= u.getUserId() %>" ><span class="fa fa-pencil-square-o"></span></a></td>
                        <td><a id= "deleteicon" href="DeleteUserServlet?id=<%= u.getUserId() %>"><span class="fa fa-remove"></span></a></td>
                        
                    
                    <%
                            
                        }
                        %>
                </tbody>
            </table>
        </div> 
                
                        

                                                    
           
    </body>
</html>
