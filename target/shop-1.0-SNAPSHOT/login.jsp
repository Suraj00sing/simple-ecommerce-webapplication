
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shop - logging page</title>
        <%@include file="nav_css_js.jsp" %>
    </head>
    
    <body style="background-color: rgb(239, 241, 241);">
        <div class="form">
            <form action="Login" method="post">    
                <div class="formheader">
                    <a href="index.jsp"> <img  class="img" src="images/logo.avif"></a>
                </div>
                <br>
                <%
                    String mess= (String)session.getAttribute("wrongCredentials");
                    if(mess!=null)
                    {
                           
                   %>
                   <div class="alert alert-warning" role="alert">
                       <%=  mess %>
                   </div>
                   
                   <%
                        session.removeAttribute("wrongCredentials");
                        
                       } 
                    %>
                   
                <div class="formbody">
                    <h2>Log in</h2>
                    <small>Don't have an account ? <a href="register.jsp"><span class="changefont">Sign up</span></a></small>
                    <br><br>
                    <label for="exampleInputEmail1">Email address</label>
                    <input name= "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We never share your email with anyone else.</small>
                    <br>
                    <label for="exampleInputPassword1">Password</label>
                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">

                    <button id="submit" type="submit" class="btn btn-primary">Log in</button>
                </div>
            </form>

        </div>


        
    </body>
</html>
