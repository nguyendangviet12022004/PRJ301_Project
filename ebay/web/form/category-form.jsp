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
        <div>
            <a href="/ebay/home.jsp"><img src="/ebay/assets/image/logo.png"></a>
        </div>
        <form action="category" method= "post" class="d-flex flex-column g-2 w-100" enctype="multipart/form-data" >
            <input type="text" name="action" value="${param.action}" hidden>
            <input type="text" name="id" value="${requestScope.category.id}" hidden>
            <div class="form-floating my-1">
                <input type="text" name="name" required class="form-control" placeholder="" value="${requestScope.category.name}">
                <label for="name">Name</label>
            </div>

            <div class="my-1">
                <input class="form-control" type="file" name="image" > 
            </div>

            <c:if test ="${requestScope.error != null}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.error}
                </div>
            </c:if>
            <c:if test ="${requestScope.info != null}">
                <div class="alert alert-success" role="alert">
                    ${requestScope.info}
                </div>
            </c:if>
            <button type="submit" class="btn btn-primary text-uppercase">${param.action}</button>
        </form>
    </body>
</html>
