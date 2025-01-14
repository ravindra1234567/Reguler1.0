
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html> 
    <head>
        <link rel="icon" href="input/logo.png">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/sol.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="bootstrap_file.jsp" /> 
    
    <script>
     
    </script>
    </head>
    <body>
        <jsp:include page="header.html" />
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>

        <%
//            if (session.getAttribute("uname") == null || session.getAttribute("pass").equals("")){
//    response.sendRedirect("admin.jsp");
//    }else{
            ServletContext context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
             //String qr="select *from class_table";
            //String qr="select year,department_name,section,specialization from class_table,department_table where class_table.department_id=department_table.id and class_table.id=?";
            String qr = "select * from subschema";
            PreparedStatement ps = con.prepareStatement(qr);
             //String qr="select year,department_name,section,specialization,course_code,class_table.id from class_table,department_table,course_table where class_table.department_id=department_table.id and course_table.id=department_table.course_id";

//            ArrayList<String> sclist = new ArrayList<String>();
            //PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs = ps.executeQuery();
            int sno = 0;
        %>
        <div>
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>  
                </div>

            </div>

            
            <div >
                <div class="col-12">
                    <center>
                        <form action="UpdateCredits" onsubmit="return check()" method="post">
                            <div class="container mt-3">
                                <input class="form-control" id="myInput" type="text" placeholder="Search............"> <br>
                                <table class="table table-bordered">
                                    <thead >
                                        <tr>
                                            <th>S.No.</th>
                                            <th>Course</th>
                                            <th>Branch</th>
                                            <th>Semester</th>
                                            <th>Subject Code</th>
                                            <th>Subject Name</th>
                                            <th>Theory Credits</th>
                                            <th>Practical Credits</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody id="myTable">
                                        <% while (rs.next()) {
                                                String course  = rs.getString(1);
                                                String branch = rs.getString(2);
                                                String sem = rs.getString(3);
                                                String subject_code = rs.getString(4);
                                                String subject_name = rs.getString(5);
                                                String theory = rs.getString(6);
                                                String practical = rs.getString(7);
                                                String id1 = rs.getString("id");
//                                                sclist.add(s1);
                                            //String stat=(String)session.getAttribute(class_id);
%>
                                        <tr>
                                            
                                            <td class="id1" id1="<%=id1%>" hidden><%=id1%></td>
                                            <td><%=++sno%></td>
                                            <td><%=course%></td>
                                            <td><%=branch%></td>
                                            <td><%=sem%></td>
                                            <td><%=subject_code %></td>
                                            <td><%=subject_name %></td>
                                            <td><%= theory %></td>
                                            <td><%= practical %></td>
                                            <td><button type="button"  class="btn_del btn btn-danger" /><i class="fas fa-trash fa-lg"></i></button></td>
                                        </tr>
                                        <% }
                                           
//            }
                                        %>

                                    </tbody>
                                </table>
                                
                            </div>
                        </form>
                    </center>
                </div>
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
            
            
            $(document).on('click',".btn_del", function() {
             var value = $(this).parent().parent().children('.id1').attr('id1');
             console.log(value);
//             window.location.href = "delete_subject.jsp?sub="+value;
             $.ajax({
                 type:'POST',
                 url:"delete_ex_subject.jsp",
                 data:{id1: value},
                 cache:false,
                 success:function(result){
                     Swal.fire({
                         type:'success',
                         title:'Success',
                         text:"Subject Deleted Successfully!!!",
                         showConfirmButton: true
                     }).then((result)=>{
                         location.reload();
                     });
                    
                 }
                 
             });
         });
        
        </script>
        <jsp:include page="footer.html" />
    </body>
</html>
