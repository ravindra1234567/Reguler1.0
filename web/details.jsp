<%-- 
    Document   : details
    Created on : 14 Jul, 2019, 11:01:59 AM
    Author     : Ravindra
--%>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="popup.css">
        <jsp:include page="bootstrap_file.jsp" /> 
        <title>Admin Home</title>

        <style>
            .accordion {
                background-color: rgb(92, 184, 92);
                color: white;
                cursor: pointer;
                padding: 20px;
                width: 400px;
                border: solid;
                text-align: left;
                outline: none;
                font-size: 17px;
                font-family: sans-serif;
                transition: 0.4s;
            }

            .active{
                background-color: rgb(92, 184, 92);
            }
            .accordion:hover {
                background-color: rgb(166, 186, 216);
            }

            .accordion:after {
                background-color: rgb(92, 184, 92);
                font-weight: bold;
                float: right;
                margin-left: 5px;

            }

            .active:after {
                background-color:  rgb(92, 184, 92);
            }

            .panel {
                margin-left: 30%;
                align-content: center;
                padding-left: 10%;
                position: absolute;
                margin-top: 15%;
                width: 750px;
                height: 80%;
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.2s ease-out;
            }
            table{
                font-family: sans-serif;
                font-size: 18px;
                width: 650px;
            }
            input{
                font-size: 18px;
            }
            /*            select{
                            font-size: 18px;
                            width: 70%;
                        }*/
            .semStyle{
                font-style: century-gothis;
                font-size:30px;
            }
        </style>

        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <script type="text/javascript" >

            /* Delete Student Ex and Regular  */
            function delete_student()
            {

                var status = slist.status.value;
                if (status === "Regular") {
                    document.getElementById("f11").action = "delete_student_record.jsp";
                } else {
                    document.getElementById("f11").action = "payment_status_ex.jsp";
                }
            }

            /* Print RASA form*/
            function printrasaform()
            {
                var a = demoForm.status.value;
                if (a === "Regular") {
                    document.getElementById("printrasa").action = "printrasaform.jsp";
                }
                else {
                    document.getElementById("printrasa").action = "ex_student_admitcard.jsp";
                }
            }
            function Reg()
            {

                var status_1 = document.getElementById("status_reg").value;
                if (status_1 === "Regular")
                    document.getElementById("form1").action = "reg_not_reg.jsp";
                else
                    document.getElementById("form1").action = "reg_not_reg_ex.jsp";
            }

        </script>
    </head>
    <body>  

        <%!
            HttpSession session1;
            String page1;
            String pass, pass1;
            String uname, uname1;
            String query;
            ServletContext context;


        %>

        <%

            page1 = request.getParameter("page");//for different responses
            if (page1.equals("admin")) {
                pass = request.getParameter("pass");
                uname = request.getParameter("uname");
                query = "select * from administration where user_name=?";

                context = getServletContext();
                Class.forName(context.getInitParameter("Driver"));
                Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

                PreparedStatement pd = con.prepareStatement(query);
                pd.setString(1, uname);
                ResultSet rs = pd.executeQuery();
                if (rs.next()) {
                    uname1 = rs.getString(1);
                    pass1 = rs.getString(2);
                }
                if (uname.equals(uname1) && pass.equals(pass1)) {
                    session1 = request.getSession();
                    session1.setAttribute("uname", uname);
                    session1.setAttribute("pass", pass);
                } else {
                    response.sendRedirect("admin.jsp");
                }

            } else if (page1.equals("fileupload")) {
                int value = Integer.parseInt(request.getParameter("value"));

        %>


        <!-- The Modal -->
        <div class="containert-flued">
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">


                    <%                        if (value == -1) {
                    %>

                    <div class="modal-header" style="background-color: #cc240c">
                        <span class="close">&times;</span>
                        <h1 align="center">&#10006;</h1>
                    </div>
                    <div class="modal-body">
                        <p style="color:black;">File Upload Opertion Abort</p>
                        <%
                        } else {
                        %>
                        <div class="modal-header" style="background-color:  #419041;">
                            <span class="close">&times;</span>
                            <h1 align="center">&#10004;</h1>
                        </div>
                        <div class="modal-body">
                            <p style="color:black;"><%=value%> Records Successfully Entered</p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <script src="popup.js">
                </script>

                <%
                    }


                %>

                <header>
                    <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
                    <h2>Institute of Engineering &amp; Technology</h2>
                    <div class="menu">
                        <a class="nav-item nav-link text-white" href="session_destroy.jsp">Logout</a>
                        <a class="nav-item nav-link text-white"  href="admin.jsp">Admin</a>
                        <a class="nav-item nav-link text-white"  href="index.jsp">Home</a>
                        
                    </div>
                </header>

                <!--<img src="input/logo.png" alt="Institute of Engineering &amp; Technology" style="position: absolute;width: 450px;height: 450px;margin-left: 45%;opacity: 0.1;margin-top: 2%">-->

                <button class="accordion" style="position:absolute;" id="bt1">Student List ( For Deletion )</button>
                <div class="panel" style="position: absolute;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" id="f11" name="slist" >
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
                                    Student List
                                </div>
                            </div>
                            <jsp:include page="search_form.jsp" /> 
                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                            </div>
                        </form>

                    </div>

                </div>

                <button class="accordion" style="top:165px;position: absolute;" id="bt2">Print RASA Form</button>
                <div class="panel" style="position: absolute;">


                    <div id="four">
                        <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                            <form class="sign-up" id="printrasa" name="demoForm">
                                <div class="row">
                                    <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
                                        Print RASA Form
                                    </div>
                                </div>
                                <jsp:include page="search_form.jsp" /> 
                                <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                                    <button type="submit" class="btn btn-success btn-block sign-up st" onclick="printrasaform();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--Ex-Student new_csv_download-->
                <button class="accordion" style="top:220px;position: absolute;" id="bt3">  <a href="new_csv_download.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Download Ex-Student ( All CSV Files )</a></button>
                <!-- Upload Regular And Ex Student Data -->
                <button class="accordion" style="top:280px;position: absolute;"  id="bt5">Upload Student data</button>
                <div class="panel">
                    <div id="one">
                        <form action="student_upload.jsp" enctype="multipart/form-data" method="post">
                            <table width="650px">
                                <tr>
                                    <td style="text-align: center;"><h2 style="color:#800000">Upload Regular Student data</h2>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="file" name="file" multiple="" required="" />
                                        <input type="submit" value="Upload"/>

                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <br/><div id="one">
                        <!-- Upload Ex Student Data -->
                        <form action="ex_student_upload.jsp" enctype="multipart/form-data" method="post">
                            <table width="650px">
                                <tr>
                                    <td style="text-align: center;"><h2 style="color:#800000">Upload Ex-Student data</h2>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input type="file" name="file" multiple="" required="" />
                                        <input type="submit" value="Upload"/>

                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>

                <button class="accordion" style="top:330px;position: absolute;"  id="bt7"><a  href="credithome.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Check Subjects Credits</a></button>
                <!-- Make Regular Subject Schema -->
                <!--<button class="accordion" style="top:360px;position: absolute;" id="bt6">Upload Subject Schema </button>-->
                <button class="accordion" style="top:380px;position: absolute;"  id="bt7">Make Regular Subject Schema </button>
                <div class="panel">
                    <div id="one">

                        <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                            <form class="sign-up" action="subjectAlloc.jsp" >
                                <div class="row">
                                    <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">

                                        Make Regular Subject Schema
                                    </div>
                                </div>
                                <jsp:include page="search_form.jsp" /> 
                                <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                    <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- Add New Subject -->
                <button class="accordion" style="top:430px;position: absolute;color:white" id="bt6"><a href="add_subject_reg.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Add New Subject </a></button>
                <button class="accordion" style="top:480px;position: absolute;"  id="bt7">Registered Student</button>
                <!--<button class="accordion" style="position:absolute;" id="bt1">Student List ( For Deletion )</button>-->
                <div class="panel" style="position: absolute;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" action="eligible_student.jsp" >
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">

                                    Registered Student
                                </div>
                            </div>
                            <jsp:include page="search_form.jsp" /> 
                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                            </div>
                        </form>
                    </div>
                </div>
                <button class="accordion" style="top:530px;position: absolute;"  id="bt8">Not Registered Student</button>
                <div class="panel" style="position: absolute;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" action="not_eligible_student.jsp" method="post" >
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">

                                    Not Registered Student
                                </div>
                            </div>
                            <jsp:include page="search_form.jsp" /> 
                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                            </div>
                        </form>

                    </div>


                </div>


                <button class="accordion" style="position:absolute;top:580px;"  id="bt11">Check Subject Schema </button>
                <div class="panel" style="position: absolute;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" action="checkSchema.jsp" method="get" >
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">

                                    Check Subject Schema
                                </div>
                            </div>
                            <jsp:include page="search_form.jsp" /> 
                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                            </div>
                        </form>

                    </div>
                </div>
                <button class="accordion" style="top:630px;position: absolute;"  id="bt7"><a href="ex_student_fee.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Update Ex-student Subject Fees</a></button>




                <button class="accordion" style="top:680px;position: absolute;"  id="bt8">Grant Special permission</button>
                <div class="panel">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" action="special_permission.jsp" method="post">
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
                                    Grant Special Permission 
                                </div>
                            </div>
                            <div class="ml-2 mr-2 row">
                                <div class="col-lg-6 p-1">
                                    <label for="student-class"><small>Enter Enrollment No.<sup class="text-danger">*</sup></small></label>
                                    <input type="text" name="eno" class="form-control" placeholder="Enter Enrollment No." required/>
                                </div>
                                <div class="col-lg-6 p-1">
                                    <label for="status"><small>Status<sup class="text-danger">*</sup></small></label>
                                    <select name="status" required class="form-control st1 " >
                                        <option value="" selected disabled  >Select Status</option>
                                        <option value="Regular" >Regular</option>
                                        <option value="Ex" >Ex</option>
                                    </select>
                                </div>
                                <div class="col-lg-6 p-1">
                                    <label for="student-medium"><small>Select Semester<sup class="text-danger">*</sup></small></label>
                                    <select id="student-medium" name="sem" class="form-control">
                                        <option value="" selected disabled>Select Semester</option>
                                        <option value="1">1Sem</option>
                                        <option value="2">2Sem</option>
                                        <option value="3">3Sem</option>
                                        <option value="4">4Sem</option>
                                        <option value="5">5Sem</option>
                                        <option value="6">6Sem</option>
                                        <option value="7">7Sem</option> 
                                        <option value="8">8Sem</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                                <button type="submit" class="btn btn-success btn-block sign-up st"  >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <button class="accordion" style="position:absolute;top:730px;"  id="bt11">Manual Unpaid to Paid</button>
            <div class="panel" style="position: absolute;">
                <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                    <form class="sign-up" action="paid.jsp">
                        <div class="row">
                            <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
                                Manual Unpaid To Paid
                            </div>
                        </div>
                        <div class="ml-2 mr-2 row">
                            <div class="col-lg-6 p-1">
                                <label for="student-class"><small>Enter Enrollment No.<sup class="text-danger">*</sup></small></label>
                                <input type="text" name="eno" class="form-control" placeholder="Enter Enrollment No." required/>
                            </div>
                            <div class="col-lg-6 p-1">
                                <label for="status"><small>Status<sup class="text-danger">*</sup></small></label>
                                <select name="status" required class="form-control st1 " >
                                    <option value="" selected disabled  >Select Status</option>
                                    <option value="Regular" >Regular</option>
                                    <option value="Ex" >Ex</option>
                                </select>
                            </div>
                            <div class="col-lg-6 p-1">
                                <label for="student-medium"><small>Select Semester<sup class="text-danger">*</sup></small></label>
                                <select id="student-medium" name="sem" class="form-control">
                                    <option value="" selected disabled>Select Semester</option>
                                    <option value="1">1Sem</option>
                                    <option value="2">2Sem</option>
                                    <option value="3">3Sem</option>
                                    <option value="4">4Sem</option>
                                    <option value="5">5Sem</option>
                                    <option value="6">6Sem</option>
                                    <option value="7">7Sem</option> 
                                    <option value="8">8Sem</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                            <button type="submit" class="btn btn-success btn-block sign-up st"  >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <button class="accordion" style="position:absolute;top:780px;" id="bt12">Payment Status</button>
            <div class="panel" style="position: absolute;">
                <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                    <form class="sign-up" action="reg_not_reg_ex.jsp">
                        <div class="row">
                            <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
                                Payment Status
                            </div>
                        </div>
                        <div class="ml-2 mr-2 row">
                            <div class="col-lg-6 p-1">
                                <label for="student-class"><small>Select Course<sup class="text-danger">*</sup></small></label>
                                <select id="student-class" name="course" class="form-control">
                                    <option value="" selected disabled >Select Course</option>
                                    <option value="BF">BE(FT)</option>
                                    <option value="BP">BE(PT)</option>
                                    <option value="MF">ME(FT)</option>
                                    <option value="MP">ME(PT)</option>
                                    <option value="MSF">MSC(FT)</option>
                                    <option value="MSP">MSC(PT)</option>
                                </select>
                            </div>
                            <div class="col-lg-6 p-1">
                                <label for="status"><small>Status<sup class="text-danger">*</sup></small></label>
                                <select name="status" required class="form-control st1 " >
                                    <option value="" selected disabled  >Select Status</option>
                                    <option value="Regular" >Regular</option>
                                    <option value="Ex" >Ex</option>
                                </select>
                            </div>
                            <div class="col-lg-6 p-1">
                                <label><small>Select Branch<sup class="text-danger">*</sup></small></label>
                                <select   name="branch" class="blank_branch branch form-control">
                                    <option value="" selected disabled>Select Branch</option>

                                </select>
                                <select  name="branch" class="branch_ME branch form-control" style="display:none">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Software Engineering">Software Engineering</option>
                                    <option value="Information Security">Information Security</option>
                                    <option value="Design and Thermal">Design And Thermal</option>
                                    <option value="Digital Communication">Digital Communication</option>
                                    <option value="Industrial Engineering And Management">Industrial Engineering And Management</option>
                                    <option value="Digital Instrumentation">Digital Instrumentation</option>
                                </select>
                                <select  name="branch" class="branch_BE branch form-control" style="display:none">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electronics and Telecommunication Engineering">Electronics & Telecommunication Engineering</option>
                                    <option value="Information Technology">Information Technology</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Electronics and Instrumentation Engineering">Electronics & Instrumentation Engineering</option>
                                </select>
                                <select  name="branch" class="branch_MS branch form-control" style="display:none">
                                    <option value="" selected disabled>Select Branch</option>
                                    <option value="Applied Mathematics">Applied Mathematics</option>

                                </select>
                            </div>
                            <div class="col-lg-6 p-1">
                                <label for="student-medium"><small>Select Semester<sup class="text-danger">*</sup></small></label>
                                <select id="student-medium" name="sem" class="form-control">
                                    <option value="" selected disabled>Select Semester</option>
                                    <option value="1">1Sem</option>
                                    <option value="2">2Sem</option>
                                    <option value="3">3Sem</option>
                                    <option value="4">4Sem</option>
                                    <option value="5">5Sem</option>
                                    <option value="6">6Sem</option>
                                    <option value="7">7Sem</option> 
                                    <option value="8">8Sem</option>
                                </select>
                            </div>
                            <!--                        </div>
                                                    <div class="row">-->
                            <div class="col-lg-6 p-2">
                                <label for="reg"><small>Registered/Not-Registered<sup class="text-danger">*</sup></small></label>
                                <select id="reg" name="reg" class="form-control">
                                    <option value="" selected disabled>Select Status</option>
                                    <option value="Paid">Registered</option>
                                    <option value="Unpaid">Not Registered</option>
                                    <option value="Both">Both</option>
                                </select>
                            </div>         
                        </div>
                        <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                            <button type="submit" class="btn btn-success btn-block sign-up st"  >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <button class="accordion" style="top:830px;position: absolute;"  id="bt7"><a  href="clerk_ex1.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Clerk Verification</a></button>
            <button class="accordion" style="top:880px;position: absolute;"  id="bt7"> <a href="ex_show_permission.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Show Special Permission Ex-Student </a></button>
            <button class="accordion" style="top:930px;position: absolute;"  id="bt7"> <a href="download_reg_csv.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Download Regular(All CSV files) </a></button>
            <button class="accordion" style="top:980px;position: absolute;"  id="bt7"><a  href="check_ex_subject_credit.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Check Ex-Subjects Credits</a></button>
             <button class="accordion" style="top:1030px;position: absolute;color:white" id="bt6"><a href="add_subject_ex.jsp" style="color: white;font-size: 17px;font-family: sans-serif;">Add New Ex-Subject </a></button>
        </div>

        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;
            var last;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {

                    if (last) {
                        var p1 = last.nextElementSibling;
                        p1.style.maxHeight = null;
                    }

                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        //  panel.style.maxHeight = null;
                    } else {
                        // panel.style.maxHeight = "100%";
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                    last = this;
                });
            }



        </script>
        <script>

            $("select#student-class").change(function () {
                var str = $(this).find("option:selected").val();
                if ((str == "MF") || (str == "MP")) {
                    $(".branch").hide();
                    $(".branch_ME").show();

                }
                if ((str == "BF") || (str == "BP")) {
                    $(".branch").hide();
                    $(".branch_BE").show();

                }
                if ((str == "MSF") || (str == "MSP")) {
                    $(".branch").hide();
                    $(".branch_MS").show();

                }
            });
        </script>
        <div style="position: relative;top:970px;">
            <jsp:include page="footer.html" />
        </div>
    </body>

</html>


