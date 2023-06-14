package com.example.ass_sof3021_ph19850.service;

import com.example.ass_sof3021_ph19850.entity.MauSac;

import java.util.List;

public interface IMauSacService {
    List<MauSac> findAll();

    MauSac findById(String id);
}
