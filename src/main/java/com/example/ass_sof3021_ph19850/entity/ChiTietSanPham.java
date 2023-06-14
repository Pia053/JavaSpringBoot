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
import java.time.LocalDate;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ChiTietSanPham")
public class ChiTietSanPham {
    @Id
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    private String id;

    @Column(name = "tenSanPham")
    private String tenSanPham;

    @Column(name = "moTa", columnDefinition = "nvarchar(Max)")
    private String moTa;

    @Column(name = "anhSanPham", columnDefinition = "nvarchar(Max)")
    private String anhSanPham;

    @Column(name = "soLuongTon")
    private Integer soLuongTon;

    @Column(name = "giaNhap")
    private BigDecimal giaNhap;

    @Column(name="ngayNhap")
    private LocalDate ngayNhap;

    @Column(name = "giaBan")
    private BigDecimal giaBan;

    @ManyToOne
    @JoinColumn(name = "idMauSac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "idNhaSanXuat")
    private NhaSanXuat nhaSanXuat;

    @ManyToOne
    @JoinColumn(name = "idDongSanPham")
    private DongSanPham dongSanPham;

    @ManyToOne
    @JoinColumn(name = "idSize")
    private Size size;
}
