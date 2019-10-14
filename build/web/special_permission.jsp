<%@page import="java.sql.Connection"%>
<%@page import ="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="java.sql.*" %>
<%@page import ="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String sub_type;
    String subject;
    String subject_code;
    String key;
    String sub_type1;
    String sem;
%>
<%

    String eno = request.getParameter("eno");
    String sem = request.getParameter("sem");
    try {
        ServletContext context = getServletContext();
        Class.forName(context.getInitParameter("Driver"));
        Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        PreparedStatement ps = con.prepareStatement("select distinct * from ex_student inner join subschema on ex_student.subject_code= subschema.subject_code and ex_student.branch=subschema.branch where enrollment_no=? and payment_status=?");
        ps.setString(1, eno);
        ps.setString(2, "Unpaid");
        int i = 0;
        ResultSet rs = ps.executeQuery();
%>
<html>

    <head>
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
        <jsp:include page="bootstrap_file.jsp" />
    </head>
    <body>   
        <jsp:include page="header.html" />
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
        <div class="container">
        <form action="permission_grant.jsp">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <td ><b>Subject Code</b></td>
                    <td ><b>Subject Name</b></td>
                    <td><b>Subject Type</b></td>
                    <td><b>Grant Permission</b></td>
                </tr>
                </thead>
                <tbody>
                <%
                    while (rs.next()) {
                        do {
                            //count+=1;
                            subject = (rs.getString("subject_name")).toUpperCase();
                            subject_code = rs.getString("subject_code");
                            sub_type = rs.getString("subject_type");

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
                    <td><input type="checkbox" style = "width:30px;height:30px;" name="sub_code" value=<%=key%>   /></td>

                </tr>


                <%
                    } while (rs.next());
                %>
                </tbody>
            </table>
            <input type="hidden" name="eno" value="<%=eno%>">
            <input type="hidden" name="sem" value="<%=sem%>">
            <center>   <input type="submit" value="submit" style="margin-left:auto;margin-right:auto" class="btn btn-success"></center>
        </form>
        </div>
        <%

                }
            } catch (Exception e) {
                out.println(e);
            }

        %>
        <jsp:include page="footer.html" />
    </body>
    
</html>