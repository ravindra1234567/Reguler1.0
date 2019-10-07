package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("  \n");
      out.write("<!DOCTYPE html>  \n");
      out.write("<html>  \n");
      out.write("<head>  \n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">  \n");
      out.write("    <title>JSP Page</title>  \n");
      out.write("</head>  \n");
      out.write("<body>  \n");
      out.write("    <form name=\"f1\" method=\"post\" enctype=\"multipart/form-data\" action=\"addEmployee\">  \n");
      out.write("    <h2>  \n");
      out.write("        Add Image In DB  \n");
      out.write("    </h2>  \n");
      out.write("    <table>  \n");
      out.write("        <tr>  \n");
      out.write("            <td>  \n");
      out.write("                <table>  \n");
      out.write("                    <tr>  \n");
      out.write("                        <td>Name:</td>  \n");
      out.write("                        <td><input type=\"text\" name=\"txtName\" value=\"\" /></td>  \n");
      out.write("                    </tr>  \n");
      out.write("                    <tr>  \n");
      out.write("                        <td>Address:</td>  \n");
      out.write("                        <td><input type=\"text\" name=\"txtAddress\" value=\"\" /></td>  \n");
      out.write("                    </tr>  \n");
      out.write("                    <tr>  \n");
      out.write("                        <td>Salary:</td>  \n");
      out.write("                        <td><input type=\"text\" name=\"txtSalary\" value=\"\" /></td>  \n");
      out.write("                    </tr>  \n");
      out.write("                    <tr>  \n");
      out.write("                        <td>Photo:</td>  \n");
      out.write("                        <td><input type=\"file\" name=\"flPhoto\" value=\"\" /></td>  \n");
      out.write("                    </tr>  \n");
      out.write("                    <tr>  \n");
      out.write("                        <td colspan=\"2\" align=\"right\"><input type=\"submit\" value=\"Save\" name=\"btnSave\" /></td>  \n");
      out.write("                    </tr>  \n");
      out.write("                </table>  \n");
      out.write("            </td>  \n");
      out.write("            <td>  \n");
      out.write("                <table>  \n");
      out.write("                    <tr>  \n");
      out.write("                        <td style=\"width: 450px; height: auto;\">  \n");
      out.write("                            <iframe name=\"ifs\" src=\"DisplayData\" style=\"width: 550px; height: 300px\"></iframe>  \n");
      out.write("                        </td>  \n");
      out.write("                    </tr>  \n");
      out.write("                </table>  \n");
      out.write("            </td>  \n");
      out.write("        </tr>  \n");
      out.write("    </table>  \n");
      out.write("    </form>  \n");
      out.write("</body>  ");
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
