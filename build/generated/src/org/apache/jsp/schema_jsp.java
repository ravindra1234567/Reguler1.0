package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class schema_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html> \n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("<link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<link href=\"css/jquery.datetimepicker.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<link href=\"css/sol.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("       <div class=\"container-fluid header\">\n");
      out.write("    <div class=\"row \" >\n");
      out.write("       \n");
      out.write("        <div class=\"offset-1 col-2\">\n");
      out.write("            <img src=\"image/logo.png\" alt=\"Davv Logo\" class=\"img-fluid logo-image\">\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-8 text-uppercase text-white\">\n");
      out.write("            <div class=\"h2 college-name text-capitalize\">Institute Of Engineering And Technology</div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"offset-6 col-3 \">Marks Entry System</div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <h3 style=\"text-align:right;\">\n");
      out.write("<span style=\"float:right;\"><a href=\"logout\">Logout</a></span>\n");
      out.write("\n");
      out.write("</h3>\n");
      out.write("                <h3 style=\"text-align:left;\">\n");
      out.write("\n");
      out.write("<span style=\"float:left;\"><a href=\"edpuserHome.jsp\">Back</a></span>\n");
      out.write("\n");
      out.write("</h3>\n");
      out.write("\n");
      out.write("</h3>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("       </div>\n");
      out.write("       ");

//         String s=(String)session.getAttribute("valid");
//         if(s==null)
//             response.sendRedirect("admin.jsp");
//         else if(s.equals("0"))
//            {
//                response.sendRedirect("admin.jsp");
//            }
            String sem = "0";
                    //request.getParameter("sem");
            session.setAttribute("sem",sem);
            Class.forName(pageContext.getServletContext().getInitParameter("Driver"));
            Connection con=DriverManager.getConnection(pageContext.getServletContext().getInitParameter("Url"),pageContext.getServletContext().getInitParameter("UserName"), pageContext.getServletContext().getInitParameter("Password"));

            //String qr="select *from class_table";
            //String qr="select year,department_name,section,specialization from class_table,department_table where class_table.department_id=department_table.id and class_table.id=?";
            
            String qr="select year,department_name,section,specialization,course_code,class_table.id from class_table,department_table,course_table where class_table.department_id=department_table.id and course_table.id=department_table.course_id";
            
            
            PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs=ps.executeQuery();
             int sno=0;
        
      out.write("\n");
      out.write("    <div>\n");
      out.write("        <div id=\"myModal\" class=\"modal\">\n");
      out.write("\n");
      out.write("  <!-- Modal content -->\n");
      out.write("  <div class=\"modal-content\">\n");
      out.write("      <span class=\"close\">&times;</span> \n");
      out.write("    <!--\n");
      out.write("    <form action=\"upload\">\n");
      out.write("        <input type=\"file\">\n");
      out.write("        <input type=\"submit\" value=\"Upload\">\n");
      out.write("    </form>-->\n");
      out.write("    \n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("            <div >\n");
      out.write("                <div class=\"col-12\">\n");
      out.write("                    <table class=\"table  table-striped tablesorter \" id=\"my_table\">\n");
      out.write("                        <thead >\n");
      out.write("                            <tr>\n");
      out.write("                                <th>S.No.</th>\n");
      out.write("                                <th>Course</th>\n");
      out.write("                                \n");
      out.write("                                <th>Class Full Name</th>\n");
      out.write("                                <!-- <th>Edit Subjects</th> -->\n");
      out.write("                                <th>Edit Timetable</th>\n");
      out.write("                                \n");
      out.write("                                    \n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                           ");
 while(rs.next()){
                               String s1=rs.getString(1);
                               String s2=rs.getString(2);
                               String s3=rs.getString(3);
                               String s4=rs.getString(4);
                               String class_id=rs.getString(6);
                               String class_full_name=s1+" year "+s2+" ";
                               if(s4!=null)
                                   class_full_name+=s4+" ";
                               if(!s3.equals("NULL"))
                                   class_full_name+=s3;
                               //class_full_name+=s3;
                               String s5=rs.getString(5);
                               //String stat=(String)session.getAttribute(class_id);
                           
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>");
      out.print(++sno);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(s5);
      out.write("</td>\n");
      out.write("                                \n");
      out.write("                                <td>");
      out.print(class_full_name);
      out.write("</td>\n");
      out.write("                                \n");
      out.write("                                <!-- <td><a href=\"#\">Edit subjects</a></td> -->\n");
      out.write("                                <td><a href=\"subjectAlloc.jsp?course=");
      out.print(s5);
      out.write("&class_id=");
      out.print(class_id);
      out.write("&class_full_name=");
      out.print(class_full_name);
      out.write("\">Add Subjects</a></td>\n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("                                  \n");
      out.write("                                \n");
      out.write("                            </tr>\n");
      out.write("                            ");
 } 
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
