package com.kepco.app.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import com.kepco.app.common.exception.StorageException;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.UUID;

@Slf4j
public abstract class FileUtils {

    public static String saveFile(String uploadPath, MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new StorageException("Failed to save empty file");
        }

        Path path = Paths.get(uploadPath);
        if (!Files.exists(path)) {
            Files.createDirectories(path);
        }

        String originalFileName = file.getOriginalFilename();
        String fileExtension = getFileExtension(originalFileName);
        String uniqueFileName = UUID.randomUUID() + fileExtension;
        Long fileSize = file.getSize();
        printSaveFileInfo(originalFileName, fileExtension, uniqueFileName, fileSize);

        Path filePath = path.resolve(uniqueFileName);
        try (InputStream inputStream = file.getInputStream()) {
            Files.copy(inputStream, filePath);
        }

        return uniqueFileName;
    }

    private static String getFileExtension(String fileName) {
        if (Objects.isNull(fileName) || !fileName.contains(".")) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    private static void printSaveFileInfo(String originalFileName, String fileExtension, String uniqueFileName, Long fileSize) {
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append("--------------- Save File Info --------------\n");
        sb.append(String.format("Original File Name: %s\n", originalFileName));
        sb.append(String.format("File Extension: %s\n", fileExtension));
        sb.append(String.format("Unique File Name: %s\n", uniqueFileName));
        sb.append(String.format("File Size: %s\n", formatFileSize(fileSize)));
        sb.append("---------------------------------------------\n");
        log.info("{}", sb);
    }

    private static String formatFileSize(Long fileSize) {
        if (fileSize < 1024) {
            return fileSize + " Bytes";
        } else if (fileSize < 1024 * 1024) {
            return String.format("%.2f KB", fileSize / 1024.0);
        } else if (fileSize < 1024 * 1024 * 1024) {
            return String.format("%.2f MB", fileSize / (1024.0 * 1024));
        } else if (fileSize < 1024L * 1024 * 1024 * 1024) {
            return String.format("%.2f GB", fileSize / (1024.0 * 1024 * 1024));
        } else {
            return String.format("%.2f TB", fileSize / (1024.0 * 1024 * 1024 * 1024));
        }
    }

}
