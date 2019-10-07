<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    String enrollmentno;
    String roll_no = null;
    String branch;
    String enrollment_no;
    int sem;
    String name;
    String father_name;
    String class_name;
    String course_name;
    String status;
    String paper_code;
    String subject_name;
    String subject_code;
    String subject_type;
    String st1;
    String year;
    ResultSet rs2;

    String subject_name1;
    String subject_code1;
    String subject_type1;
    String st2;
    String st;
    String course = null;
    String coursetype = null;
    int i;
%>


<%
    enrollmentno = request.getParameter("enrollmentno");
    branch = request.getParameter("branch");
    course = request.getParameter("course");
    sem = Integer.parseInt(request.getParameter("sem"));
    status = request.getParameter("status");

    String str = course;
    course = str.substring(0, 1);
    coursetype = str.substring(1, 2);

    if (str.equals("MS")) {
        course = "MSC";
        coursetype = "F";
    } else {
        if (course.equals("B")) {
            course = "BE";
        } else {
            course = "ME";
        }
    }
    //HttpSession ss = request.getSession();
//    enrollment_no = (String) ss.getAttribute("e");
//    status = (String) ss.getAttribute("s");
//    sem = (String) ss.getAttribute("sem");

//    SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
//    Date date = new Date();
//    dt = sdf.format(date);
//    sem1 = Integer.parseInt(sem);
//    name = (String) ss.getAttribute("name");
//  
//    if (enrollment_no == null) {
//        response.sendRedirect("index.jsp");
//    }
//    try {
    ServletContext context = getServletContext();
    Class.forName(context.getInitParameter("Driver"));
    Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));


%>


<!DOCTYPE html>

<head>
    <title>Student</title>
    <style>
        #d1{
            border-radius: 25px;
            border: 2px solid;
            padding: 2%;
            width: 70%;
            margin-left: 0px;
            margin-right: 0px;
            border-style: groove;
        }
        body{
            overflow-x: hidden;
        }
    </style>
    <link rel="icon" href="input/logo.png">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/sol.css">
    <jsp:include page="bootstrap_file.jsp" />
    <script>
//        function hideme() {
//            document.getElementById('header').style.visibility = 'hidden';
//            document.getElementById('goback').style.visibility = 'hidden';
//            document.getElementById('pay').style.visibility = 'hidden';
//            setTimeout(function () {
//                document.getElementById('header').style.visibility = 'visible';
//                document.getElementById('goback').style.visibility = 'visible';
//                document.getElementById('pay').style.visibility = 'visible';
//            }, 1000);
//        }
    </script>
</head>

<body>
    <jsp:include page="header.html" />
    <button id="goback" class="btn btn-primary" style="margin-left: 10px;"
            onclick="window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button>
    <div id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>
<center>



    <%    PreparedStatement ps2 = con.prepareStatement("select roll_no,enrollment_no,name,year,branch1 ,sem1,course1,coursetype1 from all_students where branch1=? and sem1=? and course1=? and coursetype1=?  ");
        ps2.setString(1, branch);
        ps2.setInt(2, sem);
        ps2.setString(3, course);
        ps2.setString(4, coursetype);
        rs2 = ps2.executeQuery();
        while (rs2.next()) {
            branch = rs2.getString("branch1");
            enrollmentno = rs2.getString("enrollment_no");
            roll_no = rs2.getString("roll_no");
            year = rs2.getString("year");
            enrollment_no = rs2.getString("enrollment_no");
            name = rs2.getString("name");
            sem = Integer.parseInt(rs2.getString("sem1"));
            course = rs2.getString("course1");
            coursetype = rs2.getString("coursetype1");
    %>







    <p style="page-break-after:always"></p>
    <center> 

        <div class="relative" id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>
        <center>
            <div id="d1" width="100%">

                <hr>
                <h2 align="center"  style=" color: rgb(2,159,91);">
                    Institute of Engineering & Technology -DAVV
                    <br>   (RASA Form)</br>
                </h2>
                <hr>

                <hr>
                <br>
                <table class="table table-bordered" >






                    <tr><th>
                            Enrollment Number:
                        </th>
                        <td><%=enrollment_no%></td>
                        <td rowspan="7"><img id="ihoto" src= "show.jsp?image=<%= enrollment_no%>" style="height:185px;width:165px;border-width:0px;"/> </td>
                    </tr>

                    <tr>
                        <th>Roll No.</th>
                        <td><%=roll_no%></td>


                    </tr>

                    <tr>
                        <th>Exam Name:</th>
                        <td>DEC 2019</td>
                    </tr>

                    <tr>
                        <th>Exam Center:</th>
                        <td>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE[808]</td>
                    </tr>
                    <tr>
                        <th>Exam Month:</th>
                        <td>DEC 2019</td>
                    </tr>
                    <tr>
                        <th>Name:</th>
                        <td><%=name%></td>
                    </tr>

                    <tr><th>Father Name:</th>
                        <td> </td>
                    </tr>

                    <tr><th>Mother Name:
                        </th>
                        <td colspan="2"> </td>
                    </tr>

                    <tr><th>Gender:</th>
                        <td colspan="2"> </td>
                    </tr>
                    <tr>
                        <th>Status:</th>
                        <td colspan="2">Regular</td>
                    </tr>
                </table>
                <hr>
                <center>
                    <br>
                    <h3>Opted Paper Description(Not In Sequence According To Time Table Of University)</h3>
                    <br>
                </center>
                <table class="table table-bordered">
                    <tr><th>Subject Code</th>
                        <th>Subject Name</th>
                        <th>Subject Type</th>
                        <th>Date</th>
                        <th>Candidate's Signature</th>
                        <th>Answer Sheet Number:</th>
                        <th>Invigilator's Signature</th>
                        <th style="width:100px">Signature</th>
                    </tr>
                    <tr>
                        <%   // For subSchema

                            Class.forName(context.getInitParameter("Driver"));
                            Connection con1 = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

                            PreparedStatement ps1 = con.prepareStatement("select subject_code,subject_name,subtype from schema_table,subject_table where branch='" + branch + "'and sem='" + sem + "'and course='" + course + "' and coursetype='" + coursetype + "' and subject_code = subcode ");
                            /* ps2.setString(1,branch);
                             ps2.setInt(2, sem);
                             ps2.setString(3, course);
                             ps2.setString(4,coursetype);*/
                            ResultSet rs = ps1.executeQuery();
                            if (rs.next()) {

                                do {
                                    subject_name1 = rs.getString("subject_name");
                                    subject_code1 = rs.getString("subject_code");
                                    subject_type1 = rs.getString("subtype");
                                    String st = "";
                                    if (subject_type1.equals("1")) {
                                        st += "Practical";
                        %>
                        <td align="center"><%=subject_code1%></td>
                        <td style="padding: 4px;"><%=subject_name1%></td>
                        <td align="center"><%= st%></td>
                        <%          } else if (subject_type1.equals("0")) {
                            st += "Theory";
                        %>
                        <td align="center"><%=subject_code1%></td>
                        <td style="padding: 4px;"><%=subject_name1%></td>
                        <td align="center"><%= st%></td>

                        <%
                        } else {
                        %>

                        <td align="center"><%=subject_code1%></td>
                        <td style="padding: 4px;"><%=subject_name1%></td>
                        <td align="center">Theory</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td align="center"><%=subject_code1%></td>
                        <td style="padding: 4px;"><%=subject_name1%></td>
                        <td align="center">Practical</td>





                        <%  }

                            //st2 = st;
                        %>


                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%                        } while (rs.next());

                        }


                    %>       


                </table>

            </div>   </center>
    </center>

    <% }%>


    <div style="width: 1400px;">
        <center>
            <input id="pay" style="margin-top: 0px;"  type="button" onclick="window.print();" value="Print" class="btn btn-primary"/>
        </center>
    </div>
</p>


</center>


<jsp:include page="footer.html" />
</body>
</html>



