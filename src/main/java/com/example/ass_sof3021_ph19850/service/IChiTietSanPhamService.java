package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import org.springframework.data.domain.Page;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

public interface IChiTietSanPhamService {
    List<ChiTietSanPham> findAll();

    Page<ChiTietSanPham> pageInChiTietSanPham(int pageNumber);

    Optional<ChiTietSanPham> findById(String id);

    void delete(ChiTietSanPham chiTietSanPham);

    void save(ChiTietSanPham chiTietSanPham);

    Page<ChiTietSanPham> findByNameContains(String tenSanPham, Integer pageNumber);

    List<ChiTietSanPham> findAllByGiaBan(BigDecimal giaMin, BigDecimal giaMax);

    List<Object[]> top10SoLuongTon();
 }
