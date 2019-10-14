<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challan Upload</title>


    </head>
    <body>
        <%!
            String subject_codes[];
            String query1;
            String eno;
            String status;
            String query2;
        %>
        <%
            HttpSession session1 = request.getSession();
            eno = (String) session1.getAttribute("e");
            status = (String) session1.getAttribute("s");
            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            if (status.equalsIgnoreCase("Ex")) {
                subject_codes = request.getParameterValues("sub_code");

                if (subject_codes != null) {
                    out.println("r2");
                    for (int i = 0; i < subject_codes.length; i++) {
                        query1 = "update ex_student set reg=? where enrollment_no=? and subject_code=? and subject_type=?";
                        PreparedStatement pd = con.prepareStatement(query1);
                        pd.setString(1, "Y");
                        pd.setString(2, eno);
                        pd.setString(3, (subject_codes[i]).substring(0, 6));
                        pd.setString(4, (subject_codes[i]).substring(6, 7));
                        int j = pd.executeUpdate();

                    }
                    response.sendRedirect("ex_transaction.jsp");
                } else {
                    out.println("2");
                }
            } else if (status.equalsIgnoreCase("Regular")) {
                query2 = "update eligible set reg=? where enroll_no=?";
                PreparedStatement pd = con.prepareStatement(query2);
                pd.setString(1, "Y");
                pd.setString(2, eno);
                int i = pd.executeUpdate();
                response.sendRedirect("transaction.jsp");
            }
        %>


    </body>
</html>
