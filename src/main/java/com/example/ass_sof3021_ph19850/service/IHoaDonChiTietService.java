package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.HoaDon;
import com.example.ass_sof3021_ph19850.entity.HoaDonChiTiet;

import java.time.LocalDate;
import java.util.List;

public interface IHoaDonChiTietService {

    HoaDonChiTiet saveHoaDonChiTiet(HoaDonChiTiet hoaDonChiTiet);

    List<Object[]> findByTop10SanPhamBanChay(LocalDate ngayBatDau, LocalDate ngayKetThuc);

    List<Object[]> findByTop10SanPhamBanChays();

    List<HoaDonChiTiet> findByIdHoaDon(HoaDon hoaDon);
}
