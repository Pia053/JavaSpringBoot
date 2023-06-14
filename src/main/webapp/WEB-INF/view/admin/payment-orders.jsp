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
                        <ul class="nav justify-content-center">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/admin/quan-ly-hoa-don/list">Xác
                                    Thực Đơn Hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/quan-ly-hoa-don/danh-sach-hoa-don">Danh Sách Hóa
                                    Đơn</a>
                            </li>
                        </ul>
                        <div class="row">
                            <h4><i class="fa fa-file-o"></i> Danh Sách Hóa Đớn</h4>
                            <hr/>
                            <%-- View ADD--%>
                            <div class="mt-4 mb-4">
                                <h6 style="color: red">Tài Khoản ADMIN : ${sessionScope.account.tenDangNhap}</h6>
                                <h6>Tìm Kiếm Hóa Đơn:</h6>
                                <form>
                                    <select class="form-select" name="tinhTrang" aria-label="Default select example">
                                        <option value="" selected>Chọn Trạng Thái</option>
                                        <option value="0">Chờ Thanh Toán</option>
                                        <option value="1">Đã Thanh Toán</option>
                                        <option value="2">Đã Hủy</option>
                                    </select>
                                    <button type="submit" class="btn btn-success mt-2">Tìm Kiếm</button>
                                </form>
                            </div>
                            <!-- BEGIN TABLE RESULT -->
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Tên Người Nhận Hàng</th>
                                        <th scope="col">Địa Chỉ</th>
                                        <th scope="col">Số Điện Thoại</th>
                                        <th scope="col">Tên Tài Khoản</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Trạng Thái</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${empty hoaDonList }">
                                            <tr>
                                                <td colspan="8" class="table-active" style="color: red">Danh Sách Hóa
                                                    Đơn Trống
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${hoaDonList}" var="hd" varStatus="index">
                                                <tr>
                                                    <td>${index.index +1}</td>
                                                    <td style="text-overflow: ellipsis">${hd.tenNguoiNhan}</td>
                                                    <td>${hd.diaChi}</td>
                                                    <td>${hd.soDienThoai}</td>
                                                    <td>${hd.accountKhachHang.tenDangNhap}</td>
                                                    <td>${hd.accountKhachHang.email}</td>
                                                    <c:choose>
                                                        <c:when test="${hd.tinhTrang == 0}">
                                                            <td style="color: red">Chờ Thanh Toán</td>
                                                        </c:when>
                                                        <c:when test="${hd.tinhTrang == 1}">
                                                            <td style="color: green">Đã Thanh Toán</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td style="color: red">Đã Hủy</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td>
                                                        <a role="button"
                                                           href="/admin/quan-ly-hoa-don/thong-tin-hoa-don/${hd.id}">
                                                            <i
                                                                    class="fa-solid fa-pen-to-square fa-xl"
                                                                    style="color: #1f3551;">
                                                            </i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            <%--Page--%>
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