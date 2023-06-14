<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
            rel="stylesheet"
    />
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
<section>
    <div class="container">
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
                                        <th scope="col">Ảnh Sản Phẩm</th>
                                        <th scope="col">Tên Sản Phẩm</th>
                                        <th scope="col">Số Lượng</th>
                                        <th scope="col">Đơn Giá</th>
                                        <th scope="col">Tổng Tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${hoaDonCT}" var="hDCT" varStatus="index">
                                        <tr>
                                            <td>${index.index +1}</td>
                                            <td>
                                                <img src="http://localhost:8080/images/${hDCT.chiTietSanPham.anhSanPham}"
                                                     style="height: 150px; width: 150px">
                                            </td>
                                            <td>${hDCT.chiTietSanPham.tenSanPham}</td>
                                            <td>${hDCT.soLuong}</td>
                                            <td>
                                                <fmt:formatNumber value="${hDCT.donGia}" type="currency"
                                                                  currencyCode="VND"/>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${hDCT.donGia * hDCT.soLuong}" type="currency"
                                                                  currencyCode="VND"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <h4>Tổng Tiền: <span><fmt:formatNumber value="${sessionScope.totalAmount}"
                                                                       type="currency"
                                                                       currencyCode="VND"/></span></h4>

                            </div>
                            <c:if test="${hoaDon.tinhTrang == 0}">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <a role="button" class="btn btn-success"
                                       href="/profile/don-hang/xac-nhan?id=${hoaDon.id}">
                                        Xác Nhận
                                    </a>
                                    <a role="button" class="btn btn-danger"
                                       href="/profile/don-hang/huy?id=${hoaDon.id}">
                                        Hủy
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <div class="pt-5">
                            <h6 class="mb-0">
                                <a href="/profile" class="text-body"
                                ><i class="fas fa-long-arrow-alt-left me-2"></i>Trang Cá Nhân</a>
                            </h6>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../footer-customer.jsp"></jsp:include>

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