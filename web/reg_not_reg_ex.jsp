
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
        <style>


</style>
        <title>Payment Status</title>
        <jsp:include page="bootstrap_file.jsp" /> 
    </head>
    <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
<div class="menu">
  <a href="admin.jsp">Admin</a>
  <a href="index.jsp">Home</a>
</div>
</header>
    <body>
        <div class="container">
        <%! HttpSession session1;
        String uname,uname1;
        String pass,pass1;
        String query,query3;
        String sem;
        String branch;
        String reg_status,status;
        String enrollment_no,roll_no;
        String name;
        String query1,query2;
        PreparedStatement pd;
        String course;
        ResultSet rs2;
        String reg;
         String sub_type;
           String sub_code;
             String sub_name;
        
        
       
        %>
         <% 
               ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
            
          session1=request.getSession();
        
    uname=(String)session1.getAttribute("uname");
    
      pass=(String)session1.getAttribute("pass");
  
       
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
        
               
        reg_status=request.getParameter("reg");
      
        sem=request.getParameter("sem");
         branch=request.getParameter("branch");
        course=request.getParameter("course");
        status=request.getParameter("reg");
      
       
      //  out.println(1);
       query= "select distinct  * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.branch=? and ex_student.sem=? and  payment_status=? order by name, ex_student.sem,subject_name";
                        
                 if(reg_status.equals("Paid") || reg_status.equals("Unpaid"))
                    {   
                         pd=con.prepareStatement(query);
                         pd.setString(3,reg_status);
                   }
                  else if(reg_status.equals("Both"))
                        {  // out.println(1);
                            query1="select distinct  * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.branch=? and ex_student.sem=? order by name, ex_student.sem,subject_name";
                            pd=con.prepareStatement(query1);
                         }
                           pd.setString(1,branch);
                           pd.setString(2,sem);
                            //out.println(1); 
                           rs2=pd.executeQuery();
                            // out.println(2);
           
       }
          %>
 
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
         <div class="container mt-3">
                <input class="form-control fa fa-search" id="myInput" type="text" placeholder="Search............"> <br>
                   <hr> <table class="table table-bordered">
                        <thead>
                     <tr>
                         <th>
                             <span>Course</span>
                         </th>
                     
                         <th>
                             Branch
                         </th>
                
                         <th>
                             Enrollment no
                        </th>
                    
                         <th>
                             Roll no
                        </th>
                        
                         <th>
                             Name
                        </th>
                         <th>
                             Sem
                        </th>
                             <th>
                            Subject Code
                        </th>
                         <th>
                             Subject Name
                        </th>
                     
                         <th>
                            Subject Type
                        </th>

                         <th>
                             Payment Status
                        </th>
                     </tr>
                        </thead>
                        
 
             <%    while(rs2.next())
                             {
                            course=rs2.getString("course");
                           branch=rs2.getString("branch");
                           status=rs2.getString("payment_status");
                           sem=rs2.getString("sem");
                          name=rs2.getString("name");
                          enrollment_no=rs2.getString("enrollment_no");
                          roll_no=rs2.getString("roll_no");
                          sub_type=rs2.getString("subject_type");
                          sub_name=rs2.getString("subject_name");
                          sub_code=rs2.getString("subject_code");
                           
                          
                         
                              

                %>
                <tbody id="myTable">
		<tr>
                         <td>
                             <span><%= course %></span>
                         </td>
                     
                         <td>
                            <span><%= branch %></span>
                         </td>
                
                         <td>
                            <span><%=  enrollment_no %></span>
                        </td>
                    
                         <td>
                             <span><%= roll_no %></span>
                        </td>
                        
                            <td>
                             <span><%= name %></span>
                        </td>
                         <td>
                             <span><%= sem %></span>
                        </td>
                        <td>
                             <span><%= sub_code %></span>
                        </td>
                         <td>
                             <span><%= sub_name %></span>
                        </td>
                     
                         <td>
                           <span><%= sub_type %></span>
                        </td>

                         <td>
                             <span><%= status %></span>
                        </td>
        
                
		</tr>
                        </tbody>
               <%           }
               %>   
	</table>
        </div>
        </div>
       <script>

            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
    </body>
    
<footer>
<p align="center" id="p1">
Exam Registration Portal
</p>
<hr align="center" width="60%">
<p align="center" id="p2">
Developed & Designed by :- Hemant Sir,Ravindra Kumar Kushwaha and Sumit kr.

            For any queries contact ravindrakushwahanwg@gmail.com.
            Copyright © 2019 IET DAVV. All right reserved.
</p>
    
</footer>
    
</html>
