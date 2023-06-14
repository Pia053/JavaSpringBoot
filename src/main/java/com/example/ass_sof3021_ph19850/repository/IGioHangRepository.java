package com.example.ass_sof3021_ph19850.repository;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IGioHangRepository extends JpaRepository<GioHang, String> {
    @Query(value = "Select MAX(CONVERT(INT,SUBSTRING(ma,5,100))) from gio_hang", nativeQuery = true)
    String genMaGioHang();

    GioHang findGioHangByAccount(Account account);

    @Query(
            value = """ 
                    SELECT gh.id, gh.ma, gh.ngay_tao, gh.tinh_trang, gh.account, gh.ngay_thanh_toan,gh.so_dien_thoai ,gh.dia_chi, gh.ten_nguoi_nhan,
                                              acc.id as idAccount, acc.ten_dang_nhap, acc.email, acc.ho_ten,acc.ma_account, acc.mat_khau,acc.id_chuc_vu
                        FROM gio_hang gh join account acc on gh.account = acc.id \s
                        where gh.tinh_trang = :trangThai and acc.id = :idAccount
                    """, nativeQuery = true)
    GioHang findGioHangByAccountAndTrangThai(@Param("trangThai") Integer trangThai, @Param("idAccount") String idAccount);


    @Query("""
                Select entity From GioHang entity Where entity.tinhTrang =:trangThai
            """)
    Page<GioHang> findByTrangThai(@Param("trangThai") Integer trangThai, Pageable pageable);
}
