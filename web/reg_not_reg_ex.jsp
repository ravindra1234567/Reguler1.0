
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Status</title>
        <jsp:include page="bootstrap_file.jsp" /> 
    </head>
    <body>
        <jsp:include page="header.html" />
        <div class="container-fluid">
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
        String sub_name,register;
        
        
       
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
       query= "select distinct  * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.branch=? and ex_student.sem=? and  payment_status=? and reg = ?  order by name, ex_student.sem,subject_name";
                      //reg_status.equals("Paid") ||  
                 if(reg_status.equals("N")){   
                         pd=con.prepareStatement(query);
                         pd.setString(3,"Unpaid");
                         pd.setString(4,"N");
                   }
                 else if(reg_status.equals("Y")){   
                         pd=con.prepareStatement(query);
                         pd.setString(3,"Unpaid");
                         pd.setString(4,"Y");
                   }
                  else if(reg_status.equals("Both")){
//                            query1="select distinct  * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.branch=? and ex_student.sem=? and payment_status=? and reg = ? order by name, ex_student.sem,subject_name";
                            pd=con.prepareStatement(query);
                            pd.setString(3,"Paid");
                             pd.setString(4,"Y");
                         }
                           pd.setString(1,branch);
                           pd.setString(2,sem);
//                           
                             
                           rs2=pd.executeQuery();
                            // out.println(2);
           
       }
          %>
 
        <a href="#"><button class="btn btn-primary mt-2" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
         <div class="container mt-3">
                <input class="form-control fa fa-search mb-2" id="myInput" type="text" placeholder="Search............"> <br>
                    <table class="table table-bordered">
                        <thead>
                     <tr>
                         <th>
                             <span>S.No</span>
                         </th>
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
                        <th>
                            Status
                        </th>
                     </tr>
                        </thead>
                        
 
             <%   
                            int i=1;
                            while(rs2.next())
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
                          register = rs2.getString("reg");
                          
                         if(register.equals("Y"))
                              register = "Registered";
                         else
                           register = "Not Registered"; 
                          
                         
                              

                %>
                <tbody id="myTable">
		<tr>
                        <td>
                             <span><%= i++ %></span>
                         </td>
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
                        <td>
                             <span><%= register %></span>
                        </td>
        
                
		</tr>
                        </tbody>
               <%           }
               %>   
	</table>
        </div>
        </div>
               <jsp:include page="footer.html" />
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
    
</html>
