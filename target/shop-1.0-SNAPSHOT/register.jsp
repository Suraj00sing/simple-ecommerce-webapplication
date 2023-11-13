
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shop - registration page</title>
        <%@include file="nav_css_js.jsp" %>
    </head>
    <body style="background-color: rgb(239, 241, 241);">
        <div class="form">
           
            <form action="Register" method="post">   
                
                <div class="formheader">
                    <a href="index.jsp"><img src="images/logo.avif"></a>
                </div>
                <br>
                
                <%@include file="message.jsp" %>
                <div class="formbody">
                    <h2>Sign up</h2>
                    <small>Already have an account ? <a href="login.jsp"><span class="changefont">log in</span></a></small>
                    <br><br>
                    
                    <label for="exampleInputEmail1">Username*</label>
                    <input type="text" name="user_name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter username">
                    
                    <br>
                     <label for="exampleInputEmail1">Phone no.*</label>
                    <input type="text" name="user_phone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="9999999999">
                    
                    <br>
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We never share your email with anyone else.</small>
                    
                    <br>
                    <label for="exampleInputPassword1">Password*</label>
                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">

                    <button id="submit" type="submit" class="btn btn-primary">Sign up</button>
                </div>
            </form>

        </div>
    </body>
</html>
