package com.example.ass_sof3021_ph19850.repository;


import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IHoaDonRepository extends JpaRepository<HoaDon, String> {
    @Query(value = "Select MAX(CONVERT(INT,SUBSTRING(ma,5,100))) from hoa_don", nativeQuery = true)
    String genMaHoaDon();

    @Query(value = """
            SELECT * 
            FROM hoa_don
            WHERE tinh_Trang = :tinhTrang AND id_khach_hang = :idKhachHang 
            """, nativeQuery = true)
    List<HoaDon> findByTinhTrangAndKhachHang(@Param("tinhTrang") Integer tinhTrang, @Param("idKhachHang") String idKhachHang);

    @Query(value = """
            SELECT * 
            FROM hoa_don
            WHERE tinh_Trang = :tinhTrang
            """, nativeQuery = true)
    List<HoaDon> findByTinhTrang(@Param("tinhTrang") Integer tinhTrang);

    HoaDon findByAccountKhachHang(Account account);
}
