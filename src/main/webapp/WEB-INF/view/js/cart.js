function checkOut() {
    var diaChi = document.getElementsByName("diaChia")[0].value;
    var sdt = document.getElementsByName("sdt")[0].value;
    var tenNguoiNhan = document.getElementsByName("tenNguoiNhan")[0].value;
    var xhr = new XMLHttpRequest();
    var url = "/user/check-out-cart";
    var formData = "diaChi=" + diaChi + "&sdt=" + sdt + "&tenNguoiNhan=" + tenNguoiNhan;    xhr.open("POST", url, true)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var responseText = xhr.responseText;
                // Xử lý phản hồi từ máy chủ
                console.log(responseText);
            } else {
                console.log("Lỗi xảy ra");
            }
        }
    };
    xhr.send(formData);
}