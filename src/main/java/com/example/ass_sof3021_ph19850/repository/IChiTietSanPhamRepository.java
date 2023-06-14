package com.example.ass_sof3021_ph19850.repository;

import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface IChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, String> {

    // hql
    Page<ChiTietSanPham> findByTenSanPhamContains(String tenSanPham, Pageable pageable);

    // hql
    @Query("From ChiTietSanPham Where giaBan Between :giaMin And :giaMax")
    List<ChiTietSanPham> findAllByGiaBan(@Param("giaMin") BigDecimal giaMin, @Param("giaMax") BigDecimal giaMax);

    // Top 10 san pham ton lau nhat

    @Query(value = """
            SELECT Top 10  id, DATEDIFF(day,ngay_nhap,GETDATE() ) AS ngay, so_luong_ton
            FROM chi_tiet_san_pham
            WHERE so_luong_ton > 0
            ORDER BY ngay DESC, so_luong_ton DESC
                 """, nativeQuery = true)
    List<Object[]> findTop10SanPhamTon();
}
