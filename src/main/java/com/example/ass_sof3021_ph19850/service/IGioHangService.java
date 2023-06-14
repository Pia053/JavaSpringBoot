package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IGioHangService {

    String genMaGioHang();

    GioHang findGioHangByAccount(Account account);

    GioHang save(GioHang gioHang);

    List<GioHang> findAll();

    GioHang findById(String id);

    GioHang findGioHangByAccountAndTrangThai(Integer trangThai, String idAccount);

    Page<GioHang> findGioHangByTrangThai(Integer trangThai, Integer pageNumber);
}
