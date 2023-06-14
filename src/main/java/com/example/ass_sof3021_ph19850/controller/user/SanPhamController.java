package com.example.ass_sof3021_ph19850.controller.user;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.service.IChiTietSanPhamService;
import com.example.ass_sof3021_ph19850.service.IGioHangChiTietService;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller()
@RequestMapping("/user")
public class SanPhamController {

    @Autowired
    private IGioHangService gioHangService;
    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/san-pham")
    public String hienThiSanPham(
            Model model
    ) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        GioHang gioHang = null;
        if (account != null) {
            gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            if (gioHang != null) {
                model.addAttribute("sizeCart", gioHang.getGioHangChiTiets().size());
            } else {
                model.addAttribute("sizeCart", 0);
            }
        } else {
            GioHang gioHangSession = new GioHang();
            gioHangSession.setMa(gioHangService.genMaGioHang());
            gioHangSession.setNgayTao(new Date());
            session.setAttribute("gioHangSession", gioHangSession);
        }

        model.addAttribute("listsChiTietSP", chiTietSanPhamService.findAll());
        return "customer/product";
    }
}
