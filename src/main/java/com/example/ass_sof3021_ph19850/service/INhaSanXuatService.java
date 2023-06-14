package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.NhaSanXuat;

import java.util.List;

public interface INhaSanXuatService {

    List<NhaSanXuat> findAll();

    NhaSanXuat findById(String id);
}
