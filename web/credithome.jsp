
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html> 
    <head>
        <link rel="icon" href="input/logo.png">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/sol.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="bootstrap_file.jsp" /> 
    
    <script>
        var e = 0;
        var prev = 0;

        var myMap = new Map();

        function cal(i)
        {
            var x = myMap.has(i);
            if (!x)
            {
                myMap.set(i, 0);
                prev = 0;
                //alert("not already set for this rollno");
            }
            else
            {
                //alert("already set for this rollno");
                prev = myMap.get(i);
                //prev=x;
            }
            //alert("hello");
            //var x=document.getElementById("15C30011").value;
            //alert(x);//+100);
            //alert(i);
            //alert("initially prev is:"+prev);
            var x1 = document.getElementById(i).value;
            //alert(x1);

            if (isNaN(x1))
            {
                if (prev <= 0)
                    e++;
                document.getElementById(i).style.color = "red";
                myMap.set(i, 1);

            }
            else
            {
                if (x1 < 0 || x1 > 4)
                {
                    document.getElementById(i).style.color = "red";
                    if (prev <= 0)
                        e++;
                    myMap.set(i, 1);
                    //prev=1;
                }
                else
                {
                    //valid
                    if (prev > 0)
                        e--;
                    myMap.set(i, 0);
                    //prev=0;
                    document.getElementById(i).style.color = "black";
                }
            }
        }
        function check()
        {
            if (e > 0)
            {
               // alert("Please correct the entries marked in red!");
               swal("Please correct the entries marked in red!", "You clicked the button!", "error");
                return false;
            }
            else {
                //alert("Save Successfull!");
             Swal.fire({
                 type:'success',
                 title:"Updated",
                 text:"Subject updated successfully",
                 showConfirmButton: true
                }).then((result)=>{
                      return true; 
                });
             
            }
        }
       
    </script>
    </head>
    <body>
        <jsp:include page="header.html" />
        <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>

        <%
            if (session.getAttribute("uname") == null || session.getAttribute("pass").equals("")){
    response.sendRedirect("admin.jsp");
    }else{
            ServletContext context = getServletContext();
            Class.forName(context.getInitParameter("Driver"));
            Connection con = DriverManager.getConnection(context.getInitParameter("Url"), context.getInitParameter("UserName"), context.getInitParameter("Password"));
             //String qr="select *from class_table";
            //String qr="select year,department_name,section,specialization from class_table,department_table where class_table.department_id=department_table.id and class_table.id=?";
            String qr = "select subject_code,subject_name,theory_credits,practical_credits from subject_table";
            PreparedStatement ps = con.prepareStatement(qr);
             //String qr="select year,department_name,section,specialization,course_code,class_table.id from class_table,department_table,course_table where class_table.department_id=department_table.id and course_table.id=department_table.course_id";

            ArrayList<String> sclist = new ArrayList<String>();
            //PreparedStatement ps=con.prepareStatement(qr);
            ResultSet rs = ps.executeQuery();
            int sno = 0;
        %>
        <div>
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>  
                </div>

            </div>

            
            <div >
                <div class="col-12">
                    <center>
                        <form action="UpdateCredits" onsubmit="return check()" method="post">
                            <div class="container mt-3">
                                <input class="form-control" id="myInput" type="text" placeholder="Search............"> <br>
                                <table class="table table-bordered">
                                    <thead >
                                        <tr>
                                            <th>S.No.</th>
                                            <th>Subject Code</th>
                                            <th>Subject Name</th>
                                            <th>Theory Credits</th>
                                            <th>Practical Credits</th>
                                            <th>Save Credit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody id="myTable">
                                        <% while (rs.next()) {
                                                String s1 = rs.getString(1);
                                                String s2 = rs.getString(2);
                                                String s3 = rs.getString(3);
                                                String s4 = rs.getString(4);
                                                sclist.add(s1);
                                            //String stat=(String)session.getAttribute(class_id);
%>
                                        <tr>
                                            <td><%=++sno%></td>
                                            <td class="sub_code" sub_code="<%=s1%>"><%=s1%></td>
                                            <td class="sub_name" sub_name="<%=s2%>"><%=s2%></td>
                                            <td><input type="text" value = "<%= s3 %>" id="<%= s1 %>1" name="<%= s1 %>1" onkeyup="cal('<%= s1%>1')" class="form-control"></td>
                                            <td><input type="text" value ="<%=s4%>" id="<%=s1%>2" name="<%=s1%>2" onkeyup="cal('<%=s1%>2')" class="form-control"></td>
                                            <td><button type="submit"class="btn btn-info "><i class="fas fa-lg fa-save"></i></button></td>
                                            <td><button type="button"  class="btn_del btn btn-danger" /><i class="fas fa-trash fa-lg"></i></button></td>
                                        </tr>
                                        <% }
                                            session.setAttribute("subject_code_list", sclist);
            }
                                        %>

                                    </tbody>
                                </table>
                                
                            </div>
                        </form>
                    </center>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
            
         $(document).on('click',".btn_del", function() {
             var value = $(this).parent().parent().children('.sub_code').attr('sub_code');
             console.log(value);
//             window.location.href = "delete_subject.jsp?sub="+value;
             $.ajax({
                 type:'POST',
                 url:"delete_subject.jsp",
                 data:{sub: value},
                 cache:false,
                 success:function(result){
                     Swal.fire({
                         type:'success',
                         title:'Success',
                         text:"Subject Deleted Successfully!!!",
                         showConfirmButton: true
                     }).then((result)=>{
                         location.reload();
                     });
                    
                 }
                 
             });
         });
        </script>
        <jsp:include page="footer.html" />
    </body>
</html>
