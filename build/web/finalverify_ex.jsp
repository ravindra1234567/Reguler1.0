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
    Statement stmt=null;
    String key[];
    String sub_types[];
    
%>
<% 
   ServletContext context=getServletContext();
   key= request.getParameterValues("id");
    try{
                        Class.forName(context.getInitParameter("Driver"));
                        con=DriverManager.getConnection(context.getInitParameter("Url"),context.getInitParameter("UserName"),context.getInitParameter("Password"));
                   
                          if(key != null)
                          {
                           for(int i=0;i<key.length ; i++)
                           {            
                          
                       PreparedStatement ps1 =con.prepareStatement("update ex_student set payment_status='Paid' where enrollment_no=? and reg='Y' and subject_code=? and subject_type=?" );
                   
                       eno=key[i].substring(0,7);
                        String subcode=key[i].substring(7,13);
                        String subtype=key[i].substring(13,14);
                        //out.println(subcode);
                         //out.println(subtype);
                        
                      // String sub_code=name.substring(0,6);
                       ps1.setString(1,eno);
                       ps1.setString(2,subcode);
                       ps1.setString(3,subtype);
                          //out.println(sub_types[i]);
                       int j=0;
                       j=ps1.executeUpdate();
                      //     out.println(j);
                              if(j>0)
                                 {
                                  // out.println("Verified!!")   ; 
                                  
                                 }
                                else
                              {
                                 // out.println("Not Verified !!");
  
                              } 
                           }         
                                // }
                       }     
                           
                                 %>
                                 
                          
                            <%
                            // }
                              
			%>
                        
                        
                        
      

<!DOCTYPE html>

	<title>Verify</title>
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
           <script>
           function goBack() {
  window.history.back();
}
</script>
<jsp:include page="bootstrap_file.jsp" />
</head>
<body>
    <header>
<a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
<h2>Institute Of Engineering &amp; Technology</h2>
</header>
	
    <center> <div align="left" style="margin-left:5%"> 
            <button onclick="goBack()" style="margin-top: 10px;" class="btn btn-primary"/><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button>
            </div>
              
         
		<div id="d1">
                 <a><img id="iconver" src="tick.jpg" style="height:30%"></a>
    </center>
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
      <script>

var checker = document.getElementById('check1');

 var sendbtn = document.getElementById('pay');
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
 
<!--</form>    -->     
</body>
</html>

  <%
 //}
 
                 //else
               // {
                %>
               
                
                <%
               // } 
        //}
}

        catch(Exception e)
        {
          
          e.printStackTrace();
          out.println(e);        }
               %>
