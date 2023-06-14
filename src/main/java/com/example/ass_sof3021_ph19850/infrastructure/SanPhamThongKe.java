package com.example.ass_sof3021_ph19850.infrastructure;

import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class SanPhamThongKe {
    private ChiTietSanPham chiTietSanPham;
    private Integer soLuong;
    private Integer ngayTon;
}
