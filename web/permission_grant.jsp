<%-- 
    Document   : permission_grant
    Created on : Mar 19, 2019, 4:01:34 PM
    Author     : Jayesh
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Registration</title>
        <jsp:include page="bootstrap_file.jsp" />
</head>
<body>
    <jsp:include page="header.html" />
      <a href="#"><button class="btn btn-primary" style="margin-left: 10px;margin-bottom: -3px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
    <div class="container">
        <%!
        String subject_codes[];
        String query1;
        String eno;String sem;
        %>
        <%  Class.forName("com.mysql.jdbc.Driver");
              ServletContext context=getServletContext(); 
            Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		eno=request.getParameter("eno");
            subject_codes=request.getParameterValues("sub_code");
            sem=request.getParameter("sem");
            if(subject_codes!=null)
                       {
                         
                           for(int i=0;i<subject_codes.length ; i++)
                           {            
                                       query1="insert into permission values(?,?,?,?)";
                                       PreparedStatement pd=con.prepareStatement(query1);
                                       pd.setString(1,eno);
                                       pd.setString(2,sem);
                                       pd.setString(3, (subject_codes[i]).substring(0,6));
                                       pd.setString(4,(subject_codes[i]).substring(6,7));
                                        int j= pd.executeUpdate();
                                      
                                      
                           }
                           out.println("<H1 align='center'>Permission Granted..</H1>");
                       }
            %>
            </div>
            <jsp:include page="footer.html" />
    </body>
</html>
