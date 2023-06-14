package com.example.ass_sof3021_ph19850.controller.admin;

import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.entity.GioHangChiTiet;
import com.example.ass_sof3021_ph19850.entity.HoaDon;
import com.example.ass_sof3021_ph19850.entity.HoaDonChiTiet;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
import com.example.ass_sof3021_ph19850.service.IHoaDonChiTietService;
import com.example.ass_sof3021_ph19850.service.IHoaDonService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller("hoaDon")
@RequestMapping("/admin/quan-ly-hoa-don")
public class HoaDonController {

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private IHoaDonService hoaDonService;

    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    @GetMapping("/list")
    public String danhSachDonHang(
            Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") Integer currentPage
    ) {
        Page<GioHang> gioHangList = gioHangService.findGioHangByTrangThai(1, currentPage);

        model.addAttribute("gioHangList", gioHangList.getContent());
        model.addAttribute("totalPages", gioHangList.getTotalPages());
        model.addAttribute("currentPage", currentPage);

        return "admin/order-management";
    }

    @GetMapping("/danh-sach-hoa-don")
    public String danhSachDonHangThanhToan(
            Model model,
            @RequestParam(name = "tinhTrang", required = false) Integer tinhTrang
    ) {

        List<HoaDon> hoaDons;
        if (tinhTrang == null) {
            hoaDons = hoaDonService.findAll();
        } else {
            hoaDons = hoaDonService.findByTinhTrangHoaDon(tinhTrang);
        }
        model.addAttribute("hoaDonList", hoaDons);
        return "admin/payment-orders";
    }

    @GetMapping("/detail/{id}")
    public String detailDonHang(@PathVariable("id") String id, Model model) {
        HttpSession session = request.getSession();

        GioHang gioHang = gioHangService.findById(id);
        Long total = 0L;
        for (int i = 0; i < gioHang.getGioHangChiTiets().size(); i++) {
            total += gioHang.getGioHangChiTiets().get(i).getDonGia().intValue() * gioHang.getGioHangChiTiets().get(i).getSoLuong();
        }
        session.setAttribute("totalAmount", total);
        model.addAttribute("gioHang", gioHang.getGioHangChiTiets());
        model.addAttribute("gioHangTT", gioHang);
        return "admin/detail-don-hang";
    }

    @GetMapping("/thong-tin-hoa-don/{id}")
    public String thongTinHoaDon(@PathVariable("id") String id, Model model) {
        HttpSession session = request.getSession();
        HoaDon hoaDon = hoaDonService.findByIdHoaDon(id);

        Long total = 0L;
        for (int i = 0; i < hoaDon.getHoaDonChiTietList().size(); i++) {
            total += hoaDon.getHoaDonChiTietList().get(i).getDonGia().intValue() * hoaDon.getHoaDonChiTietList().get(i).getSoLuong();
        }
        session.setAttribute("totalAmount", total);
        model.addAttribute("hoaDonCT", hoaDon.getHoaDonChiTietList());
        return "admin/detail-orders";
    }

    @GetMapping("/xac-nhan/{id}")
    public String xacNhanDonHang(@PathVariable("id") String id, Model model) {
        GioHang gioHang = gioHangService.findById(id);
        if (gioHang != null) {
            gioHang.setTinhTrang(2);
            gioHangService.save(gioHang);

            HoaDon hoaDon = new HoaDon();
            hoaDon.setMaHoaDon(hoaDonService.genMaHoaDon());
            hoaDon.setDiaChi(gioHang.getDiaChi());
            hoaDon.setNgayShip(LocalDate.now());
            hoaDon.setNgayTao(LocalDate.now());
            hoaDon.setSoDienThoai(gioHang.getSoDienThoai());
            hoaDon.setTenNguoiNhan(gioHang.getTenNguoiNhan());
            hoaDon.setTinhTrang(0);
            hoaDon.setAccountKhachHang(gioHang.getAccount());
            hoaDonService.saveHoaDon(hoaDon);

            List<GioHangChiTiet> gioHangChiTietList = gioHang.getGioHangChiTiets();
            for (GioHangChiTiet gioHangChiTiet : gioHangChiTietList) {
                HoaDonChiTiet hoaDonChiTiet = HoaDonChiTiet.builder().chiTietSanPham(gioHangChiTiet.getChiTietSanPham())
                        .soLuong(gioHangChiTiet.getSoLuong())
                        .donGia(gioHangChiTiet.getDonGia())
                        .hoaDon(hoaDon).ngay(LocalDate.now())
                        .build();
                hoaDonChiTietService.saveHoaDonChiTiet(hoaDonChiTiet);
            }
        }

        return "redirect:/admin/quan-ly-hoa-don/list";
    }
}
