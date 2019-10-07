
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo.png">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <jsp:include page="bootstrap_file.jsp" /> 
        <style>

th{background-color: #e4e4e0;}
td, th {
    border: 1px solid;
    text-align: left;
    padding: 8px;
}


</style>
        <title>Payment Status</title>
    </head>
    <body>
        <jsp:include page="header.html" />
        <div class="container-fluid">
        <%! HttpSession session1;
        String uname,uname1;
        String subject_name,subject_type,subject_code;
        String pass,pass1;
        String query,query3;
        String sem;
        String branch;
        String payment_status,status;
        String eno,rno;
        String name;
        String query1,query2;
        PreparedStatement pd;
        String course;
        ResultSet rs;
        String  coursetype;
       
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
      
        sem=request.getParameter("sem");
//        out.println("Sem = "+ sem);
       // status=request.getParameter("status");
     
        branch=request.getParameter("branch");
        course=request.getParameter("course");
        
        String str = course;
		 course = str.substring(0,1);
                 coursetype = str.substring(1,2);
		
		
		if(str.equals("MSF"))
		{
			course = "MSC";
			coursetype = "F";
		}
		else if(str.equals("MSP"))
		{
			course = "MSC";
			coursetype = "P";
		}
		else{
			if(course.equals("B"))
			course = "BE";
                        else
			course = "ME";
                    }
        
        
        
//        out.println("course = "+ course);
//        out.println("Branch = "+ branch);
        query2="select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and subschema.branch=ex_student.branch where ex_student.branch=? and ex_student.sem=?";
        
        pd=con.prepareStatement(query2);
        pd.setString(1,branch);
 
        pd.setString(2,sem);
        rs=pd.executeQuery();
           
        %>
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
           <table class="table table-bordered table-responsive mt-2" >
               <thead>
               <tr>
                   
              
                   <th><center>Enrollment Number</center></th>
                   <th>Sno.</th>
                   <th><center>Roll Number</center></th>
                   <th><center>NAME</center></th>
                   <th><center>BRANCH</center></th>
                   <th><center>SEMESTER</center></th>
          <th><center>SUBJECT CODE</center></th>
          <th><center>SUBJECT NAME</center></th>
          <th><center>SUBJECT TYPE</center></th>
                   <th><center>PAYMENT STATUS</center></th>
                   <th><center>DELETE</center></th>
               </tr>
         </thead>
        <%       
          int i = 1;
            while(rs.next()){
               
           name=(rs.getString("name")).toUpperCase();
           eno=(rs.getString("enrollment_no")).toUpperCase();
           rno=(rs.getString("roll_no")).toUpperCase();
           payment_status=(rs.getString("payment_status")).toUpperCase();
             subject_code=(rs.getString("ex_student.subject_code")).toUpperCase();
               subject_name=(rs.getString("subject_name")).toUpperCase();
                 subject_type=(rs.getString("ex_student.subject_type")).toUpperCase();
         
           %>
           <tbody>
           <tr><td><center><%= i %></center></td>
           <td><center><%=eno%></center></td>
           <td><center><%=rno%></center></td>
           <td><center><%= name %></center></td>
           <td><center><%= branch %></center></td>
           <td><center><%= sem %></center></td>
           <td><center><%= subject_code %></center></td>
            <td><center><%= subject_name %></center></td>
             <td><center><%= subject_type %></center></td>
           <td><center><%= payment_status %></center></td>
           <td><center><a href="delete_ex.jsp?eno=<%= eno %>&subject=<%= subject_code %>&subject_type=<%= subject_type %>" >DELETE</a></center></td>
           </tr>
           </tbody>
           <%  i = i+1; }
            }
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
