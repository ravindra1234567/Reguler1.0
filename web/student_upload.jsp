
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
    String year;
    String branch1;
    String branch;
    String section;
    String sem;

%>



<%

    ServletContext context = getServletContext();
    Class.forName(context.getInitParameter("Driver"));
    con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

    session1 = request.getSession();
    uname = (String) session1.getAttribute("uname");
    pass = (String) session1.getAttribute("pass");

    try {

        ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());

        List<FileItem> multifiles = sf.parseRequest(request);
        k = 0;
        for (FileItem item : multifiles) {
            String fname = item.getName();
  //out.println("2");  
            if (fname.length() < 4 || !(fname.substring(fname.length() - 4)).equalsIgnoreCase(".csv")) {

                throw new Exception("Unsupported File Type");

            }
            //    out.println("3");
            String fileName = item.getName();
            /* String sub_code=name.substring(0,6);
             char sem1=name.charAt(3);
             int sem=Integer.parseInt(String.valueOf(sem1));
             String sub_type=name.substring(7,8);*/
            String str = fileName;
            String branch,branch1,sem,section,year,course;
			//String str = "BF_1YR_MECH_3.csv";
            out.println("Ravindra : " + str);
			out.println("Length = "+ str.length());
            String str4 = str.substring(0, str.length() - 4);
			String str5 = str4.substring(0,1);
			out.println("course = "+str5);
			String coursetype  = str4.substring(1,2);
			out.println("course type = "+coursetype);
			
			out.println("last character CSV: " + str4);
			String course1 = str4.substring(0,2);
			out.println("course1 = "+course1);
            String str2 = str4.substring(7, str4.length() - 2);
			out.println("Branch Name : " + str2);
			branch1 = str2.substring(0, str2.length()  -1);
            branch = str2;
			out.println("Branch = "+ branch1);

            String str3 = str2.substring(str2.length() - 1);
			out.println("Last Charector : " + str3);
            
			out.println("<br>");
            year = str4.substring(3, 6);
            out.println("Year = " + year);
            
            out.println("<br>");
            out.println("<br>");

            out.println("<br>");
			if(course1.equals("MS"))
			{
				course = "MSC";
                                coursetype = "F";
			}
			else{
			if(str5.equals("B")){
				course = "BE";
			}
			else{
				course = "ME";
				//System.out.println("course = "+course);
			}
			}
			out.println("course= "+course);
            section = "A";
            if (str3.equals("A") || str3.equals("B")) {
                if (str3.equals("A")) {
                    section = "A";
                    branch1 = str2.substring(0, str2.length() - 1);
                    branch = branch1;
                } else {
                    section = "B";
                    branch1 = str2.substring(0, str2.length() - 1);
                    branch = branch1;
                }
            }
            System.out.println("Section : " + section);
            System.out.println("<br>");
            sem = str4.substring(str4.length() - 1);

            if (branch.equals("CS")) {
                branch = "Computer Engineering";
//                                out.println("hello"+branch);
            } else if (branch.equals("CV")) {
                branch = "Civil Engineering";
            } else if (branch.equals("EI")) {
                branch = "Electronics And Instrumentation Engineering";
            } else if (branch.equals("ETC")) {
                branch = "Electronics And Telecommunication Engineering";
            } else if (branch.equals("IT")) {
                branch = "Information Technology";

            } else if (branch.equals("MECH")) {
                branch = "Mechanical Engineering";

            }
			out.println("Branch = "+branch+"<br>");
			out.println("Section = "+section+"<br>");
                        out.println("Course = "+course);

             // out.println(context.getInitParameter("Input_Path"));
            out.println("Hello");
            f = new File(context.getInitParameter("Input_Path"), item.getName());
            out.println("Hello");
            item.write(f);
           out.println("5");
            path = context.getInitParameter("Input_Path") + item.getName();//
            query = "Load data local infile ? into table all_students  fields terminated by ',' enclosed by '\n' lines terminated by '\r\n' ignore 1 lines (roll_no,enrollment_no,name) set sem1='"+sem+"',year='"+year+"',branch1='"+branch+"',section='"+section+"',course1='"+course+"',coursetype1='"+coursetype+"' ";
            pd = con.prepareStatement(query);
            pd.setString(1, path);
//    pd.setInt(2,sem);
//    pd.setString(3,sub_code);
//    pd.setString(4,sub_type);   
            k = k + pd.executeUpdate();

            f.delete();

        }
%>
<script> window.location.href = 'details.jsp?page=fileupload&value=<%=k%>';</script>
<%

} catch (Exception e) {
    out.println(e);
%>
<script> window.location.href = 'details.jsp?page=fileupload&value=-1';</script>

<%
    }

%>
