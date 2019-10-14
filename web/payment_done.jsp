
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="bootstrap_file.jsp" />
</head>
<body>  
    <jsp:include page="header.html" />
     <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
     <div class="container" style="margin-bottom: -3px;">
<%! String subject_codes[];
    String query1;
    String eno;
    String status;
    String query2;
            %>
          <%ServletContext context=getServletContext();
              Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
  
              
              eno=request.getParameter("eno");
              status=request.getParameter("status");
              if(status.equalsIgnoreCase("Ex"))
              {
              subject_codes= request.getParameterValues("sub_code");

              
                       if(subject_codes!=null)
                       {
                                    
                           for(int i=0;i<subject_codes.length ; i++)
                           {           
                                       query1="update ex_student set payment_status=? where enrollment_no=? and subject_code=?";
                                       PreparedStatement pd=con.prepareStatement(query1);
                                       pd.setString(1,"Paid");
                                       pd.setString(2,eno);
                                       pd.setString(3,subject_codes[i]);
                                      
                                       
                                      int j= pd.executeUpdate();
                                      
                           }
                           out.println("<H1 align='center'>Updation done</H1>");
                       }
                       else{
                           out.println("2");
                       }
              }
              else if(status.equalsIgnoreCase("Regular"))
              {
                  query2="Update eligible set payment_status=? where enroll_no=?";
                  PreparedStatement pd= con.prepareStatement(query2);
                  pd.setString(1,"Paid");
                
                  pd.setString(2,eno);
                  int j=pd.executeUpdate();
              }
                       %>
    </div>
                       <jsp:include page="footer.html" />
    </body>
</html>
