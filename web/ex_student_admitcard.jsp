
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIT CARD</title>
        <link rel="icon" href="image/logo.png">
        <style>
        div.relative {

    width: 800px;
    border: 1px solid black;
    border-radius: 25px;
    padding: 25px;
    margin: 25px;
    position: relative;
   
} 
/*
@media all {
	.page-break	{ display: none; }
}
*/

@media print {
	.page-break	{ display: block; page-break-after: always; }
}
       </style>
  
    </head>
    <body>
        <%!String eno,eno1 ;
        int i;
        String name;
        String month;
        String rno;
        String status;
        String fname;
        String mname;
        String gender;
        String query;
        ResultSet rs1;
        String query1;
        String schemeId;
        String branch;
        int sem;
        String query2;
        String query3;
        String uname,uname1;
        String pass,pass1;
        HttpSession session1;
        String course,subject,subject_code;
        String sub_type;
        
        %>
        
        <%
      session1=request.getSession();
      uname=(String)session1.getAttribute("uname");
      pass=(String)session1.getAttribute("pass");
    
      if(uname==null||pass==null)
      {
          response.sendRedirect("admin.jsp");
      }
                                
          ServletContext context=getServletContext();  
          Class.forName(context.getInitParameter("Driver"));
          Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
		
            query= "select * from administration where user_name=?";
          PreparedStatement pd=con.prepareStatement(query);
           pd.setString(1,uname);
           ResultSet rs=pd.executeQuery();
           if(rs.next()){
               uname1=rs.getString(1);
               pass1=rs.getString(2);
           }
            if(uname.equals(uname1) && pass.equals(pass1))
            {
           branch=request.getParameter("branch");
          sem=Integer.parseInt(request.getParameter("sem"));
          
     i=0;
          
     
          query3=" select * from ex_student where ex_student.branch=? and ex_student.sem=? and ex_student.payment_status=?";
          PreparedStatement pd3=con.prepareStatement(query3);
            pd3.setString(1,branch);
            pd3.setInt(2,sem);
            pd3.setString(3,"Paid");
          ResultSet rs3=pd3.executeQuery();
         
          eno1="";
          while(rs3.next())
          { 
           
             eno=rs3.getString(2);
            
             while(eno.equals(eno1)){
                 if(rs3.next())
                 {  eno=rs3.getString("enrollment_no");}
                 else{
                  i=1; 
                 break;
                 }
              }
              
              if(i==1){ break;
              }
              eno1=eno;
            name=(rs3.getString("name")).toUpperCase();
            rno=rs3.getString("roll_no");
                     
            //month=rs.getString(14);
            
            //fname=rs3.getString(18);
            //status=rs.getString(15);
           // mname=rs3.getString(19);
           // gender=rs3.getString(16);
            //schemeId=rs.getString(13);
            
         
        
        
     
             %>
        <div class="page-break">  
    <center>
                        
        <div class="relative">
            <center><br>  <h2>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE-Admit Card APR 2019</h2>
            </center>
            <hr>
            <br>
        <table border="1" style="border-collapse:collapse" width="800px">
            <tr><th>
                    Enrollment Number:
                </th>
                <td><%=eno%></td>
                <td rowspan="7"><img id="ihoto" src= "show.jsp?image=<%= eno%>" style="height:185px;width:165px;border-width:0px;"/> </td>
            </tr>
            
            <tr>
                <th>Roll No.</th>
                <td><%=rno%></td>
                
               
            </tr>
            
            <tr>
                <th>Exam Name:</th>
                <td>APR 2019</td>
            </tr>
            
            <tr>
                <th>Exam Center:</th>
                <td>INSTITUTE OF ENGINEERING AND TECHNOLOGY(IET),INDORE[808]</td>
            </tr>
            <tr>
            <th>Exam Month:</th>
                <td>APR 2019</td>
            </tr>
            <tr>
                <th>Name:</th>
                <td><%=name%></td>
            </tr>
            
            <tr><th>Father Name:</th>
                <td> </td>
            </tr>
            
            <tr><th>Mother Name:
                </th>
                <td colspan="2"> </td>
            </tr>
            
            <tr><th>Gender:</th>
                <td colspan="2"> </td>
            </tr>
            <tr>
                 <th>Status:</th>
                <td colspan="2">Ex</td>
            </tr>
        </table>
            <hr>
            <center>
                <br>
            <h2>Opted Paper Description(Not In Sequence According To Time Table Of University)</h2>
            <br>
            </center>
            <table border="1" style="border-collapse:collapse" width="800px">
                <tr><th>Subject Code</th>
                <th>Subject Name</th>
                <th>Subject Type</th>
                <th>Date</th>
                <th>Candidate's Signature</th>
                <th>Answer Sheet Number:</th>
                <th>Invigilator's Signature</th>
                <th style="width:100px">Signature</th>
                </tr>
                <tr>
               <%   // For subSchema
        
             
                        PreparedStatement ps2=con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=? and payment_status='Paid' and reg='Y'");
			ps2.setString(1,eno);
			ResultSet rs2=ps2.executeQuery();
                        
			if(rs2.next())
                            
                        {    // branch=rs2.getString(2);
                             //  course=rs2.getString(1);
                              
				do{
                                    subject=(rs2.getString("subject_name")).toUpperCase();
                                    subject_code=rs2.getString("subject_code");
                                       sub_type=rs2.getString("subject_type");
                            %>
                    
                     
                    <td align="center"><%=subject_code%></td>
                    <td style="padding: 4px;"><%=subject%></td>
                     <td align="center"><%= sub_type %></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                        </tr>
                      <% }while(rs2.next()) ; }%>
                       
              
            </table>
                       
        </div>  
                   
                       
    
    </center>    
                      </div>
                      <%  }
 
       
         
      }
          else{
               response.sendRedirect("admin.jsp");
               }
      %>
                              <center>
                                  <input type="submit" value="Print" align="center" onClick= "myfunction()">
                              </center>
                    
                      <script>
                        function  myfunction(){
                            window.print();
                        }
                      </script>
                         
         
    </body>
</html>
