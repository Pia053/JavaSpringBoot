package com.example.ass_sof3021_ph19850.controller.user;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.entity.HoaDon;
import com.example.ass_sof3021_ph19850.entity.HoaDonChiTiet;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
import com.example.ass_sof3021_ph19850.service.IHoaDonChiTietService;
import com.example.ass_sof3021_ph19850.service.IHoaDonService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    private IHoaDonService hoaDonService;

    @Autowired
    private IHoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping()
    public String accountDetail(Model model, @RequestParam(name = "tinhTrang", defaultValue = "0", required = false) Integer tinhTrang) {
        HttpSession session = request.getSession();
        Account accountSession = (Account) session.getAttribute("account");
        Account account = accountService.findByTenDangNhap(accountSession.getTenDangNhap());

        GioHang gioHang;
        if (account != null) {
            gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            if (gioHang != null) {
                model.addAttribute("sizeCart", gioHang.getGioHangChiTiets().size());
            } else {
                model.addAttribute("sizeCart", 0);
            }
        }
        List<HoaDon> hoaDonList = hoaDonService.findByTinhTrangAndAccount(tinhTrang, account.getId());
//        for (HoaDon hoaDon : hoaDonList) {
//            for (int i = 0; i < hoaDon.getHoaDonChiTietList().size(); i++) {
//                if (hoaDon.getId().equals(hoaDon.getHoaDonChiTietList().get(i).getHoaDon().getId())) {
//                    lists.add(hoaDon.getHoaDonChiTietList().get(i));
//                }
//            }
//        }
        model.addAttribute("hoaDon", hoaDonList);
        model.addAttribute("acc", account);
        return "customer/profile";
    }

    @GetMapping("/don-hang/xac-nhan")
    public String userXacNhanDonHang(@RequestParam(name = "id") String idHoaDon) {
        HoaDon hoaDon = hoaDonService.findByIdHoaDon(idHoaDon);
        // thanh toán
        if (hoaDon != null) {
            hoaDon.setTinhTrang(1);
            hoaDon.setNgayNhan(LocalDate.now());
            hoaDon.setNgayThanhToan(LocalDate.now());
            hoaDonService.saveHoaDon(hoaDon);
        }

        return "redirect:/profile";
    }

    @GetMapping("/don-hang/huy")
    public String userHuyDonHang(@RequestParam(name = "id") String idHoaDon) {
        HoaDon hoaDon = hoaDonService.findByIdHoaDon(idHoaDon);
        // hủy đơn
        if (hoaDon != null) {
            hoaDon.setTinhTrang(2);
            System.out.println("Vào đay rồi hủy rồi");
            hoaDon.setNgayNhan(LocalDate.now());
            hoaDon.setNgayThanhToan(LocalDate.now());
            hoaDonService.saveHoaDon(hoaDon);
        }

        return "redirect:/profile";
    }


    @GetMapping("/don-hang/thong-tin")
    public String userThongTinDonHang(@RequestParam(name = "id") String idHoaDon, Model model
    ) {
        HttpSession session = request.getSession();
        HoaDon hoaDon = hoaDonService.findByIdHoaDon(idHoaDon);

        Long total = 0L;
        for (int i = 0; i < hoaDon.getHoaDonChiTietList().size(); i++) {
            total += hoaDon.getHoaDonChiTietList().get(i).getDonGia().intValue() * hoaDon.getHoaDonChiTietList().get(i).getSoLuong();
        }
        session.setAttribute("totalAmount", total);
        model.addAttribute("hoaDonCT", hoaDon.getHoaDonChiTietList());
        model.addAttribute("hoaDon", hoaDon);
        return "customer/detail-don-hang-user";
    }

    @PostMapping("/update-account/{id}")
    public String updateAcc(
            @PathVariable(name = "id") String idAccount,
            @RequestParam(name = "hoTen") String hoTen,
            @RequestParam(name = "email") String email
    ) {

        Account account = accountService.findById(idAccount);
        if (account != null) {
            account.setEmail(email);
            account.setHoTen(hoTen);
            accountService.saveAccount(account);
        } else {
            System.out.println("không tìm thấy account");
        }

        return "redirect:/profile";
    }
}
