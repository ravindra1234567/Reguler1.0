

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html> 
    <head>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/sol.css" rel="stylesheet" type="text/css"/>
        </head>
    <body>


        
       <div class="container-fluid header">
    <div class="row " >
       
        <div class="offset-1 col-2">
            <img src="input/logo.png" alt="Davv Logo" class="img-fluid logo-image">
        </div>
        <div class="col-8 text-uppercase text-white">
            <div class="h2 college-name text-capitalize">Institute Of Engineering And Technology</div>
            <div class="row">
                <div class="offset-6 col-3 ">Subject Entry System</div>
            </div>
        </div>
        
        
        
        <h3 style="text-align:right;">
<span style="float:right;"><a href="logout">Logout</a></span>

</h3>
                <h3 style="text-align:left;">

<!--<span style="float:left;"><a href="details.jsp">Back</a></span>-->

<h3>

</h3>


    </div>

       </div>
       <%
//         String s=(String)session.getAttribute("valid");
//         if(s==null)
//             response.sendRedirect("admin.jsp");
//         else if(s.equals("0"))
//            {
//                response.sendRedirect("admin.jsp");
//            }
           
            String sem = request.getParameter("sem");
//            out.println(sem);
                    //request.getParameter("sem");
            session.setAttribute("sem",sem);
            Class.forName(pageContext.getServletContext().getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(pageContext.getServletContext().getInitParameter("Url"),pageContext.getServletContext().getInitParameter("UserName"), pageContext.getServletContext().getInitParameter("Password"));

            //String qr="select *from class_table";
            //String qr="select year,department_name,section,specialization from class_table,department_table where class_table.department_id=department_table.id and class_table.id=?";
            
            String qr="select year,department_name,section,specialization,course_code,class_table.id from class_table,department_table,course_table where class_table.department_id=department_table.id and course_table.id=department_table.course_id";
            
            
            PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs=ps.executeQuery();
             int sno=0;
        %>
    <div>
        <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
      <span class="close">&times;</span>   
  </div>

</div>

            <hr>
            <div >
                <div class="col-12">
                    <table class="table  table-striped tablesorter " id="my_table">
                        <thead >
                            <tr>
                                <th>S.No.</th>
                                <th>Course</th>
                                
                                <th>Class Full Name</th>
                               
                                <th>Edit Timetable</th>       
                            </tr>
                        </thead>
                        <tbody>
                           <% while(rs.next()){
                               String s1=rs.getString(1);
                               String s2=rs.getString(2);
//                               out.println(s2);
                               String s3=rs.getString(3);
                               String s4=rs.getString(4);
                               String class_id=rs.getString(6);
                               
                               String class_full_name=s1+" Year "+s2+" ";
                               if(s4!=null)
                                   class_full_name+=s4+" ";
                               if(!s3.equals("NULL"))
                                   class_full_name+=s3;
                               //class_full_name+=s3;
                               String s5=rs.getString(5);
                               //String stat=(String)session.getAttribute(class_id);
                           %>
                            <tr>
                                <td><%=++sno%></td>
                                <td><%=s5%></td>
                                
                                <td><%=class_full_name  %></td>
   
                                <td><a href="subjectAlloc.jsp?course=<%=s5%>&class_id=<%=class_id%>&class_full_name=<%=class_full_name%>&branch=<%= s2 %>&year=<%= s1 %>">Add Subjects</a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
