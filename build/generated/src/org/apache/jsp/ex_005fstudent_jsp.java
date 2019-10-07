package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public final class ex_005fstudent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String eno;
        String sub_codes[];
        String en;
        String image;
        String name;
        String status1;
        String sem1;
        String branch;
        String scheme_id;
        String subject;
        String subject_code;
        String address;
        String rollno;
        String district;
        String key;
        String category;
        String course;
        String house_no, colony;
        int count;
        int sem_num;
        String sub_type, sub_type1;
        int fee1 = 0;
    
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Exam Registration</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Quicksand:300|Rajdhani:300|Raleway\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\">\n");
      out.write("        <link rel=\"icon\" href=\"image/logo.png\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .genText{\n");
      out.write("                font-family: 'Quicksand', sans-serif;\n");
      out.write("                font-size: 1.2em;\n");
      out.write("                font-weight: 1000;\n");
      out.write("            }\n");
      out.write("            .div1{\n");
      out.write("                border-radius: 25px;\n");
      out.write("                border: 2px solid;\n");
      out.write("                padding: 10px;\n");
      out.write("                padding-top: 0px;\n");
      out.write("                margin-top: 50px;\n");
      out.write("                margin-left: 20px;\n");
      out.write("                margin-right: 20px;\n");
      out.write("                margin-bottom: 50px;\n");
      out.write("                width: 1100px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #t1{\n");
      out.write("                background-color: #B0C4DE;\n");
      out.write("                width: 1000px;\n");
      out.write("                font-family:calibri;\n");
      out.write("                font-weight: bolder;\n");
      out.write("                font-size: 17px;\n");
      out.write("                margin-top: 1px; \n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #t2{\n");
      out.write("                font-family:calibri;\n");
      out.write("                border-collapse:collapse;\n");
      out.write("                width: 1000px;\n");
      out.write("                border-color: grey;\n");
      out.write("                font-size: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <header>\n");
      out.write("        <a href=\"index.jsp\"><img id=\"logo\" src=\"image/logo.png\" alt=\"Institute of Engineering &amp; Technology\"></a>\n");
      out.write("        <h2>Institute Of Engineering &amp; Technology</h2>\n");
      out.write("        <div class=\"menu\">\n");
      out.write("            <a href=\"student_select.jsp\">Student_Admit_Card</a>\n");
      out.write("            <a href=\"clerk.jsp\">Clerk Verification</a>\n");
      out.write("            <a href=\"admin.jsp\">Admin</a>\n");
      out.write("            <a href=\"index.jsp\">Home</a>\n");
      out.write("        </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("    ");


        eno = (request.getParameter("eno")).toUpperCase();
        status1 = request.getParameter("status");
        sem1 = request.getParameter("sem");

        HttpSession s = request.getSession();
        s.setAttribute("e", eno);
        s.setAttribute("s", status1);
        s.setAttribute("sem", sem1);
        try {

            ServletContext context = getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

            PreparedStatement ps = con.prepareStatement("select * from ex_student where enrollment_no=? and sem=?");
            ps.setString(1, eno);
            ps.setString(2, sem1);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                branch = rs.getString("branch");
                rollno = rs.getString("roll_no");
                name = rs.getString(3);
                s.setAttribute("name", name);


    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!DOCTYPE html>\n");
      out.write("\n");
      out.write("    <title> EX_Student</title>\n");
      out.write("    <style>\n");
      out.write("        #d1{\n");
      out.write("            border-radius: 25px;\n");
      out.write("            border: 2px solid;\n");
      out.write("            padding: 2%;\n");
      out.write("            width: 800px;\n");
      out.write("            margin-top: 20px;\n");
      out.write("            margin-left: 180px;\n");
      out.write("            margin-right: 180px;\n");
      out.write("            border-style: groove;\n");
      out.write("        }\n");
      out.write("        .footer {\n");
      out.write("            position:relative;\n");
      out.write("            left: 0;\n");
      out.write("            bottom: 0;\n");
      out.write("            width: 100%;\n");
      out.write("            height:150px;\n");
      out.write("            background-color:limegreen;\n");
      out.write("            color: white;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<center>\n");
      out.write("    <div id=\"d1\">\n");
      out.write("        <hr>\n");
      out.write("        <h3 align=\"center\">\n");
      out.write("            UTD Pay-Unpaid Examination Form/Print Reciept\n");
      out.write("        </h3>\n");
      out.write("        <hr>\n");
      out.write("\n");
      out.write("        <div style=\"background-color: #B0C4DE;text-align: left;\">\n");
      out.write("            Student Detail\n");
      out.write("        </div>\n");
      out.write("        <form action=\"challanupload.jsp\">\n");
      out.write("\n");
      out.write("            <table cellpadding=\"4\" cellspacing=\"1\" border=\"1\" style=\"border-collapse:collapse;margin-bottom: 7px;border-color: #cdcdcd\" align=\"Center\">\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Name of College(Code)\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"4\">\n");
      out.write("                        <span>\n");
      out.write("                            INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td rowspan=\"2\" align=\"center\">\n");
      out.write("                        <img id=\"ihoto\" style=\"height:120px;width:100px;border-width:0px;\"/>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Registration for Examination\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span>DEC 2018</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Examination Centre(Code)\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Name of Course\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span>BE</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Programme/Branch(Code)\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <div>");
      out.print( branch);
      out.write("</div>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Semester/Year\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span>");
      out.print( sem1);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Roll No./Enrollment No.\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span>");
      out.print( eno);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Roll No.\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span>");
      out.print( rollno);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Class\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span></span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Name of Examinee\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <div>");
      out.print( name);
      out.write("</div>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Status\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span>");
      out.print( status1);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Gender\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        <span></span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Father's Name \n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <div></div>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Mother's Name\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <span></span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        Category\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <div></div>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" >\n");
      out.write("                        Mobile NO\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <span></span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr><td align=\"left\">\n");
      out.write("                        Present Address\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"5\">\n");
      out.write("                        <div></div>\n");
      out.write("                    </td></tr>\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        City\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <span></span>\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\">\n");
      out.write("                        District\n");
      out.write("                    </td>\n");
      out.write("                    <td align=\"left\" colspan=\"2\">\n");
      out.write("                        <span></span>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>     \n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("            <div class=\"head1\" style=\"z-index: 730;background-color: #B0C4DE;text-align: left;\">\n");
      out.write("                Subject and Fees Description\n");
      out.write("            </div>\n");
      out.write("            <table cellspacing=\"0\" rules=\"all\" border=\"1\" id=\"grdSubject\" style=\"width:100%;border-collapse:collapse;\">\n");
      out.write("                <tr>\n");
      out.write("                    <th align=\"left\">\n");
      out.write("                        Paper Code\n");
      out.write("                    </th>\n");
      out.write("                    <th align=\"left\">\n");
      out.write("                        Paper Description\n");
      out.write("                    </th>\n");
      out.write("\n");
      out.write("                    <th align=\"left\">\n");
      out.write("                        Paper Type\n");
      out.write("                    </th>\n");
      out.write("                    <th align=\"left\">Select Subjects</th>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                ");

                    sem1 = sem1.substring(0, 1);
                    sem_num = Integer.parseInt(sem1);

                    PreparedStatement ps2 = con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code  where ex_student.enrollment_no=? and subschema.branch=? and ex_student.reg='N' and subschema.sem=? ");
                    ps2.setString(1, eno);
                    ps2.setString(2, branch);
                    ps2.setInt(3, sem_num);
                    ResultSet rs2 = ps2.executeQuery();
                    count = 0;
                    if (rs2.next()) {
                        branch = rs2.getString("branch");
                        course = rs2.getString("course");
                        do {
                            count += 1;
                            subject = (rs2.getString("subject_name")).toUpperCase();
                            subject_code = rs2.getString("subject_code");
                            sub_type = rs2.getString("subject_type");

                            key = subject_code + sub_type;
                            if (sub_type.equals("T")) {
                                sub_type1 = "Theory";
                            } else {
                                sub_type1 = "Practical";
                            }

                
      out.write("\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        <span>");
      out.print(subject_code);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <span>");
      out.print( subject);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <span>");
      out.print( sub_type1);
      out.write("</span>\n");
      out.write("                    </td>\n");
      out.write("                    <td><input type=\"checkbox\" name=\"sub_code\" value=");
      out.print(key);
      out.write(" /></td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                ");

                    } while (rs2.next());
                
      out.write("                                   \n");
      out.write("\n");
      out.write("                ");
	} else {
                        response.sendRedirect("index.jsp");
                    }
                    if (count == 1) {
                        fee1 = 690;
                    } else if (count == 2) {
                        fee1 = 1165;
                    } else if (count > 2) {
                        fee1 = 1650;
                    }

                    String fee = Integer.toString(fee1);
                    s.setAttribute("fee1", fee);

                
      out.write("                \n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("            <div align=\"center\">\n");
      out.write("                <span style=\"text-align:center;\">\n");
      out.write("                    <input id=\"check\" type=\"checkbox\" name=\"chkDeclaration\"/>\n");
      out.write("                    <label>CERTIFIED THAT</label>\n");
      out.write("                </span>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <span>\n");
      out.write("                    I hereby declare that the information filled by me is true and complete as per my knowledge. If any information provided by me is found false or incorrect then i shall be disqualified by the university.\n");
      out.write("                </span>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("</center>\n");
      out.write("<center>\n");
      out.write("\n");
      out.write("    <input type=\"submit\" style=\"margin-top: 10px\" id=\"pay\" class=\"button\"  value=\"   Proceed To Register   \" disabled/>\n");
      out.write("</center>\n");
      out.write("<!--  <div class=\"footer\">\n");
      out.write("<p> copyright IET, DAVV</p>\n");
      out.write("<p> Designed and Developed By :- </p>\n");
      out.write("</div>-->\n");
      out.write("<input type=\"hidden\" name=\"fee1\" value=\"");
      out.print(fee1);
      out.write("\">  \n");
      out.write("<script>\n");
      out.write("\n");
      out.write("    var checker = document.getElementById('check');\n");
      out.write("\n");
      out.write("    var sendbtn = document.getElementById('pay');\n");
      out.write("    // when unchecked or checked, run the function\n");
      out.write("\n");
      out.write("    checker.onchange = function () {\n");
      out.write("\n");
      out.write("        if (this.checked)\n");
      out.write("        {\n");
      out.write("            sendbtn.disabled = false;\n");
      out.write("\n");
      out.write("        }\n");
      out.write("        else\n");
      out.write("        {\n");
      out.write("            sendbtn.disabled = true;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    }\n");
      out.write("</script> \n");
      out.write("</form> \n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");

} else {

      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    if (window.confirm(\"No Records Found\"))\n");
      out.write("    {\n");
      out.write("        window.location = \"index.jsp\";\n");
      out.write("    }\n");
      out.write("    else\n");
      out.write("    {\n");
      out.write("        window.location = \"index.jsp\";\n");
      out.write("    }\n");
      out.write("\n");
      out.write("</script>\n");

        }

    } catch (Exception e) {

        e.printStackTrace();
    }


      out.write("\n");
      out.write("<footer>\n");
      out.write("    <p align=\"center\" id=\"p1\">\n");
      out.write("        D e v e l o p e d &nbsp&nbsp & &nbsp&nbsp D e s i g n e d &nbsp&nbsp b y :- \n");
      out.write("    </p>\n");
      out.write("    <hr align=\"center\" width=\"60%\">\n");
      out.write("    <p align=\"center\" id=\"p2\">\n");
      out.write("        Vinod Thakure ,&nbsp Jayesh Punjabi &nbsp and &nbsp Tanveer Singh Bhatia.\n");
      out.write("        <br />\n");
      out.write("        For any queries contact 15bcs158@ietdavv.edu.in.\n");
      out.write("        Copyright © 2018 IET DAVV. All rights reserved.\n");
      out.write("    </p>\n");
      out.write("\n");
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
