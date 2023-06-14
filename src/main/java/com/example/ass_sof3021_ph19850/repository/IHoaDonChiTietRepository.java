package com.example.ass_sof3021_ph19850.repository;

import com.example.ass_sof3021_ph19850.entity.HoaDon;
import com.example.ass_sof3021_ph19850.entity.HoaDonChiTiet;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {


    @Query(value = """
            SELECT i.chiTietSanPham.id, SUM(i.soLuong)
                        FROM HoaDonChiTiet i 
                        WHERE i.ngay >= :ngayBatDau AND i.ngay <= :ngayKetThuc 
                        GROUP BY i.chiTietSanPham.id 
                        ORDER BY SUM(i.soLuong) DESC
                """)
    List<Object[]> findTop10SanPhamBanChay(@Param("ngayBatDau") LocalDate ngayBatDau, @Param("ngayKetThuc") LocalDate ngayKetThuc, Pageable pageable);

    @Query(value = """
            SELECT i.chiTietSanPham.id, SUM(i.soLuong) 
                        FROM HoaDonChiTiet i 
                        GROUP BY i.chiTietSanPham.id 
                        ORDER BY SUM(i.soLuong) DESC
                """)
    List<Object[]> findTop10SanPhamBanChays(Pageable pageable);

    List<HoaDonChiTiet> findByHoaDon(HoaDon hoaDon);

}
