<%-- 
    Document   : show_permission
    Created on : Mar 26, 2019, 3:48:50 PM
    Author     : Jayesh
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="icon" href="input/logo.png">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <jsp:include page="bootstrap_file.jsp" />
        

    </head>
    <body> 
   <jsp:include page="header.html" />
        <div class="container-fluid">

            <%! String branch;
                String sem;
                String name;
                String eno;
                String rno;
                String sub_code;
                String sub_name;
                String sub_type;

            %>
            <%
                ServletContext context = getServletContext();
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
                PreparedStatement ps2 = con.prepareStatement(" select distinct * from permission inner join ex_student on (permission.enrollment_no=ex_student.enrollment_no and permission.subject_code=ex_student.subject_code and permission.subject_type=ex_student.subject_type) inner join subschema on subschema.subject_code=ex_student.subject_code and subschema.branch=ex_student.branch;");

                ResultSet rs2 = ps2.executeQuery();
            %>
            <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>                 
            <div class="container mt-3">
                <input class="form-control fa fa-search" id="myInput" type="text" placeholder="Search............"> <br>
               <br> <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Enrollment Number</th>
                            <th>Roll Number</th>
                            <th>Sem</th>
                            <th>Branch</th>
                            <th>Subject Code</th>
                            <th>Subject Name</th>
                            <th>Subject Type</th>     
                        </tr>
                    </thead>
                    <%     while (rs2.next()) {

                            branch = rs2.getString("branch");

                            sem = rs2.getString("sem");
                            name = rs2.getString("name");
                            eno = rs2.getString("enrollment_no");
                            rno = rs2.getString("roll_no");
                            sub_type = rs2.getString("subject_type");
                            sub_name = rs2.getString("subject_name");
                        sub_code = rs2.getString("subject_code");%>
                    <tbody id="myTable">
                        <tr>

                            <td>
                                <span><%= name%></span>
                            </td>

                            <td>
                                <span><%=eno%></span>
                            </td>

                            <td>
                                <span><%=rno%></span>
                            </td>

                            <td>
                                <span><%= sem%></span>
                            </td>
                            <td>
                                <span><%= branch%></span>
                            </td>


                            <td>
                                <span><%= sub_code%></span>
                            </td>

                            <td>
                                <span><%= sub_name%></span>
                            </td>

                            <td>
                                <span><%= sub_type%></span>
                            </td>
                        </tr>

                    </tbody>
                    <%
                        }

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
