
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%--<%@page import="javafx.scene.input.KeyCode" %>--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import ="org.apache.commons.fileupload.*" %>
<%@page import ="org.apache.commons.fileupload.disk.*" %>
<%@page import ="org.apache.commons.fileupload.servlet.*" %>
<%@page import ="org.apache.commons.io.output.*" %>
<%@page import="java.sql.*" import="java.sql.Connection"  import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.ServletException" import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
//    out.println("Ravindra");
       ServletContext context=getServletContext();  
       Class.forName(context.getInitParameter("Driver"));
       con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
  session1=request.getSession();
  uname=(String)session1.getAttribute("uname");
  pass=(String)session1.getAttribute("pass");

   try{
          
  ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());

  List<FileItem> multifiles=sf.parseRequest(request);
    k=0;
  for(FileItem item : multifiles)
    { 
    String fname=item.getName();
  //out.println("2");  
if( fname.length()<4 || !(fname.substring(fname.length()-4)).equalsIgnoreCase(".csv"))
        {

             throw new Exception("Unsupported File Type");
       
        }
    //    out.println("3");
     String name=item.getName();
     String sub_code=name.substring(0,6);
     char sem1=name.charAt(3);
     int sem=Integer.parseInt(String.valueOf(sem1));
     String sub_type=name.substring(7,8);
  //  out.println(context.getInitParameter("Input_Path"));
    f=new File(context.getInitParameter("Input_Path_Ex"),item.getName());
    item.write(f);
//out.println("5");
     path =context.getInitParameter("Input_Path_Ex")+ item.getName();//
    query="Load data local infile ? into table ex_student  fields terminated by ',' enclosed by '\n' lines terminated by '\r\n' ignore 1 lines (roll_no,enrollment_no,name) set sem=?,subject_code=?,subject_type=?,branch='Unknown', status='EX' ";
    pd=con.prepareStatement(query);
    pd.setString(1,path);
    pd.setInt(2,sem);
    pd.setString(3,sub_code);
    pd.setString(4,sub_type);   
    k=k+pd.executeUpdate();
    
    f.delete();
    
            try
		{
                    
			PreparedStatement ps1=con.prepareStatement("select roll_no from ex_student where branch='Unknown'  and roll_no like '_______'  ");
                       
			ResultSet rs=ps1.executeQuery();
                        
			while(rs.next())
                        {       
                                String branch="";
                                String roll_no=rs.getString("roll_no");
                                char branch1=roll_no.charAt(2);
                                
                                if(branch1=='C')
                                {
                                branch="Computer Engineering"; 
                                }
                                else if(branch1=='V')
                                {
                                branch="Civil Engineering"; 
                                }
                                else if(branch1=='E')
                                {
                                branch="Electronics And Instrumentation Engineering"; 
                                }
                                else if(branch1=='T')
                                {
                                branch="Electronics And Telecommunication Engineering"; 
                                }
                                else if(branch1=='I')
                                {
                                branch="Information Technology";    
                             
                                }
                                else if(branch1=='M')
                                {
                                branch="Mechanical Engineering";    
                                 
                                }
                                
                                  PreparedStatement ps2=con.prepareStatement("update ex_student set branch=?  where roll_no=? ");
                                  ps2.setString(1,branch);
                                  ps2.setString(2,roll_no);
                                    
                                int i=0;
                                i=ps2.executeUpdate();
                                  
                                
                                
                                
                              
                        }
                }
                catch(Exception e)
                {
                f.delete();
                out.println(e+"111");
                }

        
    }
       %>
       <script> window.location.href='details.jsp?page=fileupload&value=<%=k%>';</script>
       <%
  
    }
  catch(Exception e)
            {
	out.println(e);                 
%>
   <script> window.location.href='details.jsp?page=fileupload&value=-1';</script>

            <%
            }
    
%>
