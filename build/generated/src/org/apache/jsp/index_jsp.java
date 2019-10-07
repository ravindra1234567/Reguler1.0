package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Exam Registration</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        \n");
      out.write("       \n");
      out.write("         <script type=\"text/javascript\">\n");
      out.write("      \n");
      out.write("            function Redirect()\n");
      out.write("            {\n");
      out.write("          \n");
      out.write("        var status=document.getElementById(\"status\").value; \n");
      out.write("            if(status===\"Regular\")\n");
      out.write("                document.getElementById(\"f1\").action=\"student.jsp\";\n");
      out.write("            else\n");
      out.write("                document.getElementById(\"f1\").action=\"ex_student.jsp\";\n");
      out.write("      \n");
      out.write("        }\n");
      out.write("        </script>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\" >\n");
      out.write("        <style>\n");
      out.write("             .div1{\n");
      out.write("                border-radius: 25px;\n");
      out.write("                border: 2px solid;\n");
      out.write("                padding: 10px;\n");
      out.write("                padding-top: 0px;\n");
      out.write("                margin-top: 50px;\n");
      out.write("                margin-left: 20px;\n");
      out.write("                margin-right: 20px;\n");
      out.write("                margin-bottom: 50px;\n");
      out.write("                width: 1100px;\n");
      out.write("                 }\n");
      out.write("                 \n");
      out.write("                 #t1{\n");
      out.write("                     background-color: #B0C4DE;\n");
      out.write("                     width: 1000px;\n");
      out.write("                     font-family:calibri;\n");
      out.write("                    font-weight: bolder;\n");
      out.write("                    font-size: 17px;\n");
      out.write("                     margin-top: 1px; \n");
      out.write("                 }\n");
      out.write("                 \n");
      out.write("                 #t2{\n");
      out.write("                       font-family:calibri;\n");
      out.write("                     border-collapse:collapse;\n");
      out.write("                     width: 1000px;\n");
      out.write("                     border-color: grey;\n");
      out.write("                     font-size: 15px;\n");
      out.write("                 }\n");
      out.write("    \n");
      out.write("            </style>\n");
      out.write("    </head>\n");
      out.write("    <header>\n");
      out.write("<a href=\"index.jsp\"><img id=\"logo\" src=\"image/logo.png\" alt=\"Institute of Engineering &amp; Technology\"></a>\n");
      out.write("<h2>Institute Of Engineering &amp; Technology</h2>\n");
      out.write("<div class=\"menu\">\n");
      out.write("  <a href=\"admin.jsp\">Admin</a>\n");
      out.write("  <a href=\"index.jsp\">Home</a>\n");
      out.write("</div>\n");
      out.write("</header>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("<center>\n");
      out.write("    <form id=\"f1\">\n");
      out.write("    <div class=\"div1\">\n");
      out.write("    <h3 style=\"text-align:center\">Examination Registration</h3><hr width=\"95%\">\n");
      out.write("\n");
      out.write("    <table id=\"t1\">\n");
      out.write("        <tr><td style=\"text-align: center;\">LOGIN</td></tr>\n");
      out.write("    </table>\n");
      out.write("    \n");
      out.write("    <table border=\"1\" id=\"t2\">\n");
      out.write("    <tr>\n");
      out.write("    <td id=\"td1\">\n");
      out.write("    <b>Please Enter Enroll Number</b>\n");
      out.write("    </td>\n");
      out.write("    <td>\n");
      out.write("        <input class=\"input\"  id=\"eno\" type=\"text\" name=\"eno\" maxlength=\"7\" minlength=\"7\" required=\"\">\n");
      out.write("    </td>\n");
      out.write("    </tr>\n");
      out.write("    \n");
      out.write("    <tr>\n");
      out.write("    <td id=\"td1\">\n");
      out.write("    <b>Select Student Status</b>\n");
      out.write("    </td>\n");
      out.write("    <td>\n");
      out.write("    <select class=\"input\"  id=\"status\" name=\"status\" required=\"\">\n");
      out.write("    <option value=\"\">--Select Status--</option>\n");
      out.write("        <option>Regular</option>\n");
      out.write("        <option>Ex</option>\n");
      out.write("    </select>\n");
      out.write("    </td>\n");
      out.write("    </tr>\n");
      out.write("\n");
      out.write("    <tr>\n");
      out.write("    <td  id=\"td1\">\n");
      out.write("    <b>Select Student Semester</b>\n");
      out.write("    </td>\n");
      out.write("    <td>\n");
      out.write("    <select class=\"input\" id=\"sem\" name=\"sem\" required=\"\">\n");
      out.write("    <option value=\"\">--Select Semester--</option>\n");
      out.write("      <option value=\"1\">1Sem</option>\n");
      out.write("      <option value=\"2\">2Sem</option>\n");
      out.write("      <option value=\"3\">3Sem</option>\n");
      out.write("      <option value=\"4\">4Sem</option>\n");
      out.write("      <option value=\"5\">5Sem</option>\n");
      out.write("      <option value=\"6\">6Sem</option>\n");
      out.write("      <option value=\"7\">7Sem</option> \n");
      out.write("      <option value=\"8\">8Sem</option>\n");
      out.write("    </select>\n");
      out.write("    </td>\n");
      out.write("    </tr>\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write("<input class=\"btn\" type=\"submit\" name=\"btn\" value=\"GO\" onclick=\"Redirect()\">\n");
      out.write("<input class=\"btn\" type=\"button\" name=\"cbtn\" value=\"Cancel\">\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</form>\n");
      out.write("</center>\n");
      out.write("</body>\n");
      out.write("<footer>\n");
      out.write("<p align=\"center\" id=\"p1\">\n");
      out.write("Exam Registration Portal\n");
      out.write("</p>\n");
      out.write("<hr align=\"center\" width=\"60%\">\n");
      out.write("<p align=\"center\" id=\"p2\">\n");
      out.write("Developed & Designed by :- Vinod Thakure , Jayesh Punjabi and Tanveer Singh Bhatia.\n");
      out.write("\n");
      out.write("For any queries contact 15bcs158@ietdavv.edu.in.\n");
      out.write("Copyright © 2017 IET DAVV. All right reserved.\n");
      out.write("</p>\n");
      out.write("    \n");
      out.write("</footer>\n");
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
