<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
        <c:choose>
            <c:when test="${empty sessionScope.cart or sessionScope.cart.cartMap.size() == 0}">
                <div class="alert alert-danger" role="alert">No Product Added</div>
            </c:when>
            <c:otherwise>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Amount</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="entry" items="${sessionScope.cart.cartMap}">
                            <tr>
                                <td><img src="${entry.key.image}" width="100px"></td>
                                <td>${entry.key.name}</td>
                                <td>${entry.value}</td>
                                <td>${entry.key.price}</td>
                                <td>${entry.key.price * entry.value}</td>
                                <td><a href="../cart?action=delete&id=${entry.key.id}">Delete</a></td>
                                <td><a href="../cart?action=update&id=${entry.key.id}">Update</a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>Total</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>${sessionScope.cart.getTotal()}</td>
                            <td>
                                <form action="/ebay/order" method="post">
                                    <input name="action" value="create" hidden>
                                    <input name="mode" value="cart" hidden>
                                    <button class="btn btn-primary">Order Now</button>
                                </form>
                            </td>
                            <td></td>
                        </tr>

                    </tbody>

                </table>
            </c:otherwise>
        </c:choose>


        <jsp:include page="../common/footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
