package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.DongSanPham;
import com.example.ass_sof3021_ph19850.repository.IDongSanPhamRepository;
import com.example.ass_sof3021_ph19850.service.IDongSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DongSanPhamServiceImol implements IDongSanPhamService {

    @Autowired
    private IDongSanPhamRepository dongSanPhamRepository;

    @Override
    public List<DongSanPham> findAll() {
        return dongSanPhamRepository.findAll();
    }

    @Override
    public DongSanPham findById(String id) {
        return dongSanPhamRepository.findById(id).get();
    }
}
