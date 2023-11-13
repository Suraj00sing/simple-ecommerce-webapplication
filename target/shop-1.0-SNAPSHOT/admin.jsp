


<%@page import="com.ecom.shop.entities.Product"%>
<%@page import="com.ecom.shop.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.shop.helper.FactoryProvider"%>
<%@page import="com.ecom.shop.dao.Userdao"%>
<%@page import="com.ecom.shop.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="nav_css_js.jsp" %>
<%
      User user= (User)request.getAttribute("users");
      User u= (User)session.getAttribute("currentuser");
       if(u==null)
       {
            session.setAttribute("wrongCredentials", "You need to log in first !");
            response.sendRedirect("login.jsp");
            return;
            
       }else{
              if(u.getUserType().equals("normal"))
              {
                  session.setAttribute("wrongCredentials", "You cannot access normal admin's page directly! Need to log in first");
                  response.sendRedirect("login.jsp");
                  return;
              }
               
      }
    
    %>
<!DOCTYPE html>
<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shop - admin page</title>
        <style>
            .adminnav
            {
                display: flex;
                justify-content: space-around;
                align-items: center;
                margin: 30px 0;
            }
            .adminlogo img
            {
                width: auto;
                height: 70px;
            }
            .profile .fa-search
            {
                font-size: 1.5rem;
                margin-left: 180px;
                padding: 0 50px;
            }
            .profile .fa-user-o
            {
                font-size: 1.5rem;
                list-style: none;
                text-decoration: none;
                color: black;
            }
            
            .card
            {
                cursor: pointer;
            }

            .icon
            {
                font-size: 1.2rem;
                color: red;
            }
            
            
            
        </style>
    </head>
    <body>
        
    <header id="adminheader">
    
    <nav class="adminnav">
       <div class="adminlogo">
           <a href="admin.jsp"> <img src="images/logo.avif"></a>
        </div>
           
            <div class="profile">
                 <i class="fa fa-search" aria-hidden="true"></i>
                 <a href="login.jsp"><i class="fa fa-user-o" aria-hidden="true"> -<span class="fa fa-sort-desc"></span></i></a>
            </div>
    </nav>
    </header>
        
        <!-- Large modal -->

        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       
                    </div>
                    
                </div>
            </div>
        </div>
        
        <main>
            
            <%
                Userdao dao= new Userdao(FactoryProvider.getFactory());
                List<User> list= dao.getAllUser();
                List<Category> cat= dao.getAllCategory();
                List<Product> prod = dao.getAllProduct();
                %>
          <div class="container">
              
            <div class="container">
    <div class="row">
        <div class="col-md-4">
            <a href="showallusers.jsp">
                <div class="card" data-toggle="modal" data-target=".abd-example-modal-lg" style="width: 100%;color: black;text-decoration: none;list-style: none">
                    <div class="card-body text-center">
                        <img style="max-width: 120px; border-radius: 50%; background-color: #d3d3d3;" class="img-fluid" src="images/users.png">
                        <h3><%=  list.size() %></h3>
                        <h1>Users</h1>
                    </div>
                </div>
            </a>
        </div>
                        
         <div class="col-md-4">
             <a href="showallcategory.jsp">
                <div class="card" data-toggle="modal" data-target=".abd-example-modal-lg" style="width: 100%;color: black;text-decoration: none;list-style: none">
                    <div class="card-body text-center">
                        <img style="max-width: 120px; border-radius: 50%; background-color: #d3d3d3;" class="img-fluid" src="images/category.png">
                        <h3><%=  cat.size() %></h3>
                        <h1>Category</h1>
                    </div>
                </div>
            </a>
        </div>
                        
         <div class="col-md-4">
             <a href="showallproducts.jsp">
                <div class="card" data-toggle="modal" data-target=".abd-example-modal-lg" style="width: 100%;color: black;text-decoration: none;list-style: none">
                    <div class="card-body text-center">
                        <img style="max-width: 120px; border-radius: 50%; background-color: #d3d3d3;" class="img-fluid" src="images/product.png">
                        <h3><%= prod.size() %></h3>
                        <h1>Products</h1>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>     
            
        </main>       
    
        
    </body>
</html>
