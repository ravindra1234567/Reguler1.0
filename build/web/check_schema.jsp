<%-- 
    Document   : check_schema
    Created on : 8 Sep, 2019, 1:06:46 AM
    Author     : Ravindra
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="input/logo.png">
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
<!--  <a href="student_select.jsp">Student_Admit_Card</a>-->
 <!-- <a href="Register_sel.jsp">Student_Registration</a>-->
  <a href="admin.jsp">Admin</a>
  <a href="index.jsp">Home</a>
</div>
</header>
    <body style="margin-bottom: 100px;">
        <%! HttpSession session1;
        String subjectcode;
        String subjectname;
        String theory;
        String practical ;
        String branch;
        String course;
        int sem;
        String coursetype ;
        String query;
        PreparedStatement pd;
        ResultSet rs;
          
        String photourl;
        String transection_id;
        %>
         <% 
               ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
             try{
      /*    session1=request.getSession();
        
    uname=(String)session1.getAttribute("uname");
    
      pass=(String)session1.getAttribute("pass");
  
      // session1.invalidate();
       
      if(uname==null||pass==null)
      {
          response.sendRedirect("admin.jsp");
      }
         */                       
       
          
           
           
               
      //  payment_status=request.getParameter("payment_status");
      
        sem= Integer.parseInt(request.getParameter("sem"));
       // status=request.getParameter("status");
     
        branch=request.getParameter("branch");
        course=request.getParameter("course");
        coursetype=request.getParameter("ctype");
        
        
           
        %>
        
     
        
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
           <table border radius="1" style="border-collapse:collapse;margin-top: 10px;" width="800px" >
               <tr>
                   
                    <th><center>Sno.</center></th>
                   <th><center>Subject Code</center></th>
                   <th><center>Subject Name</center></th>
                   <th><center>Theory Credit</center></th>
                   <th><center>Practical Credit</center></th>
                    <th><center>Course</center></th>
                   <th><center>Course Type</center></th>
               </tr>
        <%    
            query="select  subject_code,subject_name,theory_credits,practical_credits,course,sem ,coursetype from subject_table,schema_table where  branch=? and sem=? and course=? and coursetype=? and subject_code=subcode";
        
        pd=con.prepareStatement(query);
        pd.setString(1,branch);
 
        pd.setInt(2,sem);
        pd.setString(3,course);
        pd.setString(4,coursetype );
        rs=pd.executeQuery();
         int i=1;
            while(rs.next()){
  
           subjectcode=rs.getString("subject_code");
           //out.println(subjectcode );
//           eno=(rs.getString("enrollment_no")).toUpperCase();
           subjectname=rs.getString("subject_name");
            theory =rs.getString("theory_credits");
            practical =rs.getString("practical_credits");
            sem = rs.getInt("sem");
            coursetype = rs.getString("coursetype");
            //out.println(photourl);
           %>
            <tr><td><center><%= i %></center></td>
           <td><center><%=subjectcode%></center></td>
           <td><center><%= subjectname %></center></td>
           <td><center><%= theory %></center></td>
           <td><center><%= practical  %></center></td>
           <td><center><%= sem %></center></td>
           <td><center><%= coursetype  %></center></td>
           <!--<td><img src="image/<%= photourl %>" class="img-thumbnail" alt="Cinque Terre" width="200" height="136"></td>-->
           </tr>
           
           <% 
            i = i+1;
            }
         }
catch(Exception e){
                         out.println(e+"skn");}
   %>
           </table>
    </center>   
    </body>
    
</html>
