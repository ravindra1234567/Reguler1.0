<%-- 
    Document   : not_eligible_student
    Created on : 21 Aug, 2019, 10:25:00 AM
    Author     : Ravindra
--%>



<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Not Registered Student </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <jsp:include page="bootstrap_file.jsp" />
    </head>
    <body> 
        <jsp:include page="header.html" />
        <%! HttpSession session1;
            String uname, uname1;
            String pass, pass1;
            String query, query3;
            String sem;
            String branch;
            String payment_status, status;
            String eno, roll_no;
            String name;
            String query1, query2;
            PreparedStatement pd;
            String course;
            ResultSet rs;

            String photourl;
            String transection_id;
        %>
        <%
            ServletContext context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            try {
                session1 = request.getSession();

                uname = (String) session1.getAttribute("uname");

                pass = (String) session1.getAttribute("pass");

                // session1.invalidate();
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

                    //  payment_status=request.getParameter("payment_status");
                    sem = request.getParameter("sem");
                    // status=request.getParameter("status");

                    branch = request.getParameter("branch");
                    course = request.getParameter("course");

                    query2 = "select  roll_no,application_id,name,photourl,branch1,sem1 from all_students where branch1=? and all_students.sem1=? and status = 0  ";

                    pd = con.prepareStatement(query2);
                    pd.setString(1, branch);

                    pd.setString(2, sem);
                    rs = pd.executeQuery();

        %>


        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
        <div class="container">
        <table class="table table-bordered ml-2 mt-2" >
            <thead>
                <tr>

                    <th>Sno.</th>
                    <th>Roll Number</th>
                    <th>NAME</th>
                    <th>BRANCH</th>
                    <th>SEMESTER</th>
                    <th>Transection Id</th>
                    <th>Slip</th>
                </tr>
            </thead>
            <tbody>
                <%      
                        int i = 1;
                        while (rs.next()) {
                        name = (rs.getString("name")).toUpperCase();
                        roll_no = (rs.getString("roll_no")).toUpperCase();
                        photourl = rs.getString("photourl");
                        transection_id = rs.getString("application_id");
                %>
                <tr>
                    <td><%= i%></td>
                    <td><%=roll_no%></td>
                    <td><%= name%></td>
                    <td><%= branch%></td>
                    <td><%= sem%></td>
                    <td><%= transection_id%></td>
                    <td><img src="image/<%= photourl%>" class="img-thumbnail" alt="slip" width="200" height="136"></td>
                </tr>



                <%
                    i = i + 1;
                }
            } else {
                response.sendRedirect("admin.jsp");
            }
            } catch (Exception e) {
            out.println(e);
                }
            %>
            </tbody>
</table>
        </div>
<jsp:include page="footer.html" />
</body>

</html>
