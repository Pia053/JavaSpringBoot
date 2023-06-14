<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>X-News</title>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<style>
    <%@include file="../css/profile.css"%>
    <%@include file="../css/rigister.css"%>
    <%@include file="../css/style.css"%>
    <%@include file="../css/form-login.css"%>
    <%@include file="../css/detail.css"%>
    <%@include file="../css/home-page.css"%>
    <%@include file="../css/product.css"%>
</style>
<jsp:include page="../header-customer.jsp"></jsp:include>
<section>
    <div class="container mt-4">
        <h4 class="text-center"> Top 10 Sản Phẩm Chạy</h4>
        <form class="row g-3">
            <div class="col-md-6">
                <label for="startDate" class="form-label">Ngày Bắt Đầu</label>
                <input type="date" id="startDate" name="startDate" class="form-control">
            </div>
            <div class="col-md-6">
                <label for="endDate" class="form-label">Ngày Kết Thúc</label>
                <input type="date" id="endDate" name="endDate" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Tìm Kiếm</button>
        </form>
        <canvas id="bestSellingChart" width="400" height="200"></canvas>

        <h4 class="text-center mt-5"> Top 10 Sản Tồn Lâu Nhất</h4>
        <canvas id="longestInventoryChart" width="400" height="200"></canvas>
    </div>
</section>

<script>
    // Data for best selling products
    var bestSellingData = {
        labels: [
            <c:forEach items="${top10BanChayNhat}" var="item" varStatus="loop">
            "${item.chiTietSanPham.tenSanPham}"
            <c:if test="${!loop.last}">, </c:if>
            </c:forEach>
        ],
        datasets: [{
            label: 'Số lượng',
            data: [
                <c:forEach items="${top10BanChayNhat}" var="item" varStatus="loop">
                ${item.soLuong}
                <c:if test="${!loop.last}">, </c:if>
                </c:forEach>
            ],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            fill: false
        }]
    };

    var longestInventoryData = {
        labels: [
            <c:forEach items="${top10TonLauNhat}" var="item" varStatus="loop">
            "${item.chiTietSanPham.tenSanPham}"<c:if test="${!loop.last}">, </c:if>
            </c:forEach>
        ],
        datasets: [{
            label: 'Ngày',
            data: [
                <c:forEach items="${top10TonLauNhat}" var="item" varStatus="loop">
                ${item.ngayTon}<c:if test="${!loop.last}">, </c:if>
                </c:forEach>
            ],
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
        }]
    };


    // Chart options
    var options = {
        //bar
        responsive: true,
        maintainAspectRatio: false
    };

    // Create charts
    var bestSellingChart = new Chart(document.getElementById('bestSellingChart'), {
        type: 'bar',
        data: bestSellingData,
        options: {
            scales: {
                x: {
                    minBarLength: 1, // Kích thước tối thiểu của cột (đơn vị pixel hoặc giá trị số)
                    barPercentage: 1, // Kích thước của cột theo tỷ lệ (giá trị từ 0 đến 1)
                    categoryPercentage: 0.9 // Kích thước của nhóm cột theo tỷ lệ (giá trị từ 0 đến 1)
                }
            }
        }

    });

    var longestInventoryChart = new Chart(document.getElementById('longestInventoryChart'), {
        type: 'bar',
        data: longestInventoryData,
        options: {
            scales: {
                x: {
                    barPercentage: 0.8, // Kích thước của cột theo tỷ lệ (giá trị từ 0 đến 1)
                    categoryPercentage: 0.9 // Kích thước của nhóm cột theo tỷ lệ (giá trị từ 0 đến 1)
                }
            }
        }
    });

</script>
<jsp:include page="../footer-customer.jsp"></jsp:include>

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