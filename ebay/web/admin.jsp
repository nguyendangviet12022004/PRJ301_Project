<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-fluid d-flex">
                <a href="account">
                    <div>
                        <img src="assets/image/account-logo.png" width="300px" height="300px"  class="rounded-circle"/>
                        <p class="text-center">Account</p>
                    </div>
                </a>
            </div>
            <div class="container-fluid d-flex">
                <a href="product">
                    <div>
                        <img src="assets/image/account-logo.png" width="300px" height="300px"  class="rounded-circle"/>
                        <p class="text-center">Product</p>
                    </div>
                </a>
            </div>
            <div class="container-fluid d-flex">
                <a href="order">
                    <div>
                        <img src="assets/image/account-logo.png" width="300px" height="300px"  class="rounded-circle"/>
                        <p class="text-center">Order</p>
                    </div>
                </a>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
