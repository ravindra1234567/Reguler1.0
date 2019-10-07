<%-- 
    Document   : add_subject_reg
    Created on : 4 Oct, 2019, 10:51:08 PM
    Author     : Ravindra
--%>

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
        <div class="container mt-5">

            <div class="input_fields_wrap">
                <!--<button class="add_field_button">Add More Fields</button><br>-->


                <form action="subject_add_table_reg.jsp">
                    <div class="row">

                        <div class="col-3"><label>Subject Code<sup class="text-danger">*</sup></label><input type="text" name="subjectcode" class="form-control" placeholder="Subject Code" required/></div>
                        <div class="col-3 "><label>Subject Name<sup class="text-danger">*</sup></label><input type="text" name="subjectname" class="form-control" placeholder="Subject Name" required/></div>
                        <div class="col-3"> 
                            <label>Theory Credit<sup class="text-danger">*</sup></label>
                            <select name="theorycredit" class="form-control" required>
                                <option selected disabled>Select Theory Credit</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <div class="col-3">
                            <label>Practical Credit<sup class="text-danger">*</sup></label>
                            <select name="practicalcredit" class="form-control" required>
                                <option selected disabled>Select Practical Credit</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                        <!--<div class="col-1"><button class="add_field_button btn" style="margin-top:30px;"> <i class="fas fa-plus-circle"></i></button></div>-->

                    </div>

                    <div class="row">
                        <div class="col-12 text-center ">
                            <input type="submit" name="submit" class=" btn btn-primary" style="margin-top:30px;" />
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <jsp:include page="footer.html" />

        <script type="text/javascript">
            /*$(document).ready(function () {
             var max_fields = 8; //maximum input boxes allowed
             var wrapper = $(".input_fields_wrap"); //Fields wrapper
             var add_button = $(".add_field_button"); //Add button ID
             
             var x = 1; //initlal text box count
             $(add_button).click(function (e) { //on add input button click
             e.preventDefault();
             if (x < max_fields) { //max input box allowed
             x++; //text box increment
             $(wrapper).append('<br>\
             <div>\n\
             <div class="container">\n\
             <div class="row">\n\
             <div class="col-2"><input type="text" name="subjectcode[]" class="form-control" placeholder="Subject Code"/></div>\
             <div class="col-2"><input type="text" name="subjectname[]" class="form-control" placeholder="Subject Name"/></div>\
             <div class="col-2"><select name="theorycredit[]" class="form-control">\n\\n\
             <option selected disabled >Select Theory Credit</option>\n\
             <option value="0">0</option>\n\\n\
             <option value="1">1</option>\n\\n\
             <option value="2">2</option>\n\\n\
             <option value="3">3</option>\n\\n\
             <option value="4">4</option>\n\
             </select></div>\n\
             <div class="col-2"><select name="practicalcredit[]" class="form-control">\
             <option selected disabled >Select Theory Credit</option>\n\
             <option value="0">0</option>\n\\n\
             <option value="1">1</option>\n\\n\
             <option value="2">2</option>\n\\n\
             <option value="3">3</option>\n\\n\
             <option value="4">4</option>\n\
             </select></div>\n\
             <a href="#" class="remove_field"><i class="fas fa-minus-circle" style="color:black;"></i></a>\n\
             </div></div></div>'); //add input box
             }
             });
             
             $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
             e.preventDefault();
             $(this).parent('div').remove();
             x--;
             })
             });*/
        </script>
    </body>
</html>
