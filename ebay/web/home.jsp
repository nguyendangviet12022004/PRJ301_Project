<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <body>       

        <c:if test="${sessionScope.categories == null}">
            <c:redirect url="category"></c:redirect>
        </c:if>

        <c:if test="${sessionScope.products == null}">
            <c:redirect url="product"></c:redirect>
        </c:if>


        <jsp:include page="common/header.jsp"></jsp:include>
        
        <c:if test ="${requestScope.info != null}">
            <div class="alert alert-success" role="alert">${requestScope.info}</div>
        </c:if>
        
        <jsp:include page="list/category-list.jsp"></jsp:include>
        
        <c:if test= "${sessionScope.account.role eq 'ADMIN'}">
            <form action="/ebay/product" method="get" class="m-3">
                <input type="text" name="action" value="create" hidden>
                <button class="btn btn-success" type="submit">Add Product</button>
            </form>
        </c:if>
         
        <jsp:include page="list/product-list.jsp"></jsp:include>
        <jsp:include page="common/footer.jsp"></jsp:include>
    </body>
</html>
