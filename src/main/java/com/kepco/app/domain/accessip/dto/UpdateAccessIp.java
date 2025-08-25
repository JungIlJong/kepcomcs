package com.kepco.app.domain.accessip.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

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
public class UpdateAccessIp {

    /**
     * 아이피ID
     */
    @Size(max = 255, min = 1, message = "{ip.ipAdres.max}")
    @NotBlank(message = "{ip.update.ipAdres.notblank}")
    private String ipId;

    /**
     * 아이피주소
     */
    @Size(max = 255, min = 1, message = "{ip.ipAdres.max}")
    @Pattern(regexp = "^([0-9]{1,3}\\.){3}[0-9]{1,3}(/([0-9]|[1-2][0-9]|3[0-2]))?$", message = "{ip.insert.ipAdres.notValid}")
    @NotBlank(message = "{ip.update.ipAdres.notblank}")
    private String ipAdres;

    /**
     * 아이피설명
     */
    @Size(max = 255, min = 0, message = "{ip.ipDc.max}")
    private String ipDc;

}
