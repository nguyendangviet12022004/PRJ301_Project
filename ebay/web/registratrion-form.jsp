<%-- 
    Document   : registratrion-form
    Created on : Sep 28, 2024, 2:19:04 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container-fluid" style="display:flex;align-items: center;align-content: center;justify-content: space-between;">
            <div class="row">
                
                <div class="col-md-7 d-flex align-items-center justify-content-start" >
                    <img src="assets/image/logo.png">
                </div>

                <div class="col-md-5 d-flex align-items-center justify-content-end" >
                    <a href="#">Tell us what you think</a>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <img src="assets/image/buyer_dweb_individual.jpg" style="border-radius: 15px; width: 713px;">
                </div>
                <div class="col-md-4 d-flex justify-content-center">
                    <form action="LoginServlet" method="POST">
                        <h1>SIGN IN </h1>
                        <div class="form-group">
                            <input id="login-username" type="text" placeholder="Email or username" required>
                        </div>
                        <div class="form-group">
                            <div class="input-container">
                                <input id="login-password" type="password" placeholder="Password" required>
                                <button aria-label="show password" class="show-password-button">
                                    <span class="icon">👁️</span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Login" name="btAction" />
                        </div>
                        <div class="form-group">
                            <a href="#">Forgot your password?</a>
                            </<form action="action"></form>>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
