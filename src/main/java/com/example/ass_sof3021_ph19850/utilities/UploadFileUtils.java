package com.example.ass_sof3021_ph19850.utilities;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class UploadFileUtils {
    public File handerUpLoadFile(MultipartFile uploadFile) {
        String folderPath = "D:\\SOF3021_SD17307_SU23\\ASS_SOF3021_PH19850\\src\\main\\resources\\static\\images";
        File myUpLoadFolder = new File(folderPath);
        // thiếu thì tạo
        if (!myUpLoadFolder.exists()) {
            myUpLoadFolder.mkdirs();
        }
        File saveFile = null;
        try { 
            // Lưu file vào thư mực
            saveFile = new File(myUpLoadFolder, uploadFile.getOriginalFilename());
            // chuyển dữ liệu sang file vừa tạo
            uploadFile.transferTo(saveFile);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return saveFile;
    }
}
