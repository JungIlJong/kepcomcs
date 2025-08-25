package com.kepco.app.domain.progrm.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * 프로그램을 관리하기 위한 DTO 클래스
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
public class InsertProgrm {

    @NotBlank(message = "{progrm.insert.progrmNm.NotBlank}")
    private String progrmNm;

    @NotBlank(message = "프로그램URL은 필수입력 값입니다.")
    private String progrmUrl;

    private String progrmDc;

}
