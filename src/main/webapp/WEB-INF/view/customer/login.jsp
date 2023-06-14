<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 3/26/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en" ng-app="myModule">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--  -->
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <title>XNew</title>
</head>
<style>
    <%@include file="../css/rigister.css"%>
    <%@include file="../css/style.css"%>
    <%@include file="../css/form-login.css"%>
    <%@include file="../css/detail.css"%>
    <%@include file="../css/home-page.css"%>
    <%@include file="../css/product.css"%>
</style>
<body>
<!-- header web -->
<jsp:include page="../header-customer.jsp"></jsp:include>
<!-- header end -->
<!-- content web -->
<section class="login py-5 bg-light">
    <div class="container">
        <div class="row g-0">
            <div class="col-lg-5">
                <img src="http://localhost:8080/images/pic-login.png" class="img-fluid">
            </div>
            <div class="col-lg-7 text-center py-5">
                <c:if test="${not empty sessionScope.ERR_LOGIN}">
                    <div class="alert alert-danger" role="alert">
                            ${sessionScope.ERR_LOGIN}
                    </div>
                    <c:remove var="ERR_LOGIN" scope="session"></c:remove>
                </c:if>
                <h4>X-News </h4>
                <form action="/login" method="post">
                    <div>
                        <div class="form-row py-3 pt-5">
                            <div class="offset-1 col-lg-10">
                                <input
                                        name="tenDangNhap"
                                        type="text"
                                        class="inp px-3"
                                        placeholder="Tài Khoản"
                                        value=""
                                />
                            </div>
                        </div>
                        <!-- Mật KhẩU -->
                        <div class="form-row">
                            <div class="offset-1 col-lg-10">
                                <input
                                        name="matKhau"
                                        type="password"
                                        class="inp px-3"
                                        placeholder="Mật khẩu"
                                        required="true"
                                        value=""
                                />
                            </div>
                        </div>
                        <!-- QUÊN MẬT KHẨU         -->
                        <label class="mt-2">
                            <a href="/forgot-password" style="text-decoration: none">Quên mật khẩu?</a>
                        </label>
                        <label class="mt-2">
                            <a href="/register" style="text-decoration: none">Đăng kí tài khoản?</a>
                        </label>
                        <!-- Đăng Nhập-->
                        <div class="form-row py-3">
                            <div class="d-grid gap-2 col-6 mx-auto">
                                <button
                                        href="#"
                                        class="btn btn-primary"
                                        type="submit"
                                        style="border-radius: 60px"
                                >
                                    Đăng Nhập
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- content end -->
<!-- footer web -->
<jsp:include page="../footer-customer.jsp"></jsp:include>
<!-- footer end -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"
></script>
<!-- Option 2: Separate Popper and Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"
></script>
<script src="../js/cart.js"></script>
</body>
</html>
