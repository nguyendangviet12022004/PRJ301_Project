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
            <form action="/ebay/account" method="post" class="form">
                <input name="action" value="update" hidden>
                <div class="form-floating my-3">
                    <input name="oldPassword" type="password" class="form-control" placeholder="" required>
                    <label for="oldPassword">Enter the old password</label>
                </div>                        

                <div class="form-floating my-3">
                    <input name="newPassword" type="password" class="form-control" placeholder="" required>
                    <label for="newPassword">Enter the new password</label>
                </div> 

                <div class="form-floating my-3">
                    <input name="rePassword" type="password" class="form-control" placeholder="" required>
                    <label for="rePassword">Re-enter the old password</label>
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


            <button class="btn btn-primary">Change Password</button>
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
