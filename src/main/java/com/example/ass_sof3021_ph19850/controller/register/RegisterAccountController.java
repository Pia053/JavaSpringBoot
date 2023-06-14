package com.example.ass_sof3021_ph19850.controller.register;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.ChucVu;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import com.example.ass_sof3021_ph19850.utilities.HashUtil;
import com.example.ass_sof3021_ph19850.utilities.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/register")
public class RegisterAccountController {

    @Autowired
    private IAccountService accountService;

    @Autowired
    private Validate validate;


    @GetMapping()
    public String viewRegister(){
        return "customer/register-account";
    }


    @PostMapping ("/new-account")
    public String register(
            Model model,
            @RequestParam(name = "hoTen") String hoTen,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "tenDangNhap") String tenDangNhap,
            @RequestParam(name = "matKhau") String matKhau
    ) {
        Account account = Account
                .builder()
                .maAccount(accountService.genMaAccount())
                .tenDangNhap(tenDangNhap)
                .email(email)
                .hoTen(hoTen)
                .matKhau(HashUtil.hash(matKhau))
                .chucVu(ChucVu.builder().id("7206247F-FF94-4806-91B7-82C17152BEC4").build()).build();

        Map<String, String> mapValid = validate.validAccount(account);
        if (!mapValid.isEmpty()) {
            model.addAttribute("ERR", mapValid);
            model.addAttribute("acc", account);
            return "customer/register-account";

        } else {
            accountService.saveAccount(account);
            return "redirect:/login";
        }
    }
}
