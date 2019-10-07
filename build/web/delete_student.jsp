<%-- 
    Document   : verifysuccess
    Created on : 15 Sep, 2018, 1:09:56 PM
    Author     : Ravindra
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
        <link rel="icon" href="image/logo.png">
        <link rel="stylesheet" type="text/css" href="css/index.css">
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/sol.css">
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
    String roll_no;
    String rno;
    Statement stmt=null;
    
%>
<% 
 
   ServletContext context=getServletContext();
   roll_no= request.getParameter("roll_no");
   //out.println(roll_no);
    try{
                        Class.forName(context.getInitParameter("Driver"));
                        con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
                             
                          
                       PreparedStatement ps1 =con.prepareStatement("delete from all_students  where roll_no=? " );
                      
                   
                      
                       ps1.setString(1,roll_no);
                         //ps1.setString(2,roll_no);
                       int j=0;
                       j=ps1.executeUpdate();
                      
                         
                              if( j > 0)
                                 {
                                                    %>   
    <center>      <h1>Student Entry Successfully Deleted</h1></center>
                                 
                                    <%
                                    }
                                else
                              {
                                             %>   
    <center>      <h1>Student Entry Not Deleted</h1>
    </center>
                                 
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