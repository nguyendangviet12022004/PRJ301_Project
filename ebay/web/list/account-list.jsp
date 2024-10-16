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

        <c:if test="${sessionScope.accounts == null}">
            <c:redirect url="../account"></c:redirect>
        </c:if>
        <jsp:include page="../common/header.jsp"></jsp:include>

            <table class="table table-hover my-3">
                <thead class="table-active">
                    <tr>
                        <th>UserName</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="account" items="${sessionScope.accounts}">
                    <tr>
                        <td>${account.userName}</td>
                        <td>${account.password}</td>
                        <td>${account.role}</td>
                        <td>
                            <c:if test="${account.role eq 'USER'}">
                                <form action="/ebay/account" method="get">
                                    <input name="action" value="delete" hidden>
                                    <input name="userName" value="${account.userName}" hidden>
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </c:if>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
</html>
