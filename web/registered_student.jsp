
<%@page import="java.sql.*" 
        import="java.sql.Connection"
        import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! String enrollment_no;
    String subject;
    String name;
    String status;
    String sem;
    String branch;
    String sub_code;
    String sub_type;
    String register;
    String course;

    String roll_no;
    String payment_status;
    String sub_name;
    int sem_num;

    Connection con;
    ResultSet rs2;
%>
<%
    if (session.getAttribute("uname") == null || session.getAttribute("pass").equals("")){
    response.sendRedirect("admin.jsp");
    }else{
    
    
    ServletContext context = getServletContext();
    //out.println("1");
    try {
        Class.forName(context.getInitParameter("Driver"));
        con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
        PreparedStatement ps2 = con.prepareStatement("select  * from  ex_student  where reg='Y' and payment_status='Unpaid' order by name");
        rs2 = ps2.executeQuery();

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<link rel="icon" href="input/logo.png">
<link rel="stylesheet" type="text/css" href="css/button.css">
<jsp:include page="bootstrap_file.jsp" /> 
        <title>Registered student</title>
    </head>
    <body>
        <jsp:include page="header.html" />
        <button  onclick="window.history.back();" style="float:left;margin-top: 10px;" class="btn btn-primary" ><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button>
        
        
        <div class="container mt-3">
            
               <input class="form-control" id="myInput" type="text" placeholder="Search............"> <br>
               <table class="table table-bordered " >
                    <thead>
                        <tr><th colspan="12" style="background-color: #B0C4DE;text-align: center;margin-top:5px;font-size:24px;padding: 2px;"><center>Registered Student</center></th></tr>
                    <tr>
                        <th>
                            <span>S.no</span>
                        </th>
                        <th>
                            <span>Course</span>
                        </th>
                        <th>
                            Name
                        </th>

                        <th>
                            Enrollment
                        </th>

                        <th>
                            Roll_no
                        </th>

                        <th>
                            Branch
                        </th>

                        <th>
                            Sem
                        </th>
                        <th>
                            Subject Code
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
                            while (rs2.next()) {
                            branch = rs2.getString("branch");
                            status = rs2.getString("payment_status");
                            sem = rs2.getString("sem");
                            name = rs2.getString("name");
                            enrollment_no = rs2.getString("enrollment_no");
                            roll_no = rs2.getString("roll_no");
                            sub_type = rs2.getString("subject_type");
                            sub_code = rs2.getString("subject_code");
                            register = rs2.getString("reg");
                            
                            if(register.equals("Y"))
                                  register = "registered";
                            else
                                register = "Not registered";

                    %>
                    <tbody>
                        <tr>
                            <td>
                                <span><%= i++ %></span>
                            </td>
                            <td>
                                <span>BE</span>
                            </td>
                            <td>
                                <span><%= name%></span>
                            </td>

                            <td>
                                <span><%=  enrollment_no%></span>
                            </td>

                            <td>
                                <span><%= roll_no%></span>
                            </td>

                            <td>
                                <span><%= branch%></span>
                            </td>

                            <td>
                                <span><%= sem%></span>
                            </td>
                            <td>
                                <span><%= sub_code%></span>
                            </td>
                         
                            <td>
                                <span><%= sub_type%></span>
                            </td>

                            <td>
                                <span><%= status%></span>
                            </td>
                            
                            <td>
                                <span><%= register %></span>
                            </td>
                    </tr>
                     
                    </tbody>
                    
                    <%  
                            }
    } catch (Exception e) {

        out.print(e);
    }
    }
%>
                </table>
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
        
        <jsp:include page="footer.html" />
    </body>
</html>


