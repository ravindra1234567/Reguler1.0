<%-- 
    Document   : student_data
    Created on : 14 Jul, 2019, 10:56:12 AM
    Author     : Ravindra
--%>


<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="javafx.scene.input.KeyCode" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import ="org.apache.commons.fileupload.*" %>
<%@page import ="org.apache.commons.fileupload.disk.*" %>
<%@page import ="org.apache.commons.fileupload.servlet.*" %>
<%@page import ="org.apache.commons.io.output.*" %>
<%@page import="java.sql.*" import="java.sql.Connection" import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.ServletException" import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<%!
   Connection con; 
String query;
String path;
HttpSession session1;
String uname;
String pass;
String query1;
String query2;
String query3;
PreparedStatement pd;
PreparedStatement pd1;
PreparedStatement pd2;
PreparedStatement pd3;
int i;
int j;
int k;
int l;
String query4;
File f;
%>


      


<% 
      ServletContext context=getServletContext();  
           Class.forName(context.getInitParameter("Driver"));
             con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
    session1=request.getSession();
  uname=(String)session1.getAttribute("uname");
  pass=(String)session1.getAttribute("pass");
try{
   ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());

  List<FileItem> multifiles=sf.parseRequest(request);

  for(FileItem item : multifiles)
    { 
     
     
     
      f=new File(context.getInitParameter("Input_Path"),item.getName());
    item.write(f);
     path =context.getInitParameter("Input_Path")+ item.getName();
    query="Load data local infile ? into table studentdata fields terminated by ',' enclosed by '\n'";
    pd=con.prepareStatement(query);
    pd.setString(1,path);
    k=pd.executeUpdate();

     f.delete();
 
 
    }
  %>
  <script> window.location.href='details.jsp?page=fileupload&value=<%=k%>';</script>
  <%
  
    }
  catch(Exception e)
            {
             

            f.delete();
            %>
            <script> window.location.href='details.jsp?page=fileupload&value=-1';</script>

             <%
         
            }
    
  
     
%>
    </body>
</html>
