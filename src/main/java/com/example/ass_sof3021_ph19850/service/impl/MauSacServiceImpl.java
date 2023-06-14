package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.MauSac;
import com.example.ass_sof3021_ph19850.repository.IMauSacRepository;
import com.example.ass_sof3021_ph19850.service.IMauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MauSacServiceImpl implements IMauSacService {

    @Autowired
    private IMauSacRepository mauSacRepository;

    @Override
    public List<MauSac> findAll() {
        return mauSacRepository.findAll();
    }

    @Override
    public MauSac findById(String id) {
        return mauSacRepository.findById(id).get();
    }
}
