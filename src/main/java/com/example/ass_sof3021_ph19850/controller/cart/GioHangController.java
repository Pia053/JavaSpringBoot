package com.example.ass_sof3021_ph19850.controller.cart;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.entity.GioHangChiTiet;
import com.example.ass_sof3021_ph19850.service.IChiTietSanPhamService;
import com.example.ass_sof3021_ph19850.service.IGioHangChiTietService;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
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

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class GioHangController {

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private IGioHangChiTietService gioHangChiTietService;

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/show-cart")
    public String showCart(Model model) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        GioHang gioHang = null;
        if (account != null) {
            gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            System.out.println("" + gioHang);
            if (gioHang != null) {
                long tongTien = 0;
                for (int i = 0; i < gioHang.getGioHangChiTiets().size(); i++) {
                    tongTien += gioHang.getGioHangChiTiets().get(i).getSoLuong() * gioHang.getGioHangChiTiets().get(i).getDonGia().intValue();
                }
                model.addAttribute("tongTien", tongTien);
                model.addAttribute("gioHangLists", gioHang.getGioHangChiTiets());
                model.addAttribute("sizeCart", gioHang.getGioHangChiTiets().size());
            } else {
                GioHang gioHangNew = new GioHang();
                gioHangNew.setMa(gioHangService.genMaGioHang());
                gioHangNew.setNgayTao(new Date());
                gioHangNew.setAccount(account);
                gioHangNew.setTinhTrang(0);
                gioHangService.save(gioHangNew);
            }
            // chưa có tài khoản
        } else {
            GioHang gioHangSession = new GioHang();
            gioHangSession.setMa(gioHangService.genMaGioHang());
            gioHangSession.setNgayTao(new Date());
            session.setAttribute("gioHangSession", gioHangSession);
        }

        return "customer/cart";
    }

    @GetMapping("/add-to-cart/{id}")
    public String addToCart(@PathVariable(name = "id") String idSanPham) {
        HttpSession session = request.getSession();
//        Tài Khoản
        Account account = (Account) session.getAttribute("account");
//             chua co gio hang thi phai tao gio hang
        if (account != null) {
            GioHang gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            if (gioHang == null) {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(idSanPham).get();
                if (chiTietSanPham.getSoLuongTon() <= 0) {
                    System.out.println("Heest hang them lam sao duoc");
                    return "";
                } else {
//              tạo mới gior hàng
                    GioHang gioHangNew = new GioHang();
                    gioHangNew.setMa(gioHangService.genMaGioHang());
                    gioHangNew.setNgayTao(new Date());
                    gioHangNew.setAccount(account);
                    gioHangNew.setTinhTrang(0);
                    GioHang gioHangSave = gioHangService.save(gioHangNew);
//              Tạo mới gior hàng chi tiết
                    GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
                    gioHangChiTiet.setGioHang(gioHangSave);
                    gioHangChiTiet.setSoLuong(1);
                    gioHangChiTiet.setDonGia(chiTietSanPham.getGiaBan());
                    gioHangChiTiet.setChiTietSanPham(chiTietSanPham);
                    gioHangChiTiet.setDonGiaKhiGiam(BigDecimal.valueOf(0));
                    GioHangChiTiet gioHangChiTietSave = gioHangChiTietService.saveGioHangChiTiet(gioHangChiTiet);
                }
//          Có giỏ hàng rồi check xem sản phẩm có trong gio chua
            } else {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(idSanPham).get();
//           Kiểm tra sản phẩm còn hàng không
                if (chiTietSanPham.getSoLuongTon() <= 0) {
                    return "";
                } else {
                    List<GioHangChiTiet> gioHangChiTietList = gioHang.getGioHangChiTiets();
//          Check hàng xem có trong giỏ chưa có rồi thì cập nhập
                    boolean check = false;
                    if (gioHangChiTietList.size() > 0) {
                        for (int i = 0; i < gioHangChiTietList.size(); i++) {
                            if (gioHangChiTietList.get(i).getChiTietSanPham().getId().equals(chiTietSanPham.getId())) {
                                gioHangChiTietList.get(i).setSoLuong(gioHangChiTietList.get(i).getSoLuong() + 1);
                                gioHangChiTietService.saveGioHangChiTiet(gioHangChiTietList.get(i));
                                check = true;
                            }
                        }
                    }
//          chưa có thì thêm mới
                    if (check == false) {
                        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
                        gioHangChiTiet.setGioHang(gioHang);
                        gioHangChiTiet.setSoLuong(1);
                        // update laij thawfng san pham
                        gioHangChiTiet.setChiTietSanPham(chiTietSanPham);
                        gioHangChiTiet.setDonGia(chiTietSanPham.getGiaBan());
                        gioHangChiTiet.setChiTietSanPham(chiTietSanPham);
                        gioHangChiTiet.setDonGiaKhiGiam(BigDecimal.valueOf(0));
                        GioHangChiTiet gioHangChiTiet1 = gioHangChiTietService.saveGioHangChiTiet(gioHangChiTiet);
                        // tổng tiền
                    }
                }
            }
        } else {

        }

        return "redirect:/user/show-cart";
    }

    @PostMapping("/update-cart/{id}")
    public String updateCart(
            @PathVariable(name = "id") String idSP,
            @RequestParam(name = "soLuong") Integer soLuong
    ) {
        Integer soLuongCapNhap = soLuong;
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            GioHang gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            for (int i = 0; i < gioHang.getGioHangChiTiets().size(); i++) {
                if (gioHang.getGioHangChiTiets().get(i).getChiTietSanPham().getId().equals(idSP)) {
                    gioHang.getGioHangChiTiets().get(i).setSoLuong(soLuongCapNhap);
                    System.out.println("vào đây nào: " + account.getTenDangNhap());
                    gioHangChiTietService.saveGioHangChiTiet(gioHang.getGioHangChiTiets().get(i));
                }
            }
        }
        return "redirect:/user/show-cart";
    }

    @GetMapping("/remove-cart/{id}")
    public String removeCart(@PathVariable(name = "id") String id) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            try {
                gioHangChiTietService.deleteChiTietGioHang(id);
            } catch (Exception exception) {
                exception.printStackTrace(System.out);
            }
        }
        return "redirect:/user/show-cart";
    }

    @PostMapping("/check-out-cart")
    public String checkOutCart(
            @RequestParam(name = "diaChi") String diaChi,
            @RequestParam(name = "soDienThoai") String soDienThoai,
            @RequestParam(name = "tenNguoiNhan") String tenNguoiNhan
    ) {
        System.out.println("" + diaChi);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            GioHang gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            gioHang.setTinhTrang(1);
            gioHang.setSoDienThoai(soDienThoai);
            gioHang.setDiaChi(diaChi);
            gioHang.setTenNguoiNhan(tenNguoiNhan);
            for (int i = 0; i < gioHang.getGioHangChiTiets().size(); i++) {
                ChiTietSanPham chiTietSanPhamServiceById = chiTietSanPhamService.findById(gioHang.getGioHangChiTiets().get(i).getChiTietSanPham().getId()).get();
                chiTietSanPhamServiceById.setSoLuongTon(chiTietSanPhamServiceById.getSoLuongTon() - gioHang.getGioHangChiTiets().get(i).getSoLuong());
                chiTietSanPhamService.save(chiTietSanPhamServiceById);
            }
            gioHangService.save(gioHang);
        } else {

        }
        return "redirect:/user/trang-chu";
    }
}
