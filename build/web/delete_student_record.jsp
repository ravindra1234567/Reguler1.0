
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
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/sol.css">
        <jsp:include page="bootstrap_file.jsp" />
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
        <title>Delete Student</title>
        
    </head>

    <body style="margin-bottom: 100px;">
        
        <%! HttpSession session1;
        String uname,uname1;
        String pass,pass1;
        String query,query3;
        int sem;
        String branch;
        String payment_status,status;
        String eno,roll_no;
        String name;
        String query1,query2;
        PreparedStatement pd;
        String course;
        ResultSet rs;
         
        %>
         <% 
               ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
             try{
          session1=request.getSession();
        
    uname=(String)session1.getAttribute("uname");
    
      pass=(String)session1.getAttribute("pass");
  
      // session1.invalidate();
       
      if(uname==null||pass==null)
      {
          response.sendRedirect("admin.jsp");
      }
                                
       
            query= "select * from administration where user_name=?";
           
           PreparedStatement pd=con.prepareStatement(query);
           pd.setString(1,uname);
           ResultSet rs=pd.executeQuery();
           if(rs.next()){
               uname1=rs.getString(1);
               pass1=rs.getString(2);
           }
            if(uname.equals(uname1) && pass.equals(pass1))
            {
        
               
      //  payment_status=request.getParameter("payment_status");
      
        sem=Integer.parseInt(request.getParameter("sem"));
       // status=request.getParameter("status");
     
        branch=request.getParameter("branch");
        course=request.getParameter("course");
        	String str = course;
             course = str.substring(0,1);
		String coursetype = str.substring(1,2);
		
		
		if(str.equals("MS"))
		{
			course = "MSC";
			coursetype = "F";
		}
		else{
			if(course.equals("B"))
			course = "BE";
		else
			course = "ME";
		}
       // out.println("branch = "+branch);
        //out.println("course ="+course);
        query2="SELECT * FROM `all_students` WHERE `coursetype1`=? and `course1`=? and `sem1`= ? and `branch1`=? ";
        
        pd=con.prepareStatement(query2);
        pd.setString(1,coursetype);
        pd.setString(2,course);
        pd.setInt(3,sem);
        pd.setString(4, branch);
        rs=pd.executeQuery();
           
        %>
        
     <jsp:include page="header.html" />
     <div class="container">
         <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
           <table border radius="1" style="border-collapse:collapse;margin-top: 20px;" width="800px" >
               <tr>
                   
                    <th><center>Sno.</center></th>
                   <th><center>Enrollment Number</center></th>
                   <th><center>Roll Number</center></th>
                   <th><center>NAME</center></th>
                   <th><center>BRANCH</center></th>
                   <th><center>SEMESTER</center></th>
                   <th><center>STATUS</center></th>
                   <th><center>DELETE</center></th>
               </tr>
        <%       
             int i=1;
            while(rs.next()){
  
           name=(rs.getString("name")).toUpperCase();
           eno=(rs.getString("enrollment_no")).toUpperCase();
           roll_no=(rs.getString("roll_no")).toUpperCase();
            status=(rs.getString("status")).toUpperCase();
//           payment_status=(rs.getString("payment_status")).toUpperCase();
            
           %>
           
            <tr><td><center><%= i %></center></td>
           <td><center><%=eno%></center></td>
           <td><center><%=roll_no%></center></td>
           <td><center><%= name %></center></td>
           <td><center><%= branch %></center></td>
           <td><center><%= sem %></center></td>
           <td><center><%= status %></center></td>
           <td><center><a href="delete_student.jsp?roll_no=<%= roll_no %>" >DELETE</a></center></td>
           </tr>
           
           <% 
            i = i+1;
            }}
                else    
                {
                response.sendRedirect("admin.jsp");
                }
                  
         }
catch(Exception e){
                         out.println(e+"skn");}
   %>
           </table>
           </div>
    <jsp:include page="footer.html" /> 
    </body>
    
</html>
