<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>eBay Header with Bootstrap</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    </head>
    <body>

        <header>
            <div class="container">
                <div class="row">
                    <div class="col-12 text-start">
                        <c:choose>
                            <c:when test="${sessionScope.account == null}">
                                <a href="/ebay/form/sign-in-form.jsp" class="text-decoration-none me-3">Sign in</a>
                                <a href="/ebay/form/registration-form.jsp" class="text-decoration-none me-3">Register</a>
                            </c:when>
                            <c:otherwise>
                                <a class="text-decoration-none me-3" href="#">Hello ${sessionScope.account.userName}</a>
                                <a class="text-decoration-none me-3" href="/ebay/account?action=signOut">Sign out</a>
                                <a class="text-decoration-none me-3" href="/ebay/form/change-password-form.jsp">Change password</a>
                                
                                <c:if test="${sessionScope.account != null && sessionScope.account.role eq 'USER'}">
                                    <a href="/ebay/list/item-list.jsp" class="text-decoration-none me-3">Cart</a>
                                </c:if>
                                <a href="/ebay/list/order-list.jsp" class="text-decoration-none me-3">Order </a>
                                <c:if test="${sessionScope.account != null && sessionScope.account.role eq 'ADMIN'}">
                                    <a  href="/ebay/list/account-list.jsp" class="text-decoration-none me-3" >Account Manager</a>
                                </c:if>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-md-2">
                        <a href="/ebay/home.jsp"><img src="/ebay/assets/image/logo.png" width="200px" height="75px"></a>

                    </div>

                    <div class="col-md-10">
                        <form class="d-flex" action="/ebay/product" method="get">
                            <input hidden name="action" value="search">
                            <input class="form-control me-2 rounded-pill" name = "searchKey" type="search" placeholder="Search product..." aria-label="Search" value="${param.searchKey}">
                            <button class="btn rounded-pill" style="background-color: #007bff; color: white;" type="submit">Search</button>
                        </form>
                    </div>
                </div>

        </header>
    </body>
</html>
