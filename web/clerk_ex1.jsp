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
    String key;
    String course;

    String roll_no;
    String payment_status;
    String sub_name;
    int sem_num;

    Connection con;
    ResultSet rs2;
%>
<%
    ServletContext context = getServletContext();
    //out.println("1");
    try {
        Class.forName(context.getInitParameter("Driver"));
        con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
        PreparedStatement ps2 = con.prepareStatement("select distinct  * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.reg='Y' and payment_status='Unpaid' order by name, ex_student.sem,subject_name");
        rs2 = ps2.executeQuery();
//                          out.println("1");
%>
<!DOCTYPE html>

<title>Verify</title>
<style>
    #d1{
        border-radius: 25px;
        border: 2px solid;
        padding: 2%;
        width: 800px;
        margin-top: 20px;
        margin-left: 180px;
        margin-right: 180px;
        border-style: groove;
    }

</style>

<script type="text/javascript">
    function selectAll() {
        var items = document.getElementsByName('id');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'checkbox')
                items[i].checked = true;
        }
    }
    function UnSelectAll() {
        var items = document.getElementsByName('id');
        for (var i = 0; i < items.length; i++) {
            if (items[i].type == 'checkbox')
                items[i].checked = false;
        }
    }


    function goBack() {
        window.history.back();
    }

</script>

<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="icon" href="input/logo.png">
<link rel="stylesheet" type="text/css" href="css/button.css">
<jsp:include page="bootstrap_file.jsp" /> 
</head>
<body>

    <jsp:include page="header.html" />
    <div class="container-fluid">
        <button  onclick="window.history.back();" style="float:left;margin-top: 10px;" class="btn btn-primary" ><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button>
        <form action="finalverify_ex.jsp" method="post">
            <div align="right" style="margin-right: 5%;">
                

                <input id="pay"  type="button" onclick="window.print()" value="   Print  " style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;"  class="btn btn-success"/>
                <input type="button" onclick='selectAll()' value="Select All" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" class="btn btn-success"/>
                <input type="button" onclick='UnSelectAll()' value="Unselect All" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" class="btn btn-success"/>
                
                
                <!--<input type="button" class="icon-refresh" value="Refresh" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" class="button"/>-->
                <input type="submit" align="left" style="margin-top: 10px;padding-top: 10px;padding-bottom: 10px;" id="pay" class="btn btn-success"  value="Submit"/>
            </div>


            <div class="container mt-3">
               <input class="form-control" id="myInput" type="text" placeholder="Search............"> <br>
                <table class="table table-bordered ">
                    <thead>
                        <tr><th colspan="11" style="background-color: #B0C4DE;text-align: center;margin-top:5px;font-size:24px;padding: 2px;"><center>Ex-Student Details</center></th></tr>
                    <tr>
                        <th>
                            <span>Course</span>
                        </th>
                        <th>
                            Name
                        </th>

                        <th>
                            Enrollment no
                        </th>

                        <th>
                            Roll no
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
                            Subject Name
                        </th>

                        <th>
                            Subject Type
                        </th>

                        <th>
                            Payment Status
                        </th>
                        <th>
                            Fees Paid
                        </th>
                    </tr>
                    </thead>
                    <%    while (rs2.next()) {
                            course = rs2.getString("course");
                            branch = rs2.getString("branch");
                            status = rs2.getString("payment_status");
                            sem = rs2.getString("sem");
                            name = rs2.getString("name");
                            enrollment_no = rs2.getString("enrollment_no");
                            roll_no = rs2.getString("roll_no");
                            sub_type = rs2.getString("subject_type");
                            sub_name = rs2.getString("subject_name");
                            sub_code = rs2.getString("subject_code");

                            key = enrollment_no + sub_code + sub_type;
                    %>
                    <tbody id="myTable">
                        <tr>
                            <td>
                                <span><%= course%></span>
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
                                <span><%= sub_name%></span>
                            </td>

                            <td>
                                <span><%= sub_type%></span>
                            </td>

                            <td>
                                <span><%= status%></span>
                            </td>
                            <!--    <input id="check1" type="checkbox" name="chkDeclaration"/> -->
                            <td> <input type="checkbox" name="id" id="check1" value=<%= key%> </td>
                    <br>
                    </tr>
                    <%           }
                    %>   
                    </tbody>
                </table>
            </div> 
        </form>
    </div>
<jsp:include page="footer.html" />

    
    <script>

        var checker = document.getElementById('check1');

        var sendbtn = document.getElementById('pay');
        // when unchecked or checked, run the function

        checker.onchange = function () {

            if (this.checked)
            {
                sendbtn.disabled = false;

            }
            else
            {
                sendbtn.disabled = true;
            }



        }




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

<%
//}
    //else
    // {
%>


<%               // } 
        //}
    } catch (Exception e) {

        e.printStackTrace();
    }
%>
