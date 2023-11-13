
<%@page import="com.ecom.shop.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.shop.helper.FactoryProvider"%>
<%@page import="com.ecom.shop.dao.Userdao"%>
<%@page import="com.ecom.shop.entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav_css_js.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sneakare- shoe care</title>
        
        <style>
            
            #butt{
                padding: 6px 9px;
                margin-bottom: 10px;
                font-family: 'Poppins',sans-serif;
            }
            .card-container {
            background-color: #f8f9fa; /* Set a background color for the card container */
            padding: 20px; /* Add padding to the container */
           
        }
      
        .card {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s; /* Add a smooth transition effect */
        }

        .card:hover {
            transform: scale(1.05); /* Add a slight scale effect on hover */
        }
        
        .card-img-container {
            height: 300px; /* Set a maximum height for the image container */
            overflow: hidden; /* Hide any overflow beyond the maximum height */
        }


        .card img {
            width: 100%;
            object-fit: cover;
            border-radius: 8px 8px 0 0; /* Adjust border-radius for the top corners */
        }

        .card-body {
            padding: 10px;
            height:180px;
            font-family: 'Poppins',sans-serif;
        }
        
        .card-body .icons{
            display: flex;
            justify-content: end;
            
        }
        .icons .fa-pencil-square-o{
            margin: 0px 8px;
            color: blue;
            font-size: 23px;
        }
        .icons .fa-remove{
            margin: 0px 8px;
            color: red;
            font-size: 23px;
        }
        
        .modal-content .modal-body{
            font-family: 'Poppins',sans-serif;
        }

        h5, p {
            margin: 0;
        }

        .btn-primary {
            background-color: #007bff; /* Customize the primary button color */
            border-color: #007bff;
        }
        
        .price{
            display: flex;
            margin-top: 5px;
        }
        
        .rupee{
            font-size: 20px;
        }
       
        </style>
    </head>
    <body>      
        
       
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
                            <%
                                Userdao dao = new Userdao(FactoryProvider.getFactory());
                                List<Category> list = dao.getAllCategory();

                            %>
                            
                            
                            <form action="AddProductServlet" method="POST" enctype="multipart/form-data">
                                <select class="form-control" name="catid">
                                    <option selected disabled>-------- Select Category --------</option>
                                    <%
                                        for(Category c: list)
                                        {
                                        
                                    %>
                                        
                                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                        
                                    <%
                                            }
                                    %>
                                </select>
                                
                                <br>
                                
                                <label for="exampleInputTitle">Title</label>
                                <input name= "ptitle" type="text" class="form-control" placeholder="Category Title"> 
                                <br>
                                
                                <label for="exampleInputEmail1">Description</label>
                                <input name= "pdescription" type="text" class="form-control" placeholder="Category Description">
                                <br>
                                
                                <div style="display: flex; align-items: center">                                    
                                ₹ &nbsp; &nbsp;<input name= "pprice" type="number" class="form-control" placeholder="M.R.P">                            
                                </div>
                                <br>
                         
                                <label for="exampleInputTitle">Product Image: </label>
                                &nbsp;<input type="file" id="image" name="pimage" accept="image/*">
                                   
                                <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Add Product</button>
                                </div>
                            </form>                           
                      
                        </div>
                    </div>
                </div>
            </div>
    
        <div class="container card-container">
            
                <button id= "butt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    Add Products
                </button>
            
            <!--1 card-->
            
            <%
                List<Product> product= dao.getAllProduct();
               
            %>
            <div class="row">
                <%      
                           for (Product p : product) {
                    %>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-img-container">
                            <img class="card-img-top" src="images/product/<%= p.getpPhoto()%>" alt="Card image cap">                                  
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getpName() %></h5>
                            <p class="card-text"><%= p.getpDesc() %></p>
                            <div class="price">
                                 <span class="rupee">&#8377;</span><h5><%= p.getpPrice() %></h5>
                            </div>
                           <div class="icons">
                               <a id= "editicon" href="EditProductServlet?id=<%= p.getpId() %>" ><span class="fa fa-pencil-square-o"></span></a>
                               <a id= "deleteicon" href="DeleteProductServlet?id=<%= p.getpId() %>" ><span class="fa fa-remove"></span></a>
                           </div>
                        </div>
                    </div>
                    
                </div>
                <%
                        }
                    %>
            </div>     
        </div>
             
    </body>
</html>
