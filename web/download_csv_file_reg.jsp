<%-- 
    Document   : download_csv_file_reg
    Created on : 30 Sep, 2019, 1:12:53 AM
    Author     : Ravindra
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
        <%! HttpSession session1;
        String uname,uname1;
        String pass,pass1;
        String query,query3;
        String sem;
        String branch;
        String payment_status,status;
        String eno,rno;
        String name;
        String query1,query2;
        PreparedStatement pd;
        String course;
        ResultSet rs;
       int count=0;
String filename;
        %>
         
        <%
          try{
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
               // out.println("1");
            query3="select subject_code,subject_type from ex_student group by subject_code,subject_type ";
           PreparedStatement pd1=con.prepareStatement(query3);
           ResultSet rs1=pd1.executeQuery();
	count=0;
//           while(rs1.next())
//           {    
//              
//               String name=rs1.getString("subject_code");
//               String type=rs1.getString("subject_type");
//            filename=context.getInitParameter("Output_Path")+name+"_"+ type +".csv";
//            FileWriter fw = new FileWriter(filename); 
//			fw.append("Roll_no");
//			fw.append(',');
//			fw.append("Enroll_no");
//			fw.append(',');
//			fw.append("Name");
//			
//                        fw.append('\n');
                        
                         filename=context.getInitParameter("Output_Path")+name+"_"+ type +".csv";
                            FileWriter fw = new FileWriter(filename); 
                       query2="select enrollment_no,roll_no,name from ex_student  where payment_status='Paid' and subject_code=? and subject_type=? order by ex_student.subject_code ";
                       PreparedStatement pd2=con.prepareStatement(query2);
                       pd2.setString(1,name);
                       pd2.setString(2,type);
                      ResultSet rs2=pd2.executeQuery();
 
                        while(rs2.next())
			{       fw.append(rs2.getString("enrollment_no").toUpperCase());
                                fw.append(',');
				fw.append(rs2.getString("roll_no").toUpperCase());
				fw.append(',');
				fw.append(rs2.getString("name").toUpperCase());
				fw.append('\n');
           
			}
			fw.flush();
			fw.close();
                        count++;
			//con.close();
                        
                        
                
                  
              }
 
            else{
                response.sendRedirect("admin.jsp");
            } 
            }
        
                   
         catch(Exception e){
                         out.println(e+"skn");
         }
         
         
          
          
               
		//out.close();
                
        
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link href="https://fonts.googleapis.com/css?family=Quicksand:300|Rajdhani:300|Raleway" rel="stylesheet">
        
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="icon" href="input/logo.png">
         <script type="text/javascript">
        <jsp:include page="bootstrap_file.jsp" /> 
            function Redirect()
            {
          
        var status=document.getElementById("status").value; 
            if(status==="Regular")
                document.getElementById("f1").action="student.jsp";
            else
                document.getElementById("f1").action="auto.jsp";
      
        }
        </script>
        <style>
        /*
           font-family: 'Raleway', sans-serif;
           font-family: 'Quicksand', sans-serif;
           font-family: 'Rajdhani', sans-serif;
        */
        .genText{
          font-family: 'Quicksand', sans-serif;
          font-size: 1.2em;
          font-weight: 1000;
        }
             .div1{
                border-radius: 25px;
                border: 2px solid;
                padding: 10px;
                padding-top: 0px;
                margin-top: 50px;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 50px;
                width: 1100px;
                 }
                 
                 #t1{
                     background-color: #B0C4DE;
                     width: 1000px;
                     font-family:calibri;
                    font-weight: bolder;
                    font-size: 17px;
                     margin-top: 1px; 
                 }
                 
                 #t2{
                       font-family:calibri;
                     border-collapse:collapse;
                     width: 1000px;
                     border-color: grey;
                     font-size: 15px;
                 }
    
            </style>
    </head>
    
  <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
<div class="menu">
<!--  <a href="student_select.jsp">Student_Admit_Card</a>-->
 <!--<a href="clerk.jsp">Clerk Verification</a>-->
  <a href="admin.jsp">Admin</a>
  <a href="index.jsp">Home</a>
</div>
</header>

<center>
    <h1>  <%=count %> Files generated at Path /var/lib/tomcat7/webapps/ROOT/output</h1>
    
</center> 
</body>
 <footer>
<p align="center" id="p1">
D e v e l o p e d &nbsp&nbsp & &nbsp&nbsp D e s i g n e d &nbsp&nbsp b y :- 
</p>
<hr align="center" width="60%">
<p align="center" id="p2">
Vinod Thakure ,&nbsp Jayesh Punjabi &nbsp and &nbsp Tanveer Singh Bhatia.
<br />
For any queries contact 15bcs158@ietdavv.edu.in.
Copyright © 2018 IET DAVV. All rights reserved.
</p>
    
</footer>
</html>
