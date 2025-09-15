package com.kepco.app.domain.ntt.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

public class SaveMberNtt {

    @Getter
    @Setter
    public static class Create {
        /**
         * 게시판 ID
         */
        @NotBlank
        private String bbsId;

        /**
         * 게시글 제목
         */
        @Size(max = 2000, message = "{ntt.nttSj.max}")
        @NotBlank(message = "{ntt.nttSj.notblank}")
        private String nttSj;

        /**
         * 게시글 내용
         */
        @NotBlank(message = "{ntt.nttCn.notblank}")
        private String nttCn;

        /**
         * 비밀글 여부
         */
        private String secretAt;

        /**
         * 사용 여부
         */
        private String useAt;

        /**
         * 작성자명
         */
        private String wrterNm;

        /**
         * 비밀번호
         */
        private String password;

        /**
         * 썸네일 URL
         */
        private String thumbUrl;

        private String googleToken;
        /**
         * 첨부파일
         */
        private List<MultipartFile> files;
    }

    @Getter
    @Setter
    public static class Update {
        /**
         * 게시글 ID
         */
        @NotNull
        private Long nttId;

        /**
         * 게시판 ID
         */
        @NotBlank
        private String bbsId;

        /**
         * 게시글 제목
         */
        @NotBlank
        private String nttSj;

        /**
         * 게시글 내용
         */
        @NotBlank
        private String nttCn;

        /**
         * 비밀글 여부
         */
        private String secretAt;

        /**
         * 사용 여부
         */
        private String useAt;

        /**
         * 썸네일 URL
         */
        private String thumbUrl;

        /**
         * 작성자명
         */
        private String wrterNm;

        /**
         * 비밀번호
         */
        private String password;


        private String confirmPassword;

        /**
         * 첨부파일
         */
        private MultipartFile[] files;

        /**
         * 삭제 파일 ID 목록
         */
        private List<String> removeFileList;
    }

    @Getter
    public static class Delete {
        private Long nttId;
        private String password;
    }

    @Getter
    @Setter
    public static class Report {
        /**
         * 게시글 ID
         */
        @NotNull
        private Long nttId;
    }

    @Getter
    @Setter
    public static class Block {
        /**
         * 게시글 ID
         */
        @NotNull
        private Long nttId;
    }
}
