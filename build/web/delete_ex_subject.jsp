<%-- 
    Document   : delete_ex_subject
    Created on : 3 Nov, 2019, 3:38:24 PM
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
        if (session.getAttribute("uname") == null || session.getAttribute("pass").equals("")){
    response.sendRedirect("admin.jsp");
    }else{
        String id1 = request.getParameter("id1");
        out.println("id = "+ id1);
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
        
            
            
      
        String qr="delete from subschema where id=?  ";
         ps=con.prepareStatement(qr);
        ps.setString(1, id1);
        int n=ps.executeUpdate();
        out.println("hello");
        //response.sendRedirect("subjectAlloc.jsp?course="+course+"&sem="+sem+"&branch="+branch);
        }
        %>
  

