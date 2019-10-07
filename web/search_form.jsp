                                        <div class="ml-2 mr-2 row">
						<div class="col-lg-6 p-1">
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
						<div class="col-lg-6 p-1">
							<label for="status"><small>Status<sup class="text-danger">*</sup></small></label>
								<select name="status" required class="form-control st1 " >
                                                                        <option value="" selected disabled  >Select Status</option>
                                                                        <option value="Regular" >Regular</option>
                                                                        <option value="Ex" >Ex</option>
                                                                </select>
                                                </div>
					<div class="col-lg-6 p-1">
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
                                        <div class="col-lg-6 p-1">
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
				