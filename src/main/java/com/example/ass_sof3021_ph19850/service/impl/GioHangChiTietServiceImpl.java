package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.GioHangChiTiet;
import com.example.ass_sof3021_ph19850.repository.IGioHangChiTietRepository;
import com.example.ass_sof3021_ph19850.service.IGioHangChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class GioHangChiTietServiceImpl implements IGioHangChiTietService {
    @Autowired
    private IGioHangChiTietRepository gioHangChiTietRepository;

    @Override
    public GioHangChiTiet saveGioHangChiTiet(GioHangChiTiet gioHangChiTiet) {
        return gioHangChiTietRepository.save(gioHangChiTiet);
    }

    @Override
    public void deleteChiTietGioHang(String id) {
        gioHangChiTietRepository.deleteChiTietGioHang(id);
    }
}
