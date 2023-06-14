package com.example.ass_sof3021_ph19850.service.impl;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.GioHang;
import com.example.ass_sof3021_ph19850.repository.IGioHangRepository;
import com.example.ass_sof3021_ph19850.service.IGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class GioHangServiceImpl implements IGioHangService {

    @Autowired
    private IGioHangRepository gioHangRepository;

    @Override
    public String genMaGioHang() {
        String maGH = null;
        maGH = gioHangRepository.genMaGioHang();
        if (maGH == null) {
            maGH = "1";
            Integer ma = Integer.parseInt(maGH);
            System.out.println("mã trong :" + maGH);
            return maGH = "GH00" + ma;
        }
        Integer ma = Integer.parseInt(maGH);
        ma++;
        maGH = "GH00" + ma;
        System.out.println("mã ngoài :" + maGH);
        return maGH;
    }

    @Override
    public GioHang findGioHangByAccount(Account account) {
        return gioHangRepository.findGioHangByAccount(account);
    }

    @Override
    public GioHang save(GioHang gioHang) {
        return gioHangRepository.save(gioHang);
    }

    @Override
    public List<GioHang> findAll() {
        return gioHangRepository.findAll();
    }

    @Override
    public GioHang findById(String id) {
        return gioHangRepository.findById(id).get();
    }

    @Override
    public GioHang findGioHangByAccountAndTrangThai(Integer trangThai, String idAccount) {
        return gioHangRepository.findGioHangByAccountAndTrangThai(trangThai, idAccount);
    }

    @Override
    public Page<GioHang> findGioHangByTrangThai(Integer trangThai, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 5);
        return gioHangRepository.findByTrangThai(trangThai, pageable);
    }

}
