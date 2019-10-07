package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.Date;
import java.sql.DriverManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public final class transaction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String query3;
    String query4;
    String date;
    String payment_status;
    String query5;
    String query6;
    String date2;
    int time1;
    String time2;
    String transaction_id;
    String eno;
    String query7;
    String pay_mode;
    int fee;
    String name;
    String sem;
    String reg;
    String category;
    String gender;
    String address;
    String image;
    String s;
    String rno;
    String query;
    String subject;
    String subject_code;
    String query1;
    String branch;
    String[] sub = new String[50];
    String subCode[] = new String[50];
    int i;
    int j;
    String eno1;
    String city;
    String district;
    String scheme_id;
    String course;
    String house_no, colony;
    int sem_num;
    String sub_type, sub_type1;
    int fee1, sem1;
    String enrollment_no;
    String status;
    String challan_no;
    String roll_no;
    String sub_code[];
    String dt;
    String query10;

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
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    HttpSession ss = request.getSession();
    enrollment_no = (String) ss.getAttribute("e");
    status = (String) ss.getAttribute("s");
    sem = (String) ss.getAttribute("sem");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
    Date date = new Date();
    dt = sdf.format(date);
    sem1 = Integer.parseInt(sem);
    name = (String) ss.getAttribute("name");
    //  ss.invalidate();

    sub_code = request.getParameterValues("sub_code");
    if (enrollment_no == null) {
        response.sendRedirect("index.jsp");
    }

    try {

        ServletContext context = getServletContext();
        Class.forName(context.getInitParameter("Driver"));
        Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        PreparedStatement ps2 = con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=? and ex_student.reg=? and subschema.sem=?");
        ps2.setString(1, enrollment_no);
        ps2.setString(2, "Y");
        //ps2.setString(3,branch);
        ps2.setInt(3, sem1);
        ResultSet rs2 = ps2.executeQuery();

        rs2.last();
        branch = rs2.getString("branch");
        roll_no = rs2.getString("roll_no");
        course = rs2.getString("course");
        fee1 = rs2.getRow();
        rs2.beforeFirst();

        if (fee1 > 3) {
            fee1 = 3;
        }
        PreparedStatement ps = con.prepareStatement("select * from ex_fees where subjects=?");
        ps.setInt(1, fee1);
        ResultSet rs = ps.executeQuery();
        rs.next();

        fee1 = rs.getInt(2);



      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <title>Student</title>\n");
      out.write("    <style>\n");
      out.write("        #d1{\n");
      out.write("            border-radius: 25px;\n");
      out.write("            border: 2px solid;\n");
      out.write("            padding: 2%;\n");
      out.write("            width: 800px;\n");
      out.write("            margin-left: 250px;\n");
      out.write("            margin-right: 250px;\n");
      out.write("            border-style: groove;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <link rel=\"icon\" href=\"image/logo.png\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<header style=\"width: 1550px;\">\n");
      out.write("    <a href=\"index.jsp\"><img id=\"logo\" src=\"image/logo.png\" alt=\"Institute of Engineering &amp; Technology\"></a>\n");
      out.write("    <h2>Institute Of Engineering &amp; Technology</h2>\n");
      out.write("    <div class=\"menu\">\n");
      out.write("        <a href=\"index.jsp\">Home</a>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("<body>\n");
      out.write("    <div id=\"menu_bar\" style=\"background-color:yellowgreen;margin-top: 10px;\"></div>\n");
      out.write("<center>\n");
      out.write("    <div id=\"d1\">\n");
      out.write("        <hr>\n");
      out.write("        <h3 align=\"center\">\n");
      out.write("            UTD Pay-Unpaid Examination Form/Print Reciept ( SEM ");
      out.print( sem);
      out.write(" )\n");
      out.write("        </h3>\n");
      out.write("        <hr>\n");
      out.write("\n");
      out.write("        <div style=\"background-color: #B0C4DE;text-align: left;\">\n");
      out.write("            Student Detail\n");
      out.write("        </div>\n");
      out.write("        <table cellpadding=\"4\" cellspacing=\"1\" border=\"1\" style=\"border-collapse:collapse;margin-bottom: 7px;border-color: #cdcdcd\" align=\"Center\">\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Name of College(Code)\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"4\">\n");
      out.write("                    <span>\n");
      out.write("                        INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>\n");
      out.write("                </td>\n");
      out.write("                <td rowspan=\"2\" align=\"center\">\n");
      out.write("                    <img id=\"ihoto\" style=\"height:120px;width:100px;border-width:0px;\"/>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Registration for Examination\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span>JUN-2017</span>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Examination Centre(Code)\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Name of Course\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span>");
      out.print( course);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Programme/Branch(Code)\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <div>");
      out.print( branch);
      out.write("</div>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Semester/Year\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span>");
      out.print( sem);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Enrollment No.\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span>");
      out.print( enrollment_no);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Roll No\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span>");
      out.print( roll_no);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Class\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span></span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Name of Examinee\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <div>");
      out.print( name);
      out.write("</div>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Status\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span>");
      out.print( status);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Gender\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    <span></span>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Father's Name \n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <div></div>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Mother's Name\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <span></span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    Category\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <div></div>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" >\n");
      out.write("                    Mobile NO\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <span></span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("            <tr><td align=\"left\">\n");
      out.write("                    Present Address\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"5\">\n");
      out.write("                    <div></div>\n");
      out.write("                </td></tr>\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    City\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <span></span>\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\">\n");
      out.write("                    District\n");
      out.write("                </td>\n");
      out.write("                <td align=\"left\" colspan=\"2\">\n");
      out.write("                    <span></span>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("            </tr>     \n");
      out.write("\n");
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <div class=\"head1\" style=\"z-index: 730;background-color: #B0C4DE;text-align: left;\">\n");
      out.write("            Subject and Fees Description\n");
      out.write("        </div>\n");
      out.write("        <table cellspacing=\"0\" rules=\"all\" border=\"1\" id=\"grdSubject\" style=\"width:100%;border-collapse:collapse;\">\n");
      out.write("            <tr>\n");
      out.write("               \t<th align=\"left\">\n");
      out.write("                    Paper Code\n");
      out.write("                </th>\n");
      out.write("                <th align=\"left\">\n");
      out.write("                    Paper Description\n");
      out.write("                </th>\n");
      out.write("                <th align=\"left\">\n");
      out.write("                    Paper Type\n");
      out.write("                </th>\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");


                if (rs2.next()) {
                    branch = rs2.getString("branch");
                    course = rs2.getString("course");

                    do {
                        subject = rs2.getString("subject_name");
                        subject_code = rs2.getString("subject_code");
                        sub_type = rs2.getString("subject_type");
                        if (sub_type.equals("T")) {
                            sub_type1 = "Theory";
                        } else {
                            sub_type1 = "Practical";
                        }

            
      out.write("\n");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <span>");
      out.print(subject_code);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <span>");
      out.print( subject);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <span>");
      out.print( sub_type1);
      out.write("</span>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                    } while (rs2.next());

                }

            
      out.write("       \n");
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </div>\n");
      out.write("</center>\n");
      out.write("\n");
     query10 = " select * from ex_student where ex_student.enrollment_no=? and ex_student.sem=? and ex_student.reg=?";
    PreparedStatement pd10 = con.prepareStatement(query10);
    pd10.setString(1, enrollment_no);
    pd10.setInt(2, sem1);
    pd10.setString(3, "Y");
    ResultSet rs10 = pd10.executeQuery();

    if (rs10.next()) {

        j = 0;
        eno = rs10.getString(2);

        name = (rs10.getString("name")).toUpperCase();
        rno = rs10.getString("roll_no");

           //month=rs.getString(14);
           //fname=rs3.getString(18);
        //status=rs.getString(15);
        // mname=rs3.getString(19);
        // gender=rs3.getString(16);
        //schemeId=rs.getString(13);


      out.write("\n");
      out.write("\n");
      out.write("<p style=\"page-break-after:always\"></p>\n");
      out.write("<center> \n");
      out.write("\n");
      out.write("    <div class=\"relative\" id=\"menu_bar\" style=\"background-color:yellowgreen;margin-top: 10px;\"></div>\n");
      out.write("    <center>\n");
      out.write("        <div id=\"d1\">\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("            <h2 align=\"center\"  style=\" color: rgb(2,159,91);\">\n");
      out.write("                Institute of Engineering & Technology -DAVV\n");
      out.write("                <br>   (RASA Form)</br>\n");
      out.write("            </h2>\n");
      out.write("            <hr>\n");
      out.write("\n");
      out.write("            <hr>\n");
      out.write("            <br>\n");
      out.write("            <table border=\"1\" style=\"border-collapse:collapse\" width=\"800px\">\n");
      out.write("                <tr><th>\n");
      out.write("                        Enrollment Number:\n");
      out.write("                    </th>\n");
      out.write("                    <td>");
      out.print(eno);
      out.write("</td>\n");
      out.write("                    <td rowspan=\"7\"><img id=\"ihoto\" src= \"show.jsp?image=");
      out.print( eno);
      out.write("\" style=\"height:185px;width:165px;border-width:0px;\"/> </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <th>Roll No.</th>\n");
      out.write("                    <td>");
      out.print(rno);
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <th>Exam Name:</th>\n");
      out.write("                    <td>APR 2019</td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <th>Exam Center:</th>\n");
      out.write("                    <td>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE[808]</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Exam Month:</th>\n");
      out.write("                    <td>APR 2019</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Name:</th>\n");
      out.write("                    <td>");
      out.print(name);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr><th>Father Name:</th>\n");
      out.write("                    <td> </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr><th>Mother Name:\n");
      out.write("                    </th>\n");
      out.write("                    <td colspan=\"2\"> </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr><th>Gender:</th>\n");
      out.write("                    <td colspan=\"2\"> </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Status:</th>\n");
      out.write("                    <td colspan=\"2\">Ex</td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <hr>\n");
      out.write("            <center>\n");
      out.write("                <br>\n");
      out.write("                <h3>Opted Paper Description(Not In Sequence According To Time Table Of University)</h3>\n");
      out.write("                <br>\n");
      out.write("            </center>\n");
      out.write("            <table border=\"1\" style=\"border-collapse:collapse\" width=\"800px\">\n");
      out.write("                <tr><th>Subject Code</th>\n");
      out.write("                    <th>Subject Name</th>\n");
      out.write("                    <th>Subject Type</th>\n");
      out.write("                    <th>Date</th>\n");
      out.write("                    <th>Candidate's Signature</th>\n");
      out.write("                    <th>Answer Sheet Number:</th>\n");
      out.write("                    <th>Invigilator's Signature</th>\n");
      out.write("                    <th style=\"width:100px\">Signature</th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    ");
   // For subSchema

                        PreparedStatement ps11 = con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=?  and reg='Y'");
                        ps11.setString(1, enrollment_no);
                        ResultSet rs11 = ps11.executeQuery();

                        if (rs11.next()) {    // branch=rs2.getString(2);
                            //  course=rs2.getString(1);

                            do {
                                subject = (rs11.getString("subject_name")).toUpperCase();
                                subject_code = rs11.getString("subject_code");
                                sub_type = rs11.getString("subject_type");

                    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <td align=\"center\">");
      out.print(subject_code);
      out.write("</td>\n");
      out.write("                    <td style=\"padding: 4px;\">");
      out.print(subject);
      out.write("</td>\n");
      out.write("                    <td align=\"center\">");
      out.print( sub_type);
      out.write("</td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 } while (rs11.next());
                    }


                
      out.write("\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("        </div>   </center>\n");
      out.write("</center>\n");
      out.write("\n");
                  }
    } catch (Exception e) {

        e.printStackTrace();
    }

      out.write("\n");
      out.write("\n");
      out.write("<div style=\"width: 1400px;\">\n");
      out.write("    <center>\n");
      out.write("        <input id=\"pay\" style=\"margin-top: 10px\" type=\"button\" onclick=\"window.print()\" value=\"   Print   \"/>\n");
      out.write("    </center>\n");
      out.write("</div>\n");
      out.write("</p>\n");
      out.write("<center>\n");
      out.write("\n");
      out.write("</center>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("<footer style=\"width: 1550px;\">\n");
      out.write("    <p align=\"center\" id=\"p1\">\n");
      out.write("        Exam Registration Portal\n");
      out.write("    </p>\n");
      out.write("    <hr align=\"center\" width=\"60%\">\n");
      out.write("    <p align=\"center\" id=\"p2\">\n");
      out.write("        Developed & Designed by :- Vinod Thakure , Jayesh Punjabi and Tanveer Singh Bhatia.\n");
      out.write("\n");
      out.write("        For any queries contact 15bcs158@ietdavv.edu.in.\n");
      out.write("        Copyright © 2017 IET DAVV. All right reserved.\n");
      out.write("    </p>\n");
      out.write("\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
