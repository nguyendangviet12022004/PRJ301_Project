<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>

    <body>

        <form action="cart" method="post" class="container-fluid">
            <img src="${requestScope.product.image}" width="300px"/>
            <input name="id" value = "${requestScope.product.id}" hidden>
            <input name="action" value="create" hidden>
            <div class="form-group my-3">
                <label for= "name">Product</label>
                <input name = "name" value = "${requestScope.product.name}" class="form-control" readonly>
            </div>
            <div class="form-group my-3">
                <label for= "price" class="form-label">Price</label>
                <input name = "price" value = "${requestScope.product.price}" class="form-control"  readonly>
            </div>
            <div class="form-group my-3">
                <label for= "quantity">Quantity</label>
                <input type = "number" name = "quantity" min="1" max="${requestScope.product.stock}" class="form-control" required="" >
            </div>

            <button class="btn btn-primary">${requestScope.btn}</button>
        </form>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
</html>
