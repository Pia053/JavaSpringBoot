package com.example.ass_sof3021_ph19850.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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

import java.util.Date;
import java.util.List;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "GioHang")
public class GioHang {
    @Id
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    private String id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ngayTao")
    private Date ngayTao;

    @Column(name = "ngayThanhToan")
    private Date ngayThanhToan;

    @Column(name = "tenNguoiNhan")
    private String tenNguoiNhan;

    @Column(name = "soDienThoai")
    private String soDienThoai;

    @Column(name = "tinhTrang")
    private Integer tinhTrang;

    @Column(name = "diaChi")
    private String diaChi;

    @ManyToOne
    @JoinColumn(name = "account")
    private Account account;

    @OneToMany(
            mappedBy = "gioHang",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.EAGER
    )
    private List<GioHangChiTiet> gioHangChiTiets;

}
