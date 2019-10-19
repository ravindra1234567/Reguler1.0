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

        psmnt = con.prepareStatement("insert into subject_table(subject_code,subject_name,theory_credits,practical_credits)values(?,?,?,?)");
        psmnt.setString(1, subjectcode);
        psmnt.setString(2, subjectname);
        psmnt.setInt(3, theorycredit);
        psmnt.setInt(4, practicalcredit);
        int s = psmnt.executeUpdate();
        out.println(" ..");
        if (s > 0) {

            out.println("<script>"
                    + "Swal.fire({type: 'success',title:'Subject added successfully',})"
                    + ".then(function(){window.location ='add_subject_reg.jsp' ;});"
                    + "</script>");

        } else {
            out.println("<script>"
                    + "Swal.fire({type: 'error',title:'Subject was not added',title:'There was some problem',})"
                    + ".then(function(){window.location ='add_subject_reg.jsp' ;});"
                    + "</script>");
        }
    } catch (Exception e) {

        out.println(" ..");
        out.println("<script>"
                    + "Swal.fire({type: 'error',title:'Subject was not added',title:'There was some problem',})"
                    + ".then(function(){window.location ='add_subject_reg.jsp' ;});"
                    + "</script>");
    }

%>