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
         <a href="#"><button class="btn btn-primary" style="margin-left: 10px;" onclick=" window.history.back();"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Go Back</button></a>
         <div class="container mt-5" style="margin-bottom: -50px;">

            <div class="input_fields_wrap">
                <!--<button class="add_field_button">Add More Fields</button><br>-->


                <form action="subject_add_table_ex.jsp">
                    <div class="row">
                        <div class="col-lg-4 p-1">
						<label for="student-class"><small>Select Course<sup class="text-danger">*</sup></small></label>
						<select id="student-class" name="course" class="form-control">
							 <option value="" selected disabled >Select Course</option>
                                                         <option value="BE">BE</option>
                                                        <option value="ME">ME</option>
                                                        <option value="MSC">MSC</option>
                                                       
						</select>
					</div>
                        <div class="col-lg-4 p-1">
						<label><small>Select Branch<sup class="text-danger">*</sup></small></label>
                                                <select   name="branch" class="blank_branch branch form-control">
                                                        <option value="" selected disabled>Select Branch</option>
                                 
                                                </select>
                                                <select  name="branch" class="branch_ME branch form-control" style="display:none">
                                                        <option value="" selected disabled>Select Branch</option>
                                                         <option value="Software Engineering">Software Engineering</option>
                                                         <option value="Information Security">Information Security</option>
                                                         <option value="Design and Thermal">Design and Thermal</option>
                                                         <option value="Digital Communication">Digital Communication</option>
                                                         <option value="Industrial Engineering And Management">Industrial Engineering And Management</option>
                                                         <option value="Digital Instrumentation">Digital Instrumentation</option>
                                                </select>
						<select  name="branch" class="branch_BE branch form-control" style="display:none">
                                                    <option value="" selected disabled>Select Branch</option>
                                                    <option value="Computer Engineering">Computer Engineering</option>
                                                    <option value="Electronics and Telecommunication Engineering">Electronics & Telecommunication Engineering</option>
                                                    <option value="Information Technology">Information Technology</option>
                                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                                    <option value="Civil Engineering">Civil Engineering</option>
                                                    <option value="Electronics and Instrumentation Engineering">Electronics & Instrumentation Engineering</option>
                                                </select>
                                                <select  name="branch" class="branch_MS branch form-control" style="display:none">
                                                    <option value="" selected disabled>Select Branch</option>
                                                    <option value="Applied Mathematics">Applied Mathematics</option>
                                                    
                                                </select>
					</div>
                        <div class="col-lg-4 p-1">
						<label for="student-medium"><small>Select Semester<sup class="text-danger">*</sup></small></label>
						<select id="student-medium" name="sem" class="form-control">
                                                         <option value="" selected disabled>Select Semester</option>
							 <option value="1">1Sem</option>
                                                         <option value="2">2Sem</option>
                                                         <option value="3">3Sem</option>
                                                         <option value="4">4Sem</option>
                                                        <option value="5">5Sem</option>
                                                        <option value="6">6Sem</option>
                                                        <option value="7">7Sem</option> 
                                                        <option value="8">8Sem</option>
						</select>
					</div>
                        </div>
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
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
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
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                               
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
        <script>
            
                 $("select#student-class").change(function () {
                     var str =  $(this).find("option:selected").val();
                    if( (str=="ME") || (str=="MP") ){
                        $(".branch").hide();
                        $(".branch_ME").show();
                         
                    }
                    if( (str=="BE") || (str=="BP") ){
                         $(".branch").hide();
                         $(".branch_BE").show();
                         
                    }
                    if( (str=="MSC") || (str=="MSP") ){
                         $(".branch").hide();
                         $(".branch_MS").show();
                         
                    }
		});
        </script>
    </body>
</html>
