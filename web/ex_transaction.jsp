
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%> 
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! String query3;
           String query4;
           String date;
           String payment_status;
           String query5;
           String query6;
           String date2 ;
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
           String[] sub=new String[50] ;
            String subCode[]=new String[50] ;
           int i;
           int j;
           String eno1;
           String city;
           String district;
           String scheme_id;
           String course;String house_no,colony;
           int sem_num;String sub_type,sub_type1;
           int fee1,sem1;
           String enrollment_no;
           String status;
           String challan_no;
		String roll_no;
                String sub_code[];
                String dt;
           String query10;
        %>

        
        <%
            HttpSession ss=request.getSession();
            enrollment_no =(String)ss.getAttribute("e");
            status =(String)ss.getAttribute("s");
            sem =(String)ss.getAttribute("sem");
             
            SimpleDateFormat sdf=new SimpleDateFormat("dd/mm/yyyy hh:mm:ss");
            Date date=new Date();
            dt=sdf.format(date);
            sem1=Integer.parseInt(sem);
            name=(String)ss.getAttribute("name");
            //  ss.invalidate();
           
            sub_code = request.getParameterValues("sub_code");
            if(enrollment_no==null)
            {
            response.sendRedirect("index.jsp");
            }
        
                try
		{
                    
			ServletContext context=getServletContext();  
                        Class.forName(context.getInitParameter("Driver"));
                        Connection con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
                        
                                  
                          
                        PreparedStatement ps2=con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=? and ex_student.reg=? and subschema.sem=?");
			ps2.setString(1,enrollment_no);
                        ps2.setString(2,"Y");
			//ps2.setString(3,branch);
			ps2.setInt(3,sem1);
			ResultSet rs2=ps2.executeQuery();
                              
                          
                        rs2.last();
                        branch=rs2.getString("branch");
                        roll_no=rs2.getString("roll_no");
                        course=rs2.getString("course");
                        fee1=rs2.getRow();
                        rs2.beforeFirst();
                          if(fee1>3)
                              fee1=3; 
                        PreparedStatement ps=con.prepareStatement("select * from ex_fees where subjects=?");
			ps.setInt(1,fee1);
			ResultSet rs=ps.executeQuery();
                        rs.next();                
             fee1=rs.getInt(2);

        
        %>

        
<!DOCTYPE html>

<head>
	<title>Student</title>
	<style>
            #d1{
                border-radius: 25px;
                border: 2px solid;
                padding: 2%;
                border-style: groove;
            }
        </style>
        <link rel="icon" href="input/logo.png">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <jsp:include page="bootstrap_file.jsp" /> 
         
</head>
<header style="width: 1550px;">
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
<div class="menu">
  <a href="index.jsp">Home</a>
</div>
</header>
<body>
    <div class="container mx-auto">
         <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
	  <div id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>
	
		<div id="d1">
			<hr>
			<h3 align="center">
			UTD Pay-Unpaid Examination Form/Print Reciept ( SEM <%= sem %> )
			</h3>
			<hr>


           <div class="head1" style="z-index: 750;background-color: #B0C4DE;text-align: center;">
            Transaction Details
            </div>
                        <table class="table table-bordered shadow">
           
            <tr>
            <th>
            Payment Mode:
            </th>
            <td>
            <span>Challan</span>
            </td>
            <th>
            Date:
            </th>
            <td>
                <span><%= dt %></span>
            </td>
            
            </tr>
            <tr>
            <th>
            Challan Number:
            </th>
            <td >
            <span></span>
            </td>
            <th>
            Application Fee(Rs.):
            </th>
            <td colspan="2">
            <span><%= fee1 %></span>
            </td>
            </tr>
            </table>
        
            <div style="background-color: #B0C4DE;text-align: center;">
        	Student Detail
        	</div>
		<table class="table table-bordered shadow">
                    <tr>

                    <th>
                    Name of College(Code)
                   	</th>
                    <td  colspan="4">
                    <span>
                    INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                    </td>
                    <td rowspan="2" align="center">
                    <img id="ihoto" style="height:120px;width:100px;border-width:0px;"/>
                    </td>

                    </tr>
                    <tr>
                    
                    <th>
                    Registration for Examination
                    </th>
                    <td>
                   	<span>JUN-2017</span>
                   	</td>
                    <th>
                    Examination Centre(Code)
                   </th>
                    <td>
                    <span>INSTITUTE OF ENGINEERING &amp; TECHNOLOGY (IET), INDORE(808)</span>
                    </td>
                   	
                   	</tr>
                    <tr>
                    
                    <th>
                    Name of Course
                    </th>
                    <td>
                    <span><%= course%></span>
                    </td>
                    <th>
                    Programme/Branch(Code)
                   </th>
                   <td>
                     <div><%= branch %></div>
                   </td>
                    <th>
                    Semester/Year
                    </th>
                    <td>
                    <span><%= sem %></span>
                    </td>
                    
                    </tr>
                    <tr>
                    
                    <th>
                   	Enrollment No.
                   </th>
                    <td>
                    <span><%= enrollment_no %></span>
                    </td>
                    <th>
                    Roll No
                   </th>
                    <td>
                    <span><%= roll_no %></span>
                    </td>
                    <th>
                    Class
                    </th>
                    <td>
                    <span></span>
                    </td>
                    
                    </tr>
                 	<tr>
                    	<th>
                    Name of Examinee
                    </th>
                    <td>
                   	<div><%= name%></div>
                    </td>
                    <th>
                        Status
                    </th>
                    <td>
                    <span><%= status %></span>
                    </td>
                           
                     <th>
                    Gender
                    </th>
                    <td>
                    <span></span>
                    </td>
                    </tr>
                   	   <tr>

                    <th>
                    Father's Name 
                    </th>
                    <td colspan="2">
                    <div></div>
                    </td>
                    <th>
                    Mother's Name
                    </th>
                    <td  colspan="2">
                    <span></span>
                    </td>
                                      
                    </tr>
                    
                       	<tr>

                    <th>
                    Category
                    </th>
                    <td  colspan="2">
                    <div></div>
                    </td>
                    <th>
                    Mobile NO
                    </th>
                    <td  colspan="2">
                    <span></span>
                    </td>
                   
                                                
                    </tr>
                    
                    <tr><th>
                    Present Address
                        </th>
                    <td colspan="5">
                    <div></div>
                    </td></tr>
                   	<tr>

                    <th>
                    City
                    </th>
                    <td  colspan="2">
                    <span></span>
                    </td>
                    <th>
                    District
                   	</th>
                        <td  colspan="2">
                    <span></span>
                   	</td>
                                                
                    </tr>     

                    
                </table>
                <div class="head1" style="z-index: 730;background-color: #B0C4DE;text-align: center;">
                Subject and Fees Description
                </div>
    			<table class="table table-bordered shadow">
        		<tr>
               	<th >
                Paper Code
                </th>
                <th >
                Paper Description
                </th>
                <th>
                Paper Type
                </th>
        		</tr>
                        

                   <%
                        
			if(rs2.next())
                        {       branch=rs2.getString("branch");
                                course=rs2.getString("course");
                              
				do{
                                    subject=rs2.getString("subject_name");
                                    subject_code=rs2.getString("subject_code");
                                    sub_type=rs2.getString("subject_type");
                                    if(sub_type.equals("T"))
                                        sub_type1="Theory";
                                    
                                    else
                                        sub_type1="Practical";
    
                %>

       		<tr>
            	<td>
                <span><%=subject_code %></span>
                </td>
                <td>
                <span><%= subject %></span>
                </td>
                <td>
                <span><%= sub_type1 %></span>
                </td>
                </tr>
 <%
                                   }while(rs2.next());

			}

%>       
   
            </table>
                </div>
        
 <%   
                     
                        query10=" select * from ex_student where ex_student.enrollment_no=? and ex_student.sem=? and ex_student.reg=?";
          PreparedStatement pd10=con.prepareStatement(query10);
            pd10.setString(1,enrollment_no);
            pd10.setInt(2,sem1);
            pd10.setString(3,"Y");
          ResultSet rs10=pd10.executeQuery();
            
         
         if(rs10.next()){ 
             
            j=0;
             eno=rs10.getString(2);
               
           name=(rs10.getString("name")).toUpperCase();
            rno=rs10.getString("roll_no");
             %>
             
             <p style="page-break-after:always"></p>
              

                        <div class="relative" id="menu_bar" style="background-color:yellowgreen;margin-top: 10px;"></div>
		
		<div id="d1">
       
           <hr>
			<h2 align="center"  style=" color: rgb(2,159,91);">
			Institute of Engineering & Technology -DAVV
                        <br>   (RASA Form)</br>
			</h2>
			<hr>

            <hr>
            <br>
            <table class="table table-bordered">
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
            
            <tr><th>Branch:</th>
                <td> <%= branch %></td>
            </tr>
            
            <tr><th>Sem:</th>
                <td colspan="2"><%= sem %> </td>
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
            <h3>Opted Paper Description(Not In Sequence According To Time Table Of University)</h3>
            <br>
            </center>
            <table class="table table-bordered shadow">
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
        
             
                        PreparedStatement ps11=con.prepareStatement("select distinct * from subschema inner join ex_student on subschema.subject_code=ex_student.subject_code and ex_student.branch=subschema.branch where ex_student.enrollment_no=?  and reg='Y'");
			ps11.setString(1,enrollment_no);
			ResultSet rs11=ps11.executeQuery();
                       
                  
			if(rs11.next())
                            
                        {    // branch=rs2.getString(2);
                             //  course=rs2.getString(1);
                         
				do{
                                    subject=(rs11.getString("subject_name")).toUpperCase();
                                    subject_code=rs11.getString("subject_code");
                                       sub_type=rs11.getString("subject_type");
                                       
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
                      <% }while(rs11.next()) ; }
                       
              
          %>
          
          </table>
              
        </div>  
               

          <%
                }
                }
                catch(Exception e)
        {
           
          e.printStackTrace();
        }
               %>
         
       <div >
    <center>
          <!--<input id="pay" style="margin-top: 10px" type="button" onclick="window.print()" value="   Print   "/>-->
          <center>
        <input id="pay" style="margin-top: 10px" type="button" onclick="window.print()" value="Print" class="btn btn-success"/>
        <button class="btn btn-danger"> <a href="index.jsp" style="color:white;">Exit</a></button>
    </center>
    </center>
</div><br>
    </div>
 
         
</body>
<footer style="width: 1550px;">
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

                                                  
                                   
                                  
                               
