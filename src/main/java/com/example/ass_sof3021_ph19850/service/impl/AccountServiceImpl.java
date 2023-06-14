package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.repository.IAccountRepository;
import com.example.ass_sof3021_ph19850.service.IAccountService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AccountServiceImpl implements IAccountService {
    @Autowired
    private IAccountRepository accountRepository;

    @Override
    public Account findByTenDangNhap(String tenDangNhap) {
        return accountRepository.findByTenDangNhap(tenDangNhap);
    }

    @Override
    public Account findById(String id) {
        return accountRepository.findById(id).orElse(null);
    }

    @Override
    public void saveAccount(Account account) {

        accountRepository.save(account);
    }

    @Override
    public String genMaAccount() {
        String maAC = null;
        maAC = accountRepository.genMaAccount();
        if (maAC == null) {
            maAC = "1";
            Integer ma = Integer.parseInt(maAC);
            System.out.println("mã trong :" + maAC);
            return maAC = "AC00" + ma;
        }
        Integer ma = Integer.parseInt(maAC);
        ma++;
        maAC = "AC00" + ma;
        System.out.println("mã ngoài :" + maAC);

        return maAC;
    }
}
