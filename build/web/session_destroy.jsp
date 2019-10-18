<%-- 
    Document   : session_destroy
    Created on : 19 Oct, 2019, 3:20:20 AM
    Author     : Ravindra
--%>
<%
session.invalidate(); 
response.sendRedirect("admin.jsp");
%>