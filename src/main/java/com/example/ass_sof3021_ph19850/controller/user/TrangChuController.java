package com.example.ass_sof3021_ph19850.controller.user;

import com.example.ass_sof3021_ph19850.controller.cart.GioHangController;
import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.service.IChiTietSanPhamService;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
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

import java.util.Date;

@Controller
@RequestMapping("/user")
public class TrangChuController {

    @Autowired
    private IGioHangService gioHangService;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

    @GetMapping("/trang-chu")
    public String trangChu(
            Model model,
            @RequestParam(name = "currentPage", defaultValue = "1") Integer pageNumber
    ) {
        Page<ChiTietSanPham> page = chiTietSanPhamService.pageInChiTietSanPham(pageNumber);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        GioHang gioHang = null;
        if (account != null) {
            gioHang = gioHangService.findGioHangByAccountAndTrangThai(0,account.getId());
            if(gioHang != null){
                model.addAttribute("sizeCart", gioHang.getGioHangChiTiets().size());
            }else{
                model.addAttribute("sizeCart", 0);
            }
        }else{
            GioHang gioHangSession = new GioHang();
            gioHangSession.setMa(gioHangService.genMaGioHang());
            gioHangSession.setNgayTao(new Date());
            session.setAttribute("gioHangSession", gioHangSession);
        }

        model.addAttribute("listsChiTietSP", page.getContent());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("currentPage", pageNumber);

        return "customer/home-page";
    }

    @GetMapping("/chi-tiet-san-pham/{id}")
    public String thongTinSanPham(Model model, @PathVariable(name = "id") String id) {
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");
//        GioHang gioHang = null;
//        if (account != null) {
//            gioHang = gioHangService.findGioHangByAccountAndTrangThai(account);
//            model.addAttribute("sizeCart", gioHang.getGioHangChiTiets().size());
//        }


        model.addAttribute("chiTietSanPham", chiTietSanPhamService.findById(id).get());
        return "customer/detail-product";
    }
}
