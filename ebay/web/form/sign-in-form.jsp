<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In Page</title>
        <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>       
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-7 d-flex align-items-center justify-content-start">
                    <a href="home.jsp"><img src="../assets/image/logo.png"></a>
                </div>

                <div class="col-md-5 d-flex justify-content-end">
                    <a href="#" style="color: blue; text-decoration: none">Tell us what you think</a>
                </div>


                <div class="d-flex justify-content-center">
                    <form action="account" method="POST" class="form text-center">

                        <h3 class="d-flex justify-content-center">Sign in to your account</h3>

                        <div class="d-flex justify-content-center">
                            <p class="mb-0" style="color: black">New to eBay?</p>
                            <a href="registration-form.jsp">Create Account</a>
                        </div>

                        <input type="hidden" name="action" value="login">
                        <div class="form-floating my-3">
                            <input name="userName" type="text" class="form-control" placeholder="" required>
                            <label for="userName">User Name</label>
                        </div>
                        <div class="form-floating my-3">
                            <input name="password" type="password" class="form-control" placeholder="" required>
                            <label for="password">Password</label>
                        </div>                        
                        
                        <c:if test ="${requestScope.error != null}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.error}
                            </div>
                        </c:if>

                        <button type="submit" class="btn btn-primary">Login</button> 

                    </form>

                </div>
            </div>

        </div>

    </body>
</html>