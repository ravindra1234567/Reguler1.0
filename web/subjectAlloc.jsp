<%-- 
    Document   : facultyAlloc
    Created on : Dec 25, 2017, 1:19:56 PM
    Author     : Ravindra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html> 
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/sol.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid header">
            <div class="row " >

                <div class="offset-1 col-2">
                    <a href="index.jsp"><img src="input/logo.png" alt="Davv Logo" class="img-fluid logo-image"></a>
                </div>
                <div class="col-8 text-uppercase text-white">
                    <div class="h2 college-name text-capitalize">Institute Of Engineering And Technology</div>
                    <div class="row">
                        <div class="offset-6 col-3 ">Subject Entry System</div>
                    </div>
                </div>
                <h3 style="text-align:right;">
                    <span style="float:right;"><a href="logout">Logout</a></span>
                </h3>
            </div>


        </div>
        <div >
            <!--            <hr>
                        Welcome  as Admin-->
            <%
//            String s=(String)session.getAttribute("valid");
//         if(s==null)
//             response.sendRedirect("panel.jsp");
//         else if(s.equals("0"))
//            {
//                response.sendRedirect("panel.jsp");
//            }
                
                //String class_full_name = request.getParameter("class_full_name");
                
                
               
                
                /*
                session.setAttribute("class_id", class_id);
                session.setAttribute("class_full_name", class_full_name);
                session.setAttribute("course", course);
                */
               // int sem = Integer.parseInt((String) session.getAttribute("sem"));
                 String  branch = request.getParameter("branch");
                 int sem = Integer.parseInt(request.getParameter("sem"));
//                  out.println(year);
                String course = request.getParameter("course");
                String ctype = request.getParameter("ctype");
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
            <hr>
            <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
            <div class="row">
                <div class="col-12 text-capitalize h4 text-info" >
                    <h1 align="center"> Subject Allocation</h1>
                </div>
            </div>
            <div class="row">
                <div class="offset-4 col-4">
                    <!--<h1 align="center">  <a class="btn btn-info" href="schema.jsp?sem=<%=sem%>" >View All Class</a></h1>-->
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-12">
                </div>
            </div>
            <div class="row text-left">
                <div class="offset-2 col-8">
                    <form action="SaveSchema" method="get">
                        <table class="table table-success">
                            <tbody>
                                <tr>
                                    <td>Course</td>
                                    <td><%=course%></td>
                                </tr>
                                <tr>
                                    <td>Semester</td>
                                    <td><%=sem%></td>
                                </tr>
                                <tr>
                                    <td>Branch</td>
                                    <td><%=branch%></td>
                                </tr>
                              
                                    <input type="text" value="<%= branch %>" name = "branch" hidden  />
                                    <input type="text" value="<%= course %>" name = "course" hidden />
                                    <input type="text" value="<%= sem %>" name = "sem" hidden />
                                     <input type="text" value="<%= ctype %>"  name = "ctype" hidden />
                                      


                                <% for (int k = 0; k < 8; k++) {%> 
                                <tr>
                                    <td>Subject Code <%=k + 1%></td>


                                    <td>
                                        <input list='subjectList' name='subcodeList<%=k + 1%>'>
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

                                        <select name='subjectTypeList<%=k + 1%>'>
                                            <option value='0'>T</option>
                                            <option value='1'>P</option>
                                            <option value='2'>T+P</option>
                                        </select>
                                    </td>

                                </tr>
                                <%}%>


                                <tr>
                                    <td colspan="3">
                                        <input type="submit" class="form-control btn btn-success" value="Submit"/>
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
                              try{
                                String qr1 = "select  subject_name,subcode,subtype from schema_table,subject_table where subject_code=subcode and branch='"+branch+"' and sem='"+sem+"' and coursetype='"+ctype+"' and course='"+course+"'";

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
                                        st += "T+P";}
                                    
                            %><tr>
                                <td><%= i++%></td>
                                <td><%= sc%></td>
                                <td><%= sn %></td>
                                <td><%= st%></td>
                                
                                <td class="hidden-print">
                                    <form action="DeleteSubject" method="post">
                                        <input type="hidden" value="<%=sc%>" name="subcode"/>  
                                        <input type="hidden" value="<%=st1%>" name="subtype"/>
                                        <input type="hidden" value="<%=branch%>" name="branch"/>
                                        <input type="hidden" value="<%=ctype%>" name="ctype"/>
                                        <input type="hidden" value="<%=sem%>" name="sem"/>
                                        <input type="hidden" value="<%=course %>" name="course"/>
                                        <input type="submit" class="btn btn-primary" value="Delete"/>
                                    </form>
                                </td>  
                            </tr>
                            <% 
                                }
                              }
                            catch(Exception e)
                                    {out.println(e);}%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
