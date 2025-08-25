package com.kepco.app.domain.atchfile.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 생성 DTO
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
public class InsertAtchFile {

    /**
     * 파일저장경로
     */
    private String path;

    /**
     * 파일부모ID
     */
    private String upperId;

    /**
     * 최초등록자 ID
     */
    private String frstRegisterId;

    /**
     * 파일구분
     */
    private String fileSe;

    /**
     * 파일
     */
    private MultipartFile file;

    private InsertAtchFile() {
    }

    private InsertAtchFile(String path, String upperId, String frstRegisterId, String fileSe, MultipartFile file) {
        this.path = path;
        this.upperId = upperId;
        this.frstRegisterId = frstRegisterId;
        this.fileSe = fileSe;
        this.file = file;
    }

    public static Builder builder() {
        return new Builder();
    }

    public static class Builder {
        private String path;
        private String upperId;
        private String frstRegisterId;
        private String fileSe;
        private MultipartFile file;

        public Builder path(String path) {
            this.path = path;
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

        public Builder fileSe(String fileSe) {
            this.fileSe = fileSe;
            return this;
        }

        public Builder file(MultipartFile file) {
            this.file = file;
            return this;
        }

        public InsertAtchFile build() {
            return new InsertAtchFile(path, upperId, frstRegisterId, fileSe, file);
        }
    }


}
