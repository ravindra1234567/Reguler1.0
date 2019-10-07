<%-- 
    Document   : index
    Created on : 14 Jul, 2019, 12:55:18 AM
    Author     : Ravindra
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exam Registration Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="input/logo.png">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
         <meta charset="utf-8">
 <jsp:include page="bootstrap_file.jsp" /> 
        <script type="text/javascript">

            function Redirect()
            {
                  
                //var status = document.getElementById("status").value;
                var a = demo1.status.value;
//                alert(a);
                if ( a === "Regular" ){
                    
                    document.getElementById("f1").action = "student_registration.jsp";
			
        }else{
                    document.getElementById("f1").action = "ex_student.jsp";
			
		}
                
                
                
                    //document.getElementById("f1").action = "student.jsp";

            }
            
            
            
       
 

        </script>
        <link rel="stylesheet" type="text/css" href="css/index.css" >
        <style>
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
            small{
                font-size:16px;
            }
            .container{
                margin-bottom: 20px;
                margin-top: 40px;
                max-width: 600px;
            }
            .container form{
                padding-bottom: 20px;
            }
        </style>
    </head>
    
    <body>
        <jsp:include page="header.html" />
     <div class="container">
        <div class="font-weight-bold col-lg-12  shadow-lg sign-up" >
			<form class="sign-up" id="f1" name="demo1">
				<div class="row">
					<div class="col-lg-12 p-3 h2 font-weight-light bg-success text-light text-center">
						Examination Registration Portal
						<!--<button type="button" class="close text-white" onclick="$('div.sign-up').hide();$('div.video-ad').show();">&times;</button>-->
					</div>
                                </div>
					<div class="ml-2 mr-2 row">
						<div class="col-lg-6 p-1">
							<label for="student-name"><small>Enter Enrollment Number<sup class="text-danger">*</sup></small></label>
							<input type="text" id="student-name" class="form-control" placeholder="Enter Enrollment Number" required autofocus name="enrollmentno"  autocomplete="off">
						</div>
						<div class="col-lg-6 p-1">
							<label for="student-mobile"><small>Status<sup class="text-danger">*</sup></small></label>
							<div class="input-group">
<!--								<div class="input-group-prepend">
									<div class="input-group-text">+91</div>
								</div>-->
								<select   id="status" name="status" required="" class="form-control">
                                                                        <option value="" selected disabled >Select Status</option>
                                                                        <option value="Regular">Regular</option>
                                                                        <option value="Ex">Ex</option>
                                                                </select>
							</div>
							<small class="text-danger font-italic mobile-warning" style="display: none;">Incorrect Mobile Number</small>
                                                </div>
					<div class="col-lg-4 p-1">
						<label for="student-class"><small>Select Course<sup class="text-danger">*</sup></small></label>
						<select id="student-class" name="course" class="form-control">
							 <option value="" selected disabled >Select Course</option>
                                                         <option value="BF">BE(FT)</option>
                                                         <option value="BP">BE(PT)</option>
                                                        <option value="MF">ME(FT)</option>
                                                        <option value="MP">ME(PT)</option>
                                                        <option value="MSF">MSC(FT)</option>
                                                        <option value="MSP">MSC(PT)</option>
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
                                                         <option value="Design And Thermal">Design And Thermal</option>
                                                         <option value="Digital Communication">Digital Communication</option>
                                                         <option value="Industrial Engineering And Management">Industrial Engineering And Management</option>
                                                         <option value="Digital Instrumentation">Digital Instrumentation</option>
                                                </select>
						<select  name="branch" class="branch_BE branch form-control" style="display:none">
                                                    <option value="" selected disabled>Select Branch</option>
                                                    <option value="Computer Engineering">Computer Engineering</option>
                                                    <option value="Electronics & Telecommunication Engineering">Electronics & Telecommunication Engineering</option>
                                                    <option value="Information Technology">Information Technology</option>
                                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                                    <option value="Civil Engineering">Civil Engineering</option>
                                                    <option value="Electronics & Instrumentation Engineering">Electronics & Instrumentation Engineering</option>
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
				<div class="col-lg-12">
					<label class="checkbox-inline small">
						<input class="test-result-date" type="checkbox" required>
						I accept the terms and conditions.
					</label>
				</div>
				<div class="col-lg-12 pl-4 pr-4 mt-2 mb-2" align="center">
                                     
					<button type="submit" class="btn btn-success btn-block sign-up" onclick="Redirect();" >GO &nbsp; <i class='fas fas fa-arrow-right '></i></button>
                                       
                                        </div>
                            	</form>

			</div>
	</div>
     <jsp:include page="footer.html" />
        <script>
            
                 $("select#student-class").change(function () {
                     var str =  $(this).find("option:selected").val();
                    if( (str=="MF") || (str=="MP") ){
                        $(".branch").hide();
                        $(".branch_ME").show();
                         
                    }
                    if( (str=="BF") || (str=="BP") ){
                         $(".branch").hide();
                         $(".branch_BE").show();
                         
                    }
                    if( (str=="MSF") || (str=="MSP") ){
                         $(".branch").hide();
                         $(".branch_MS").show();
                         
                    }
		});
        </script>
</body>

</html>
