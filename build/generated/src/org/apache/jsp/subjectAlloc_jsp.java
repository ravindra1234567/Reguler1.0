package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Connection;

public final class subjectAlloc_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html> \n");
      out.write("    <head>\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/jquery.datetimepicker.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/sol.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid header\">\n");
      out.write("            <div class=\"row \" >\n");
      out.write("\n");
      out.write("                <div class=\"offset-1 col-2\">\n");
      out.write("                    <img src=\"image/logo.png\" alt=\"Davv Logo\" class=\"img-fluid logo-image\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-8 text-uppercase text-white\">\n");
      out.write("                    <div class=\"h2 college-name text-capitalize\">Institute Of Engineering And Technology</div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"offset-6 col-3 \">Marks Entry System</div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <h3 style=\"text-align:right;\">\n");
      out.write("                    <span style=\"float:right;\"><a href=\"logout\">Logout</a></span>\n");
      out.write("                </h3>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div >\n");
      out.write("            <!--            <hr>\n");
      out.write("                        Welcome  as Admin-->\n");
      out.write("            ");

//            String s=(String)session.getAttribute("valid");
//         if(s==null)
//             response.sendRedirect("panel.jsp");
//         else if(s.equals("0"))
//            {
//                response.sendRedirect("panel.jsp");
//            }
                 String branch = request.getParameter("branch");
                  String year = request.getParameter("year");
                  out.println(year);
                 
                String course = request.getParameter("course");
                String class_id = request.getParameter("class_id");
                String class_full_name = request.getParameter("class_full_name");
                session.setAttribute("class_id", class_id);
                session.setAttribute("class_full_name", class_full_name);
                session.setAttribute("course", course);
                int sem = Integer.parseInt((String) session.getAttribute("sem"));
                Class.forName(pageContext.getServletContext().getInitParameter("Driver"));
                Connection con = DriverManager.getConnection(pageContext.getServletContext().getInitParameter("Url"), pageContext.getServletContext().getInitParameter("UserName"), pageContext.getServletContext().getInitParameter("Password"));

                ArrayList<String> sdlist = new ArrayList<String>();
                ArrayList<String> stlist = new ArrayList<String>();

                ArrayList<String> subjectList = new ArrayList<String>();
                String qr3 = "select subject_code from subject_table";
                PreparedStatement ps3 = con.prepareStatement(qr3);
                ResultSet rs3 = ps3.executeQuery();
                while (rs3.next()) {
                    subjectList.add(rs3.getString(1));
                }

                session.setAttribute("subcode_list", subjectList);
            
      out.write("\n");
      out.write("            <hr>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-12 text-capitalize h4 text-info\" >\n");
      out.write("                    <h1 align=\"center\"> Faculty Class Allocation</h1>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"offset-4 col-4\">\n");
      out.write("                    <h1 align=\"center\">  <a class=\"btn btn-info\" href=\"schema.jsp?sem=");
      out.print(sem);
      out.write("\" >View All Class</a></h1>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <hr>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-12\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row text-left\">\n");
      out.write("                <div class=\"offset-2 col-8\">\n");
      out.write("                    <form action=\"SaveSchema\" method=\"get\">\n");
      out.write("                        <table class=\"table table-success\">\n");
      out.write("                            <tbody>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Course</td>\n");
      out.write("                                    <td>");
      out.print(course);
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Class Id</td>\n");
      out.write("                                    <td>");
      out.print(class_id);
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Class Name</td>\n");
      out.write("                                    <td>");
      out.print(class_full_name);
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("                              \n");
      out.write("                                    <input type=\"hidden\" value=\"");
      out.print( branch );
      out.write("\" name=\"branch\" />\n");
      out.write("                                    <input type=\"hidden\" value=\"");
      out.print( year );
      out.write("\" name=\"year\" />\n");
      out.write("                                \n");
      out.write("\n");
      out.write("\n");
      out.write("                                ");
 for (int k = 0; k < 8; k++) {
      out.write(" \n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Subject Code ");
      out.print(k + 1);
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    <td>\n");
      out.write("                                        <input list='subjectList' name='subcodeList");
      out.print(k + 1);
      out.write("'>\n");
      out.write("                                        <datalist id='subjectList'>\n");
      out.write("                                            ");
int i;
                                                for (i = 0; i < subjectList.size(); i++) {
                                                    String mysubcode = subjectList.get(i);
                                                    //String st2=subjectList.get(i);
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print(mysubcode);
      out.write('"');
      out.write('>');
      out.print(mysubcode);
      out.write("</option>\n");
      out.write("                                            ");
 }
      out.write("\n");
      out.write("                                        </datalist><!--Faculty Dropdown-->\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("\n");
      out.write("                                        <select name='subjectTypeList");
      out.print(k + 1);
      out.write("'>\n");
      out.write("                                            <option value='0'>T</option>\n");
      out.write("                                            <option value='1'>P</option>\n");
      out.write("                                            <option value='2'>T+P</option>\n");
      out.write("                                        </select>\n");
      out.write("                                    </td>\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td colspan=\"3\">\n");
      out.write("                                        <input type=\"submit\" class=\"form-control btn btn-success\" value=\"Submit\"/>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"offset-2 col-8\">\n");
      out.write("                    <table class=\"table table-bordered\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>S.No</th>\n");
      out.write("                                <th>Subject Code</th>\n");
      out.write("                                <th>Subject Name</th>\n");
      out.write("                                <th>Subject Type</th>\n");
      out.write("                                <th>Delete</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            ");


                                //String qr1="select subject_name,subject_code,subtype from subject_table,schema_table where subject_code in(select subcode from schema_table where classid="+class_id+") and sem="+sem;
                                String qr1 = "select subject_name,subcode,subtype from schema_table,subject_table where subcode=subject_code and classid='" + class_id + "' and sem=?";

                                PreparedStatement ps1 = con.prepareStatement(qr1);
                                ps1.setInt(1, sem);
                                ResultSet rs1 = ps1.executeQuery();
                                int i = 1;
                                while (rs1.next()) {
                                    String sn = rs1.getString(1);
                                    String sc = rs1.getString(2);
                                    String st1 = rs1.getString(3);
                                    String st = "";
                                    if (st1.equals("0")) {
                                        st += "T";
                                    } else if (st1.equals("1")) {
                                        st += "P";
                                    } else {
                                        st += "T+P";
                                    }
                            
      out.write("<tr>\n");
      out.write("                                <td>");
      out.print(i++);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(sc);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(sn);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(st);
      out.write("</td>\n");
      out.write("                                <td class=\"hidden-print\">\n");
      out.write("                                    <form action=\"DeleteSubject\" method=\"post\">\n");
      out.write("                                        <input type=\"hidden\" value=\"");
      out.print(sc);
      out.write("\" name=\"subcode\"/>  \n");
      out.write("                                        <input type=\"hidden\" value=\"");
      out.print(st1);
      out.write("\" name=\"subtype\"/>\n");
      out.write("                                        <input type=\"submit\" class=\"btn btn-primary\" value=\"Delete\"/>\n");
      out.write("                                    </form>\n");
      out.write("                                </td>  \n");
      out.write("                            </tr>\n");
      out.write("                            ");
 }
      out.write("\n");
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
