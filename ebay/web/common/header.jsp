<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>eBay Header with Bootstrap</title>
        <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>

    </head>
    <body>

        <header>
            <div class="container">
                <div class="row">
                    <div class="col-12 text-start">
                        <c:choose>
                            <c:when test="${sessionScope.account == null}">
                                <a href="form/sign-in-form.jsp" class="text-decoration-none me-3">Sign in</a>
                                <a href="form/registration-form.jsp" class="text-decoration-none me-3">Register</a>
                            </c:when>
                            <c:otherwise>
                                <a class="text-decoration-none me-3" href="#">Hello ${sessionScope.account.userName}</a>
                                <a class="text-decoration-none me-3" href="account?action=signOut">Sign out</a>
                            </c:otherwise>
                        </c:choose>
                        <a href="#" class="text-decoration-none me-3">Daily Deals</a>
                        <a href="#" class="text-decoration-none me-3">Help & Contact</a>
                        <a href="#" class="text-decoration-none me-3">Cart</a>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-md-2">
                        <img src="assets/image/logo.png" width="200px" height="75px">
                    </div>

                    <div class="col-md-10">
                        <form class="d-flex" action="product" method="get">
                            <input hidden name="action" value="search">
                            <input class="form-control me-2 rounded-pill" name = "searchKey" type="search" placeholder="Search for anything..." aria-label="Search" value="${param.searchKey}">
                            <button class="btn rounded-pill" style="background-color: #007bff; color: white;" type="submit">Search</button>
                        </form>
                    </div>
                </div>

        </header>
    </body>
</html>
