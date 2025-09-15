package com.kepco.app.domain.ntt.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kepco.app.core.vo.ComSearchVO;

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
        private String startDt;
        private String endDt;
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
        private String bbsNm;
        private String startDt;
        private String endDt;
        private String nttStatus;
        private String nttReply;
        private String email;
        private String authorHp;
        private String opinionTitleHead;
        private String linkUrl;
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
        private Long atchFileId;
        private String orignlFileNm;
    }

    @Getter
    public static class PreNext {
        private Long nttId;
        private String nttSj;
        private String viewType;
    }

    @Getter
    public static class Password {
        private String password;
    }
}
