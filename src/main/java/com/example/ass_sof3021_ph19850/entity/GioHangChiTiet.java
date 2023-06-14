package com.example.ass_sof3021_ph19850.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import java.math.BigDecimal;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "GioHangChiTiet")
public class GioHangChiTiet {
    @Id
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    private String id;

    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "donGia")
    private BigDecimal donGia;

    @Column(name = "donGiaKhiGiam")
    private BigDecimal donGiaKhiGiam;

    @ManyToOne
    @JoinColumn(name = "idChiTietSanPham")
    private ChiTietSanPham chiTietSanPham;

    @ManyToOne
    @JoinColumn(name = "idGioHang")
    private GioHang gioHang;
}
