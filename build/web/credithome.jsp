
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
    </head>
    <script>
        var e = 0;
        var prev = 0;

        var myMap = new Map();

        function cal(i)
        {
            var x = myMap.has(i);
            if (!x)
            {
                myMap.set(i, 0);
                prev = 0;
                //alert("not already set for this rollno");
            }
            else
            {
                //alert("already set for this rollno");
                prev = myMap.get(i);
                //prev=x;
            }
            //alert("hello");
            //var x=document.getElementById("15C30011").value;
            //alert(x);//+100);
            //alert(i);
            //alert("initially prev is:"+prev);
            var x1 = document.getElementById(i).value;
            //alert(x1);

            if (isNaN(x1))
            {
                if (prev <= 0)
                    e++;
                document.getElementById(i).style.color = "red";
                myMap.set(i, 1);

            }
            else
            {
                if (x1 < 0 || x1 > 4)
                {
                    document.getElementById(i).style.color = "red";
                    if (prev <= 0)
                        e++;
                    myMap.set(i, 1);
                    //prev=1;
                }
                else
                {
                    //valid
                    if (prev > 0)
                        e--;
                    myMap.set(i, 0);
                    //prev=0;
                    document.getElementById(i).style.color = "black";
                }
            }
        }
        function check()
        {
            if (e > 0)
            {
                alert("Please correct the entries marked in red!");
                return false;
            }
            else {
                alert("Save Successfull!");
                return true;
            }
        }
    </script>
    <body>



        <div class="container-fluid header">
            <div class="row " >

                <div class="offset-1 col-2">
                    <img src="input\logo.png" alt="Davv Logo" class="img-fluid logo-image">
                </div>
                <div class="col-8  text-white">
                    <div class="h2 college-name ">Institute of Engineering And Technology</div>
                    <div class="row">
                        <div class="offset-6 col-3 ">Marks Entry System</div>
                    </div>
                </div>






            </div>
            <h3 style="text-align:left;">
                <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
            </h3>            



        </div>
        <%

            ServletContext context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
             //String qr="select *from class_table";
            //String qr="select year,department_name,section,specialization from class_table,department_table where class_table.department_id=department_table.id and class_table.id=?";
            String qr = "select subject_code,subject_name,theory_credits,practical_credits from subject_table";
            PreparedStatement ps = con.prepareStatement(qr);
             //String qr="select year,department_name,section,specialization,course_code,class_table.id from class_table,department_table,course_table where class_table.department_id=department_table.id and course_table.id=department_table.course_id";

            ArrayList<String> sclist = new ArrayList<String>();
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

            <hr>
            <div >
                <div class="col-12">
                    <center>
                        <form action="UpdateCredits" onsubmit="return check()" method="post">
                            <div class="container mt-3">
                                <br><input class="form-control" id="myInput" type="text" placeholder="Search............"> <br>
                                <table class="table table-bordered">
                                    <thead >
                                        <tr>
                                            <th>S.No.</th>
                                            <th>Subject Code</th>
                                            <th>Subject Name</th>
                                            <th>Theory Credits</th>
                                            <th>Practical Credits</th>

                                        </tr>
                                    </thead>
                                    <tbody id="myTable">
                                        <% while (rs.next()) {
                                                String s1 = rs.getString(1);
                                                String s2 = rs.getString(2);
                                                String s3 = rs.getString(3);
                                                String s4 = rs.getString(4);
                                                sclist.add(s1);
                                            //String stat=(String)session.getAttribute(class_id);
%>
                                        <tr>
                                            <td><%=++sno%></td>
                                            <td><%=s1%></td>
                                            <td><%=s2%></td>
                                            <td><input type="text" value ="<%=s3%>" id="<%=s1%>1" name="<%=s1%>1" onkeyup="cal('<%=s1%>1')" class="form-control"></td>
                                            <td><input type="text" value ="<%=s4%>" id="<%=s1%>2" name="<%=s1%>2" onkeyup="cal('<%=s1%>2')" class="form-control"></td>
                                        </tr>
                                        <% }
                                            session.setAttribute("subject_code_list", sclist);
                                        %>

                                    </tbody>
                                </table>
                                <center><input type="submit" value="Save Credits" class="btn btn-success"></center>
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
        </script>
    </body>
</html>
