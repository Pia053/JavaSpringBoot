package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.repository.IChiTietSanPhamRepository;
import com.example.ass_sof3021_ph19850.service.IChiTietSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class ChiTietSanPhamServiceImpl implements IChiTietSanPhamService {

    @Autowired
    private IChiTietSanPhamRepository chiTietSanPhamRepository;

    @Override
    public List<ChiTietSanPham> findAll() {
        return chiTietSanPhamRepository.findAll();
    }

    @Override
    public Page<ChiTietSanPham> pageInChiTietSanPham(int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 5);
        return chiTietSanPhamRepository.findAll(pageable);
    }

    @Override
    public Optional<ChiTietSanPham> findById(String id) {
        return chiTietSanPhamRepository.findById(id);
    }

    @Override
    public void delete(ChiTietSanPham chiTietSanPham) {
        chiTietSanPhamRepository.delete(chiTietSanPham);
    }

    @Override
    public void save(ChiTietSanPham chiTietSanPham) {
        chiTietSanPhamRepository.save(chiTietSanPham);
    }

    @Override
    public Page<ChiTietSanPham> findByNameContains(String tenSanPham, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 6);
        return chiTietSanPhamRepository.findByTenSanPhamContains(tenSanPham, pageable);
    }

    @Override
    public List<ChiTietSanPham> findAllByGiaBan(BigDecimal giaMin, BigDecimal giaMax) {
        return chiTietSanPhamRepository.findAllByGiaBan(giaMin, giaMax);
    }

    @Override
    public List<Object[]> top10SoLuongTon() {
        return chiTietSanPhamRepository.findTop10SanPhamTon();
    }
}
