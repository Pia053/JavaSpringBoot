package com.example.ass_sof3021_ph19850.controller.login;

import com.example.ass_sof3021_ph19850.config.MailService;
import com.example.ass_sof3021_ph19850.config.PasswordGenerator;
import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import com.example.ass_sof3021_ph19850.utilities.HashUtil;
import jakarta.mail.MessagingException;
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
@RequestMapping("/forgot-password")
public class ForgotPasswordController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private IAccountService accountService;

    @Autowired
    private MailService mailService;

    @GetMapping
    public String viewForgotPass(
            Model model
    ) {
        HttpSession sessionForgot = request.getSession();
        Account account = (Account) sessionForgot.getAttribute("account");
        if (account != null) {
            model.addAttribute("acc", account);
        }
        return "customer/forgot-pass";
    }

    @PostMapping("/send-mail")
    public String sendEmail(
            Model model,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "tenDangNhap") String tenDangNhap

    ) throws MessagingException {
        HttpSession sessionForgotPass = request.getSession();
        Account account = accountService.findByTenDangNhap(tenDangNhap);
        System.out.println("accc forgot: " + account);
        if (StringUtils.isEmpty(email) || StringUtils.isBlank(email) || StringUtils.isEmpty(tenDangNhap) || StringUtils.isBlank(tenDangNhap)) {
            model.addAttribute("acc", Account.builder().email(email).tenDangNhap(tenDangNhap).build());
            sessionForgotPass.setAttribute("ERR", "Không Được Để Trống Tên Tài Khoản Hoặc Email");
            return "customer/forgot-pass";
        }
        if (account == null) {
            model.addAttribute("acc", Account.builder().email(email).tenDangNhap(tenDangNhap).build());
            sessionForgotPass.setAttribute("ERR", "Tài Khoản Không Tồn Tại");
            return "customer/forgot-pass";
        } else {
            if (!account.getEmail().equals(email)) {
                model.addAttribute("acc", Account.builder().email(email).tenDangNhap(tenDangNhap).build());
                sessionForgotPass.setAttribute("ERR", "Email Không Đúng Với Tài Khoản Được Đăng Ký");
                return "customer/forgot-pass";
            } else {
                String passWord = PasswordGenerator.generateRandomPassword(5);
                String to = email;
                String subject = "Xác Nhận Mật Khẩu Mới";
                String content = String.format(
                        "<html>" +
                                "<body>" +
                                "<h3>Dear %s</h1>" +
                                "<p>Tên Tài Khoản: %s</p>" +
                                "<p>Mật Khẩu Mới: %s</p>" +
                                "<p>Chú ý không tiết lộ mật khẩu cho bất kỳ ai, thay đổi mật khẩu ngay sau khi đăng nhập vào hệ thống</p>" +
                                "<p>Thanks,</p>" +
                                "<p>Ad X-News: Nguyễn Phúc Lâm</p>" +
                                "</body>" +
                                "</html>", account.getHoTen(), account.getTenDangNhap(), passWord);
                System.out.println(passWord);
                account.setMatKhau(HashUtil.hash(passWord));
                accountService.saveAccount(account);
                mailService.sendEmail(to, subject, content);
                return "redirect:/login";
            }
        }
    }
}
