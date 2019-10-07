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
        <link rel="icon" href="input/logo.png">
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
                font-size: 20px;
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
                margin-top: 7%;
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
                        <a href="admin.jsp">Admin</a>
                        <a href="index.jsp">Home</a>
                    </div>
                </header>

                <img src="input/logo.png" alt="Institute of Engineering &amp; Technology" style="position: absolute;width: 450px;height: 450px;margin-left: 45%;opacity: 0.1;margin-top: 2%">

                <button class="accordion" style="position:absolute;" id="bt1">Student List ( For Deletion )</button>
                <div class="panel" style="position: absolute;margin-top: 5%;">
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

                <button class="accordion" style="top:185px;position: absolute;" id="bt2">Print RASA Form</button>
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
                <button class="accordion" style="top:260px;position: absolute;" id="bt3">  <a href="new_csv_download.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Download Ex-Student ( All CSV Files )</a></button>
                <!-- Upload Regular And Ex Student Data -->
                <button class="accordion" style="top:310px;position: absolute;"  id="bt5">Upload Student data</button>
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

                <button class="accordion" style="top:360px;position: absolute;"  id="bt7"><a  href="credithome.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Check Subjects Credits</a></button>
                <!-- Make Regular Subject Schema -->
                <!--<button class="accordion" style="top:360px;position: absolute;" id="bt6">Upload Subject Schema </button>-->
                <button class="accordion" style="top:410px;position: absolute;"  id="bt7">Make Regular Subject Schema </button>
                <div class="panel">
                    <div id="one">
                        <!--  <form action="subjectAlloc.jsp" action="GET">
                              <table style="border-style:solid;" >
                                  <tr>
                                      <th width="50%">Select Course</th>
                                      <td><select name="course" required="">
                                              <option value="" selected disabled>Course</option>
                                              <option value="BE">BE</option>
                                              <option value="ME">ME</option>
                                              <option value="ME">MSC</option>
                                          </select>
                                      </td>
                                  </tr>
                                  <tr>
                                      <th>Select Branch</th>
                                      <td> 
                                          <select name="branch" required="">
                                              <option value="" selected disabled>Select Branch</option>
                                              <option value="Computer Engineering">Computer Engineering</option>
                                              <option value="Electronics And Telecommunication Engineering">Electronics And Telecommunication Engineering</option>
                                              <option value="Information Technology">Information Technology</option>
                                              <option value="Mechanical Engineering">Mechanical Engineering</option>
                                              <option value="Civil Engineering">Civil Engineering</option>
                                              <option value="Electronics And Instrumentation Engineering">Electronics And Instrumentation Engineering</option>
                                          </select>
                                      </td>
                                  </tr>
                                  <tr>
                                      <th>Select Semester</th>
                                      <td><select  name="sem" required="">
                                              <option value="" selected disabled >Select sem</option>
                                              <option value="1">1Sem</option>
                                              <option value="2">2Sem</option>
                                              <option value="3">3Sem</option>
                                              <option value="4">4Sem</option>
                                              <option value="5">5Sem</option>   
                                              <option value="6">6Sem</option>
                                              <option value="7">7Sem</option>
                                              <option value="8">8Sem</option>
  
                                          </select></td>
                                  </tr>
                                  <tr>
                                      <th>Select Course Type</th>
                                      <td><select  name="ctype" required="">
                                              <option value="" selected disabled>Select Course Type</option>
                                              <option value="P">PT</option>
                                              <option value="F">FT</option>
                                          </select></td>
                                  </tr>
                                  <tr>
                                      <td colspan="2" align="center">  <input type="hidden" value="0" name="i">
                                          <input type="submit" value="SUBMIT" class="button" required=""></td>
                                  </tr>
                              </table><br>
                        </form> -->
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
                <button class="accordion" style="top:460px;position: absolute;" id="bt6">Upload Ex-Subject Schema </button>
                <div class="panel">
                    <div id="one">
                        <form action="subject_schema_upload.jsp" enctype="multipart/form-data" method="post">

                            <table width="650px">
                                <tr>
                                    <td style="text-align: center;"><h2 style="color:#800000">Upload Ex-Subject Schema</h2>


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

                <button class="accordion" style="top:510px;position: absolute;"  id="bt7">Eligible Student</button>
                <!--<button class="accordion" style="position:absolute;" id="bt1">Student List ( For Deletion )</button>-->
                <div class="panel" style="position: absolute;margin-top: 5%;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" action="eligible_student.jsp" >
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">

                                    Eligible Student
                                </div>
                            </div>
                            <jsp:include page="search_form.jsp" /> 
                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                            </div>
                        </form>
                    </div>
                </div>
                <button class="accordion" style="top:560px;position: absolute;"  id="bt8">Not Eligible Student</button>
                <div class="panel" style="position: absolute;margin-top: 5%;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" action="not_eligible_student.jsp" method="post" >
                            <div class="row">
                                <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">

                                    Not Eligible Student
                                </div>
                            </div>
                            <jsp:include page="search_form.jsp" /> 
                            <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">

                                <button type="submit" class="btn btn-success btn-block sign-up" onclick="delete_student();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>

                            </div>
                        </form>

                    </div>


                </div>


                <button class="accordion" style="position:absolute;top:610px;"  id="bt11">Check Subject Schema </button>
                <div class="panel" style="position: absolute;margin-top: 5%;">
                    <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                        <form class="sign-up" id="f11" >
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
                <button class="accordion" style="top:660px;position: absolute;"  id="bt7"><a href="ex_student_fee.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Update Ex-student Subject Fees</a></button>

                

               
                <button class="accordion" style="top:710px;position: absolute;"  id="bt8">Grant Special permission</button>
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
						<label for="student-class"><small>Select Course<sup class="text-danger">*</sup></small></label>
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
				<div class="col-lg-12">
					<label class="checkbox-inline small">
						<input class="test-result-date" type="checkbox" required>
						I accept the terms and conditions.
					</label>
				</div>
				
                                <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                                    <button type="submit" class="btn btn-success btn-block sign-up st"  >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                                </div>
                            </form>
                        </div>
        </div>
 </div>

                  
     
                
                
                <button class="accordion" style="position:absolute;top:760px;"  id="bt11">Manual Unpaid to Paid</button>
                <div class="panel" style="position: absolute;margin-top: 5%;">
                 <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
                            <form class="sign-up" action="paid.jsp">
                                <div class="row">
                                    <div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
                                       Manual Unpaid To Paid
                                    </div>
                                </div>
                                                                        <div class="ml-2 mr-2 row">
						<div class="col-lg-6 p-1">
						<label for="student-class"><small>Select Course<sup class="text-danger">*</sup></small></label>
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
				<div class="col-lg-12">
					<label class="checkbox-inline small">
						<input class="test-result-date" type="checkbox" required>
						I accept the terms and conditions.
					</label>
				</div>
				
                                <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                                    <button type="submit" class="btn btn-success btn-block sign-up st"  >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                                </div>
                            </form>
                        </div>
                    
            
                </div>
                
                
                
                
                
                
                
                
                
                
               
                <button class="accordion" style="position:absolute;top:810px;" id="bt12">Payment Status</button>
                <div class="panel" style="position: absolute;margin-top: 5%;">
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
                                                         <option value="Design And Thermal">Design And Thermal</option>
                                                         <option value="Digital Communication">Digital Communication</option>
                                                         <option value="Industrial Engineering And Management">Industrial Engineering And Management</option>
                                                         <option value="Digital Instrumentation">Digital Instrumentation</option>
                                                </select>
						<select  name="branch" class="branch_BE branch form-control" style="display:none">
                                                    <option value="" selected disabled>Select Branch</option>
                                                    <option value="Computer Engineering">Computer Engineering</option>
                                                    <option value="Electronics & Telecommunication Engineering">Electronics & Telecommunication Engineering</option>
                                                    <option value="Information Technology">Information Technology</option>
                                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                                    <option value="Civil Engineering">Civil Engineering</option>
                                                    <option value="Electronics & Instrumentation Engineering">Electronics & Instrumentation Engineering</option>
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
                                    </div>
                                        <div class="row">
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
				
				<div class="col-lg-12">
					<label class="checkbox-inline small">
						<input class="test-result-date" type="checkbox" required>
						I accept the terms and conditions.
					</label>
				</div>
				
                                <div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                                    <button type="submit" class="btn btn-success btn-block sign-up st"  >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                                </div>
                            </form>
                        </div>
                    


                </div>


                <button class="accordion" style="top:860px;position: absolute;"  id="bt7"><a  href="clerk_ex1.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Clerk Verification</a></button>
                <button class="accordion" style="top:910px;position: absolute;"  id="bt7"> <a href="ex_show_permission.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Show Special Permission Ex-Student </a></button>
                <button class="accordion" style="top:960px;position: absolute;"  id="bt7"> <a href="download_reg_csv.jsp" style="color: white;font-size: 20px;font-family: sans-serif;">Download Regular(All CSV files) </a></button>
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
        <div style="position: relative;top:915px;">
            <jsp:include page="footer.html" />
        </div>
    </body>
    
    <%--<jsp:include page="footer.html" />--%>
<!--    <footer style="position: relative;top:900px;">
        <p align="center" id="p1">
            Exam Registration Portal
        </p>
        <hr align="center" width="60%">
        <p align="center" id="p2">
            Developed & Designed by :- Hemant Sir,Ravindra Kumar Kushwaha and Sumit kr.

            For any queries contact ravindrakushwahanwg@gmail.com.
            Copyright © 2019 IET DAVV. All right reserved.
        </p>

    </footer>-->
</html>


