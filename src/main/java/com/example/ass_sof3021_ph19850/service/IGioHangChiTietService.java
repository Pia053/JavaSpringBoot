package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.GioHangChiTiet;

public interface IGioHangChiTietService {

    GioHangChiTiet saveGioHangChiTiet(GioHangChiTiet gioHangChiTiet);

    void deleteChiTietGioHang(String id);
}
