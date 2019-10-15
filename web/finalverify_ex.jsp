<%-- 
    Document   : verifysuccess
    Created on : 15 Sep, 2018, 1:09:56 PM
    Author     : Ravindra
--%>
<%@page import="java.sql.*" 
        import="java.sql.Connection"
        import="java.io.IOException" 
        import="java.io.PrintWriter" 
        import="javax.servlet.annotation.WebServlet" 
        import="javax.servlet.http.HttpServlet" import="javax.servlet.http.HttpServletRequest" 
        import="javax.servlet.http.HttpServletResponse"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%!
    String status;
    String payment_status;
    Connection con;
    String eno;
    String rno;
    Statement stmt = null;
    String key[];
    String sub_types[];

%>
<%
    ServletContext context = getServletContext();
    key = request.getParameterValues("id");
    try {
        Class.forName(context.getInitParameter("Driver"));
        con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));

        if (key != null) {
            for (int i = 0; i < key.length; i++) {

                PreparedStatement ps1 = con.prepareStatement("update ex_student set payment_status='Paid' where enrollment_no=? and reg='Y' and subject_code=? and subject_type=?");

                eno = key[i].substring(0, 7);
                String subcode = key[i].substring(7, 13);
                String subtype = key[i].substring(13, 14);
                        //out.println(subcode);
                //out.println(subtype);

                // String sub_code=name.substring(0,6);
                ps1.setString(1, eno);
                ps1.setString(2, subcode);
                ps1.setString(3, subtype);
                //out.println(sub_types[i]);
                int j = 0;
                j = ps1.executeUpdate();
                //     out.println(j);
                if (j > 0) {
                                  // out.println("Verified!!")   ; 

                } else {
                                 // out.println("Not Verified !!");

                }
            }
            // }
        }

%>


<%                            // }

%>





<!DOCTYPE html>

<title>Verify</title>
<style>
    #d1{
        border-radius: 25px;
        border: 2px solid;
        padding: 2%;
        border-style: groove;
        margin-bottom: 0px;
        height:0px;
    }

</style>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<jsp:include page="bootstrap_file.jsp" />
</head>
<body>
    <jsp:include page="header.html" />

    <div align="left" style="margin-left:5px"> 
        <button onclick="goBack();" class="btn btn-primary"/><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button>
</div>
<div id="d1" class="container"  style="margin-bottom: -3px;">
    <center> <img  src="tick.jpg" name="tick" alt="Tick" ></center>
</div>

<script>

    var checker = document.getElementById('check1');

    var sendbtn = document.getElementById('pay');
// when unchecked or checked, run the function
    checker.onchange = function () {

        if (this.checked)
        {
            sendbtn.disabled = false;

        }
        else
        {
            sendbtn.disabled = true;
        }



    }
</script> 

<!--</form>    -->     


<%
%>


<%                    } catch (Exception e) {

        e.printStackTrace();
        out.println(e);
    }
%>
<jsp:include page="footer.html" />
</body>
</html>
