package com.daonplace.vasanta.domain.ntt.dto;

import com.daonplace.vasanta.core.vo.ComSearchVO;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

public class SearchMberNtt {

    @Getter
    @Setter
    public static class Search extends ComSearchVO {
        private Long bbsId;
        private Long frstRgstId;
    }

    @Getter
    public static class NttInfo {
        private Long id;
        private Integer rdcnt;
        private String nttSj;
        private String wrterNm;
        private String thumbUrl;
        private String frstRegistDt;
        private boolean secret;
        private boolean notice;
        private boolean reply;
    }

    @Getter
    public static class NttDetail {
        private Long id;
        private Integer rdcnt;
        private String nttSj;
        private String nttCn;
        private String wrterNm;
        private String frstRegistDt;
        private boolean secret;
        private boolean notice;
        private boolean mine;
        private boolean anonymousWriter;
        private ReplyDetail replyDetail;
        private List<FileInfo> files;

        @JsonIgnore
        private String password;
    }

    public static class ReplyDetail {
        private Long id;
        private String nttSj;
        private String nttCn;
        private String wrterNm;
        private String frstRegistDt;
        private List<FileInfo> files;
    }

    @Getter
    public static class FileInfo {
        private Long id;
        private String name;
    }

    @Getter
    public static class PreNext {
        private Long prevId;
        private String prevSj;
        private String prevSecret;
        private Long nextId;
        private String nextSj;
        private String nextSecret;
    }

    @Getter
    public static class Password {
        private String password;
    }
}
