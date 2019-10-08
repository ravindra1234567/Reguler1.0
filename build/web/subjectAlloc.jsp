<%-- 
    Document   : subjectAlloc.jsp
    Created on : 8 Oct, 2019, 6:06:17 AM
    Author     : Ravindra
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String sem = request.getParameter("sem");
    String branch = request.getParameter("branch");
    String course = request.getParameter("course");
    String status = request.getParameter("status");
    
                 String str = course;
                course = str.substring(0, 1);
               String coursetype = str.substring(1, 2);

                if (str.equals("MSF")) {
                    course = "MSC";
                    coursetype = "F";
                } else if (str.equals("MSP")) {
                    course = "MSC";
                    coursetype = "P";
                } else {
                    if (course.equals("B")) {
                        course = "BE";
                    } else {
                        course = "ME";
                    }
                }
                out.println("branch ="+branch);
                out.println("<br> sem = "+ sem);
                out.println("<br> course ="+course);
                out.println("<br> coursetype = "+coursetype);
                
                Class.forName(pageContext.getServletContext().getInitParameter("Driver"));
                Connection con = DriverManager.getConnection(pageContext.getServletContext().getInitParameter("Url"), pageContext.getServletContext().getInitParameter("UserName"), pageContext.getServletContext().getInitParameter("Password"));

                ArrayList<String> sdlist = new ArrayList<String>();
                ArrayList<String> stlist = new ArrayList<String>();

                ArrayList<String> subjectList = new ArrayList<String>();
                String qr3 = "select subject_code from subject_table ";
                PreparedStatement ps3 = con.prepareStatement(qr3);
                ResultSet rs3 = ps3.executeQuery();
                while (rs3.next()) {
                    subjectList.add(rs3.getString(1));
                }

                session.setAttribute("subcode_list", subjectList);
    
    
    
%>


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
            <div class="row">
                <div class="col-12 text-capitalize h1 text-info" >
                    <div align="center"> Subject Allocation</div>
                </div>
            </div>
        <div class="row text-left">
                <div class="offset-2 col-8">
                    <form action="saveSchema.jsp" method="get">
                        <table class="table table-success">
                            <tbody>
                                <tr>
                                    <td >Course</td>
                                    <td colspan="2"><%=course%></td>
                                </tr>
                                <tr>
                                    <td>Semester</td>
                                    <td colspan="2"><%=sem%></td>
                                </tr>
                                <tr>
                                    <td>Branch</td>
                                    <td colspan="2"><%=branch%></td>
                                </tr>

                            <input type="text" value="<%= branch%>" name = "branch" hidden  />
                            <input type="text" value="<%= str %>" name = "course" hidden />
                            <input type="text" value="<%= sem%>" name = "sem" hidden />
                            <% for (int k = 0; k < 8; k++) {%> 
                            <tr>
                                <td>Subject Code <%=k + 1%></td>


                                <td>
                                    <input list='subjectList' name='subcodeList<%=k + 1%>'  class="form-control">
                                    <datalist id='subjectList'>
                                        <%int i;
                                            for (i = 0; i < subjectList.size(); i++) {
                                                String mysubcode = subjectList.get(i);
                                        %>
                                        
                                        <option value="<%=mysubcode%>"><%=mysubcode%></option>
                                        <% }%>
                                    </datalist>
                                </td>
                                <td>

                                    <select name='subjectTypeList<%=k + 1%>' class="form-control">
                                        <option value="0">T</option>
                                        <option value='1'>P</option>
                                        <option value='2'>T+P</option>
                                    </select>
                                </td>

                            </tr>
                            <%}%>


                            <tr>
                                <td colspan="3">
                                   <center> <input type="submit" class="form-control btn btn-success" value="Submit" style="width:150px;" align="center"/></center>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </form>
                </div>
            </div>
            <div class="row">
                <div class="offset-2 col-8">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>S.No</th>
                                <th>Subject Code</th>
                                <th>Subject Name</th>
                                <th>Subject Type</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                //String qr1="select subject_name,subject_code,subtype from subject_table,schema_table where subject_code in(select subcode from schema_table where classid="+class_id+") and sem="+sem;
                                //String qr1 = "select distinct(subject_name),subcode,subtype from schema_table,subject_table where subcode=subject_code and classid='"+class_id+"' and sem='"+sem+"'";
                                try {
                                    String qr1 = "select  subject_name,subcode,subtype from schema_table,subject_table where subject_code=subcode and branch='" + branch + "' and sem='" + sem + "' and coursetype='" + coursetype + "' and course='" + course + "'";

                                    PreparedStatement ps1 = con.prepareStatement(qr1);

                                    ResultSet rs1 = ps1.executeQuery();
                                    int i = 1;
                                    while (rs1.next()) {
                                        String sn = rs1.getString("subject_name");
                                        //out.println(sn);
                                        String sc = rs1.getString("subcode");
                                        //out.println(sc);
//                                    String sc = rs1.getString("subject_code");
                                        String st1 = rs1.getString("subtype");
                                        //out.println(st1);
                                        String st = "";
                                        if (st1.equals("0")) {
                                            st += "T";
                                        } else if (st1.equals("1")) {
                                            st += "P";
                                        } else {
                                            st += "T+P";
                                        }

                            %><tr>
                                <td><%= i++%></td>
                                <td><%= sc%></td>
                                <td><%= sn%></td>
                                <td><%= st%></td>

                                <td class="hidden-print">
                                    <form action="DeleteSubject" method="post">
                                        <input type="hidden" value="<%=sc%>" name="subcode"/>  
                                        <input type="hidden" value="<%=st1%>" name="subtype"/>
                                        <input type="hidden" value="<%=branch%>" name="branch"/>
                                        
                                        <input type="hidden" value="<%=sem%>" name="sem"/>
                                        <input type="hidden" value="<%= str %>" name="course"/>
                                        
                                        <input type="submit" class="btn btn-primary" value="Delete"/>
                                    </form>
                                </td>  
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                }%>

                        </tbody>
                    </table>
                </div>
            </div>                
    </body>
</html>
