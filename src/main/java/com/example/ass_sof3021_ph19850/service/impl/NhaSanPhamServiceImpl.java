package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.NhaSanXuat;
import com.example.ass_sof3021_ph19850.repository.INhaSanXuatRepository;
import com.example.ass_sof3021_ph19850.service.INhaSanXuatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhaSanPhamServiceImpl implements INhaSanXuatService {

    @Autowired
    private INhaSanXuatRepository nhaSanXuatRepository;

    @Override
    public List<NhaSanXuat> findAll() {
        return nhaSanXuatRepository.findAll();
    }

    @Override
    public NhaSanXuat findById(String id) {
        return nhaSanXuatRepository.findById(id).get();
    }
}
