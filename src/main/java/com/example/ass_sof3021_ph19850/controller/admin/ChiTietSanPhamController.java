package com.example.ass_sof3021_ph19850.controller.admin;

import com.example.ass_sof3021_ph19850.entity.ChiTietSanPham;
import com.example.ass_sof3021_ph19850.entity.DongSanPham;
import com.example.ass_sof3021_ph19850.entity.MauSac;
import com.example.ass_sof3021_ph19850.entity.NhaSanXuat;
import com.example.ass_sof3021_ph19850.entity.Size;
import com.example.ass_sof3021_ph19850.service.IChiTietSanPhamService;
import com.example.ass_sof3021_ph19850.service.IDongSanPhamService;
import com.example.ass_sof3021_ph19850.service.IMauSacService;
import com.example.ass_sof3021_ph19850.service.INhaSanXuatService;
import com.example.ass_sof3021_ph19850.service.ISizeService;
import com.example.ass_sof3021_ph19850.utilities.UploadFileUtils;
import com.example.ass_sof3021_ph19850.utilities.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Controller
@RequestMapping(path = "/admin/san-pham")
public class ChiTietSanPhamController {
    @Autowired
    private ISizeService sizeService;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Autowired
    private IChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private INhaSanXuatService nhaSanXuatService;

    @Autowired
    private IMauSacService mauSacService;

    @Autowired
    private IDongSanPhamService dongSanPhamService;
    
    @Autowired
    private Validate validate;

    @GetMapping(value = "/list")
    public String listSanPhamPage(
            Model model,
            @RequestParam(name = "tenSanPham", required = false) String tenSanPham,
            @RequestParam(name = "currentPage", defaultValue = "1") Integer pageNumber
    ) {

        Page<ChiTietSanPham> page;
        if (tenSanPham == null || tenSanPham.isBlank()) {
            page = chiTietSanPhamService.pageInChiTietSanPham(pageNumber);
        } else {
            page = chiTietSanPhamService.findByNameContains(tenSanPham, pageNumber);
            if (page.isEmpty()) {
                model.addAttribute("err", "Không tìm thấy đối tượng");
            }
        }
        model.addAttribute("listsDongSP", dongSanPhamService.findAll());
        model.addAttribute("listsSize", sizeService.findAll());
        model.addAttribute("listNSX", nhaSanXuatService.findAll());

        model.addAttribute("listsChiTietSP", page.getContent());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("currentPage", pageNumber);

        return "admin/san-pham";
    }

    @GetMapping(value = "/view-add")
    public String viewAddSanPham(
            Model model
    ) {
        model.addAttribute("titile", "Thêm Mới");
        model.addAttribute("listNSX", nhaSanXuatService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listsDongSP", dongSanPhamService.findAll());
        model.addAttribute("listsSize", sizeService.findAll());

        return "admin/view-add";
    }

    @PostMapping(value = "/add")
    public String addSanPham(
            Model model,
            @RequestParam(name = "dongSanPham") DongSanPham dongSanPham,
            @RequestParam(name = "size") Size size,
            @RequestParam(name = "mauSac") MauSac mauSac,
            @RequestParam(name = "nhaSanXuat") NhaSanXuat nhaSanXuat,
            @RequestParam(name = "tenSanPham") String tenSanPham,
            @RequestParam(name = "soLuongTon") Integer soLuongTon,
            @RequestParam(name = "giaNhap") BigDecimal giaNhap,
            @RequestParam(name = "giaBan") BigDecimal giaBan,
            @RequestParam(name = "anhSanPham") MultipartFile uploadFile,
            @RequestParam(name = "moTa") String moTa
    ) {
        ChiTietSanPham chiTietSanPham = ChiTietSanPham.builder()
                .anhSanPham(uploadFile.getOriginalFilename())
                .mauSac(mauSac)
                .tenSanPham(tenSanPham)
                .dongSanPham(dongSanPham)
                .nhaSanXuat(nhaSanXuat)
                .soLuongTon(soLuongTon)
                .moTa(moTa).giaBan(giaBan)
                .giaNhap(giaNhap)
                .size(size)
                .ngayNhap(LocalDate.now())
                .soLuongTon(soLuongTon)
                .build();
        Map<String, String> listERR = validate.validChiTietSanPham(chiTietSanPham);
        if (!listERR.isEmpty()) {
            model.addAttribute("sp", chiTietSanPham);
            model.addAttribute("ERR", listERR);
            model.addAttribute("listNSX", nhaSanXuatService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listsDongSP", dongSanPhamService.findAll());
            model.addAttribute("listsSize", sizeService.findAll());

            return "admin/view-add";
        } else {
            uploadFileUtils.handerUpLoadFile(uploadFile);
            chiTietSanPhamService.save(chiTietSanPham);
            return "redirect:/admin/san-pham/list";
        }

    }

    @GetMapping(value = "/detail/{id}")
    public String detailSanPham(Model model, @PathVariable(name = "id") String id) {
        if (chiTietSanPhamService.findById(id).isPresent()) {
            model.addAttribute("titile", "Thông tin");
            model.addAttribute("listNSX", nhaSanXuatService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listsDongSP", dongSanPhamService.findAll());
            model.addAttribute("listsSize", sizeService.findAll());

            model.addAttribute("sp", chiTietSanPhamService.findById(id).get());
            return "admin/view-add";
        }
        return "admin/san-pham";
    }

    @GetMapping(value = "/delete/{id}")
    public String deleteSanPham(@PathVariable(name = "id") String id) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(id).get();
        chiTietSanPhamService.delete(chiTietSanPham);
        return "redirect:/admin/san-pham/list";
    }

    @GetMapping(value = "/view-update/{id}")
    public String viewUpdateSanPham(
            @PathVariable(name = "id") String id,
            Model model
    ) {
        ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(id).get();
        model.addAttribute("listNSX", nhaSanXuatService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listsDongSP", dongSanPhamService.findAll());
        model.addAttribute("listsSize", sizeService.findAll());

        model.addAttribute("sp", chiTietSanPham);
        return "admin/view-update";
    }

    @PostMapping(value = "/update/{id}")
    public String updateSanPham(
            Model model,
            @PathVariable(name = "id") String id,
            @RequestParam(name = "anhSanPham") MultipartFile uploadFile,
            @RequestParam(name = "dongSanPham") DongSanPham dongSanPham,
            @RequestParam(name = "mauSac") MauSac mauSac,
            @RequestParam(name = "size") Size size,
            @RequestParam(name = "nhaSanXuat") NhaSanXuat nhaSanXuat,
            @RequestParam(name = "tenSanPham") String tenSanPham,
            @RequestParam(name = "soLuongTon") Integer soLuongTon,
            @RequestParam(name = "giaNhap") BigDecimal giaNhap,
            @RequestParam(name = "giaBan") BigDecimal giaBan,
            @RequestParam(name = "moTa") String moTa

    ) {


        ChiTietSanPham chiTietSanPhamADD = ChiTietSanPham.builder()
                .tenSanPham(tenSanPham)
                .moTa(moTa.trim())
                .anhSanPham(String.valueOf(uploadFile.getOriginalFilename()))
                .soLuongTon(soLuongTon)
                .giaNhap(giaNhap)
                .giaBan(giaBan)
                .mauSac(mauSac)
                .dongSanPham(dongSanPham)
                .nhaSanXuat(nhaSanXuat)
                .size(size)
                .ngayNhap(LocalDate.now())
                .build();

        ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(id).get();

        if (chiTietSanPham == null) {
            uploadFileUtils.handerUpLoadFile(uploadFile);
            chiTietSanPhamService.save(chiTietSanPhamADD);
            System.out.println("Thêm mới thành công");
        } else {
            System.out.println("vào else rồi");
            if (uploadFile.isEmpty()) {
                chiTietSanPhamADD.setId(chiTietSanPham.getId());
                chiTietSanPhamADD.setAnhSanPham(chiTietSanPham.getAnhSanPham());
                System.out.println(chiTietSanPham.getAnhSanPham());
                chiTietSanPhamService.save(chiTietSanPhamADD);
                System.out.println("vào thằng không cập nhập lại ảnh rồi");
            } else {
                System.out.println("vào thằng cập nhập lại ảnh mới rồi");
                chiTietSanPhamADD.setId(chiTietSanPham.getId());
                chiTietSanPhamADD.setAnhSanPham(String.valueOf(uploadFile.getOriginalFilename()));
                uploadFileUtils.handerUpLoadFile(uploadFile);
                chiTietSanPhamService.save(chiTietSanPhamADD);
                System.out.println("vào thằng cập nhặp ảnh mới nhưng không dính valid rồi");
            }
        }
        return "redirect:/admin/san-pham/list";
    }

    @GetMapping("/search")
    public String search(
            Model model,
            @RequestParam(name = "nhaSanXuat", required = false) String nhaSanXuat,
            @RequestParam(required = false) List<String> dongSanPham,
            @RequestParam(name = "minPrice", required = false) BigDecimal minPrice,
            @RequestParam(name = "maxPrice", required = false) BigDecimal maxPrice
    ) {
        List<ChiTietSanPham> lists = chiTietSanPhamService.findAllByGiaBan(minPrice, maxPrice);
        if (nhaSanXuat != null) {
            lists = lists.stream()
                    .filter(p -> p.getNhaSanXuat().getId().equals(nhaSanXuat))
                    .collect(Collectors.toList());
        }

        List<ChiTietSanPham> listSearch = new ArrayList<>();
        if (dongSanPham != null) {
            for (String idDongSanPham : dongSanPham) {
                for (ChiTietSanPham chiTietSanPham : lists) {
                    if (chiTietSanPham.getDongSanPham().getId().equals(idDongSanPham)) {
                        listSearch.add(chiTietSanPham);
                    }
                }
            }
        }
        lists = listSearch;
        if (lists.isEmpty()) {
            return "redirect:/admin/san-pham/list";
        }
        model.addAttribute("listsDongSP", dongSanPhamService.findAll());
        model.addAttribute("listNSX", nhaSanXuatService.findAll());
        model.addAttribute("listsChiTietSP", lists);
        return "admin/san-pham";
    }

}
