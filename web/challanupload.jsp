


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
            String roll_no;
            String tid;
        %>
        <%
            roll_no=request.getParameter("rollno");
            tid = request.getParameter("tid");
            out.println("ravindra"+tid);
//            out.println(roll_no);
            HttpSession session1 = request.getSession();
            eno = (String) session1.getAttribute("e");
            status = (String) session1.getAttribute("s");
            ServletContext context = getServletContext();
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
                out.println("ksjd");
                if (status.equalsIgnoreCase("Regular")) {
                     out.println("ksjd33");
                    query2 = "update all_students,schema_table set status=1,status1=1,application_no='"+tid+"' where roll_no=? and rollno=?";
                    PreparedStatement pd = con.prepareStatement(query2);
                    pd.setString(2, roll_no);
                    pd.setString(1, roll_no);
                    int i = pd.executeUpdate();
//                    response.sendRedirect("upload.jsp?id = tid " );
                    response.sendRedirect("upload.jsp?rollno="+roll_no);
                         out.println("hello world");
                }
            } catch (Exception e) {
                e.printStackTrace();
                 out.println(e);
            }
        %>


    </body>
</html>
