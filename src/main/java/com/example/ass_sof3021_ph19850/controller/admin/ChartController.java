package com.example.ass_sof3021_ph19850.controller.admin;

import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.infrastructure.SanPhamThongKe;
import com.example.ass_sof3021_ph19850.service.IChiTietSanPhamService;
import com.example.ass_sof3021_ph19850.service.IHoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/chart")
public class ChartController {

    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

    @GetMapping("/top-10-san-pham-ban-chay")
    public String showChart(
            Model model,
            @RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate ngayBatDau,
            @RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate ngayKetThuc
    ) {

        List<Object[]> top10DuLieuBanChay;

        if (ngayBatDau != null && ngayKetThuc != null) {
            top10DuLieuBanChay = hoaDonChiTietService.findByTop10SanPhamBanChay(ngayBatDau, ngayKetThuc);
        } else {
            top10DuLieuBanChay = hoaDonChiTietService.findByTop10SanPhamBanChays();
        }
        List<SanPhamThongKe> top10BanChayNhat = new ArrayList<>();
        for (Object[] data : top10DuLieuBanChay) {
            String chiTietSanPhamId = (String) data[0];
            Integer soLuong = ((Number) data[1]).intValue();
            // Lấy chi tiết sản phẩm từ cơ sở dữ liệu dựa trên chiTietSanPhamId
            ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(chiTietSanPhamId).orElse(null);
            if (chiTietSanPham != null) {
                SanPhamThongKe item = SanPhamThongKe.builder().chiTietSanPham(chiTietSanPham).soLuong(soLuong).build();
                top10BanChayNhat.add(item);
            }
        }
        List<Object[]> top10SanPhamTon = chiTietSanPhamService.top10SoLuongTon();
        List<SanPhamThongKe> top10HangTon = new ArrayList<>();
        for (Object[] data : top10SanPhamTon) {
            String chiTietSanPhamId = (String) data[0];
            Integer thoiGianTon = (Integer) data[1];
            Integer soLuongTon = (Integer) data[2];
            ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(chiTietSanPhamId).orElse(null);
            if (chiTietSanPham != null) {
                SanPhamThongKe item = SanPhamThongKe.builder().chiTietSanPham(chiTietSanPham).soLuong(soLuongTon).ngayTon(thoiGianTon).build();
                top10HangTon.add(item);
            }

        }

        model.addAttribute("top10BanChayNhat", top10BanChayNhat);
        model.addAttribute("top10TonLauNhat", top10HangTon);
        return "admin/chart";
    }
}
