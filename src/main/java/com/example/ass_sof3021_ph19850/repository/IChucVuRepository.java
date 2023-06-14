package com.example.ass_sof3021_ph19850.repository;

import com.example.ass_sof3021_ph19850.entity.ChucVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IChucVuRepository extends JpaRepository<ChucVu, String> {
}
