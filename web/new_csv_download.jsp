<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%! HttpSession session1;
    String uname, uname1;
    String pass, pass1;
    String query, query3;
    String sem;
    String branch;
    String payment_status, status;
    String eno, rno;
    String name;
    String query1, query2;
    PreparedStatement pd;
    String course;
    ResultSet rs;
    int count = 0;
    String filename;
%>

<%
    try {
        session1 = request.getSession();

        uname = (String) session1.getAttribute("uname");

        pass = (String) session1.getAttribute("pass");

        if (uname == null || pass == null) {
            response.sendRedirect("admin.jsp");
        }
        ServletContext context = getServletContext();
        Class.forName(context.getInitParameter("Driver"));
        Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        query = "select * from administration where user_name=?";
        PreparedStatement pd = con.prepareStatement(query);
        pd.setString(1, uname);
        ResultSet rs = pd.executeQuery();
        if (rs.next()) {

            uname1 = rs.getString(1);
            pass1 = rs.getString(2);
        }
        if (uname.equals(uname1) && pass.equals(pass1)) {
            // out.println("1");
            query3 = "select subject_code,subject_type from ex_student group by subject_code,subject_type ";
            PreparedStatement pd1 = con.prepareStatement(query3);
            ResultSet rs1 = pd1.executeQuery();
            count = 0;
            while (rs1.next()) {

                String name = rs1.getString("subject_code");
                String type = rs1.getString("subject_type");
//               String = (String)System.getProperty("user.home")+"/Dowmloads/";
//                filename = context.getInitParameter("Output_Path") + name + "_" + type + ".csv";
                filename = System.getProperty("user.home")+"/Downloads/" + name + "_" + type + ".csv";
                FileWriter fw = new FileWriter(filename);
                fw.append("Roll_no");
                fw.append(',');
                fw.append("Enroll_no");
                fw.append(',');
                fw.append("Name");

                fw.append('\n');

                query2 = "select enrollment_no,roll_no,name from ex_student  where payment_status='Paid' and subject_code=? and subject_type=? order by ex_student.subject_code ";
                PreparedStatement pd2 = con.prepareStatement(query2);
                pd2.setString(1, name);
                pd2.setString(2, type);
                ResultSet rs2 = pd2.executeQuery();

                while (rs2.next()) {
                    fw.append(rs2.getString("roll_no").toUpperCase());
                    fw.append(',');
                    fw.append(rs2.getString("enrollment_no").toUpperCase());
                    fw.append(',');
                    fw.append(rs2.getString("name").toUpperCase());
                    fw.append('\n');

                }
                fw.flush();
                fw.close();
                count++;
                //con.close();

            }

        } else {
            response.sendRedirect("admin.jsp");
        }
    } catch (Exception e) {
        out.println(e + "skn");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="bootstrap_file.jsp" />
        <script type="text/javascript">

            function Redirect()
            {

                var status = document.getElementById("status").value;
                if (status === "Regular")
                    document.getElementById("f1").action = "student.jsp";
                else
                    document.getElementById("f1").action = "auto.jsp";

            }
            function goBack() {
        window.history.back();
    }
        </script>
    </head>
    <body>
        <jsp:include page="header.html" />
        <div align="left" style="margin-left:5px;margin-top: 5px;"> 
        <button onclick="goBack();" class="btn btn-primary noprint"/><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button>
</div>
    <center style="margin-bottom: 248px;margin-top: 100px;">
        <h1>  <%=count%> Files generated at Path /var/lib/tomcat7/webapps/ROOT/output</h1>

    </center> 
    <jsp:include page="footer.html" />
</body>
</html>
