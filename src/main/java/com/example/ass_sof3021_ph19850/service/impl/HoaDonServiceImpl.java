package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.HoaDon;
import com.example.ass_sof3021_ph19850.repository.IHoaDonRepository;
import com.example.ass_sof3021_ph19850.service.IHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonServiceImpl implements IHoaDonService {
    @Autowired
    private IHoaDonRepository hoaDonRepository;

    @Override
    public String genMaHoaDon() {
        String maHD = null;
        maHD = hoaDonRepository.genMaHoaDon();
        if (maHD == null) {
            maHD = "1";
            Integer ma = Integer.parseInt(maHD);
            return maHD = "HD00" + ma;
        }
        Integer ma = Integer.parseInt(maHD);
        ma++;
        maHD = "HD00" + ma;

        return maHD;
    }

    @Override
    public void saveHoaDon(HoaDon hoaDon) {
        hoaDonRepository.save(hoaDon);
    }

    @Override
    public List<HoaDon> findByTinhTrangAndAccount(Integer tinhTrang, String idAccount) {
        return hoaDonRepository.findByTinhTrangAndKhachHang(tinhTrang, idAccount);
    }

    @Override
    public HoaDon findByAccountKhachHang(Account account) {
        return hoaDonRepository.findByAccountKhachHang(account);
    }

    @Override
    public HoaDon findByIdHoaDon(String idHoaDon) {
        return hoaDonRepository.findById(idHoaDon).get();
    }

    @Override
    public List<HoaDon> findByTinhTrangHoaDon(Integer tinhTrang) {
        return hoaDonRepository.findByTinhTrang(tinhTrang);
    }

    @Override
    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }
}
