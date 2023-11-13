<%@include file="nav_css_js.jsp" %>
<% 
     String mess= (String)session.getAttribute("message");
     if(mess!=null){
    
%>
<div class="alert alert-success" role="alert" style="font-family: 'Poppins',sans-serif">
    <%= mess %> Redirect to<a href="login.jsp" class="alert-link"> Log in </a> page.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
        session.removeAttribute("message");
        
    }
%>