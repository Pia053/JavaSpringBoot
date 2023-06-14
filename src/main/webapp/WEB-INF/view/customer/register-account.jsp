<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
<body>
<jsp:include page="../header-customer.jsp"></jsp:include>
<style>
    <%@include file="../css/profile.css"%>
    <%@include file="../css/rigister.css"%>
    <%@include file="../css/style.css"%>
    <%@include file="../css/form-login.css"%>
    <%@include file="../css/detail.css"%>
    <%@include file="../css/home-page.css"%>
    <%@include file="../css/product.css"%>
</style>

<section class="register">
    <div class="container">
        <div class="row justify-content-around">
            <div class="col-md-6 bg-light p-3 my-3 shadow">
                <img
                        src="http://localhost:8080/images/logo-chu-X-x_logo_2x-2-removebg.png"
                        alt=""
                        srcset=""
                        width="200"
                        height="100"
                        class="rounded mx-auto d-block"
                />
                <h1 class="text-center text-uppercase py-3" style="  font-size: 2rem;
                                                    font-weight: 700;">Đăng Kí Tài Khoản</h1>
                <form method="post" action="/register/new-account">
                    <!-- Họ Và Tên -->
                    <div class="form-group">
                        <label for="fullname">Họ Và Tên</label>
                        <input
                                type="text"
                                class="form-control mt-2 mb-3"
                                id="fullname"
                                name="hoTen"
                                value="${acc.hoTen}"
                        />
                    </div>
                    <span style="color: red">${ERR.get("ERR_HOTEN")}</span>
                    <!--Email -->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input
                                type="email"
                                class="form-control mt-2 mb-3"
                                id="email"
                                name="email"
                                value="${acc.email}"
                        />
                    </div>
                    <span style="color: red">${ERR.get("ERR_EMAIL")}</span>

                    <!--Tên đăng Nhập -->
                    <div class="form-group">
                        <label for="username">Tên Đăng Nhập</label>
                        <input
                                type="text"
                                class="form-control mt-2 mb-3"
                                id="username"
                                name="tenDangNhap"
                                value="${acc.tenDangNhap}"
                        />
                    </div>
                    <span style="color: red">${ERR.get("ERR_TENDANGNHAPTRUNG")}</span>
                    <span style="color: red">${ERR.get("ERR_TENDANGNHAP")}</span>

                    <!--Mật Khẩu -->
                    <div class="form-group">
                        <label for="password">Mật Khẩu</label>
                        <input
                                type="password"
                                class="form-control mt-2 mb-3"
                                id="password"
                                name="matKhau"
                                value="${acc.matKhau}"
                        />
                    </div>
                    <span style="color: red">${ERR.get("ERR_MATKHAU")}</span>

                    <label class="mt-2">
                        <a href="" style="text-decoration: none">Quên mật khẩu?</a>
                    </label>
                    <label class="mt-2">
                        <a href="/register" style="text-decoration: none">Đăng kí tài khoản?</a>
                    </label>

                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button class="btn btn-success" type="submit">Đăng Kí</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

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