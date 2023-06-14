package com.example.ass_sof3021_ph19850.infrastructure;

import com.example.ass_sof3021_ph19850.entity.Account;
import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.entity.ChucVu;
import com.example.ass_sof3021_ph19850.entity.DongSanPham;
import com.example.ass_sof3021_ph19850.entity.MauSac;
import com.example.ass_sof3021_ph19850.entity.NhaSanXuat;
import com.example.ass_sof3021_ph19850.entity.Size;
import com.example.ass_sof3021_ph19850.repository.IAccountRepository;
import com.example.ass_sof3021_ph19850.repository.IChiTietSanPhamRepository;
import com.example.ass_sof3021_ph19850.repository.IChucVuRepository;
import com.example.ass_sof3021_ph19850.repository.IDongSanPhamRepository;
import com.example.ass_sof3021_ph19850.repository.IMauSacRepository;
import com.example.ass_sof3021_ph19850.repository.INhaSanXuatRepository;
import com.example.ass_sof3021_ph19850.repository.ISizeRepository;
import com.example.ass_sof3021_ph19850.utilities.HashUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import java.math.BigDecimal;

//@SpringBootApplication
@EnableJpaRepositories(
        basePackages = "com.example.ass_sof3021_ph19850.repository"
)
public class GenData implements CommandLineRunner {
    @Autowired
    private IAccountRepository iAccountRepository;
    @Autowired
    private IChucVuRepository iChucVuRepository;
    @Autowired
    private IMauSacRepository iMauSacRepository;
    @Autowired
    private INhaSanXuatRepository iNhaSanXuatRepository;
    @Autowired
    private IDongSanPhamRepository iDongSanPhamRepository;
    @Autowired
    private IChiTietSanPhamRepository iChiTietSanPhamRepository;
    @Autowired
    private ISizeRepository sizeRepository;


    @Override
    public void run(String... args) throws Exception {
        // Chức Vụ
        ChucVu chucVu = ChucVu.builder().ma("CV001").tenChucVu("USER").build();
        iChucVuRepository.save(chucVu);
        ChucVu chucVu1 = ChucVu.builder().ma("CV002").tenChucVu("ADMIN").build();
        iChucVuRepository.save(chucVu1);

        // account
        Account account = Account.builder()
                .maAccount("AC001").hoTen("Nguyễn Anh Thy").email("anhThy@gmail.com")
                .tenDangNhap("thynaAC001").matKhau(HashUtil.hash("12345678"))
                .chucVu(chucVu)
                .build();
        iAccountRepository.save(account);
        Account account1 = Account.builder()
                .maAccount("AC002").hoTen("Nguyễn Phương Anh").email("anhPhuong@gmail.com")
                .tenDangNhap("phuongnpAC002").matKhau(HashUtil.hash("123456"))
                .chucVu(chucVu)
                .build();
        iAccountRepository.save(account1);
        Account account2 = Account.builder()
                .maAccount("AC003").hoTen("Nguyễn Phúc Lâm").email("phuclam05122003@gmail.com")
                .tenDangNhap("lamnpAC003").matKhau(HashUtil.hash("lam123456"))
                .chucVu(chucVu1)
                .build();
        iAccountRepository.save(account2);

        // màu sắc
//        MauSac mauSac = MauSac.builder().maMauSac("MS001").mau("Kem").build();
//        iMauSacRepository.save(mauSac);
//        MauSac mauSac1 = MauSac.builder().maMauSac("MS002").mau("Trắng").build();
//        iMauSacRepository.save(mauSac1);
//        MauSac mauSac2 = MauSac.builder().maMauSac("MS003").mau("Đen").build();
//        iMauSacRepository.save(mauSac2);
//        MauSac mauSac3 = MauSac.builder().maMauSac("MS004").mau("Đen Trắng").build();
//        iMauSacRepository.save(mauSac2);
        // Nhà sản xuất
//        NhaSanXuat nhaSanXuat = NhaSanXuat.builder().maNhaSanXuat("NSX001").tenNhaSanXuat("Nike").build();
//        iNhaSanXuatRepository.save(nhaSanXuat);
//        NhaSanXuat nhaSanXuat1 = NhaSanXuat.builder().maNhaSanXuat("NSX002").tenNhaSanXuat("MLB").build();
//        iNhaSanXuatRepository.save(nhaSanXuat1);
//        NhaSanXuat nhaSanXuat2 = NhaSanXuat.builder().maNhaSanXuat("NSX003").tenNhaSanXuat("Converse").build();
//        iNhaSanXuatRepository.save(nhaSanXuat2);
//        NhaSanXuat nhaSanXuat3 = NhaSanXuat.builder().maNhaSanXuat("NSX004").tenNhaSanXuat("Vans").build();
//        iNhaSanXuatRepository.save(nhaSanXuat3);
        // Dòng sản phẩm Low-top, hight-top, Slip - on
//        DongSanPham dongSanPham = DongSanPham.builder().ma("DSP001").tenDongSanPham("Low-top").build();
//        iDongSanPhamRepository.save(dongSanPham);
//        DongSanPham dongSanPham1 = DongSanPham.builder().ma("DSP002").tenDongSanPham("Hight-top").build();
//        iDongSanPhamRepository.save(dongSanPham1);
//        DongSanPham dongSanPham2 = DongSanPham.builder().ma("DSP003").tenDongSanPham("Slip-on").build();
//        iDongSanPhamRepository.save(dongSanPham2);
        // Sản phẩm
//        ChiTietSanPham chiTietSanPham = ChiTietSanPham.builder()
//                .tenSanPham("Giày Converse Chuck Taylor All Star 1970s White – High Trắng Cổ cao")
//                .anhSanPham("converse-chuck-taylor-all-star-1970s-white-high.jpg")
//                .giaNhap(BigDecimal.valueOf(1400000))
//                .giaBan(BigDecimal.valueOf(1500000))
//                .soLuongTon(11).dongSanPham(dongSanPham1)
//                .mauSac(mauSac)
//                .nhaSanXuat(nhaSanXuat2)
//                .moTa("với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.")
//                .build();
//        iChiTietSanPhamRepository.save(chiTietSanPham);
//        ChiTietSanPham chiTietSanPham1 = ChiTietSanPham.builder()
//                .tenSanPham("Giày Sneaker MLB LA Big Ball Chunky A Nam Nữ")
//                .anhSanPham("MLB-LA-Big-Ball-Chunky-A.jpg")
//                .giaNhap(BigDecimal.valueOf(800000))
//                .giaBan(BigDecimal.valueOf(1500000))
//                .soLuongTon(10).dongSanPham(dongSanPham1)
//                .mauSac(mauSac2)
//                .nhaSanXuat(nhaSanXuat1)
//                .moTa("với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.")
//                .build();
//        iChiTietSanPhamRepository.save(chiTietSanPham1);
//        ChiTietSanPham chiTietSanPham2 = ChiTietSanPham.builder()
//                .tenSanPham("Giày Vans Caro Slip on Bản Cao Cấp")
//                .anhSanPham("vans-caro-slip-on-ban-cao-cap.jpg")
//                .giaNhap(BigDecimal.valueOf(1000000))
//                .giaBan(BigDecimal.valueOf(1500000))
//                .soLuongTon(4).dongSanPham(dongSanPham2)
//                .mauSac(mauSac3)
//                .nhaSanXuat(nhaSanXuat3)
//                .moTa("với thiết kế đẹp, tinh tế & màu sắc vô cùng dễ phối đồ. Vậy nên đôi giày này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.")
//                .build();
//        iChiTietSanPhamRepository.save(chiTietSanPham2);
        // Size
//        Size size = Size.builder().ma("SZ001").size(35).build();
//        sizeRepository.save(size);
//        Size size1 = Size.builder().ma("SZ001").size(36).build();
//        sizeRepository.save(size1);
//        Size size2 = Size.builder().ma("SZ001").size(37).build();
//        sizeRepository.save(size2);
//        Size size3 = Size.builder().ma("SZ001").size(38).build();
//        sizeRepository.save(size3);
//        Size size4 = Size.builder().ma("SZ001").size(39).build();
//        sizeRepository.save(size4);
//        Size size5 = Size.builder().ma("SZ001").size(40).build();
//        sizeRepository.save(size5);
//        Size size6 = Size.builder().ma("SZ001").size(41).build();
//        sizeRepository.save(size6);
//        Size size7 = Size.builder().ma("SZ001").size(42).build();
//        sizeRepository.save(size7);
//        Size size8 = Size.builder().ma("SZ001").size(43).build();
//        sizeRepository.save(size8);
//        Size size9 = Size.builder().ma("SZ001").size(44).build();
//        sizeRepository.save(size9);
//        Size size10 = Size.builder().ma("SZ001").size(45).build();
//        sizeRepository.save(size10);
    }
}
