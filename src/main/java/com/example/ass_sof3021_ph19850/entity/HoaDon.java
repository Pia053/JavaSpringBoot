package com.example.ass_sof3021_ph19850.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "HoaDon")
public class HoaDon {
    @Id
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    private String id;

    @Column(name = "ma")
    private String maHoaDon;

    @Column(name = "ngayTao")
    private LocalDate ngayTao;

    @Column(name = "ngayThanhToan")
    private LocalDate ngayThanhToan;

    @Column(name = "ngayShip")
    private LocalDate ngayShip;

    @Column(name = "ngayNhan")
    private LocalDate ngayNhan;

    @Column(name = "tinhTrang")
    private Integer tinhTrang;

    @Column(name = "tenNguoiNhan")
    private String tenNguoiNhan;

    @Column(name = "diaChi")
    private String diaChi;

    @Column(name = "soDienThoai")
    private String soDienThoai;

    @ManyToOne
    @JoinColumn(name = "idKhachHang")
    private Account accountKhachHang;

    @OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
}
