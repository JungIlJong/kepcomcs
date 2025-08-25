package com.kepco.app.domain.accessip.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

/**
 * 접근IP를 관리하기 위한 DTO 클래스
 * @author 기업부설연구소 박규영
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
 *   2024.03.28  박규영         최초 생성
 * </pre>
 */

@Getter
@Setter
@Alias(value = "xlsxAccessIp")
public class XlsxAccessIp {

    /**
     * 아이피주소
     */
    @JsonProperty("아이피주소")
    private String ipAdres;

    /**
     * 아이피설명
     */
    @JsonProperty("아이피설명")
    private String ipDc;

}
