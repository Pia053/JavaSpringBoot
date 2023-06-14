package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.Account;

import java.util.Map;

public interface IAccountService {
    Account findByTenDangNhap(String tenDangNhap);

    Account findById(String id);

    void saveAccount(Account account);

    String genMaAccount();
}
