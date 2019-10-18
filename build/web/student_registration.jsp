<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration</title>
        <meta charset="UTF-8">
        <jsp:include page="bootstrap_file.jsp" />
    </head>
    <%@page import="java.sql.*" import="java.io.IOException" 
            import="java.io.PrintWriter" 
            import="javax.servlet.annotation.WebServlet" 
            import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
            import="javax.servlet.http.HttpServletResponse"  %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%! Connection con;
        String eno;
        String sub_codes[];
        String en;
        String name;
        String status1;
        int sem1;
        String branch;
        String scheme_id;
        String subject_name;
        String subtype;
        String section;
        String subcode;
        String address;
        String rollno;
        String district;
        String key;
        String category;
        String course;
        String house_no, colony;
        String year;
        int count;
        int sem_num;
        String st1 = "";
        String sub_type, sub_type1;
        int fee1 = 0;
        String coursetype;
        ServletContext context;
    %>
    <%

        eno = (request.getParameter("enrollmentno")).toUpperCase();
        status1 = request.getParameter("status");
        sem1 = Integer.parseInt(request.getParameter("sem"));
        branch = request.getParameter("branch");
        course = request.getParameter("course");
//        out.println("eno = "+eno);
//        out.println("<br>status1 = "+status1);
//        out.println("<br>sem1 = "+sem1);
//        out.println("<br>branch = "+ branch);
//       out.println("course = "+course);
        
        
        	String str = course;
		 course = str.substring(0,1);
                 coursetype = str.substring(1,2);
		
		
		if(str.equals("MSF"))
		{
			course = "MSC";
			coursetype = "F";
		}
		else if(str.equals("MSP"))
		{
			course = "MSC";
			coursetype = "P";
		}
		else{
			if(course.equals("B"))
			course = "BE";
                        else
			course = "ME";
                    }
	//	System.out.println("course = "+ course);
		//System.out.println("coursetype = "+ coursetype);
        
        HttpSession s = request.getSession();
        s.setAttribute("e", eno);
        s.setAttribute("s", status1);
        s.setAttribute("sem", sem1);
        try {

            context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
             } catch (Exception e) {

          out.println(" ..");
        out.println("<script>"
                    + "Swal.fire({type: 'error',title:'Recored Not Find',title:'There was Some Problem',})"
                    + ".then(function(){window.location ='index.jsp' ;});"
                    + "</script>");
    }
            //PreparedStatement ps = con.prepareStatement("SELECT roll_no,enrollment_no,name,year,branch,section,subcode,subtype,subject_name from all_students,schema_table,subject_table where subject_table.subject_code=schema_table.subcode and  all_students.enrollment_no=? and all_students.sem=? ");
//            PreparedStatement ps = con.prepareStatement("SELECT roll_no,enrollment_no,name,year,branch1,section,subcode,subtype,subject_name,sem1 from all_students,schema_table,subject_table where all_students.enrollment_no = ? and all_students.sem1=?  and schema_table.sem =? and schema_table.branch=? and schema_table.course = ? and schema_table.coursetype = ? and subject_table.subject_code=schema_table.subcode ");
            PreparedStatement ps = con.prepareStatement(" SELECT roll_no,enrollment_no,name,year,branch1,section,subcode,subtype,subject_name,sem1 from all_students,schema_table,subject_table where enrollment_no=? and sem1=? and sem=? and coursetype=? and  course=? and branch=? and subject_table.subject_code=schema_table.subcode ");
                                                            
            ps.setString(1, eno);
            ps.setInt(2, sem1);
            ps.setInt(3,sem1);
            ps.setString(6,branch );
            ps.setString(5, course );
            ps.setString(4, coursetype );
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                branch = rs.getString("branch1");
                rollno = rs.getString("roll_no");
                name = rs.getString(3);
                year = rs.getString("year");
                s.setAttribute("name", name);


    %>





    <!DOCTYPE html>

    <title> EX_Student</title>
</head>
<body>
    <jsp:include page="header.html" />
<a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
<div class="container mx-auto">
    
    <div id="d1">
        
        <h3 align="center">
            UTD Pay-Unpaid Examination Form/Print Reciept
        </h3>
        

        <div style="background-color: #B0C4DE;text-align: left;">
                <center> Student Detail</center>
        </div>
        <form action="upload.jsp?enrollmentno=<%= eno %>" method="get" >

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

                    <th align="left">
                        Registration for Examination
                    </th>
                    <td align="left">
                        <span>JULY 2019</span>
                    </td>
                    <th align="left">
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
                    <td>
                        <span>BE</span>
                    </td>
                    <th>
                        Programme/Branch
                    </th>
                    <td>
                        <div><%= branch%></div>
                    </td>
                    <th>
                        Semester
                    </th>
                    <td>
                        <span><%= sem1%></span>
                    </td>

                </tr>
                <tr>

                    <th>
                        Enrollment No.
                    </th>
                    <td>
                        <span><%= eno%></span>
                    </td>
                    <th>
                        Roll No.
                    </th>
                    <td>
                        <span><%= rollno%></span>
                    </td>
                    <th>
                        Class
                    </th>
                    <td>
                        <span><%= year %></span>
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
                    <th >
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
                <center>Subject Description</center>
            </div>
<table class="table table-bordered">
                <tr>
                    <th>
                        Paper Code
                    </th>
                    <th>
                        Paper Description
                    </th>

                    <th>
                        Paper Type
                    </th>
                    <!--<th align="left">Select Subjects</th>-->
                </tr>


                <%
                   
                    con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
                  
                    //PreparedStatement ps1 = con.prepareStatement("SELECT subcode,subtype,subject_name from all_students,schema_table,subject_table where subject_table.subject_code=schema_table.subcode and schema_table.rollno=all_students.roll_no and all_students.enrollment_no=? and all_students.sem=? ");
                    PreparedStatement ps1 = con.prepareStatement("SELECT subcode,subtype,subject_name from schema_table,subject_table where schema_table.sem =? and schema_table.branch=? and schema_table.course = ? and  schema_table.coursetype = ? and subject_table.subject_code=schema_table.subcode");
                
                    ps1.setInt(1, sem1);
                    ps1.setString(2,branch);
                    ps1.setString(3,course);
                    ps1.setString(4, coursetype);

                    ResultSet rs1 = ps1.executeQuery();
                    
                    if (rs1!=null) {
                             //out.println("hello3");
//                        branch = rs1.getString("branch");
//                        course = rs1.getString("course");
                       while(rs1.next()) {
                                 
                            subtype = rs1.getString("subtype");
//                            out.println(subtype);
                            subcode = rs1.getString("subcode");
                            subject_name = rs1.getString("subject_name");
                            String st="";
                            if(subtype.equals("0")) {
                                st += "T";
                            } else if (subtype.equals("1")) {
                                st += "P";
                            } else {
                                st += "T+P";
                            }

                        st1=st;
                    
                   
                %>

                <tr>
                    <td>
                        <span><%=subcode%></span>
                    </td>
                    <td>
                        <span><%= subject_name%></span>
                    </td>
                    <td>
                        <span><%= st1 %></span>
                    </td>
                    <!--<td><input type="checkbox" name="sub_code" value=<%=key%> /></td>-->

                </tr>
                <%

                        }
                        
                    }
                     else {
                       // response.sendRedirect("index.jsp");
                    }


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

    </div>
</div>
<center>

    <input type="submit" style="margin-top: 10px" id="pay" class="btn btn-success"  value="Go ->" disabled/>
</center><br>
<input type="hidden" name="fee1" value="<%=fee1%>">  
<script>

    var checker = document.getElementById('check');

    var sendbtn = document.getElementById('pay');
    // when unchecked or checked, run the function

    checker.onchange = function ()
    {

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
<input type="hidden" name="enrollmentno" value=<%= eno %> />
</form> 



<%
} else {

                out.println(" ..");
        out.println("<script>"
                    + "Swal.fire({type: 'error',title:'Recored Not Find',title:'Recored Not Find',})"
                    + ".then(function(){window.location ='index.jsp' ;});"
                    + "</script>");
        }
%>
<jsp:include page="footer.html" />
</body>
</html>
