package com.example.ass_sof3021_ph19850.controller.login;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
import com.example.ass_sof3021_ph19850.utilities.HashUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/change-password")
public class ChangePassController {

    @Autowired
    private IAccountService accountService;

    @Autowired
    private IGioHangService gioHangService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping()
    public String viewChangePass(Model model) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        GioHang gioHang;
        if (account != null) {
            model.addAttribute("acc", account);
            gioHang = gioHangService.findGioHangByAccountAndTrangThai(0, account.getId());
            if (gioHang != null) {
                model.addAttribute("sizeCart", gioHang.getGioHangChiTiets().size());
            } else {
                model.addAttribute("sizeCart", 0);
            }
        }
        return "customer/change-pass";
    }

    @PostMapping()
    public String updateAccount(
            Model model,
            @RequestParam(name = "tenDangNhap") String tenDangNhap,
            @RequestParam(name = "matKhauCu") String matKhauCu,
            @RequestParam(name = "matKhauMoiN") String matKhauMoiN,
            @RequestParam(name = "matKhauMoiR") String matKhauMoiR
    ) {
        HttpSession sessionChangePass = request.getSession();
        Account account = accountService.findByTenDangNhap(tenDangNhap);
        if (account == null || !HashUtil.verify(matKhauCu, account.getMatKhau()) || !matKhauMoiN.equals(matKhauMoiR)) {
            model.addAttribute("acc", account);
            sessionChangePass.setAttribute("ERR", "Sai Tên Đăng Nhập Hoặc Mật Khẩu");
            return "redirect:/change-password";
        } else {
            if (StringUtils.isEmpty(matKhauMoiN) || StringUtils.isEmpty(matKhauMoiR)) {
                model.addAttribute("acc", account);
                sessionChangePass.setAttribute("ERR", "Yêu cầu Nhập đầy Đủ ");
                return "redirect:/change-password";
            } else {
                account.setMatKhau(HashUtil.hash(matKhauMoiR));
                accountService.saveAccount(account);
                sessionChangePass.setAttribute("account", null);
                return "redirect:/login";
            }
        }
    }
}
