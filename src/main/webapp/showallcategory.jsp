
<%@page import="java.util.List"%>
<%@page import="com.ecom.shop.entities.Category"%>
<%@page import="com.ecom.shop.dao.Userdao"%>
<%@page import="com.ecom.shop.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav_css_js.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        
        <style>
            .container
            {
               
                font-family: 'Poppins',sans-serif;
                margin-top: 80px;
                width: 45%;
                
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
            
            #butt
            {
                font-family: 'Poppins',sans-serif;
                padding: 10px 10px;
                margin-bottom: 5px;
            }
            .modal-body
            {
                 font-family: 'Poppins',sans-serif;
            }
            
        </style>
        
    </head>
    <body style="background-color: #f5f5f5">
        
        <%
            Userdao dao= new Userdao(FactoryProvider.getFactory());
            List<Category> list= dao.getAllCategory();
            
            %>
        
            

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="AddCategoryServlet" method="get">
                                <label for="exampleInputTitle">Title</label>
                                <input name= "title" type="text" class="form-control" placeholder="Category Title"> 
                                <br>
                                <label for="exampleInputEmail1">Description</label>
                                <input name= "description" type="text" class="form-control" placeholder="Category Description">
                                    
                            
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Category</button>
                        </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
        <div class="container">
             <!-- Button trigger modal -->
                            <button id= "butt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                Add Category
                            </button>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Description</th>
                        <th scope="col">Delete</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                
                <tbody>
                    
                    <%
                        for(Category c: list)
                        {
                        
                        
                        %>
                    <tr>
                        <td><%= c.getCategoryTitle() %></td>
                        <td><%= c.getCategoryDescription() %></td>
                        <td><a id= "deleteicon" href="DeleteCategoryServlet?id=<%= c.getCategoryId()%>"><span class="fa fa-remove"></span></a></td>
                    </tr>
                    
                    <%
                        
                        }
                    %>
                </tbody>
            </table>    
        </div>
        
    </body>
</html>
