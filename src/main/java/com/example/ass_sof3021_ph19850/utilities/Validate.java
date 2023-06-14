package com.example.ass_sof3021_ph19850.utilities;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class Validate {
    @Autowired
    private IAccountService accountService;

    public Map<String, String> validChiTietSanPham(ChiTietSanPham chiTietSanPham) {
        Map<String, String> valid = new HashMap<>();
        if (StringUtils.isEmpty(chiTietSanPham.getTenSanPham().trim()) || StringUtils.isBlank(chiTietSanPham.getTenSanPham().trim())) {
            valid.put("ERR_TENSANPHAM", "Không được để trống tên");
        }

        if (chiTietSanPham.getSoLuongTon() <= 0) {
            valid.put("ERR_SOLUONGTON", "Số lượng tồn lớn hơn 0");
        }

        if (StringUtils.isEmpty(chiTietSanPham.getMoTa().trim()) || StringUtils.isBlank(chiTietSanPham.getMoTa().trim())) {
            valid.put("ERR_MOTA", "Không được để trống mô tả");
        }

        return valid;
    }

    public Map<String, String> validAccount(Account account) {
        Map<String, String> valid = new HashMap<>();
        Account accountUserName = accountService.findByTenDangNhap(account.getTenDangNhap());
        if (accountUserName != null) {
            valid.put("ERR_TENDANGNHAPTRUNG", "Trùng Tên Đăng Nhâp");
        }

        if (StringUtils.isEmpty(account.getHoTen()) || StringUtils.isBlank(account.getHoTen())) {
            valid.put("ERR_HOTEN", "Nhập Họ Tên");
        }

        if (StringUtils.isEmpty(account.getEmail()) || StringUtils.isBlank(account.getEmail())) {
            valid.put("ERR_EMAIL", "Nhập Email");
        }

        if (StringUtils.isEmpty(account.getTenDangNhap()) || StringUtils.isBlank(account.getTenDangNhap())) {
            valid.put("ERR_TENDANGNHAP", "Nhập Tên Đăng Nhập");
        }

        if (StringUtils.isEmpty(account.getMatKhau()) || StringUtils.isBlank(account.getMatKhau())) {
            valid.put("ERR_MATKHAU", "Nhập Mat Khau");
        }


        return valid;
    }
}
