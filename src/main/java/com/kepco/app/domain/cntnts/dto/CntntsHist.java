package com.kepco.app.domain.cntnts.dto;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

/**
 * 콘텐츠를 관리하기 위한 DTO
 *
 * @author 기업부설연구소 김선홍
 * @since 2024.03.28
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
@Alias(value = "cntntsHist")
public class CntntsHist {

    /**
     * 콘텐츠 이력 ID
     */
    private String cntntsHistId;

    /**
     * 콘텐츠 ID
     */
    private String cntntsId;

    /**
     * 콘텐츠명
     */
    private String cntntsNm;

    /**
     * 이력 코드
     */
    private String histSeCode;

    /**
     * 최종수정자 ID
     */
    private String lastUpdusrId;
}

