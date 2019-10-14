
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int subject;
%>
<%
    subject = Integer.parseInt(request.getParameter("subject"));

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ex-Student Fee</title>
        <link rel="icon" href="input/logo.png">
        <jsp:include page="bootstrap_file.jsp" /> 
    </head>

    <body>
        <jsp:include page="header.html" />
        
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
        <div class="container" style="margin-bottom: -3px;">
            <form action="ex_student_fee_update.jsp" method="get">
            <table class="table table-bordered">
                <thead
                <tr> 
                    <th >No of Subjects</th>
                    <th>Fees Amount</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                        <%    try {
                                ServletContext context = getServletContext();
                                Class.forName(context.getInitParameter("Driver"));
                                Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

                                PreparedStatement ps = con.prepareStatement("select * from ex_fees where subjects=?");
                                ps.setInt(1, subject);
                                ResultSet rs = ps.executeQuery();

                                rs.next();
                                int sub = rs.getInt("subjects");
                                int fee = rs.getInt("fees");
                        %>
                <tr>
                    <td style="width:100px;"> <input type="number" value="<%=sub%>" name="sub" class="edit form-control" ></td>
                    <td style="width:100px;"> <input type="number" value="<%=fee%>" name="fee" class="edit form-control" ></td>
                    <td style="width:100px;"><input type="submit" value="Update" class=" btn btn-success " ></td>
                </tr>
                <%

                    } catch (Exception e) {
                        out.println(e);
                    }


                %>

                </tbody>
            </table>
        </form>
        </div>
        <jsp:include page="footer.html" />
    </body>

</html>
