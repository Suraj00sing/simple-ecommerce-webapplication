

<%@page import="com.ecom.shop.entities.User"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is normal user page welcome. </h1>
    </body>
</html>
