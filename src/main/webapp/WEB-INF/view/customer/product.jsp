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
        <div class="row">
            <div class="col-sm-3">
                <div class="card bg-light mb-3 mt-5">
                    <div class="card-header bg-primary">
                        <i class="fa fa-list"><span>Thương Hiệu</span></i>
                    </div>
                    <ul class="list-group category_block">
                        <li class="list-group-item text-while"><a href="/khach-hang/san-pham">Tất Cả</a></li>
                        <c:forEach items="${listsNSX}" var="nhaSanXuat">
                            <li class="list-group-item text-while" class="${tag==nhaSanXuat.id?"active":""}">
                                <a
                                    href="/khach-hang/hang-giay?id=${nhaSanXuat.id}">${nhaSanXuat.ten}>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="card mb-3" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's content.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">An item</li>
                        <li class="list-group-item">A second item</li>
                        <li class="list-group-item">A third item</li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="card-link">Card link</a>
                        <a href="#" class="card-link">Another link</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-9">

                <h3
                        class="highlight header-colorize text-uppercase mb-3 mt-2 fw-bold text-center"
                >
                    Sản Phẩm
                </h3>
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
                                                    currencySymbol="Vnd"/>
                                        </h4>
                                        <h5>
                                            Số lượng: ${sp.soLuongTon}
                                        </h5>
                                    </div>
                                </div>
                                <div class="d-grid gap-2 d-md-block">
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
                    </c:forEach>
                </div>
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

