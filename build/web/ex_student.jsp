<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="icon" href="input/logo.png">
        <jsp:include page="bootstrap_file.jsp" />


        <style>
            .genText{
                font-family: 'Quicksand', sans-serif;
                font-size: 1.2em;
                font-weight: 1000;
            }
            .div1{
                border-radius: 25px;
                border: 2px solid;
                padding: 10px;
                padding-top: 0px;
                margin-top: 50px;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 50px;
                width: 1100px;
            }

            #t1{
                background-color: #B0C4DE;
                width: 1000px;
                font-family:calibri;
                font-weight: bolder;
                font-size: 17px;
                margin-top: 1px; 
            }

            #t2{
                font-family:calibri;
                border-collapse:collapse;
                width: 1000px;
                border-color: grey;
                font-size: 15px;
            }

        </style>
    </head>





    <%@page import="java.sql.*" import="java.io.IOException" 
            import="java.io.PrintWriter" 
            import="javax.servlet.annotation.WebServlet" 
            import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
            import="javax.servlet.http.HttpServletResponse"  %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <header>
        <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
        <h2>Institute Of Engineering &amp; Technology</h2>
        <div class="menu">
            <a href="student_select.jsp">Student Admit Card</a>

            <a href="admin.jsp">Admin</a>
            <a href="index.jsp">Home</a>
        </div>
    </header>

    <%! String eno;
        String sub_codes[];
        String en;
        String image;
        String name;
        String status1;
        String sem1;
        String branch;
        String scheme_id;
        String subject;
        String subject_code;
        String address;
        String rollno;
        String district;
        String key;
        String category;
        String course;
        String house_no, colony;
        int count;
        int sem_num;
        String sub_type, sub_type1;
        int fee1 = 0;
    %>
    <%

        eno = (request.getParameter("enrollmentno")).toUpperCase();
        status1 = request.getParameter("status");
        sem1 = request.getParameter("sem");

        HttpSession s = request.getSession();
        s.setAttribute("e", eno);
        s.setAttribute("s", status1);
        s.setAttribute("sem", sem1);
        try {

            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            PreparedStatement ps = con.prepareStatement("select * from ex_student where enrollment_no=? and sem=?");
            ps.setString(1, eno);
            ps.setString(2, sem1);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                branch = rs.getString("branch");
                rollno = rs.getString("roll_no");
                name = rs.getString(3);
                s.setAttribute("name", name);


    %>





    <!DOCTYPE html>

    <title> EX_Student</title>
    <style>
        #d1{
            border-radius: 25px;
            border: 2px solid;
            padding: 2%;
            border-style: groove;
        }
        .footer {
            position:relative;
            left: 0;
            bottom: 0;
            width: 100%;
            height:150px;
            background-color:limegreen;
            color: white;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container mx-auto">
        <a href="#"><button class="btn btn-primary" style="" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
        <br> <br> 
        <div id="d1">

            <hr>
            <h3 align="center">
                UTD Pay-Unpaid Examination Form/Print Reciept
            </h3>
            <hr>

            <div style="background-color: #B0C4DE;text-align: left;">
                Student Detail
            </div>
            <form action="ex_transaction.jsp" method="get">

                <table class="table table-bordered shadow">
                    <tr>

                        <th align="left">
                            Name of College(Code)
                        </th>
                        <td align="left" colspan="4">
                            <span>
                                INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                        </td>
                        <td rowspan="2" align="center">
                            <img id="ihoto" style="height:120px;width:100px;border-width:0px;"/>
                        </td>

                    </tr>
                    <tr>

                        <th>
                            Registration for Examination
                        </th>
                        <td>
                            <span>DEC 2018</span>
                        </td>
                        <th>
                            Examination Centre(Code)
                        </th>
                        <td align="left" colspan="2">
                            <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                        </td>

                    </tr>
                    <tr>

                        <th>
                            Name of Course
                        </th>
                        <td align="left">
                            <span>BE</span>
                        </td>
                        <th>
                            Programme/Branch(Code)
                        </th>
                        <td align="left">
                            <div><%= branch%></div>
                        </td>
                        <th>
                            Semester/Year
                        </th>
                        <td align="left">
                            <span><%= sem1%></span>
                        </td>

                    </tr>
                    <tr>

                        <th>
                            Roll No./Enrollment No.
                        </th>
                        <td align="left">
                            <span><%= eno%></span>
                        </td>
                        <th>
                            Roll No.
                        </th>
                        <td align="left">
                            <span><%= rollno%></span>
                        </td>
                        <th>
                            Class
                        </th>
                        <td align="left">
                            <span></span>
                        </td>

                    </tr>
                    <tr>
                        <th>
                            Name of Examinee
                        </th>
                        <td align="left">
                            <div><%= name%></div>
                        </td>

                        <th>
                            Status
                        </th>
                        <td align="left">
                            <span><%= status1%></span>
                        </td>
                        <th>
                            Gender
                        </th>
                        <td align="left">
                            <span></span>
                        </td>

                    </tr>
                    <tr>

                        <th>
                            Father's Name 
                        </th>
                        <td align="left" colspan="2">
                            <div></div>
                        </td>
                        <th>
                            Mother's Name
                        </th>
                        <td align="left" colspan="2">
                            <span></span>
                        </td>

                    </tr>

                    <tr>

                        <th>
                            Category
                        </th>
                        <td align="left" colspan="2">
                            <div></div>
                        </td>
                        <th>
                            Mobile NO
                        </th>
                        <td align="left" colspan="2">
                            <span></span>
                        </td>


                    </tr>

                    <tr><th>
                            Present Address
                        </th>
                        <td align="left" colspan="5">
                            <div></div>
                        </td></tr>
                    <tr>

                        <th>
                            City
                        </th>
                        <td align="left" colspan="2">
                            <span></span>
                        </td>
                        <th>
                            District
                        </th>
                        <td align="left" colspan="2">
                            <span></span>
                        </td>

                    </tr>     
                </table>

                <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: left;">
                    Subject and Fees Description
                </div>
                <table class="table table-bordered shadow">
                    <tr>
                        <th align="left">
                            Paper Code
                        </th>
                        <th align="left">
                            Paper Description
                        </th>

                        <th align="left">
                            Paper Type
                        </th>
                        <th align="left">Select Subjects</th>
                    </tr>


                    <%
                        sem1 = sem1.substring(0, 1);
                        sem_num = Integer.parseInt(sem1);

                        PreparedStatement ps2 = con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code  where ex_student.enrollment_no=? and subschema.branch=? and ex_student.reg='N' and subschema.sem=? ");
                        ps2.setString(1, eno);
                        ps2.setString(2, branch);
                        ps2.setInt(3, sem_num);
                        ResultSet rs2 = ps2.executeQuery();
                        count = 0;
                        if (rs2.next()) {
                            branch = rs2.getString("branch");
                            course = rs2.getString("course");
                            do {
                                count += 1;
                                subject = (rs2.getString("subject_name")).toUpperCase();
                                subject_code = rs2.getString("subject_code");
                                sub_type = rs2.getString("subject_type");

                                key = subject_code + sub_type;
                                if (sub_type.equals("T")) {
                                    sub_type1 = "Theory";
                                } else {
                                    sub_type1 = "Practical";
                                }

                    %>

                    <tr>
                        <td>
                            <span><%=subject_code%></span>
                        </td>
                        <td>
                            <span><%= subject%></span>
                        </td>
                        <td>
                            <span><%= sub_type1%></span>
                        </td>
                        <td><input type="checkbox" name="sub_code" value=<%=key%> /></td>

                    </tr>
                    <%
                        } while (rs2.next());
                    %>                                   

                    <%	} else {
                            response.sendRedirect("index.jsp");
                        }
                        if (count == 1) {
                            fee1 = 690;
                        } else if (count == 2) {
                            fee1 = 1165;
                        } else if (count > 2) {
                            fee1 = 1650;
                        }

                        String fee = Integer.toString(fee1);
                        s.setAttribute("fee1", fee);

                    %>                

                </table>

                <div align="center">
                    <span style="text-align:center;">
                        <input id="check" type="checkbox" name="chkDeclaration"/>
                        <label><b>CERTIFIED THAT</b></label>
                    </span>
                </div>

                <div>
                    <span>
                        I hereby declare that the information filled by me is true and complete as per my knowledge. If any information provided by me is found false or incorrect then i shall be disqualified by the university.
                    </span>
                </div>
            <center>
                <input type="submit" style="margin-top: 10px" id="pay" class="btn btn-success"  value="GO ->" disabled/>
            </center><br>

            <input type="hidden" name="fee1" value="<%=fee1%>">  
            <script>

                var checker = document.getElementById('check');

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
            </script> 
        </form>
        </div>
</div>
</body>
<%
} else {
%>

<script>
    if (window.confirm("No Records Found"))
    {
        window.location = "index.jsp";
    }
    else
    {
        window.location = "index.jsp";
    }

</script>
<%
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

%>
<footer>
    <p align="center" id="p1">
        D e v e l o p e d &nbsp&nbsp & &nbsp&nbsp D e s i g n e d &nbsp&nbsp b y :- 
    </p>
    <hr align="center" width="60%">
    <p align="center" id="p2">
        Developed & Designed by :- Hemant Sir,Ravindra Kumar Kushwaha and Sumit kr.

        For any queries contact ravindrakushwahanwg@gmail.com.
        Copyright © 2019 IET DAVV. All right reserved.
    </p>

</footer>
</html>
