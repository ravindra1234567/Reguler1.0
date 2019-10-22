
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

<%! String query3;
    String query4;
    String date;
    String payment_status;
    String query5;
    String query6;
    String date2;
    int time1;
    String time2;
    String transaction_id;
    String eno;
    String query7;
    String pay_mode;
    int fee;
    String name;
    String sem;
    String reg;
    String category;
    String gender;
    String address;
    String image;
    String s;
    String rno;
    String query;
    String subject;
    String subject_code;
    String query1;
    String branch;
    String[] sub = new String[50];
    String subCode[] = new String[50];
    int i;
    int j;
    String eno1;
    String city;
    String district;
    String scheme_id;
    String course;
    String house_no, colony;
    int sem_num;
    String sub_type, sub_type1;
    int fee1, sem1;
    String enrollment_no;
    String status;
    String challan_no;
    String roll_no;
    String sub_code[];
    String dt;
    String query10;
%>


<%
    HttpSession ss = request.getSession();
    enrollment_no = (String) ss.getAttribute("e");
    status = (String) ss.getAttribute("s");
    sem = (String) ss.getAttribute("sem");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
    Date date = new Date();
    dt = sdf.format(date);
    sem1 = Integer.parseInt(sem);
    name = (String) ss.getAttribute("name");
    //  ss.invalidate();

    sub_code = request.getParameterValues("sub_code");
    if (enrollment_no == null) {
        response.sendRedirect("index.jsp");
    }

    try {

        ServletContext context = getServletContext();
        Class.forName(context.getInitParameter("Driver"));
        Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        PreparedStatement ps2 = con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=? and ex_student.reg=? and subschema.sem=?");
        ps2.setString(1, enrollment_no);
        ps2.setString(2, "Y");
        //ps2.setString(3,branch);
        ps2.setInt(3, sem1);
        ResultSet rs2 = ps2.executeQuery();

        rs2.last();
        branch = rs2.getString("branch");
        roll_no = rs2.getString("roll_no");
        course = rs2.getString("course");
        fee1 = rs2.getRow();
        rs2.beforeFirst();

        if (fee1 > 3) {
            fee1 = 3;
        }
        PreparedStatement ps = con.prepareStatement("select * from ex_fees where subjects=?");
        ps.setInt(1, fee1);
        ResultSet rs = ps.executeQuery();
        rs.next();
        fee1 = rs.getInt(3);
%>


<!DOCTYPE html>

<head>
    <title>Exam Registration</title>
    <style>
        #d1{
            border-radius: 25px;
            border: 2px solid;
            padding: 2%;
            border-style: groove;
        }
    </style>
    <jsp:include page="bootstrap_file.jsp" />
</head>
<body>
    <jsp:include page="student_header.jsp" />
    <div class="container">

        <div id="d1">
            
            <h3 align="center">
                <span class="mb-2">Institute of Engineering & Technology - DAVV(Indore)</span><br>
                UTD Pay-Unpaid Examination Form/Print Reciept ( SEM <%= sem%> )
            </h3>
            <div class="head1" style="z-index: 750;background-color: #B0C4DE;text-align: center;">
                Transaction Details
            </div>
            <table class="table table-bordered">
                <tr>
                    <td >
                        Payment Mode:
                    </td>
                    <td >
                        <span>Challan</span>
                    </td>
                    <td >
                        Date:
                    </td>
                    <td >
                        <span><%= dt%></span>
                    </td>

                </tr>
                <tr>
                    <td >
                        Challan Number:
                    </td>
                    <td >
                        <span></span>
                    </td>
                    <td >
                        Application Fee(Rs.):
                    </td>
                    <td  colspan="2">
                        <span><%= fee1%></span>
                    </td>

                </tr>


            </table>

            <div style="background-color: #B0C4DE;text-align: center;">
                Student Detail
            </div>
            <table class="table table-bordered">
                <tr>

                    <td >
                        Name of College(Code)
                    </td>
                    <td  colspan="4">
                        <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                    </td>
                    <td rowspan="2" align="center">
                        <img id="ihoto" style="height:120px;width:100px;border-width:0px;"/>
                    </td>

                </tr>
                <tr>

                    <td >
                        Registration for Examination
                    </td>
                    <td >
                        <span>Nov-2019</span>
                    </td>
                    <td >
                        Examination Centre(Code)
                    </td>
                    <td  colspan="2">
                        <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                    </td>

                </tr>
                <tr>

                    <td >
                        Name of Course
                    </td>
                    <td >
                        <span><%= course%></span>
                    </td>
                    <td >
                        Branch
                    </td>
                    <td >
                        <div><%= branch%></div>
                    </td>
                    <td >
                        Semester
                    </td>
                    <td >
                        <span><%= sem%></span>
                    </td>

                </tr>
                <tr>

                    <td >
                        Enrollment No.
                    </td>
                    <td >
                        <span><%= enrollment_no%></span>
                    </td>
                    <td >
                        Roll No
                    </td>
                    <td >
                        <span><%= roll_no%></span>
                    </td>
                    <td >
                        Class
                    </td>
                    <td >
                        <span></span>
                    </td>

                </tr>
                <tr>
                    <td >
                        Name of Examinee
                    </td>
                    <td >
                        <div><%= name%></div>
                    </td>


                    <td >
                        Status
                    </td>
                    <td >
                        <span><%= status%></span>
                    </td>

                    <td >
                        Gender
                    </td>
                    <td >
                        <span></span>
                    </td>
                </tr>
                <tr>

                    <td >
                        Father's Name 
                    </td>
                    <td  colspan="2">
                        <div></div>
                    </td>
                    <td >
                        Mother's Name
                    </td>
                    <td  colspan="2">
                        <span></span>
                    </td>

                </tr>

                <tr>

                    <td >
                        Category
                    </td>
                    <td  colspan="2">
                        <div></div>
                    </td>
                    <td  >
                        Mobile NO
                    </td>
                    <td  colspan="2">
                        <span></span>
                    </td>


                </tr>

                <tr><td >
                        Present Address
                    </td>
                    <td  colspan="5">
                        <div></div>
                    </td></tr>
                <tr>

                    <td >
                        City
                    </td>
                    <td  colspan="2">
                        <span></span>
                    </td>
                    <td >
                        District
                    </td>
                    <td  colspan="2">
                        <span></span>
                    </td>

                </tr>     


            </table>
            <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: center;">
                Subject and Fees Description
            </div>
            <table class="table table-bordered">
                <tr>
                    <th >
                        Paper Code
                    </th>
                    <th >
                        Paper Description
                    </th>
                    <th >
                        Paper Type
                    </th>
                </tr>


                <%

                    if (rs2.next()) {
                        branch = rs2.getString("branch");
                        course = rs2.getString("course");

                        do {
                            subject = rs2.getString("subject_name");
                            subject_code = rs2.getString("subject_code");
                            sub_type = rs2.getString("subject_type");
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
                </tr>
                <%
                        } while (rs2.next());

                    }

                %>       

            </table>
        </div>


        <%     query10 = " select * from ex_student where ex_student.enrollment_no=? and ex_student.sem=? and ex_student.reg=?";
            PreparedStatement pd10 = con.prepareStatement(query10);
            pd10.setString(1, enrollment_no);
            pd10.setInt(2, sem1);
            pd10.setString(3, "Y");
            ResultSet rs10 = pd10.executeQuery();

            if (rs10.next()) {

                j = 0;
                eno = rs10.getString(2);

                name = (rs10.getString("name")).toUpperCase();
                rno = rs10.getString("roll_no");
        %>

        <p style="page-break-after:always"></p>


        <div class="relative" id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>

        <div id="d1">

            
            <h2 align="center"  >
                Institute of Engineering & Technology - DAVV(Indore)
                <br>   (RASA Form)</br>
            </h2>
            <br>
            <table class="table table-bordered">
                <tr><th>
                        Enrollment Number:
                    </th>
                    <td><%=eno%></td>
                    <td rowspan="7"><img id="ihoto" src= "show.jsp?image=<%= eno%>" style="height:185px;width:165px;border-width:0px;"/> </td>
                </tr>

                <tr>
                    <th>Roll No.</th>
                    <td><%=rno%></td>


                </tr>

                <tr>
                    <th>Exam Name:</th>
                    <td>Nov 2019</td>
                </tr>

                <tr>
                    <th>Exam Center:</th>
                    <td>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE[808]</td>
                </tr>
                <tr>
                    <th>Exam Month:</th>
                    <td>Nov 2019</td>
                </tr>
                <tr>
                    <th>Name:</th>
                    <td><%=name%></td>
                </tr>

                <tr><th>Branch</th>
                    <td><%= branch  %> </td>
                </tr>

                <tr><th>Semester
                    </th>
                    <td colspan="2"><%= sem  %> </td>
                </tr>
                <tr>
                    <th>Status:</th>
                    <td colspan="2">Ex</td>
                </tr>
            </table>
            

            <br>
            <h3>Opted Paper Description(Not In Sequence According To Time Table Of University)</h3>
            <br>

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

                        PreparedStatement ps11 = con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=?  and reg='Y'");
                        ps11.setString(1, enrollment_no);
                        ResultSet rs11 = ps11.executeQuery();

                        if (rs11.next()) {    // branch=rs2.getString(2);
                            //  course=rs2.getString(1);

                            do {
                                subject = (rs11.getString("subject_name")).toUpperCase();
                                subject_code = rs11.getString("subject_code");
                                sub_type = rs11.getString("subject_type");
                                if(sub_type.equals("T"))
                                {
                                    sub_type="Theory";
                                }
                                else{
                                    sub_type="Practical";
                                }

                    %>


                    <td align="center"><%=subject_code%></td>
                    <td style="padding: 4px;"><%=subject%></td>
                    <td align="center"><%= sub_type%></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <% } while (rs11.next());
                    }


                %>

            </table>

        </div>   


        <%                  }
            } catch (Exception e) {

                e.printStackTrace();
            }
        %>

        <div align="center" class="mt-2">
            
                    <a href="">
                        <button id="pay" style="" type="button" onclick="window.print()" value="Print" class="btn  btn-success noprint">Print</button>
                    </a>
                
                    <a href="index.jsp" style="color:white;"><button class=" btn btn-danger noprint  ">Exit</button></a>
                
        </div>   
    </div>
    <jsp:include page="footer.html" />   
</body>
</html>





