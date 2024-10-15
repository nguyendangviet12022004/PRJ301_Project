
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
        <c:if test="${sessionScope.account == null}">
            <c:redirect url="/form/sign-in-form.jsp"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.orders == null}">
            <c:redirect url="../order"></c:redirect>
        </c:if>

        <jsp:include page="../common/header.jsp"></jsp:include>
        <c:if test="${sessionScope.orders.size() == 0}">
             <div class="alert alert-danger" role="alert">No Order</div>
        </c:if>
            <div class="accordion" id="accordionExample">
            <c:forEach var="order" items="${sessionScope.orders}" varStatus="status">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading${status.index}">
                        <button class="accordion-button d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-expanded="${status.index == 0 ? 'true' : 'false'}" aria-controls="collapse${status.index}">
                            <c:if test="${sessionScope.account.role == 'ADMIN'}">
                                <div  class="rounded-pill bg-danger text-center px-3 text-white">${order.account.userName}</div>
                            </c:if>
                            <div class="bg-light text-center px-3">${order.date}</div>
                            <div class="text-center px-3"></div>
                            <c:choose>
                                <c:when test="${order.status eq 'PENDDING'}">
                                    <div class="btn btn-primary rounded-pill text-white">Pendding</div>
                                </c:when>
                                <c:when test="${order.status eq 'APPROVE'}">
                                    <div class="btn btn-success rounded-pill text-white">Approve</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="btn btn-danger rounded-pill text-white">Reject</div>
                                </c:otherwise>
                            </c:choose>
                        </button>
                    </h2>
                    <div id="collapse${status.index}" class="accordion-collapse collapse"  data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="entry" items="${order.cart.cartMap}">
                                        <tr>
                                            <td><img src="${entry.key.image}" width="100px"></td>
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
                                        <td></td>
                                        <td>${order.cart.getTotal()}</td>
                                    </tr>

                                </tbody>

                            </table>
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                    <c:when test="${sessionScope.account.role eq 'USER' and order.status eq 'PENDDING'}">
                                        <form action="/ebay/order" method="get">
                                            <input name="action" value="delete" hidden>
                                            <input name="id" value="${order.id}" hidden>
                                            <button type="submit" class = "btn btn-danger rounded-pill">Cancel</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${sessionScope.account.role eq 'ADMIN' and order.status eq 'PENDDING'}">
                                        <div class="d-flex gap-3">
                                            <form action="/ebay/order" method="post">
                                                <input name="action" value="update" hidden>
                                                <input name="id" value="${order.id}" hidden>
                                                <input name="status" value="APPROVE" hidden>
                                                <button type="submit" class = "btn btn-success rounded-pill">Approve</button>
                                            </form>
                                            <form action="/ebay/order" method="post">
                                                <input name="action" value="update" hidden>
                                                <input name="id" value="${order.id}" hidden>
                                                <input name="status" value="REJECT" hidden>
                                                <button type="submit" class = "btn btn-danger rounded-pill">Reject</button>
                                            </form>
                                        </div>
                                    </c:when>

                                </c:choose>
                            </div>


                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
