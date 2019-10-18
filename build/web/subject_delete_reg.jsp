<%-- 
    Document   : subject_delete_reg
    Created on : 18 Oct, 2019, 7:48:57 PM
    Author     : Ravindra
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

    
   <%!
   ServletContext context;
   Connection con;
   PreparedStatement ps;
   String course;
   String subtype;
   String subcode;
   String branch;
   int sem;
   %>
    <%
     try{
        context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            }
       catch(Exception e)
       {
           out.println(e);
           //out.println("hello driver not loaded");
       }
            /* TODO output your page here. You may use following sample code. */
            con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"), context.getInitParameter("Password"));
        //HttpSession session=request.getSession();
            //String class_id=(String)session.getAttribute("class_id");
            
            sem = Integer.parseInt(request.getParameter("sem"));
            subcode=request.getParameter("subcode");
            subtype=request.getParameter("subtype");
//            String ctype = request.getParameter("ctype");
           course=request.getParameter("course");
           branch = request.getParameter("branch");
        out.println("branch = " + branch);
        out.println("<br> sem = "+ sem);
        out.println("<br> subcode ="+subcode);
        out.println("<br> subtype ="+subtype);
        out.println("<br> course = "+ course);
        String qr="delete from schema_table where subcode=? and subtype=? and sem=? ";
         ps=con.prepareStatement(qr);
        ps.setString(1, subcode);
        ps.setInt(2,Integer.parseInt(subtype));
       ps.setInt(3,sem);
        int n=ps.executeUpdate();
        //response.sendRedirect("subjectAlloc.jsp?course="+course+"&sem="+sem+"&branch="+branch);
       %>

