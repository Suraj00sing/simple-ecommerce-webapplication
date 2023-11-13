

<%@page import="com.ecom.shop.entities.User"%>
<%@include file="nav_css_js.jsp" %>

<%
    
User u = (User) session.getAttribute("currentuser");
    if (u == null) {
        session.setAttribute("wrongCredentials", "You need to log in First!");
        response.sendRedirect("login.jsp");
        return;

    } else {
        if (u.getUserType().equals("admin")) {
            session.setAttribute("wrongCredentials", "You cannot access normal user's account");
            response.sendRedirect("login.jsp");
            return;
        }

    }
      
      
      %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sneakare- shoe care</title>
        
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
            
            
            .heading{
                display: flex;
                justify-content: center;
                font-family: 'Poppins',sans-serif;  
                font-size: 28px;
                font-weight: 600;
                margin: 15px 0;
                color: black;
            }
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
            height:150px;
            font-family: 'Poppins',sans-serif;
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
        
        <div class="heading">All Categories</div>
    </body>
</html>
