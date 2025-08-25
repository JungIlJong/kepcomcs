package com.kepco.app.domain.mbr.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

public class SaveMbr {

    @Getter
    @Setter
    public static class Report {
        /**
         * 사용자 ID
         */
        @NotNull
        private Long frstRgstId;
    }

    @Getter
    @Setter
    public static class Block {
        /**
         * 사용자 ID
         */
        @NotNull
        private Long frstRgstId;
    }
}
