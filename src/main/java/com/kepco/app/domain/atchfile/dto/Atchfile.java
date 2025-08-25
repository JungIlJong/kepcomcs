package com.kepco.app.domain.atchfile.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

/**
 * 파일 DTO
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.30
 * @
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2024.03.28  김선홍         최초 생성
 * </pre>
 */
@Getter
@Setter
@Alias(value = "atchfile")
public class Atchfile {
    /**
     * 파일 ID
     */
    private String atchFileId;

    /**
     * 파일저장경로
     */
    private String fileStreCours;

    /**
     * 파일저장명
     */
    private String streFileNm;

    /**
     * 확장자
     */
    private String fileExtsn;

    /**
     * 파일명
     */
    private String orignlFileNm;

    /**
     * 파일크기
     */
    private Long fileSize;

    /**
     * 파일구분
     */
    private String fileSe;

    /**
     * 파일부모ID
     */
    private String upperId;


    /**
     * 최초등록자 ID
     */
    private String frstRegisterId;

    /**
     * 최초등록날짜
     */
    private LocalDateTime frstRegistDt;

    private Atchfile(String atchFileId, String fileStreCours, String streFileNm, String fileExtsn, String orignlFileNm, Long fileSize, String fileSe, String upperId, String frstRegisterId, LocalDateTime frstRegistDt) {
        this.atchFileId = atchFileId;
        this.fileStreCours = fileStreCours;
        this.streFileNm = streFileNm;
        this.fileExtsn = fileExtsn;
        this.orignlFileNm = orignlFileNm;
        this.fileSize = fileSize;
        this.fileSe = fileSe;
        this.upperId = upperId;
        this.frstRegisterId = frstRegisterId;
        this.frstRegistDt = frstRegistDt;
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private String atchFileId;
        private String fileStreCours;
        private String streFileNm;
        private String fileExtsn;
        private String orignlFileNm;
        private Long fileSize;
        private String fileSe;
        private String upperId;
        private String frstRegisterId;
        private LocalDateTime frstRegistDt;

        public Builder atchFileId(String atchFileId) {
            this.atchFileId = atchFileId;
            return this;
        }

        public Builder fileStreCours(String fileStreCours) {
            this.fileStreCours = fileStreCours;
            return this;
        }

        public Builder streFileNm(String streFileNm) {
            this.streFileNm = streFileNm;
            return this;
        }

        public Builder fileExtsn(String fileExtsn) {
            this.fileExtsn = fileExtsn;
            return this;
        }

        public Builder orignlFileNm(String orignlFileNm) {
            this.orignlFileNm = orignlFileNm;
            return this;
        }

        public Builder fileSize(Long fileSize) {
            this.fileSize = fileSize;
            return this;
        }

        public Builder fileSe(String fileSe) {
            this.fileSe = fileSe;
            return this;
        }

        public Builder upperId(String upperId) {
            this.upperId = upperId;
            return this;
        }

        public Builder frstRegisterId(String frstRegisterId) {
            this.frstRegisterId = frstRegisterId;
            return this;
        }

        public Builder frstRegistDt(LocalDateTime frstRegistDt) {
            this.frstRegistDt = frstRegistDt;
            return this;
        }

        public Atchfile build() {
            return new Atchfile(atchFileId, fileStreCours, streFileNm, fileExtsn, orignlFileNm, fileSize, fileSe, upperId, frstRegisterId, frstRegistDt);
        }
    }
}
