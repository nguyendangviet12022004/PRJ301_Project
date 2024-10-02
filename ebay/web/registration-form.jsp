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
        <link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                
                <div class="col-md-7 d-flex align-items-center justify-content-start">
                    <img src="assets/image/logo.png">
                </div>

                <div class="col-md-5 d-flex align-items-center justify-content-end">
                    <a href="#">Tell us what you think</a>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    <img src="assets/image/buyer_dweb_individual.jpg" style="border-radius: 15px; width: 713px;">
                </div>
                <div class="col-md-6">
                    <form action="LoginServlet" method="POST" class="form text-center">
                        <h1>Create an account</h1>
                        <div class="form-floating my-3">
                            <input name="userName" type="text" class="form-control" placeholder="" required>
                            <label for="userName">User Name</label>
                        </div>
                        <div class="form-floating my-3 ">
                            <input name="password" type="password" class="form-control" placeholder="" required>
                            <label for="password">Password</label>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Sign In</button> 
                        
                        <p class="my-3"><a href="#" target="target">Forget Your Password ?</a></p>
                    </form>
                </div>
            </div>
        </div>
    

</body>
</html>
