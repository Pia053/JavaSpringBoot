package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.DongSanPham;

import java.util.List;

public interface IDongSanPhamService {

    List<DongSanPham> findAll();

    DongSanPham findById(String id);

}
