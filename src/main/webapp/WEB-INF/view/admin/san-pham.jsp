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
                            <!-- BEGIN FILTERS -->
                            <div class="col-md-3">
                                <h4 class="grid-title"><i class="fa fa-filter"></i> Filters</h4>
                                <hr/>
                                <!-- BEGIN FILTER BY CATEGORY -->
                                <form action="/admin/san-pham/search" method="get">
                                    <h4>Nhà sản xuất</h4>
                                    <c:forEach items="${listNSX}" var="nsx">
                                        <div class="checkbox">
                                            <label><input type="radio"
                                                          value="${nsx.id}" ${param.nhaSanXuat==nsx.id?"checked":""}
                                                          name="nhaSanXuat"
                                                          class="icheck"/>${nsx.tenNhaSanXuat}</label>
                                        </div>
                                    </c:forEach>

                                    <h4>Dòng sản phẩm</h4>
                                    <c:forEach items="${listsDongSP}" var="dsp">
                                        <div class="checkbox">
                                            <label>
                                                <input name="dongSanPham"
                                                        <c:forEach items="${param.dongSanPham}" var="prSP">
                                                            ${prSP==dsp.id?"checked":""}
                                                        </c:forEach>
                                                       type="checkbox" value="${dsp.id}"
                                                       class="icheck"/>${dsp.tenDongSanPham}
                                            </label>
                                        </div>
                                    </c:forEach>
                                    <!-- END FILTER BY CATEGORY -->
                                    <div class="padding"></div>

                                    <!-- BEGIN FILTER BY DATE -->
                                    <!-- END FILTER BY DATE -->

                                    <div class="padding"></div>
                                    <h4>Giá Bán</h4>
                                    <div class="slider-primary">
                                        <div class="slider slider-horizontal" style="width: 152px">
                                            <div class="slider-track">
                                                <div
                                                        class="slider-selection"
                                                        style="left: 30%; width: 50%"
                                                ></div>
                                                <div class="slider-handle round" style="left: 30%"></div>
                                                <div class="slider-handle round" style="left: 80%"></div>
                                            </div>
                                            <div>
                                                <label>Giá Bán :
                                                    <span id="minPriceValue"></span> <span>vnd</span>
                                                    - <span id="maxPriceValue"></span><span>vnd</span>
                                                </label>
                                                <input type="range" id="priceRange1" name="minPrice" min="0"
                                                       max="10000000" step="10" value="0"/>
                                                <input type="range" id="priceRange2" name="maxPrice" min="0"
                                                       max="10000000" step="10" value="10000000"/>
                                                <button class="btn btn-primary" type="submit">Lọc</button>
                                                <button class="btn btn-primary" type="reset">Reset</button>

                                                <div id="slider-range">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END FILTER BY PRICE -->
                                </form>
                            </div>
                            <!-- END FILTERS -->
                            <!-- BEGIN RESULT -->
                            <div class="col-md-9">
                                <h4><i class="fa fa-file-o"></i> Danh Sách bản ghi</h4>
                                <hr/>
                                <%-- View ADD--%>
                                <div class="mt-4 mb-4">
                                    <p style="color: red">Giao diện thêm mới sản phẩm</p>
                                    <div class="button">
                                        <a class="btn btn-success" href="/admin/san-pham/view-add" role="button">Thêm
                                            Mới</a>
                                    </div>
                                </div>
                                <!-- BEGIN SEARCH INPUT -->
                                <form>
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                class="form-control"
                                                name="tenSanPham"
                                                placeholder="Tìm kiếm theo tên sản phẩm"
                                                value="${param.tenSanPham}"
                                        />
                                        <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                    </div>
                                </form>

                                <!-- END SEARCH INPUT -->
                                <p style="color: red; size: 20px; " class="text-center">${err}</p>

                                <div class="padding"></div>

                                <div class="row">
                                    <!-- BEGIN ORDER RESULT -->
                                    <div class="col-sm-6">
                                        <div class="btn-group">
                                            <button
                                                    type="button"
                                                    class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown"
                                            >
                                                Order by <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Name</a></li>
                                                <li><a href="#">Date</a></li>
                                                <li><a href="#">View</a></li>
                                                <li><a href="#">Rating</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- END ORDER RESULT -->

                                    <div class="col-md-6 text-right">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default active">
                                                <i class="fa fa-list"></i>
                                            </button>
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-th"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- BEGIN TABLE RESULT -->
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Ảnh</th>
                                            <th scope="col">Giá Nhập</th>
                                            <th scope="col">Giá Bán</th>
                                            <th scope="col">Số Lượng</th>
                                            <th scope="col">Màu Sắc</th>
                                            <th scope="col">NSX</th>
                                            <th scope="col">Dòng SP</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listsChiTietSP}" var="sp">
                                            <tr>
                                                <td style="text-overflow: ellipsis">${sp.tenSanPham}</td>
                                                <td>
                                                    <img src="http://localhost:8080/images/${sp.anhSanPham}"
                                                         style="height: 150px; width: 150px">
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${sp.giaNhap}" type="currency"
                                                                      currencyCode="VND"/>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${sp.giaBan}" type="currency"
                                                                      currencyCode="VND"/>
                                                </td>
                                                <td>${sp.soLuongTon}</td>
                                                <td>${sp.mauSac.mau}</td>
                                                <td>${sp.nhaSanXuat.tenNhaSanXuat}</td>
                                                <td>${sp.dongSanPham.tenDongSanPham}</td>
                                                <td>
                                                    <a role="button" href="/admin/san-pham/detail/${sp.id}">
                                                        <i
                                                                class="fa-solid fa-pen-to-square fa-xl"
                                                                style="color: #1f3551;"></i></a>

                                                    <a role="button"
                                                       onclick=" return confirm('Bạn có muốn xóa') ? alert('Xóa thành công'):alert('Xóa không thành công') "
                                                       href="/admin/san-pham/delete/${sp.id}">
                                                        <i class="fa-solid fa-trash fa-xl" style="color: red"></i>
                                                    </a>

                                                    <a
                                                            role="button"
                                                            href="/admin/san-pham/view-update/${sp.id}">
                                                        <i class="fa-solid fa-pen fa-xl"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END TABLE RESULT -->

                                <!-- BEGIN PAGINATION -->
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <%--Privious--%>
                                        <c:if test="${currentPage > 1}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/admin/san-pham/list?currentPage=${currentPage -1}&tenSanPham=${param.tenSanPham}"
                                                   tabindex="-1"
                                                   aria-disabled="true">Previous</a>
                                            </li>
                                        </c:if>

                                        <c:forEach var="pageNumber" end="${totalPages}" begin="1">
                                            <c:choose>
                                                <c:when test="${pageNumber == currentPage}">
                                                    <li class="page-item active" aria-current="page">
                                                        <a class="page-link"
                                                           href="/admin/san-pham/list?currentPage=${pageNumber}&tenSanPham=${param.tenSanPham}">${pageNumber}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li aria-current="page">
                                                        <a class="page-link"
                                                           href="/admin/san-pham/list?currentPage=${pageNumber}&tenSanPham=${param.tenSanPham}">${pageNumber}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <c:if test="${totalPages > currentPage}">
                                            <li class="page-item">
                                                <a class="page-link"
                                                   href="/admin/san-pham/list?currentPage=${currentPage + 1}&tenSanPham=${param.tenSanPham}">Next</a>
                                            </li>
                                        </c:if>

                                    </ul>
                                </nav>
                                <!-- END PAGINATION -->
                            </div>
                            <!-- END RESULT -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END SEARCH RESULT -->
        </div>
    </div>
</section>

<jsp:include page="../footer-customer.jsp"></jsp:include>

<script>
    var minPriceRange = document.getElementById("priceRange1");
    var maxPriceRange = document.getElementById("priceRange2");
    var minPriceValue = document.getElementById("minPriceValue");
    var maxPriceValue = document.getElementById("maxPriceValue");

    // Gán giá trị từ biến param.minPrice và param.maxPrice cho thuộc tính value của các thanh trượt

    minPriceRange.value = "${param.minPrice}";
    maxPriceRange.value = "${param.maxPrice}";

    // Hiển thị giá trị ban đầu của thanh trượt
    minPriceValue.textContent = minPriceRange.value;
    maxPriceValue.textContent = maxPriceRange.value;

    // Cập nhật giá trị khi thanh trượt được di chuyển
    minPriceRange.addEventListener("input", function () {
        minPriceValue.textContent = minPriceRange.value;
    });

    maxPriceRange.addEventListener("input", function () {
        maxPriceValue.textContent = maxPriceRange.value;
    });
</script>
<!-- footer end -->
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"--%>
<%--        crossorigin="anonymous"></script>--%>
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