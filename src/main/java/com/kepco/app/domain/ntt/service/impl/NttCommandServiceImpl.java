package com.kepco.app.domain.ntt.service.impl;

import java.io.File;
import java.time.LocalDate;
import java.util.Objects;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kepco.app.core.security.util.UserDetailsUtil;
import com.kepco.app.domain.atchfile.dto.InsertAtchFile;
import com.kepco.app.domain.atchfile.service.FileService;
import com.kepco.app.domain.block.dto.BlockRequest;
import com.kepco.app.domain.block.service.BlockService;
import com.kepco.app.domain.ntt.dto.MberNtt;
import com.kepco.app.domain.ntt.mapper.NttCommandMapper;
import com.kepco.app.domain.ntt.service.NttCommandService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NttCommandServiceImpl extends EgovAbstractServiceImpl implements NttCommandService {

    private final NttCommandMapper nttCommandMapper;

    private final FileService fileService;

    private final PasswordEncoder passwordEncoder;

    private final BlockService blockService;

    private final String path = "ntt";

    @Override
    @Transactional
    public void insertNtt(MberNtt ntt) {
        if(Objects.isNull(ntt.getWrterNm())) {
            ntt.setFrstRegisterId(UserDetailsUtil.getMbrId());
            ntt.setWrterNm(UserDetailsUtil.getName());
        } else {
            ntt.setPassword(passwordEncoder.encode(ntt.getPassword()));
        }
        nttCommandMapper.insertNtt(ntt);
        fileUpload(ntt);
    }

    @Override
    @Transactional
    public void updateNtt(MberNtt ntt) {
        if(Objects.isNull(ntt.getWrterNm())) {
            ntt.setFrstRegisterId(UserDetailsUtil.getMbrId());
            ntt.setWrterNm(UserDetailsUtil.getName());
        } else {
            ntt.setPassword(passwordEncoder.encode(ntt.getPassword()));
        }
        nttCommandMapper.updateNtt(ntt);
        if(Objects.nonNull(ntt.getRemoveFileList())) {
            for(String fileId: ntt.getRemoveFileList()) {
                fileService.deleteAtchfileById(fileId);
            }
        }
        fileUpload(ntt);
    }

    @Override
    @Transactional
    public void incrementRdcnt(Long nttId) {
        nttCommandMapper.incrementRdcnt(nttId);
    }

    @Override
    @Transactional
    public void deleteNtt(Long nttId) {
        nttCommandMapper.deleteNtt(nttId);
    }

    private void fileUpload(MberNtt ntt) {

        if(Objects.isNull(ntt.getFiles())) {
            return;
        }

        if(ntt.getFiles().length == 0) {
            return;
        }

        if(ntt.getFiles()[0].isEmpty()) {
            return;
        }

        for(MultipartFile file: ntt.getFiles()) {
            StringBuilder sb = new StringBuilder();
            InsertAtchFile insertAtchFile = InsertAtchFile.builder()
                    .file(file)
                    .path(sb.append(path).append(File.separator).append("bbs").append(File.separator).append(ntt.getBbsId()).append(File.separator).append(LocalDate.now().toString()).toString())
                    .frstRegisterId((ntt.getFrstRegisterId() == null) ? ntt.getWrterNm() : ntt.getFrstRegisterId())
                    .upperId(ntt.getNttId())
                    .fileSe("ntt")
                    .build();
            String fileId = fileService.insertAtchfile(insertAtchFile);
            if(ntt.getThumbUrl() == null && file.getContentType().toLowerCase().startsWith("image")) {
                ntt.setThumbUrl(String.format("/file/%s", fileId));
            }
        }
    }

    @Override
    @Transactional
    public void blockNtt(Long nttId) {
        blockService.insertBlock(BlockRequest.builder()
                .targetId(nttId)
                .targetType(path)
                .blockerId(Long.valueOf(UserDetailsUtil.getMbrId()))
                .build());
    }
}
