<%-- 
    Document   : checkSchem
    Created on : 8 Oct, 2019, 3:48:20 PM
    Author     : Ravindra
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>

<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="bootstrap_file.jsp" />
        <title>Check Schema </title>
    </head>

    <body>
        <jsp:include page="header.html" />
        
        <%! HttpSession session1;
            String uname, uname1;
            String pass, pass1;
            String query, query2;
            PreparedStatement pd;
            String branch;
            int sem;
            String course;
            String coursetype;
            String subcode;
            String subname;
            String theory_credit;
            String  practical_credit;
            String str;
        %>
        <%
            ServletContext context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            try {
                session1 = request.getSession();

                uname = (String) session1.getAttribute("uname");

                pass = (String) session1.getAttribute("pass");
                if (uname == null || pass == null) {
                    response.sendRedirect("admin.jsp");
                }

                query = "select * from administration where user_name=?";

                PreparedStatement pd = con.prepareStatement(query);
                pd.setString(1, uname);
                ResultSet rs = pd.executeQuery();
                if (rs.next()) {
                    uname1 = rs.getString(1);
                    pass1 = rs.getString(2);
                }
                if (uname.equals(uname1) && pass.equals(pass1)) {
                    sem = Integer.parseInt(request.getParameter("sem"));
                    branch = request.getParameter("branch");
                    course = request.getParameter("course");
                    
                    str = course;
                    course = str.substring(0, 1);
                    coursetype = str.substring(1, 2);

                if (str.equals("MSF")) {
                    course = "MSC";
                    coursetype = "F";
                } else if (str.equals("MSP")) {
                    course = "MSC";
                    coursetype = "P";
                } else {
                    if (course.equals("B")) {
                        course = "BE";
                    } else {
                        course = "ME";
                    }
                }
                
//                 out.println("branch ="+branch);
//                out.println("<br> sem = "+ sem);
//                out.println("<br> course ="+course);
//                out.println("<br> coursetype = "+coursetype);
                    query2 = "select * from schema_table,subject_table where branch=? and sem=? and course=? and coursetype=? and schema_table.subcode = subject_table.subject_code ";
                    
                    pd = con.prepareStatement(query2);
                    pd.setString(1, branch);
                    
                    pd.setInt(2, sem);
                    
                    pd.setString(3, course);
                    
                    pd.setString(4,coursetype);
//                    out.println("hello");
                    rs = pd.executeQuery();
//                    out.println("hello");
        %>


        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
        <table class="table table-bordered ml-2 mt-2">
            <thead>
                <tr>

                    <th>Sno.</th>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Theory Credit</th>
                    <th>Practical Credit</th>
                    <th>Course</th>
                    <th>Branch</th>
                    <th>Semester</th>
                    <th>Course Type</th>
                </tr>
            </thead>
            <tbody>
                <%   int i = 1;      
                    while (rs.next()) {
                        
                        branch = rs.getString("branch");
                        sem = Integer.parseInt(rs.getString("sem"));
                        course = rs.getString("course");
                        coursetype = rs.getString("course");
                        subcode = rs.getString("subcode");
                        subname = rs.getString("subject_name");
                        theory_credit = rs.getString("theory_credits");
                        practical_credit = rs.getString("practical_credits");

                %>
                <tr><td><%= i%></td>
                    <td><%= subcode%></td>
                    <td><%= subname%></td>
                    <td><%= theory_credit %></td>
                    <td><%= practical_credit %></td>
                    <td><%= course  %></td>
                    <td><%= branch %></td>
                    <td><%= sem %></td>
                    <td><%= coursetype%></td>
                </tr>

                <%
                                i = i + 1;
                            }
                        } else {
                            response.sendRedirect("admin.jsp");
                        }

                    } catch (Exception e) {
                        out.println(e + "skn");
                    }
                %>
            </tbody>
        </table>
        
                <jsp:include page="footer.html" />
    </body>

</html>

