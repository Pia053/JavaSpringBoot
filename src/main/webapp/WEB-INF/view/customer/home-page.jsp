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
<section id="cover">
    <div class="container mt-2">
        <div class="row g-2 justify-content-around">
            <div
                    class="col-md-6 d-flex justify-content align-items-center order-lg-2"
            >
                <div class="p-3">
                    <img
                            src="http://localhost:8080/images/hero.png"
                            alt=""
                            class="mx-auto d-block w-100 img-fluid"
                    />
                </div>
            </div>

            <div
                    class="col-md-6 d-flex justify-content align-items-center order-lg-2"
            >
                <div class="p-3">
                    <h1 class="custom-highlight" style="font-weight: bold">X News</h1>
                    <h1 class="text">Không Ngừng Vươn Xa...</h1>
                    <p>
                        Qua hơn 39 năm hoạt động sản xuất kinh doanh với bao thăng trầm và
                        thách thức, giờ đây, X News đã lớn mạnh và phát triển đi lên cùng
                        đất nước, trở thành một thương hiệu uy tín, tin cậy và quen thuộc
                        với người tiêu dùng và là niềm tự hào của người Việt Nam về một
                        “Thương hiệu Quốc gia” trong lĩnh vực kinh doanh và phân phối Giày
                        sneaker uy tín và chất lượng.
                    </p>
                </div>
            </div>
        </div>
        <!-- main -->
        <div id="service" class="mt-5">
            <div class="row g-2 justify-content-around">
                <div class="col-md-6 d-flex justify-content align-items-center order-1">
                    <div class="col">
                        <div
                                class="card p-3 mb-3 custom-services-card"
                                style="max-width: 540px"
                        >
                            <div class="row g-0">
                                <div class="col-md-4 gy-3">
                                    <img
                                            src="http://localhost:8080/images/image 12.png"
                                            alt=""
                                            class="mx-auto d-block custom-img-width"
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body custom-text">
                                        <h5 class="card-title">Cửa Hàng</h5>
                                        <div class="card-text">
                                            <ul>
                                                <li>Chi Nhánh 1:Ngô Quyền - Vĩnh Yên - Vĩnh Phúc</li>
                                                <li>Chi Nhánh 2: Quan Hoa - Cầu Giấy - Hà Nội</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                                class="card p-3 mb-3 custom-services-card"
                                style="max-width: 540px"
                        >
                            <div class="row g-0">
                                <div class="col-md-4 gy-3">
                                    <img
                                            src="http://localhost:8080/images/image 13.png"
                                            alt=""
                                            class="mx-auto d-block custom-img-width"
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body custom-text">
                                        <h5 class="card-title">Đơn Vị Vẩn Chuyển</h5>
                                        <div class="card-text">
                                            <ul>
                                                <li>Giao Hàng Tiết Kiệm</li>
                                                <li>GIao Hàng Nhanh</li>
                                                <li>Express</li>
                                                <li>Ninja Van</li>
                                                <li>VietNam Post</li>
                                                <li>GIao Hàng Nhanh</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div
                                class="card p-3 mb-3 custom-services-card"
                                style="max-width: 540px"
                        >
                            <div class="row g-0">
                                <div class="col-md-4 gy-3">
                                    <img
                                            src="http://localhost:8080/images/image 14.png"
                                            alt=""
                                            class="mx-auto d-block custom-img-width"
                                    />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body custom-text">
                                        <h5 class="card-title">Tư Vấn Hỗ Trợ</h5>
                                        <div class="card-text">
                                            <ul>
                                                <li>Hỗ trợ viên: Nguyễn Vân Anh <br/>- ĐT: 0982226477</li>
                                                <li>Hỗ trợ viên: Vũ Văn Hướng <br/>- ĐT: 0369112744</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col order-lg-2">
                    <img
                            src="http://localhost:8080/images/section1.png"
                            alt=""
                            class="mx-auto d-block w-100"
                    />
                </div>
            </div>
        </div>
        <!-- Product -->
        <div id="products" class="mt-5">
            <h4 class="card-title text-center">Sản Phẩm Mới</h4>
            <!-- row -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach items="${listsChiTietSP}" var="sp">
                    <div class="col">
                        <!-- card -->
                        <div class="card h-100 shadow custom-card">
                            <!-- ảnh -->
                            <img
                                    alt=""
                                    src="http://localhost:8080/images/${sp.anhSanPham}"
                                    class="card-ing-top w-100 custom-bg"
                            />
                            <!--  -->
                            <div class="card-body">
                                <h4 class="card-title">${sp.tenSanPham}</h4>
                            </div>
                            <div class="card-footer custom-footer">
                                <div class="float-start">
                                    <h4 class="custom-highlight">
                                        <fmt:formatNumber
                                                value="${sp.giaBan}"
                                                type="currency"
                                                currencySymbol="Vnd"/></h4>
                                </div>
                                <div class="float-end">
                                    <!-- Mua Ngay -->
                                    <a
                                            href="/user/add-to-cart/${sp.id}"
                                            class="btn btn-primary rounded-3 custom-btn"
                                    >
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                    <a
                                            href="/user/chi-tiet-san-pham/${sp.id}"
                                            class="btn btn-primary rounded-3 custom-btn"
                                    >
                                        <i class="fa-solid fa-eye"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <%--                page--%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="?curentPage=${currentPage -1}" tabindex="-1"
                                   aria-disabled="true">Previous</a>
                            </li>
                        </c:if>

                        <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                            <c:choose>
                                <c:when test="${pageNumber == currentPage}">
                                    <li class="page-item active" aria-current="page">
                                        <a  class="page-link"
                                           href="?currentPage=${pageNumber}">${pageNumber}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="?currentPage=${pageNumber}">${pageNumber}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${totalPages > currentPage}">
                            <li class="page-item">
                                <a class="page-link" href="?currentPage=${currentPage + 1}">Next</a>
                            </li>
                        </c:if>

                    </ul>
                </nav>


            </div>
        </div>
        <!-- Product -->
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



















