<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-7 d-flex align-items-center justify-content-start">
                    <a href="home.jsp"><img src="assets/image/logo.png"></a>
                </div>

                <div class="col-md-5 d-flex justify-content-end">
                    <p>Already have an account? <a href="sign-in-form.jsp">Sign in</a></p>
                    
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <img src="assets/image/buyer_dweb_individual.jpg" style="border-radius: 15px; width: 713px;">
                </div>

                <div class="col-md-4 d-flex justify-content-start">
                    <form action="account" method="POST" class="form text-center">

                        <input type="hidden" name="action" value="create">
                        <h1>Create an account</h1>
                        <div class="form-floating my-3">
                            <input name="userName" type="text" class="form-control" placeholder="" required>
                            <label for="userName">User Name</label>
                        </div>
                        <div class="form-floating my-3 ">
                            <input name="password" type="password" class="form-control" placeholder="" required>
                            <label for="password">Password</label>
                        </div>
                        <c:if test ="${requestScope.error != null}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.error}
                            </div>
                        </c:if>
                        <button type="submit" class="btn btn-primary">Create</button> 
                        
                        
                        
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
