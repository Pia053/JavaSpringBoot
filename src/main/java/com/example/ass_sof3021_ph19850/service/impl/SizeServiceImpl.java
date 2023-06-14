package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.Size;
import com.example.ass_sof3021_ph19850.repository.ISizeRepository;
import com.example.ass_sof3021_ph19850.service.ISizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SizeServiceImpl implements ISizeService {

    @Autowired
    private ISizeRepository sizeRepository;

    @Override
    public List<Size> findAll() {
        return sizeRepository.findAll();
    }

    @Override
    public Size findById(String id) {
        return sizeRepository.findById(id).get();
    }
}
