<%-- 
    Document   : imageupload_session
    Created on : 23 Aug, 2019, 6:57:25 PM
    Author     : Ravindra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="fileupload_session.jsp" method="post" enctype="multipart/form-data">
            <table style="border:solid #000000 1px" >
                <tr style="border:solid #000000 2px">
                    <th>Session</th>
                     <td><select name="session"  required>
                             <option value="" selected disabled >Select Session</option>
                             <option value="July-Dec-2019">July-Dec-2019</option>
                             <option value="Jan-may-2020">Jan-may-2020</option>
                         </select></td><br></tr>
                <tr>
            <th><span>Application Id</span></th>
            <td><input type="text" name="application_id" required /></td>
                </tr><br/>
               <tr>
            <th>Choose file</th> 
             <td><input type="file" name="image" required /></td>
               </tr><br/>
               <tr>
                   <td></td><td><input type="submit" name="submit" /></td>
            </tr>
            </table>
        </form>
        
         <div >

                    <table width="300" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" >
                        <tr>
                            <form name="f1" method="post" action="index.php">
                                <td>
                                    <table width="400" height="200" border="4" cellpadding="5" cellspacing="5" bgcolor="#FFFFFF">
                                        <tr>
                                            <td colspan="3" align="center">
                                                <div style="color:blue;"><b>Login </b></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100%">
                                                <div style="font-size:17px;"><center><strong>Session</strong> </center></div>
                                            </td>
                                            <td width="6">:</td>
                                            <td><select name="session"  required>
                             <option value="" selected disabled >Select Session</option>
                             <option value="July-Dec-2019">July-Dec-2019</option>
                             <option value="Jan-may-2020">Jan-may-2020</option>
                         </select></td>
                                        </tr>
                                        <tr>
                                            <td width="78">
                                                <div style="font-size:17px;"><center><strong>Application Id</strong></center></div>
                                            </td>
                                            <td width="6">:</td>
                                            <td width="294"><input type="text" name="application_id" required /></td>
                                        </tr>
                                        <tr>
                                            <td width="78">
                                                <div style="font-size:17px;"><center><strong>Choose file</strong></center></div>
                                            </td>
                                            <td width="6">:</td>
                                            <td width="294"><input type="file" name="image" required /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <center>
                                                    <input type="submit"  name="submit" value="Submit"> 
                                                    &nbsp;&nbsp;&nbsp;

                                                </center>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </form>
                        </tr>
                    </table>

                </div>

        
    </body>
</html>
