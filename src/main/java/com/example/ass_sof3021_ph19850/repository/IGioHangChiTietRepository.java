package com.example.ass_sof3021_ph19850.repository;

import com.example.ass_sof3021_ph19850.entity.GioHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IGioHangChiTietRepository extends JpaRepository<GioHangChiTiet, String> {
    @Query(value = """
            DELETE FROM gio_hang_chi_tiet where gio_hang_chi_tiet.id = :idGioHang
            """, nativeQuery = true)
    void deleteChiTietGioHang(@Param("idGioHang")String idGioHangChiTiet);

}
