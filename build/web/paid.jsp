
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                           	<style>
            #d1{
                border-radius: 25px;
                border: 2px solid;
                padding: 2%;
                width: 800px;
                margin-top: 20px;
                margin-left: 180px;
                margin-right: 180px;
                border-style: groove;
            }
    
        </style>
          <link rel="stylesheet" type="text/css" href="css/index.css">
          <link rel="icon" href="input/logo.png">
   <link rel="stylesheet" type="text/css" href="css/button.css">
   <jsp:include page="bootstrap_file.jsp" /> 

    </head>
    <body>  <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
</header>
	       <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
        <%! 
        String query1;
        String eno;
        String sem;
        ResultSet rs;
        String subject_code;
        String subject_name;
        String status;
        String query2;
        %>
        <%
            eno=request.getParameter("eno");
            sem=request.getParameter("sem");
            status=request.getParameter("status");
             ServletContext context=getServletContext();  
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
           if(status.equals("Ex"))
           {
           query1="Select distinct * from ex_student inner join subschema on ex_student.subject_code=subschema.subject_code and ex_student.branch=subschema.branch where enrollment_no=? and ex_student.sem=? and ex_student.reg=? and ex_student.payment_status=?";
           PreparedStatement pd= con.prepareStatement(query1);
           
           pd.setString(1,eno);
           pd.setString(2,sem);
           pd.setString(3,"y");
           pd.setString(4,"Unpaid");
          rs= pd.executeQuery();
          %>
          <form action="payment_done.jsp">
           <table cellpadding="4" cellspacing="1" border="1" style="border-collapse:collapse;margin-bottom: 7px;border-color: #cdcdcd" align="Center">
              <tr><th>Subject Code</th><th>Subject Name</th><th>Choose Subjects</th></tr>
          <%
          while(rs.next())
          {
              subject_code=rs.getString("subject_code");
              subject_name=rs.getString("subject_name");
              %>
              <tr>
                  <td><%=subject_code%></td>
              <td><%=subject_name%></td>
              <td><input type="checkbox" name="sub_code" value=<%=subject_code%>></td>
              </tr>
   
              <%
              
              
          }
          %>
         
          </table>
           <input type="hidden" name="eno" value=<%=eno%>>
            <input type="hidden" name="status" value=<%=status%>>
            <center><input type="submit" value="Update" class="btn btn-success"></center>
            
                </form>    
            <%
           }
           else if(status.equalsIgnoreCase("Regular")){
               query2="Select * from eligible inner join subschema on eligible.course=subschema.course and eligible.branch=subschema.branch and eligible.eligible_semester=subschema.sem where eligible.enroll_no=? and eligible.reg=?";
               PreparedStatement pd=con.prepareStatement(query2);
               pd.setString(1,eno);
               pd.setString(2,"Y");
               ResultSet rs=pd.executeQuery();
               %>
               <form action="payment_done.jsp">
               <table cellpadding="4" cellspacing="1" border="1" style="border-collapse:collapse;margin-bottom: 7px;border-color: #cdcdcd" align="Center">
                        
                            <tr><th>Subject Code</th><th>Subject Name</th></tr>
               <%             
                while (rs.next())
                {
                    subject_code=rs.getString("subject_code");
                    subject_name=rs.getString("subject_name");
                    %>
                    
                            <tr><td><%=subject_code%></td><td><%=subject_name%></td></tr>
                      
            <%    }%>
            
             <input type="checkbox" name="sub_code"  id= "check">
             
            <script>

var checker = document.getElementById('check');

 var sendbtn = document.getElementById('ok');
 // when unchecked or checked, run the function
 
checker.onchange = function(){

if(this.checked)
{
    sendbtn.disabled = false;

} 
else
 {
    sendbtn.disabled = true;
}



}
</script> 

          </table>
             <input type="hidden" name="eno" value=<%=eno%>>
             <input type="hidden" name="status" value=<%=status%>>
             <center> <input type="submit" value="Update" id="ok" disabled></center>
                </form>  
            <%
           }
          
            %>
           
    </body>
    <footer>
<p align="center" id="p1">
Exam Registration Portal
</p>
<hr align="center" width="60%">
<p align="center" id="p2">
Developed & Designed by :- Hemant Sir,Ravindra Kumar Kushwaha and Sumit kr.

            For any queries contact ravindrakushwahanwg@gmail.com.
            Copyright © 2019 IET DAVV. All right reserved.
</p>
    
</footer>
</html>
