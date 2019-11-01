<%-- 
    Document   : subject_add_table_reg
    Created on : 5 Oct, 2019, 11:24:17 AM
    Author     : Ravindra
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.String"%>
<jsp:include page="bootstrap_file.jsp" />
<%!

%>
<%
    String course = request.getParameter("course");
    String branch = request.getParameter("branch");
    String sem = request.getParameter("sem");
    String subjectcode = request.getParameter("subjectcode");
    String subjectname = request.getParameter("subjectname");
    int theorycredit = Integer.parseInt(request.getParameter("theorycredit"));
    int practicalcredit = Integer.parseInt(request.getParameter("practicalcredit"));

//        out.println("cose = " + subjectcode);
//        out.println("<br>name = " + subjectname);
//        out.println("<br>t = " + theorycredit);
//        out.println("<br>P = " + practicalcredit);
    Connection con = null;
    PreparedStatement psmnt = null;
    try {
        ServletContext context = this.getServletContext();
        Class.forName(context.getInitParameter("Driver"));

        con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        psmnt = con.prepareStatement("insert into subschema(course,branch,sem,subject_code,subject_name,theory,practical)values(?,?,?,?,?,?,?)");
        psmnt.setString(1, course);
        psmnt.setString(2, branch);
        psmnt.setString(3, sem);
        psmnt.setString(4, subjectcode);
        psmnt.setString(5, subjectname);
        psmnt.setInt(6, theorycredit);
        psmnt.setInt(7, practicalcredit);
        int s = psmnt.executeUpdate();
        out.println(" ..");
        if (s > 0) {
            out.println("<script> alert('Subject Added Successfully!');"
                + "window.location ='add_subject_ex.jsp'; </script> ");

            

        } else {
            out.println("<script>"
                    + "Swal.fire({type: 'error',title:'Subject was not added',title:'There was some problem',})"
                    + ".then(function(){window.location ='add_subject_ex.jsp' ;});"
                    + "</script>");
        }
    } catch (Exception e) {

        out.println("<script> alert('This Subject not Added !');"
                + "window.location ='add_subject_ex.jsp'; </script> ");
//        out.println(" ..");
//        out.println("<script>"
//                    + "Swal.fire({type: 'error',title:'Subject was not added',title:'There was some problem',},location.reload();)"
//                    + ".then(function(){window.location ='add_subject_reg.jsp' ;});"
//                    + "</script>");
    }

%>