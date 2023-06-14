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
<section>
    <div class="container-xl px-4 mt-4">
        <!-- Account page navigation-->
        <%--        <nav class="nav nav-borders">--%>
        <%--            <a class="nav-link active ms-0"--%>
        <%--               href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details"--%>
        <%--               target="__blank">Profile</a>--%>
        <%--            <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page" target="__blank">Billing</a>--%>
        <%--            <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-security-page" target="__blank">Security</a>--%>
        <%--            <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"--%>
        <%--               target="__blank">Notifications</a>--%>
        <%--        </nav>--%>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Thông Tin Tài Khoản</div>
                    <div class="card-body text-center">
                        <!-- Profile picture image-->
                        <img class="img-account-profile rounded-circle mb-2"
                             src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <!-- Form Group (username)-->
                        <form action="/profile/update-account/${acc.id}" method="post">
                            <div class="mb-3">
                                <label class="small mb-1">Họ Tên</label>
                                <input class="form-control" type="text"
                                       name="hoTen"
                                       placeholder="Họ và tên"
                                       value="${acc.hoTen}">
                            </div>
                            <!-- Form Row-->

                            <!-- Form Group (first name)-->
                            <div class="mb-3">
                                <label class="small mb-1">Email</label>
                                <input class="form-control" type="email"
                                       name="email"
                                       placeholder="Địa chỉ email"
                                       value="${acc.email}">
                            </div>

                            <!-- Form Row        -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (organization name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1">Tên Đăng Nhập</label>
                                    <input class="form-control" type="text"
                                           name="tenDangNhap"
                                           placeholder="Tên đăng nhập" value="${acc.tenDangNhap}" disabled>
                                </div>
                                <!-- Form Group (location)-->
                                <div class="col-md-6">
                                    <label class="small mb-1">Mật Khẩu</label>
                                    <input class="form-control" type="password"
                                           placeholder="Mật khẩu" value="${acc.matKhau}" disabled>
                                </div>
                            </div>
                            <%--                            Tài Khoản--%>
                            <label class="mt-2">
                                <a href="/forgot-password" style="text-decoration: none">Quên mật khẩu?</a>
                            </label>
                            <label class="mt-2">
                                <a href="/register" style="text-decoration: none">Đăng kí tài khoản?</a>
                            </label>
                            <%--                            Tài Khoản--%>
                            <button class="btn btn-primary" type="submit">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Đơn Hàng</div>
                    <div class="card-body">
                        <div class="mt-4 mb-4">
                            <h6>Tìm Kiếm:</h6>
                            <form>
                                <select class="form-select" name="tinhTrang" aria-label="Default select example">
                                    <option value="" selected>Chọn Trạng Thái</option>
                                    <option value="0">Chưa Thanh Toán</option>
                                    <option value="1">Đã Thanh Toán</option>
                                    <option value="2">Đã Hủy</option>
                                </select>
                                <button type="submit" class="btn btn-success mt-2">Tìm Kiếm</button>
                            </form>
                        </div>

                        <div class="row">
                            <!-- BEGIN SEARCH RESULT -->
                            <div class="col-md-12">
                                <div class="grid search">
                                    <div class="grid-body">
                                        <div class="row">
                                            <h4><i class="fa fa-file-o">
                                            </i>Thông Tin Đơn Hàng</h4>
                                            <hr/>
                                            <%-- View ADD--%>
                                            <!-- BEGIN TABLE RESULT -->
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">STT</th>
                                                        <th scope="col">Tên Người Nhận</th>
                                                        <th scope="col">Địa Chỉ</th>
                                                        <th scope="col">Số Điện Thoại</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Tài Khoản</th>
                                                        <th scope="col">Trạng Thái</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:choose>
                                                        <c:when test="${empty hoaDon }">
                                                            <tr>
                                                                <td colspan="8" class="table-active" style="color: red">Danh Sách Hóa
                                                                    Đơn Trống
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${hoaDon}" var="hd" varStatus="index">
                                                                <tr>
                                                                    <td>${index.index +1}</td>
                                                                    <td>${hd.tenNguoiNhan}</td>
                                                                    <td>${hd.diaChi}</td>
                                                                    <td>${hd.soDienThoai}</td>
                                                                    <td>${hd.accountKhachHang.email}</td>
                                                                    <td>${hd.accountKhachHang.tenDangNhap}</td>
                                                                    <c:choose>
                                                                        <c:when test="${hd.tinhTrang == 0}">
                                                                            <td style="color: red">Chưa Thanh Toán</td>
                                                                        </c:when>
                                                                        <c:when test="${hd.tinhTrang == 1}">
                                                                            <td style="color: green">Đã Thanh Toán</td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td style="color: red">Đã Hủy</td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <td>
                                                                        <a type="button"
                                                                           href="/profile/don-hang/thong-tin?id=${hd.id}"
                                                                           class="btn btn-success"><i class="fa-regular fa-eye fa-xl"></i></a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>

                                                        </c:otherwise>
                                                    </c:choose>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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