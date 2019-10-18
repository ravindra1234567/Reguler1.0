<%-- 
    Document   : delete_subject
    Created on : 18 Oct, 2019, 11:57:37 PM
    Author     : Ravindra
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
        String subcode = request.getParameter("sub");
     try{
        context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            }
       catch(Exception e)
       {
           out.println(e);
       }
            /* TODO output your page here. You may use following sample code. */
            con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"), context.getInitParameter("Password"));
        
            
            
      
        String qr="delete from subject_table where subject_code=?  ";
         ps=con.prepareStatement(qr);
        ps.setString(1, subcode);
        int n=ps.executeUpdate();
        out.println("hello");
        //response.sendRedirect("subjectAlloc.jsp?course="+course+"&sem="+sem+"&branch="+branch);
       %>
  

