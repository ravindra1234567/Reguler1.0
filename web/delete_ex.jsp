<%-- 
    Document   : verifysuccess
    Created on : 15 Sep, 2018, 1:09:56 PM
    Author     : lenovo
--%>
<%@page import="java.sql.*" 
 import="java.sql.Connection"
 import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="input/logo.png">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
}
th{background-color: #e4e4e0;}
td, th {
    border: 1px solid;
    text-align: left;
    padding: 8px;
}


</style>
        <title>Payment Status</title>
        <jsp:include page="bootstrap_file.jsp" />
    </head>
    <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
<div class="menu">
  <a href="student_select.jsp">Student_Admit_Card</a>
 <!-- <a href="Register_sel.jsp">Student_Registration</a>-->
  <a href="admin.jsp">Admin</a>
  <a href="index.jsp">Home</a>
</div>
</header>
    <body style="margin-bottom: 100px;">

<a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
<%! 
    String status;
    String payment_status;
    Connection con;
    String eno,subject_code,subject_type;
    String rno;
    Statement stmt=null;
    String key[];
    String sub_types[];
    
%>
<% 
 
   ServletContext context=getServletContext();
   eno= request.getParameter("eno");
   subject_code= request.getParameter("subject");
   subject_type= request.getParameter("subject_type");
    try{
                        Class.forName(context.getInitParameter("Driver"));
                        con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
                             
                          
                       PreparedStatement ps1 =con.prepareStatement("delete from ex_student where enrollment_no=? and subject_code=? and subject_type=?" );
                   
                      
                       ps1.setString(1,eno);
                       ps1.setString(2,subject_code);
                       ps1.setString(3,subject_type);
                       int j=0;
                       j=ps1.executeUpdate();
                         
                              if(j>0)
                                 {
                                                    %>   
    <center>      <h1>Ex-Student Entry Successfully Deleted</h1></center>
    
                                 
                                    <%
                                    }
                                else
                              {
                                             %>   
    <center>      <h1>Ex-Student Entry Not Deleted</h1></center>
                                 
                                    <%
                              } 
                                   
}

        catch(Exception e)
        {
          
          e.printStackTrace();
          out.println(e);        }
               %>
    </body>
</html>