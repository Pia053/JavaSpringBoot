package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.HoaDon;
import com.example.ass_sof3021_ph19850.entity.HoaDonChiTiet;
import com.example.ass_sof3021_ph19850.repository.IHoaDonChiTietRepository;
import com.example.ass_sof3021_ph19850.service.IHoaDonChiTietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class HoaDonChiTietServiceImpl implements IHoaDonChiTietService {

    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;

    @Override
    public HoaDonChiTiet saveHoaDonChiTiet(HoaDonChiTiet hoaDonChiTiet) {
        return hoaDonChiTietRepository.save(hoaDonChiTiet);
    }

    @Override
    public List<Object[]> findByTop10SanPhamBanChay(LocalDate ngayBatDau, LocalDate ngayKetThuc) {
        Pageable pageable = PageRequest.of(0, 10);
        return hoaDonChiTietRepository.findTop10SanPhamBanChay(ngayBatDau, ngayKetThuc, pageable);
    }

    @Override
    public List<Object[]> findByTop10SanPhamBanChays() {
        Pageable pageable = PageRequest.of(0, 10);
        return hoaDonChiTietRepository.findTop10SanPhamBanChays(pageable);
    }

    @Override
    public List<HoaDonChiTiet> findByIdHoaDon(HoaDon hoaDon) {
        return hoaDonChiTietRepository.findByHoaDon(hoaDon);
    }
}
