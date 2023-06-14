<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header-index">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="/user/trang-chu"
                ><img
                        src="http://localhost:8080/images/logo-chu-X-x_logo_2x-2-removebg.png"
                        alt=""
                        srcset=""
                        width="150"
                        height="90"
                /></a>
                <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a
                                    class="nav-link active"
                                    aria-current="page"
                                    href="/user/trang-chu"
                            >Trang Chủ</a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/san-pham">Sản Phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/gioi-thieu">Giới Thiệu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/tin-tuc">Tin Tức</a>
                        </li>
                        <c:if test="${sessionScope.account.chucVu.tenChucVu == 'ADMIN'}">
                            <li class="nav-item">
                                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                                    <ul class="navbar-nav">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink"
                                               role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                Admin Quản Lý
                                            </a>
                                            <ul class="dropdown-menu dropdown-menu-dark"
                                                aria-labelledby="navbarDarkDropdownMenuLink">
                                                <li>
                                                    <a class="dropdown-item" href="/admin/san-pham/list">Quản Lý Sản
                                                        Phẩm</a>
                                                </li>
                                                <li>
                                                    <a class="dropdown-item" href="/admin/quan-ly-hoa-don/list">Quản Lý Hóa
                                                        Đơn</a>
                                                </li>
                                                <li>
                                                    <a class="dropdown-item" href="/admin/chart/top-10-san-pham-ban-chay">Thống
                                                        Kê</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                        </c:if>
                    </ul>
                    <form class="d-flex ms-auto">
                        <div class="dropdown">
                            <a
                                    class="dropdown-toggle"
                                    id="dropdownMenuButton1"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    style="text-decoration: none"
                            >
                                <i
                                        class="fas fa-user"
                                        style="font-size: 17px; color: white"
                                ></i>
                                <c:choose>
                                    <c:when test="${empty sessionScope.account}">
                                        <span style="font-size: 17px; color: white">Tài Khoản</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="font-size: 17px; color: white">${sessionScope.account.tenDangNhap}</span>
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <ul
                                    class="dropdown-menu"
                                    aria-labelledby="dropdownMenuButton1"
                                    style="font-size: 17px; color: white"
                            >
                                <c:choose>
                                    <c:when test="${sessionScope.account == null}">
                                        <li>
                                            <a class="dropdown-item" href="/login">Đăng Nhập</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a class="dropdown-item" href="/logout">Đăng Xuất</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item"
                                               href="/profile">
                                                Thông Tin Tài Khoản
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item"
                                               href="/change-password">
                                                Đổi Mật Khẩu
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <li>
                                    <a class="dropdown-item" href="/register"
                                    >Đăng Kí</a
                                    >
                                </li>
                                <hr class="dropdown-divider"/>
                            </ul>
                        </div>
                    </form>
                    <a href="/user/show-cart" class="position-relative">
                        <i
                                class="fa fa-shopping-cart"
                                style="font-size: 17px; color: white"
                        ></i>
                        <c:choose>
                            <c:when test="${sizeCart != null}">
                                <span
                                        class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                >
                                        ${sizeCart}
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span
                                        class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                >
                                0
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </a>
                </div>
            </div>
        </nav>
    </div>
</header>
