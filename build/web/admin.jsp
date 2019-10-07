
<%@page import = "javax.servlet.http.HttpServlet" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import = "javax.servlet.http.HttpServletResponse" %>
<%@page import= "java.sql.*" %>
<%@page import = "javax.servlet.http.HttpSession" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Exam Registration Portal</title>
        <jsp:include page="bootstrap_file.jsp" />
        <style>
/*            html,
            body {
                height: 100%;
            }
            body {
                display: -ms-flexbox;
                display: -webkit-box;
                display: flex;
                -ms-flex-align: center;
                -ms-flex-pack: center;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }*/
            .form-signin {
                width: 100%;
                max-width: 330px;
                padding: 15px;
                margin: 0 auto;
            }
            
            .form-signin .checkbox {
                font-weight: 400;
            }
            .form-signin .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            .form-signin .form-control:focus {
                z-index: 2;
            }
            /*.form-signin input[type="email"] {
                    margin-bottom: -1px;
                    border-bottom-right-radius: 0;
                    border-bottom-left-radius: 0;
            }
            .form-signin input[type="password"] {
                    margin-bottom: 10px;
                    border-top-left-radius: 0;
                    border-top-right-radius: 0;
            }*/
            .card{
                box-shadow: 10px 10px 20px grey;
                border : 10px 10px 10px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.html" />
        <div class="container pb-3">

            <form class="card form-signin" style="margin-top:60px;" method="post" action="details.jsp">
                <div align="center" >
                    <img class="mb-4" src="input/logo.png" alt="" width="100" height="100" style="margin-top: -65px;">
                </div>

                <h3 class="h4 mb-3 font-weight-normal text-center" style="font-family: serif;">IET-DAVV</h3>
                <label for="inputEmail" class="sr-only">User Name</label>
                <input type="text" id="inputEmail" class="form-control" placeholder="Enter User Name" name="uname" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <br>
                <input type="password" id="inputPassword" class="form-control" name="pass" placeholder="Password" required>
                <br>
                <button name="signin" class="btn btn-lg btn-success btn-block" type="submit">Sign in</button>
                <input type="hidden" value="admin" name="page">
            </form>
        </div>
        <jsp:include page="footer.html" />
    </body>

</html>

