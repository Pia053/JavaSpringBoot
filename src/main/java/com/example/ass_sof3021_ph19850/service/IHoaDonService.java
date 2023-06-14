package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.HoaDon;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IHoaDonService {

    String genMaHoaDon();

    void saveHoaDon(HoaDon hoaDon);

    List<HoaDon> findByTinhTrangAndAccount(Integer tinhTrang, String idAccount);

    HoaDon findByAccountKhachHang(Account account);

    HoaDon findByIdHoaDon(String idHoaDon);

    List<HoaDon> findByTinhTrangHoaDon(Integer tinhTrang);

    List<HoaDon> findAll();
}
