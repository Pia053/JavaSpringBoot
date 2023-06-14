<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<section>
    <div class="mt-5">
        <h4 style="font-weight: bold" class="text-center">${titile} Chi Tiết Sản Phẩm</h4>
        <div class="row">
            <div class="col-sm-6 offset-sm-3">
                <form action="/admin/san-pham/add" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">Tên Sản Phẩm</label>
                        <input type="text" class="form-control" name="tenSanPham" value="${sp.tenSanPham}"
                               required="true">
                        <span style="color: red">${ERR.get('ERR_TENSANPHAM')}</span>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số Lượng Tồn</label>
                        <input type="number" min="1" step="1" class="form-control" name="soLuongTon" required
                               value="${sp.soLuongTon}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Giá Nhập</label>
                        <input type="number" min="100000" step="50" class="form-control" name="giaNhap" required
                               value="${sp.giaNhap}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Giá Bán</label>
                        <input type="number" min="100000" step="50" class="form-control" name="giaBan" required
                               value="${sp.giaBan}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Nhà Sản Xuất</label>
                        <select name="nhaSanXuat" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listNSX}" var="nsx">
                                <option ${sp.nhaSanXuat.id == nsx.id? "selected":""}
                                        value="${nsx.id}">${nsx.tenNhaSanXuat}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Màu Sắc</label>
                        <select name="mauSac" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listMauSac}" var="ms">
                                <option ${sp.mauSac.id == ms.id?"selected":""} value="${ms.id}">${ms.mau}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Dòng Sản Phẩm</label>
                        <select name="dongSanPham" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listsDongSP}" var="dSP">
                                <option ${sp.dongSanPham.id == dSP.id?"selected":""}
                                        value="${dSP.id}">${dSP.tenDongSanPham}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Size</label>
                        <select name="size" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listsSize}" var="sz">
                                <option ${sp.size.id == sz.id?"selected":""}
                                        value="${sz.id}">${sz.size}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Ảnh Sản Phẩm</label>
                        <input class="form-control" name="anhSanPham" type="file">
                    </div>

                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1">Mô tả</label>
                        <textarea class="form-control" name="moTa" id="exampleFormControlTextarea1" rows="3">
                            ${sp.moTa}
                        </textarea>
                        <span style="color: red">${ERR.get('ERR_MOTA')}</span>
                    </div>
                    <c:if test="${titile=='Thêm Mới'}">
                        <button type="submit" class="btn btn-success"
                                onclick=" return confirm('Bạn có muốn thêm') ? alert('Thêm mới thành công'):alert('Thêm mới không thành công') ">
                            Thêm Mới
                        </button>
                    </c:if>
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