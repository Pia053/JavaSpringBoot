package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.Size;

import java.util.List;

public interface ISizeService {
    List<Size> findAll();

    Size findById(String id);
}
