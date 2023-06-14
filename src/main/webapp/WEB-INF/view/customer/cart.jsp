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
<section class="h-100 h-custom" style="background-color: #f1f1f1">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <!-- card -->
                <div
                        class="card card-registration card-registration-2"
                        style="border-radius: 15px"
                >
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div
                                            class="d-flex justify-content-between align-items-center mb-5"
                                    >
                                        <h3 class="fw-bold mb-0 text-black">Giỏ Hàng</h3>
                                    </div>
                                    <hr class="my-4"/>
                                    <!-- bắt đầu row -->
                                    <c:choose>
                                        <c:when test="${gioHangLists == null}">
                                            <h4 class="text-center">Không có sản phẩm nào trong giỏ hàng</h4>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${gioHangLists != null}">
                                                <c:forEach items="${gioHangLists}" var="cart">
                                                    <div class="d-sm-flex justify-content-between my-4 pb-4 border-bottom">
                                                        <div class="media d-block d-sm-flex text-sm-left">
                                                            <div class="cart-item-thumb mx-auto mr-sm-4">
                                                                <img

                                                                        src="http://localhost:8080/images/${cart.chiTietSanPham.anhSanPham}"
                                                                        style="height: 200px; width: 200px"
                                                                />
                                                            </div>
                                                            <div class="media-body pt-3 ml-5">
                                                                <h4 class="product-card-title text-center font-weight-semibold border-0 pb-0">
                                                                        ${cart.chiTietSanPham.tenSanPham}
                                                                </h4>
                                                                <div class="font-size-sm">
                                                                    <span
                                                                            class="text-muted text-center mr-2">Color:
                                                                     </span>
                                                                        ${cart.chiTietSanPham.mauSac.mau}
                                                                </div>
                                                                <div class="font-size-lg text-primary pt-2">
                                                                    Price: ${cart.chiTietSanPham.giaBan}$
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="pt-2 pt-sm-0 pl-sm-3 mx-auto mx-sm-0 text-sm-left"
                                                             style="max-width: 10rem;">
                                                            <form action="/user/update-cart/${cart.chiTietSanPham.id}"
                                                                  method="post">
                                                                <div class="form-group mb-2">
                                                                    <label for="quantity">Số lượng</label>
                                                                    <input class="form-control form-control-sm"
                                                                           type="number"
                                                                           name="soLuong"
                                                                           id="quantity"
                                                                           value="${cart.soLuong}">
                                                                </div>
                                                                <button class="btn btn-outline-secondary btn-sm btn-block mb-2"
                                                                        type="submit">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                         height="24"
                                                                         viewBox="0 0 24 24"
                                                                         fill="none"
                                                                         stroke="currentColor" stroke-width="2"
                                                                         stroke-linecap="round"
                                                                         stroke-linejoin="round"
                                                                         class="feather feather-refresh-cw mr-1">
                                                                        <polyline points="23 4 23 10 17 10"></polyline>
                                                                        <polyline points="1 20 1 14 7 14"></polyline>
                                                                        <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
                                                                    </svg>
                                                                    Update cart
                                                                </button>
                                                            </form>

                                                            <a class="btn btn-outline-danger btn-sm btn-block mb-2"
                                                               href="/user/remove-cart/${cart.id}"
                                                               type="button">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                     height="24"
                                                                     viewBox="0 0 24 24"
                                                                     fill="none"
                                                                     stroke="currentColor" stroke-width="2"
                                                                     stroke-linecap="round"
                                                                     stroke-linejoin="round"
                                                                     class="feather feather-trash-2 mr-1">
                                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                                                </svg>
                                                                Remove
                                                            </a>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                    <hr class="my-4"/>
                                    <div class="pt-5">
                                        <h6 class="mb-0">
                                            <a href="/user/san-pham" class="text-body"
                                            ><i class="fas fa-long-arrow-alt-left me-2"></i>Trang
                                                chủ</a
                                            >
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 bg-grey">
                                <div class="p-5">
                                    <h3 class="fw-bold mb-5 mt-2 pt-1">Bản Tóm Tắt</h3>
                                    <hr class="my-4"/>

                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="text-uppercase">Tổng Tiền
                                            <c:choose>
                                                <c:when test="${gioHangLists == null}">
                                                    <span>
                                                        <fmt:formatNumber value="0" type="currency" currencySymbol="₫"/>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>
                                                        <fmt:formatNumber value="${tongTien}" type="currency"
                                                                          currencySymbol="₫"/>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </h5>
                                    </div>

                                    <h5 class="text-uppercase mb-3">Cung cấp mã</h5>
                                    <div class="mb-5">
                                        <div class="form-outline">
                                            <input
                                                    type="text"
                                                    id="form3Examplea2"
                                                    class="form-control form-control-lg"
                                            />
                                            <label class="form-label" for="form3Examplea2"
                                            >Nhập mã của bạn.</label
                                            >
                                        </div>
                                    </div>
                                    <hr class="my-4"/>

                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase">Thành tiền: <span>
                                            <c:choose>
                                                <c:when test="${gioHangLists == null}">
                                                    <span>
                                                        <fmt:formatNumber value="0" type="currency" currencySymbol="₫"/>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>
                                                        <fmt:formatNumber value="${tongTien}" type="currency"
                                                                          currencySymbol="₫"/>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                    </div>

                                    <c:if test="${sizeCart > 0}">
                                        <button
                                                type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark"
                                                ng-click="thanhToan($event)"
                                        >
                                            <i class="fa-regular fa-money-check-dollar-pen fa-lg"></i>Thanh Toán
                                        </button>

                                    </c:if>
                                    <!-- Modal -->
                                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
                                         data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel">Xác Nhận Thông
                                                        Tin</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <form method="post" action="/user/check-out-cart">
                                                    <div class="modal-body">
                                                        <div class="modal-body">
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text">Địa Chỉ</span>
                                                                <input type="text" name="diaChi" class="form-control"
                                                                       aria-label="Sizing example input"
                                                                       aria-describedby="inputGroup-sizing-default">
                                                            </div>
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text">Số Điện Thoại</span>
                                                                <input type="text" name="soDienThoai"
                                                                       class="form-control"
                                                                       aria-label="Sizing example input"
                                                                       aria-describedby="inputGroup-sizing-default">
                                                            </div>
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text">Tên Người Nhận</span>
                                                                <input type="text" name="tenNguoiNhan"
                                                                       class="form-control"
                                                                       aria-label="Sizing example input"
                                                                       aria-describedby="inputGroup-sizing-default">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close
                                                        </button>
                                                        <button type="submit"
                                                                class="btn btn-primary"
                                                                onclick=" return confirm('Bạn có muốn mua hàng') ? alert('Mua Hàng Thành Công'):alert('Mua Hàng không Thành Công') ">
                                                            Check Out
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <%--End Modal--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- content end -->
<!-- footer web -->
<jsp:include page="../footer-customer.jsp"></jsp:include>
<!-- footer end -->
<script>
    function checkOut() {
        var diaChi = document.getElementsByName("diaChia")[0].value;
        var sdt = document.getElementsByName("sdt")[0].value;
        var tenNguoiNhan = document.getElementsByName("tenNguoiNhan")[0].value;
        var xhr = new XMLHttpRequest();
        var url = "http://localhost:8080/user/check-out-cart";
        var formData = "diaChi=" + diaChi + "&sdt=" + sdt + "&tenNguoiNhan=" + tenNguoiNhan;
        xhr.open("POST", url, true)
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var responseText = xhr.responseText;
                    // Xử lý phản hồi từ máy chủ
                    console.log(responseText);
                    window.location.href = "http://localhost:8080/user/trang-chu";
                } else {
                    console.log("Lỗi xảy ra");
                }
            }
        };
        xhr.send(formData);
    }
</script>
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
<%--<script src="../js/cart.js"></script>--%>
</body>
</html>

