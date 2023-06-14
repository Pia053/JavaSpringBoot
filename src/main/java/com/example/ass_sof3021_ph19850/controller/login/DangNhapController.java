package com.example.ass_sof3021_ph19850.controller.login;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import com.example.ass_sof3021_ph19850.utilities.HashUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DangNhapController {
    @Autowired
    private IAccountService accountService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping(value = "/login")
    public String hienThiFormLogin() {
        return "customer/login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam(name = "tenDangNhap") String tenDangNhap,
            @RequestParam(name = "matKhau") String matKhau
    ) {
        Account account = accountService.findByTenDangNhap(tenDangNhap);
        HttpSession sessionLogin = request.getSession();
        if (account == null || !HashUtil.verify(matKhau, account.getMatKhau())) {
            sessionLogin.setAttribute("ERR_LOGIN", "Sai Tên Tài Khoản Hoặc Mật Khẩu");
            return "redirect:/login";
        } else {
            if (account.getChucVu().getTenChucVu().equals("ADMIN")) {
                sessionLogin.setAttribute("account", account);
                return "redirect:/admin/san-pham/list";
            } else {
                sessionLogin.setAttribute("account", account);
                return "redirect:/user/trang-chu";
            }
        }
    }

    @GetMapping("/logout")
    public String logout() {
        HttpSession session = request.getSession();
        session.setAttribute("account", null);
        return "redirect:/login";
    }
}
