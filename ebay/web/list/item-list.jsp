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
        <table class="table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${sessionScope.cart.cartMap}">
                    <tr>
                        <td>${entry.key.name}</td>
                        <td>${entry.value}</td>
                        <td>${entry.key.price}</td>
                        <td>${entry.key.price * entry.value}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>Total</td>
                    <td></td>
                    <td></td>
                    <td>${sessionScope.cart.getTotal()}</td>
                </tr>

            </tbody>

        </table>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
</html>
