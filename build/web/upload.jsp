<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html >

<html>
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="popup.css">
        <link rel="icon" href="input/logo.png">
        <jsp:include page="bootstrap_file.jsp" /> 
        <style>
            form{
                /*                background-image: url("image/logo.png");
                                background-repeat: no-repeat;*/
                width: 50%;
                
            }
            

        </style>

        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/button.css">
    </head>
    <header>
        <a href="index.jsp"><img id="logo" src="input/logo.png" alt="Institute of Engineering &amp; Technology"></a>
        <h2>Institute Of Engineering &amp; Technology</h2>
        <div class="menu">
            <a href="index.jsp">Home</a>
        </div>
    </header>
    <div>
        <body>
           
            
                 <%!
            String subject_codes[];
            String query1;
            String eno;
            String status;
            String query2;
            String rollno;
            String tid;
        %>
        <%
            eno=request.getParameter("enrollmentno");
//            tid = request.getParameter("tid");
//            out.println("ravindra"+tid);
////            out.println(roll_no);
//            HttpSession session1 = request.getSession();
//            eno = (String) session1.getAttribute("e");
//            status = (String) session1.getAttribute("s");
//            ServletContext context = getServletContext();
            %>
            <div class="container mx-auto">
                        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
                <center>
                    
                            <form name="f1" method="post" action="submit.jsp?enrollmentno=<%= eno %>" enctype="multipart/form-data" >
                                
                                    <table class="table table-bordered" >
                                        <tr>
                                            <td colspan="3" align="center">
                                                <div style="color:blue;"><b>Upload Slip </b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                <div style="font-size:17px;"><strong>Session</strong></div>
                                            </td>
                                            <td >:</td>
                                            <td><select name="session" class="form-control" required>
                                                    <option value="" selected disabled >Select Session</option>
                                                    <option value="July-Dec-2019">July-Dec-2019</option>
                                                    <option value="Jan-may-2020">Jan-may-2020</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="font-size:17px;"><strong>Application Id</strong></div>
                                            </td>
                                            <td>:</td>
                                            <td><input type="text" name="application_id"class="form-control" placeholder="Enter Application Id"  required /></td>
                                        </tr>
                                        <tr>
                                            <td width="78">
                                                <div style="font-size:17px;"><strong>Choose file</strong></div>
                                            </td>
                                            <td>:</td>
                                            <td><input type="file" class="form-control" name="image"  required /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <center>
                                                    <input type="submit"  name="submit" value="Submit" class="btn btn-success"> 
                                                    &nbsp;&nbsp;&nbsp;

                                                </center>
                                            </td>
                                        </tr>
                                    </table>
                                
                           </form></center>
                    </div>
            </div>               
        </body>
        <footer style="position: relative;top:10px;">
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