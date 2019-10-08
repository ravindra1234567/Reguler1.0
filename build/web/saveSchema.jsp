<%-- 
    Document   : saveSchema
    Created on : 8 Oct, 2019, 6:29:29 AM
    Author     : Ravindra
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="bootstrap_file.jsp" />
    </head>
    <body>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import =" javax.servlet.http.HttpSession" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String branch = null;
    int sem;
    String coursetype;
    String course = null;
    int status1 = 0;
    String str=null;
%>
  <%  branch = request.getParameter("branch");
    sem = Integer.parseInt(request.getParameter("sem"));
//                  out.println(year);
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
%>
<script>
    
    var branch1 = <%= branch %>
    var str1 = <%= str %>
    var sem1 = <%= sem %>
</script>
<%
    /* TODO output your page here. You may use following sample code. */
    ServletContext context = getServletContext();
    Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
    out.println("branch=" + branch);
    out.println("sem=" + sem);
    out.println("course=" + course);
    out.println("coursetype=" + coursetype);
    int i = 0;
//            HttpSession session = request.getSession();

    HttpSession s = request.getSession();
    String qr = "Insert into schema_table values( ?,?,?,?,?,? ) ";
//                    i = i+1;
    for (i = 0; i < 8; i++) {
        PreparedStatement ps = con.prepareStatement(qr);
        ps.setString(1, branch);
        ps.setInt(2, sem);

        String subject_code = request.getParameter("subcodeList" + (i + 1));
        out.println("<br>sub_code=" + subject_code + "<br>");
        int subject_type = Integer.parseInt(request.getParameter("subjectTypeList" + (i + 1)));
        out.println("sub_type=" + subject_type);
//                        String subject_type="1";
        out.println("\n");
        if (subject_code != null) {
            if (!subject_code.equals("")) {
                ps.setString(3, course);
                ps.setString(4, coursetype);
                ps.setString(5, subject_code);
                ps.setInt(6, subject_type);
                try {
                    int n = ps.executeUpdate();
                    //out.println("rows updated:" + n + "<br>");

                    out.println(" ..");
                    if (n > 0) {
                        %>
                                <script>
                                Swal.fire({type: 'success',title:'Subject added successfully',})
                                .then(function(){window.location ='subjectAlloc.jsp' ;});
                                </script>;

                  <%  } else {
                        out.println("<script>"
                                + "Swal.fire({type: 'error',title:'Subject was not added',title:'There was some problem',})"
                                + ".then(function(){window.location ='add_subject_reg.jsp' ;});"
                                + "</script>");
                    }

                } catch (Exception e) {
                    out.println(e);
                }

            }
        }
    }
//             response.sendRedirect("subjectAlloc.jsp");

%>

