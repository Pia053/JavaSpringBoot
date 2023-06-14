<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<section>
    <div class="container">
        <div class="card-detail">
            <div class="card-body">

                <h3 class="card-title text-center fw-bold">${chiTietSanPham.tenSanPham}</h3>
                <h6 class="card-subtitle text-center">globe type chair for rest</h6>
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-6">
                        <div class="white-box text-center">
                            <img
                                    src="http://localhost:8080/images/${chiTietSanPham.anhSanPham}"
                                    class="img-responsive"
                                    style="width:400px; height:500px"
                            />
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-6">
                        <h4 class="box-title mt-5">Mô Tả Sản Phẩm</h4>
                        <p>
                            ${chiTietSanPham.moTa}
                        </p>
                        <h2 class="mt-5">
                            <h4 class="box-title mt-5">Giá Sản Phẩm</h4>
                            <h3>
                                <fmt:formatNumber value="${chiTietSanPham.giaBan}" type="currency" currencyCode="VND"/>
                            </h3>
                        </h2>
                        <h6 class="mt-5">
                            <c:choose>
                                <c:when test="${chiTietSanPham.soLuongTon > 0}">
                                    <p>Số lượng: ${chiTietSanPham.soLuongTon}</p>
                                    <p>Trạng thái: còn hàng</p>
                                </c:when>
                                <c:otherwise>
                                    <p>Số lượng: ${chiTietSanPham.soLuongTon}</p>
                                    <p>Trạng thái: <span style="color: red">Hết hàng</span></p>
                                </c:otherwise>
                            </c:choose>
                        </h6>
                        <a
                                href="/user/add-to-cart/${chiTietSanPham.id}"
                                class="btn btn-primary rounded-3 custom-btn"
                        >
                            <i class="fa fa-shopping-cart"></i>
                        </a>

                        <a
                                href="/user/mua-hang/${chiTietSanPham.id}"
                                class="btn btn-primary rounded-3 custom-btn"
                        >Mua Ngay
                        </a>

                        <h3 class="box-title mt-5">Điểm nổi bật chính</h3>
                        <!-- thuộc tính -->
                        <ul class="list-unstyled">
                            <li><i class="fa fa-check text-success"></i>Sturdy structure</li>
                            <li>
                                <i class="fa fa-check text-success"></i>Designed to foster easy
                                portability
                            </li>
                            <li>
                                <i class="fa fa-check text-success"></i>Perfect furniture to
                                flaunt your wonderful collectibles
                            </li>
                        </ul>
                        <!-- hết thuộc tính -->
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <h3 class="box-title mt-5">Thông Tin chung</h3>
                        <div class="table-responsive">
                            <table class="table table-striped table-product">
                                <tbody>
                                <tr>
                                    <td width="390">Thương hiệu</td>
                                    <td>${chiTietSanPham.nhaSanXuat.tenNhaSanXuat}</td>
                                </tr>
                                <tr>
                                    <td>Thuộc Tính</td>
                                    <td>${chiTietSanPham.dongSanPham.tenDongSanPham}</td>
                                </tr>
                                <tr>
                                    <td>Màu Sắc</td>
                                    <td>${chiTietSanPham.mauSac.mau}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="pt-5">
                    <h6 class="mb-0">
                        <a href="/khach-hang/trang-chu" class="text-body"
                        ><i class="fas fa-long-arrow-alt-left me-2"></i>Trang chủ</a>
                    </h6>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- content end -->
<!-- footer web -->
<jsp:include page="../footer-customer.jsp"></jsp:include>
<!-- footer end -->
<script src="../js/cart.js"></script>
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
</body>
</html>