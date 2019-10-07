<%-- 
    Document   : submit
    Created on : 28 Jul, 2019, 4:22:41 PM
    Author     : Ravindra
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%!
    String enrollmentno=null;
    String filename =null;
     String saveFile = "";
     int pos;
%>
<%
    enrollmentno = request.getParameter("enrollmentno");

    
        MultipartRequest mr=new MultipartRequest(request,"F:\\Reguler\\web\\image\\");
	
	String application_id=(String)mr.getParameter("application_id");
	String session1=(String)mr.getParameter("session");
	String image=(String)mr.getParameter("image");
	

	Enumeration files=mr.getFileNames();
	String filename=(String)files.nextElement();
        String saveFile=mr.getFilesystemName(filename);
       // photo = rollno;
          out.println("Application Id"+ application_id+"<br>");
        out.println("session"+session1+"<br>");
        out.println("image name"+saveFile);
        
         Connection con = null;
        PreparedStatement psmnt = null;
        try {
            ServletContext context = this.getServletContext();
            Class.forName(context.getInitParameter("Driver"));

            con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            psmnt = con.prepareStatement("update  all_students,schema_table set photourl = '"+saveFile+"', application_id='"+application_id+"' ,session1='"+session1+"',all_students.status=1 where all_students.enrollment_no= '"+enrollmentno+"' ");
         
            int s = psmnt.executeUpdate();
            if (s > 0) {
//                out.println("Uploaded successfully !");
                response.sendRedirect("transaction.jsp?enrollmentno="+enrollmentno);
            } else {
                out.println("Error!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
%>