package com.kepco.app.common;

import org.springframework.context.i18n.LocaleContextHolder;

import java.util.Locale;

public enum CommonErrorCode implements ErrorCode {

    /**
     * 공통 (000)
     */
    BAD_REQUEST(400, 400000000, "잘못된 요청입니다.", "Bad request"),
    UNAUTHORIZED(401, 401000000, "인증에 실패하였습니다.", "Unauthorized"),
    FORBIDDEN_REQUEST(403, 403000000, "허용되지 않은 요청입니다.", "Forbidden request"),
    NOT_FOUND(404, 404000000, "존재하지않는 정보입니다.", "Not found"),
    INTERNAL_SERVER_ERROR(500, 500000000, "일시적인 오류가 발생했습니다. 잠시 후 다시 시도해주세요.", "This is temporary error. Please try again in a few minutes."),


    /**
     * 회원 (001)
     */
    ALREADY_USE_ID(400, 400001000, "이미 사용중인 아이디입니다.", "This ID is already in use."),
    ALREADY_USE_EMAIL(400, 400002000, "이미 사용중인 이메일입니다.", "This Email is already in use."),

    /**
     * 로그인
     */
    PENDING(400, 400002000, "계정이 신청상태입니다.", "계정이 신청상태입니다."),
    EXPIRED(400, 400002001, "계정이 만료상태입니다.", "계정이 만료상태입니다."),
    DROPPED(400, 400002002, "계정이 탈퇴상태입니다.", "계정이 탈퇴상태입니다."),
    BLOCKED(400, 400002003, "계정이 차단상태입니다.", "계정이 차단상태입니다."),
    LOCKED(400, 400002004, "계정이 잠금상태입니다.", "계정이 잠금상태입니다."),
    UNAUTHORIZED_MEMBER(401, 401000001, "아이디 혹은 비밀번호가 틀립니다.", "Unauthorized member or invalid password"),
    LOGIN_FAIL_EXCEED_LIMIT(401, 401000003, "비밀번호 입력 오류가 5회 초과되어 계정이 잠겼습니다.\n관리자에게 문의 주세요.", "Login attempt limit exceeded. Account locked.")
    ;

    private final int statusCode;

    private final int errorCode;

    private final String errorMessageKo;

    private final String errorMessageEn;

    CommonErrorCode(int statusCode, int errorCode, String errorMessageKo, String errorMessageEn) {
        this.statusCode = statusCode;
        this.errorCode = errorCode;
        this.errorMessageKo = errorMessageKo;
        this.errorMessageEn = errorMessageEn;
    }

    @Override
    public int getStatusCode() {
        return statusCode;
    }

    @Override
    public int getErrorCode() {
        return errorCode;
    }

    @Override
    public String getErrorMessage() {
        return LocaleContextHolder.getLocale() == Locale.ENGLISH ? this.errorMessageEn : this.errorMessageKo;
    }

}
