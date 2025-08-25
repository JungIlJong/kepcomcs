<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script type="text/javascript" src="/static/js/common/getToken.js"></script>
    <script type="text/javascript" src="/static/vendor/sneat/libs/bs-stepper/bs-stepper.js"></script>
    <script type="text/javascript" src="/static/vendor/sneat/libs/cleave-zen/cleave-zen.js"></script>

    <script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/popular.js"></script>
    <script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/bootstrap5.js"></script>
    <script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/auto-focus.js"></script>

    <title>회원가입</title>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/bs-stepper/bs-stepper.css" />
    <link rel="stylesheet" href="/static/pages/mber/css/page-auth.css" />
    <link rel="stylesheet" href="/static/vendor/sneat/libs/@form-validation/form-validation.css"/>

    <script type="text/javascript">
        <%-- 아이디 중복체크 시 Callback 함수 --%>
        let successDuplicate = function (data) {
            document.getElementById('chkDup').value = 'Y';
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '사용가능한 아이디입니다.',
                showCancel: false,
                onConfirm: function() {}
            });
        }

        <%-- 회원가입 성공 시 Callback 함수 --%>
        let successJoin = function (data) {
            document.getElementById('multiStepsForm').submit();
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            const responseJSON = xhr.responseJSON;

            if (!responseJSON) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="fail.common.msg"/>',
                    showCancel: false,
                    onConfirm: function() {}
                });
                return;
            }

            if (responseJSON.errorCode === 400001000) {
                document.getElementById('chkDup').value = 'N';
            }

            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: responseJSON.errorMessage,
                showCancel: false,
                onConfirm: function() {}
            });
        }

    </script>
</head>
<body>

<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- Navbar -->
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-nav.jsp" %>
        <!-- / Navbar -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Menu -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
                <!-- / Menu -->

                <!-- Content -->
                <div class="container-p-y">
                    <div class="container-xxl">
                        <%--                        multistep registration --%>
                        <div class="authentication-inner row justify-content-center">
                            <!--  Multi Steps Registration -->
                            <div class="loginbox">
                                <div class="card">
                                    <div class="card-body">
                                        <div id="multiStepsValidation" class="bs-stepper border-none mt-5">
                                            <div class="row">
                                                <div class="bs-stepper-header border-none pt-0 px-0">
                                                    <div class="step" data-target="#accountDetailsValidation">
                                                        <button type="button" class="step-trigger">
                                                            <span class="bs-stepper-circle"><i class="icon-base bx bx-home"></i></span>
                                                            <span class="bs-stepper-label">
                                                          <span class="bs-stepper-title">계정 정보 입력</span>
                                                        </span>
                                                        </button>
                                                    </div>
                                                    <div class="line">
                                                        <i class="icon-base bx bx-chevron-right icon-22px"></i>
                                                    </div>
                                                    <div class="step" data-target="#requiredInfoValidation">
                                                        <button type="button" class="step-trigger">
                                                            <span class="bs-stepper-circle"><i class="icon-base bx bx-user"></i></span>
                                                            <span class="bs-stepper-label">
                                                          <span class="bs-stepper-title">필수 정보 입력</span>
                                                        </span>
                                                        </button>
                                                    </div>
                                                    <div class="line">
                                                        <i class="icon-base bx bx-chevron-right icon-22px"></i>
                                                    </div>
                                                    <div class="step" data-target="#optionalInfoValidation">
                                                        <button type="button" class="step-trigger">
                                                            <span class="bs-stepper-circle"><i class="icon-base bx bx-detail"></i></span>
                                                            <span class="bs-stepper-label">
                                                          <span class="bs-stepper-title">선택 정보 입력</span>
                                                        </span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="bs-stepper-content px-0">
                                                <form id="multiStepsForm" onSubmit="return false;" action="step3" method="post">
                                                    <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">

                                                    <!-- Account Details -->
                                                    <div id="accountDetailsValidation" class="content">
                                                        <div class="content-header mb-6">
                                                            <h4>계정 생성</h4>
                                                            <p>계정 정보를 입력해 주세요.</p>
                                                        </div>
                                                        <div class="d-flex flex-column gap-2">
                                                            <div class="col-md-12 form-control-validation">
                                                                <label class="form-label" for="mberid">아이디</label>
                                                                <div class="input-group">
                                                                    <input
                                                                            type="text"
                                                                            name="mberid"
                                                                            id="mberid"
                                                                            class="form-control"
                                                                            autocomplete="one-time-code"
                                                                            maxlength="12"
                                                                            placeholder="아이디를 입력해주세요" />
                                                                    <button id="btnDuplicateId" class="btn btn-dark">중복 확인</button>
                                                                </div>
                                                            </div>
                                                            <div type="hidden" class="form-control-validation">
                                                                <input type="hidden" name="chkDup" id="chkDup" value="N">
                                                            </div>

                                                            <div class="col-mb-12 form-password-toggle form-control-validation">
                                                                <label class="form-label" for="pswd">비밀번호</label>
                                                                <div class="input-group input-group-merge">
                                                                    <input
                                                                            type="password"
                                                                            id="pswd"
                                                                            name="pswd"
                                                                            class="form-control"
                                                                            placeholder="비밀번호를 입력해주세요"
                                                                            autocomplete="off"
                                                                            maxlength="20"
                                                                            aria-describedby="pswdIcon" />
                                                                    <span class="input-group-text cursor-pointer" id="pswdIcon"
                                                                    ><i class="icon-base bx bx-hide"></i
                                                                    ></span>
                                                                </div>
                                                                <%--                                                                <div class="infoTxtBox">--%>
                                                                <%--                                                                    <p class="infoTxtItem">--%>
                                                                <%--                                                                        - 8자 이상 20자리 이하<br/>--%>
                                                                <%--                                                                        - 영문자, 숫자, 특수문자(~!@#$%^&*?)의 조합<br/>--%>
                                                                <%--                                                                        - 3자리 이상 반복 또는 연속된 문자 사용 금지 예) kkk, 321등사용금지--%>
                                                                <%--                                                                    </p>--%>
                                                                <%--                                                                </div>--%>

                                                            </div>
                                                            <div class="col-mb-12 form-password-toggle form-control-validation">
                                                                <label class="form-label" for="pswdConfirm">비밀번호 확인</label>
                                                                <div class="input-group input-group-merge">
                                                                    <input
                                                                            type="password"
                                                                            id="pswdConfirm"
                                                                            name="pswdConfirm"
                                                                            class="form-control"
                                                                            autocomplete="off"
                                                                            maxlength="20"
                                                                            placeholder="비밀번호를 다시 입력해주세요"
                                                                            aria-describedby="pswdConfirmIcon" />
                                                                    <span class="input-group-text cursor-pointer" id="pswdConfirmIcon">
                                                                        <i class="icon-base bx bx-hide"></i>
                                                                    </span>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex flex-column gap-2 mt-4 mb-4">
                                                               <div class="col-mb-12 form-control-validation">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" name="chk01" id="chk01" aria-label="Checkbox for following text input">
                                                                    <label class="form-check-label d-flex justify-content-between" for="chk01">
                                                                        [필수]서비스 이용약관 동의
                                                                        <a href="/mber/support/trmuse/cntnts/1/view" class="btn btn-sm btn-label-secondary" target="_blank">
                                                                        상세보기</a>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                              <div class="col-mb-12 form-control-validation">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" name="chk02" id="chk02" aria-label="Checkbox for following text input">
                                                                    <label class="form-check-label d-flex justify-content-between" for="chk02">
                                                                        [필수]개인정보 처리방침 동의
                                                                        <a href="/mber/support/prvplc/cntnts/2/view" class="btn btn-sm btn-label-secondary" target="_blank">상세보기</a>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            </div>

                                                            <div class="col-12 d-flex justify-content-between">
                                                                <button class="btn btn-label-secondary btn-prev" disabled>
                                                                    <i class="icon-base bx bx-left-arrow-alt icon-sm ms-sm-n2 me-sm-2"></i>
                                                                    <span class="align-middle d-sm-inline-block d-none">이전</span>
                                                                </button>
                                                                <button class="btn btn-primary btn-next">
                                                                    <span class="align-middle d-sm-inline-block d-none me-sm-2 me-0">다음</span>
                                                                    <i class="icon-base bx bx-right-arrow-alt icon-sm me-sm-n2"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Required Info -->
                                                    <div id="requiredInfoValidation" class="content">
                                                        <div class="content-header mb-6">
                                                            <h4>필수 정보</h4>
                                                            <p>필수 정보를 입력해 주세요.</p>
                                                        </div>
                                                        <div class="d-flex flex-column gap-2">
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="mbrNm">이름</label>
                                                                <input
                                                                        type="text"
                                                                        id="mbrNm"
                                                                        name="mbrNm"
                                                                        class="form-control"
                                                                        placeholder="이름을 입력해주세요"
                                                                        autocomplete="one-time-code"
                                                                        maxlength="20"
                                                                />
                                                            </div>
                                                            <div class="col-md-12 form-control-validation">
                                                                <label class="form-label" for="emlAddr">이메일</label>
                                                                <div class="input-group">
                                                                    <input
                                                                            type="email"
                                                                            name="emlAddr"
                                                                            id="emlAddr"
                                                                            class="form-control"
                                                                            autocomplete="one-time-code"
                                                                            placeholder="이메일을 입력해주세요"
                                                                    />
                                                                    <button id="btnSendVerification" type="button" class="btn btn-dark">인증코드 발송</button>
                                                                </div>
                                                                <!-- 이메일 유효성 검사 메시지를 위한 별도 영역 -->
                                                            </div>

                                                            <!-- 이메일 인증 코드 입력 필드 (기본적으로 숨김) -->
                                                            <div class="col-mb-12" id="verificationCodeArea" style="display:none;">
                                                                <label class="form-label" for="verificationCode">인증 코드</label>
                                                                <div class="input-group">
                                                                    <input
                                                                            type="text"
                                                                            id="verificationCode"
                                                                            class="form-control"
                                                                            placeholder="이메일로 발송된 인증 코드를 입력해주세요"
                                                                            maxlength="6"
                                                                    />
                                                                    <button id="btnVerifyCode" type="button" class="btn btn-primary">인증 확인</button>
                                                                </div>
                                                                <div class="mt-1">
                                                                    <small id="verificationMessage" class="text-muted">인증 코드는 30분간 유효합니다.</small>
                                                                </div>
                                                            </div>

                                                            <!-- 이메일 인증 상태 저장용 hidden 필드 -->
                                                            <input type="hidden" id="emailVerified" name="emailVerified" value="N">

                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="mblTelno">휴대폰 번호</label>
                                                                <input
                                                                        type="text"
                                                                        id="mblTelno"
                                                                        name="mblTelno"
                                                                        class="form-control"
                                                                        placeholder="'-' 없이 입력해주세요." />
                                                            </div>

                                                            <div class="col-12 d-flex justify-content-between mt-5">
                                                                <button class="btn btn-label-secondary btn-prev">
                                                                    <i class="icon-base bx bx-left-arrow-alt icon-sm ms-sm-n2 me-sm-2"></i>
                                                                    <span class="align-middle d-sm-inline-block d-none">이전</span>
                                                                </button>
                                                                <button class="btn btn-primary btn-next">
                                                                    <span class="align-middle d-sm-inline-block d-none me-sm-2 me-0">다음</span>
                                                                    <i class="icon-base bx bx-right-arrow-alt icon-sm me-sm-n2"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Optional Info -->
                                                    <div id="optionalInfoValidation" class="content">
                                                        <div class="content-header mb-6">
                                                            <h4>선택 정보</h4>
                                                            <p>사용자 선택 정보를 입력해 주세요.</p>
                                                        </div>
                                                        <!-- Custom plan options -->
                                                        <div class="row g-6">
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="fxno">팩스번호</label>
                                                                <input
                                                                        type="text"
                                                                        id="fxno"
                                                                        name="fxno"
                                                                        class="form-control"
                                                                        placeholder="'-' 없이 입력해주세요." />
                                                            </div>
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="zip">우편번호</label>
                                                                <input
                                                                        type="text"
                                                                        id="zip"
                                                                        name="zip"
                                                                        class="form-control multi-steps-pincode"
                                                                        maxlength="5"
                                                                />
                                                            </div>
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="addr">주소</label>
                                                                <input
                                                                        type="text"
                                                                        id="addr"
                                                                        name="addr"
                                                                        class="form-control"
                                                                        maxlength="100"
                                                                />
                                                            </div>
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="daddr">상세주소</label>
                                                                <input
                                                                        type="text"
                                                                        id="daddr"
                                                                        name="daddr"
                                                                        class="form-control"
                                                                        maxlength="100"
                                                                />
                                                            </div>

                                                            <div class="col-12 d-flex justify-content-between">
                                                                <button class="btn btn-label-secondary btn-prev">
                                                                    <i class="icon-base bx bx-left-arrow-alt icon-sm ms-sm-n2 me-sm-2"></i>
                                                                    <span class="align-middle d-sm-inline-block d-none">돌아가기</span>
                                                                </button>
                                                                <button class="btn btn-primary btn-submit" id="btnSave">회원가입</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- / Multi Steps Registration -->


                        </div>



                        <%--                        single page registration    --%>
                        <%--                            <div class="authentication-inner row justify-content-center">--%>
                        <%--                                <div class="col-sm-8 col-md-6 col-lg-5 col-xl-5">--%>
                        <%--                                    <div class="card px-sm-6 px-0">--%>
                        <%--                                        <div class="card-body">--%>

                        <%--                                            <form id="frmRegist" onSubmit="return false">--%>
                        <%--                                                <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">--%>
                        <%--                                                <input type="hidden" name="chkDup" id="chkDup" value="N">--%>

                        <%--                                                <div id="accountDetailsValidation" class="content">--%>
                        <%--                                                    <div class="content-header mb-6">--%>
                        <%--                                                        <h4 class="mb-0">계정 생성</h4>--%>
                        <%--                                                        <p class="mb-0">계정 정보를 입력해 주세요.</p>--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="id">아이디</label>--%>
                        <%--                                                        <div class="input-group mb-5">--%>
                        <%--                                                            <input--%>
                        <%--                                                                    type="text"--%>
                        <%--                                                                    name="id"--%>
                        <%--                                                                    id="id"--%>
                        <%--                                                                    class="form-control"--%>
                        <%--                                                                    autocomplete="one-time-code"--%>
                        <%--                                                                    maxlength="12"--%>
                        <%--                                                                    placeholder="" />--%>
                        <%--                                                            <button id="btnDuplicateId" class="btn btn-primary">중복 확인</button>--%>
                        <%--                                                        </div>--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3 form-password-toggle">--%>
                        <%--                                                        <label class="form-label" for="pswd">비밀번호</label>--%>
                        <%--                                                        <div class="input-group input-group-merge">--%>
                        <%--                                                            <input--%>
                        <%--                                                                    type="password"--%>
                        <%--                                                                    id="pswd"--%>
                        <%--                                                                    name="pswd"--%>
                        <%--                                                                    class="form-control"--%>
                        <%--                                                                    placeholder=""--%>
                        <%--                                                                    autocomplete="off"--%>
                        <%--                                                                    maxlength="20"--%>
                        <%--                                                                    aria-describedby="multiStepsConfirmPass2" />--%>
                        <%--                                                            <span class="input-group-text cursor-pointer" id="multiStepsConfirmPass2"--%>
                        <%--                                                            ><i class="icon-base bx bx-hide"></i--%>
                        <%--                                                            ></span>--%>
                        <%--                                                        </div>--%>
                        <%--                                                        <div class="infoTxtBox">--%>
                        <%--                                                            <p class="infoTxtItem">--%>
                        <%--                                                                - 8자 이상 20자리 이하<br/>--%>
                        <%--                                                                - 영문자, 숫자, 특수문자(~!@#$%^&*?)의 조합<br/>--%>
                        <%--                                                                - 3자리 이상 반복 또는 연속된 문자 사용 금지 예) kkk, 321등사용금지--%>
                        <%--                                                            </p>--%>
                        <%--                                                        </div>--%>

                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3 form-password-toggle">--%>
                        <%--                                                        <label class="form-label" for="pswdConfirm">비밀번호 확인</label>--%>
                        <%--                                                        <div class="input-group input-group-merge">--%>
                        <%--                                                            <input--%>
                        <%--                                                                    type="password"--%>
                        <%--                                                                    id="pswdConfirm"--%>
                        <%--                                                                    name="pswdConfirm"--%>
                        <%--                                                                    class="form-control"--%>
                        <%--                                                                    autocomplete="off"--%>
                        <%--                                                                    maxlength="20"--%>
                        <%--                                                                    placeholder=""--%>
                        <%--                                                                    aria-describedby="multiStepsPass2" />--%>
                        <%--                                                            <span class="input-group-text cursor-pointer" id="multiStepsPass2"--%>
                        <%--                                                            ><i class="icon-base bx bx-hide"></i--%>
                        <%--                                                            ></span>--%>
                        <%--                                                        </div>--%>
                        <%--                                                    </div>--%>

                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="mbrNm">이름</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="text"--%>
                        <%--                                                                id="mbrNm"--%>
                        <%--                                                                name="mbrNm"--%>
                        <%--                                                                class="form-control"--%>
                        <%--                                                                placeholder=""--%>
                        <%--                                                                autocomplete="one-time-code"--%>
                        <%--                                                                maxlength="20"--%>
                        <%--                                                        />--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="emlAddr">이메일</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="email"--%>
                        <%--                                                                name="emlAddr"--%>
                        <%--                                                                id="emlAddr"--%>
                        <%--                                                                class="form-control"--%>
                        <%--                                                                autocomplete="one-time-code"--%>
                        <%--                                                        />--%>
                        <%--                                                    </div>--%>

                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="mblTelno">휴대폰 번호</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="text"--%>
                        <%--                                                                id="mblTelno"--%>
                        <%--                                                                name="mblTelno"--%>
                        <%--                                                                class="form-control"--%>
                        <%--                                                                placeholder="'-' 없이 입력해주세요." />--%>
                        <%--                                                    </div>--%>

                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="fxno">팩스번호</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="text"--%>
                        <%--                                                                id="fxno"--%>
                        <%--                                                                name="fxno"--%>
                        <%--                                                                class="form-control"--%>
                        <%--                                                                placeholder="'-' 없이 입력해주세요." />--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="zip">우편번호</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="text"--%>
                        <%--                                                                id="zip"--%>
                        <%--                                                                name="zip"--%>
                        <%--                                                                class="form-control multi-steps-pincode"--%>
                        <%--                                                                maxlength="5" />--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="addr">주소</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="text"--%>
                        <%--                                                                id="addr"--%>
                        <%--                                                                name="addr"--%>
                        <%--                                                                class="form-control"--%>
                        <%--                                                                maxlength="100"--%>
                        <%--                                                        />--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <label class="form-label" for="daddr">상세주소</label>--%>
                        <%--                                                        <input--%>
                        <%--                                                                type="text"--%>
                        <%--                                                                id="daddr"--%>
                        <%--                                                                name="daddr"--%>
                        <%--                                                                class="form-control"--%>
                        <%--                                                                maxlength="100"--%>
                        <%--                                                        />--%>
                        <%--                                                    </div>--%>

                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <div class="input-group">--%>
                        <%--                                                            <div class="input-group-text border-transparent mt-0">--%>
                        <%--                                                                <input class="form-check-input mt-0" type="checkbox" name="chk01" id="chk01" required aria-label="Checkbox for following text input">--%>
                        <%--                                                            </div>--%>
                        <%--                                                            <label class="input-group-text border-transparent">--%>
                        <%--                                                                <a href="/mber/support/trmuse/cntnts/1/view" class="hoverTxt" target="_blank">--%>
                        <%--                                                                    [필수]서비스 이용약관 동의--%>
                        <%--                                                                    <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">--%>
                        <%--                                                                </a>--%>
                        <%--                                                            </label>--%>
                        <%--                                                        </div>--%>
                        <%--                                                    </div>--%>
                        <%--                                                    <div class="mb-3">--%>
                        <%--                                                        <div class="input-group">--%>
                        <%--                                                            <div class="input-group-text border-transparent mt-0">--%>
                        <%--                                                                <input class="form-check-input mt-0" type="checkbox" name="chk02" id="chk02" required aria-label="Checkbox for following text input">--%>
                        <%--                                                            </div>--%>
                        <%--                                                            <label class="input-group-text border-transparent">--%>
                        <%--                                                                <a href="/mber/support/prvplc/cntnts/2/view" class="hoverTxt" target="_blank">--%>
                        <%--                                                                    [필수]개인정보 처리방침 동의--%>
                        <%--                                                                    <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">--%>
                        <%--                                                                </a>--%>
                        <%--                                                            </label>--%>
                        <%--                                                        </div>--%>
                        <%--                                                    </div>--%>

                        <%--                                                    <div class="col-12 d-flex justify-content-between">--%>
                        <%--                                                        <button class="btn btn-label-secondary btn-prev">--%>
                        <%--                                                            <i class="icon-base bx bx-left-arrow-alt icon-sm ms-sm-n2 me-sm-2"></i>--%>
                        <%--                                                            <span class="align-middle d-sm-inline-block d-none">돌아가기</span>--%>
                        <%--                                                        </button>--%>
                        <%--                                                        <button type="submit" class="btn btn-success btn-next btn-submit" id="btnSave">회원가입</button>--%>
                        <%--                                                    </div>--%>
                        <%--                                                </div>--%>
                        <%--                                            </form>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                    </div>
                </div>

                <!--/ Content -->

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>

        <!--/ Layout container -->
    </div>
</div>

<%--<script src="/mber/js/Component_1_0_231220.js"></script>--%>
<%--<script src="/mber/js/lib/slick.min.js"></script>--%>
<%--<script src="/mber/js/lib/flatpickr.js"></script>--%>
<%--<script src="/mber/js/lib/l10n_ko.js"></script>--%>
<%--<script src="/mber/js/lib/jstree.js"></script>--%>
<%--<script src="/mber/js/lib/jquery.selectric.min.js"></script>--%>
<%--<script src="/mber/js/common.js"></script>--%>
<%--<script src="/mber/js/content.js"></script>--%>
<%--<script src="/js/common/validator.js"></script>--%>
<script type="text/javascript">
    $(function () {
        <%-- 중복체크튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateId').addEventListener('click', function () {
            const id = document.getElementById('mberid').value;

            if (isEmpty(id)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '아이디를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mberid').focus();
                    }
                });
                return;
            }

            if (!/^[a-z][a-z0-9]{5,11}$/.test(id)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '유효하지 않은 아이디입니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mberid').focus();
                    }
                });
                return;
            }

            const data = {
                id: id.trim()
            };

            Ajax.post('/api/duplicateId', successDuplicate, fail, {data: JSON.stringify(data)} );
        });

        <%--        &lt;%&ndash; 저장버튼 클릭 시 이벤트 &ndash;%&gt;--%>
        <%--        document.getElementById('btnSave').addEventListener('click', function () {--%>
        <%--            if (confirm('<spring:message code="confirm.common.join"/>')){--%>
        <%--                const data = {--%>
        <%--                    "id": id.trim(),--%>
        <%--                    "pswd": pswd,--%>
        <%--                    "mbrNm": mbrNm.trim(),--%>
        <%--                    "emlAddr": emlAddr.trim(),--%>
        <%--                    "mblTelno": mblTelno.trim(),--%>
        <%--                    "zip": zip,--%>
        <%--                    "addr": addr,--%>
        <%--                    "daddr": daddr,--%>
        <%--                    "dvcPushToken": dvcPushToken--%>
        <%--                };--%>

        <%--                Ajax.post('/api/join', successJoin, fail, {data: JSON.stringify(data)} );--%>
        <%--            }--%>
        <%--        });--%>
        console.log("이벤트 처리")
    });

    // Check selected custom option
    window.Helpers.initCustomOptionCheck();

    // Multi Steps Validation
    // --------------------------------------------------------------------
    document.addEventListener('DOMContentLoaded', function (e) {
        (function () {
            const stepsValidation = document.getElementById('multiStepsValidation');
            if (typeof stepsValidation !== undefined && stepsValidation !== null) {
                // Multi Steps form
                const stepsValidationForm = stepsValidation.querySelector('#multiStepsForm');
                // Form steps
                const stepsValidationFormStep1 = stepsValidationForm.querySelector('#accountDetailsValidation');
                const stepsValidationFormStep2 = stepsValidationForm.querySelector('#requiredInfoValidation');
                const stepsValidationFormStep3 = stepsValidationForm.querySelector('#optionalInfoValidation');
                // Multi steps next prev button
                const stepsValidationNext = [].slice.call(stepsValidationForm.querySelectorAll('.btn-next'));
                const stepsValidationPrev = [].slice.call(stepsValidationForm.querySelectorAll('.btn-prev'));

                // const multiStepsExDate = document.querySelector('.multi-steps-exp-date'),
                //     multiStepsCvv = document.querySelector('.multi-steps-cvv'),
                //     multiStepsMobile = document.querySelector('.multi-steps-mobile'),
                //     multiStepsPincode = document.querySelector('.multi-steps-pincode'),
                //     multiStepsCard = document.querySelector('.multi-steps-card');

                <%--// Expiry Date Mask--%>
                <%--if (multiStepsExDate) {--%>
                <%--    multiStepsExDate.addEventListener('input', event => {--%>
                <%--        multiStepsExDate.value = formatDate(event.target.value, {--%>
                <%--            date: true,--%>
                <%--            delimiter: '/',--%>
                <%--            datePattern: ['m', 'y']--%>
                <%--        });--%>
                <%--    });--%>
                <%--    registerCursorTracker({--%>
                <%--        input: multiStepsExDate,--%>
                <%--        delimiter: '/'--%>
                <%--    });--%>
                <%--}--%>

                <%--// CVV--%>
                <%--if (multiStepsCvv) {--%>
                <%--    multiStepsCvv.addEventListener('input', event => {--%>
                <%--        const cleanValue = event.target.value.replace(/\D/g, '');--%>
                <%--        multiStepsCvv.value = formatNumeral(cleanValue, {--%>
                <%--            numeral: true,--%>
                <%--            numeralPositiveOnly: true--%>
                <%--        });--%>
                <%--    });--%>
                <%--}--%>

                <%--// Mobile--%>
                <%--if (multiStepsMobile) {--%>
                <%--    multiStepsMobile.addEventListener('input', event => {--%>
                <%--        const cleanValue = event.target.value.replace(/\D/g, '');--%>
                <%--        multiStepsMobile.value = formatGeneral(cleanValue, {--%>
                <%--            blocks: [3, 4, 4],--%>
                <%--            delimiters: ['-', '-']--%>
                <%--        });--%>
                <%--    });--%>
                <%--    registerCursorTracker({--%>
                <%--        input: multiStepsMobile,--%>
                <%--        delimiter: '-'--%>
                <%--    });--%>
                <%--}--%>

                <%--// Pincode--%>
                <%--if (multiStepsPincode) {--%>
                <%--    multiStepsPincode.addEventListener('input', event => {--%>
                <%--        multiStepsPincode.value = formatNumeral(event.target.value, {--%>
                <%--            delimiter: '',--%>
                <%--            numeral: true--%>
                <%--        });--%>
                <%--    });--%>
                <%--}--%>

                <%--// Credit Card--%>
                <%--if (multiStepsCard) {--%>
                <%--    multiStepsCard.addEventListener('input', event => {--%>
                <%--        multiStepsCard.value = formatCreditCard(event.target.value);--%>
                <%--        const cleanValue = event.target.value.replace(/\D/g, '');--%>
                <%--        let cardType = getCreditCardType(cleanValue);--%>
                <%--        if (cardType && cardType !== 'unknown' && cardType !== 'general') {--%>
                <%--            document.querySelector('.card-type').innerHTML =--%>
                <%--                `<img src="${assetsPath}img/icons/payments/${cardType}-cc.png" height="20"/>`;--%>
                <%--        } else {--%>
                <%--            document.querySelector('.card-type').innerHTML = '';--%>
                <%--        }--%>
                <%--    });--%>
                <%--    registerCursorTracker({--%>
                <%--        input: multiStepsCard,--%>
                <%--        delimiter: ' '--%>
                <%--    });--%>
                <%--}--%>

                let validationStepper = new Stepper(stepsValidation, {
                    linear: true
                });

                console.log("check FormValidation: ", FormValidation);

                // Account details
                const multiSteps1 = FormValidation.formValidation(stepsValidationFormStep1, {
                    fields: {
                        chkDup: {
                            validators: {
                                identical: {
                                    compare: function () {
                                        return "Y";
                                    },
                                    message: '아이디 중복체크를 해 주세요.'
                                }
                            }
                        },
                        mberid: {
                            validators: {
                                notEmpty: {
                                    message: '아이디를 입력해 주세요.'
                                },
                                stringLength: {
                                    min: 6,
                                    max: 20,
                                    message: '아이디는 20자 이하로 입력해 주세요.'//The name must be more than 6 and less than 30 characters long'
                                },
                            }
                        },
                        pswd: {
                            validators: {
                                notEmpty: {
                                    message: '비밀번호를 입력해주세요.'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9~!@#$%^&*?]{8,20}$/,
                                    message: `- 8자 이상 20자리 이하</br>` +
                                            `- 영문자, 숫자, 특수문자(~!@#$%^&*?)의 조합</br>` +
                                        `- 3자리 이상 반복 또는 연속된 문자 사용 금지  예) kkk, 321등 사용 금지`
                                },

                            }
                        },
                        pswdConfirm: {
                            validators: {
                                notEmpty: {
                                    message: '비밀번호 확인을 입력해주세요.'
                                },
                                identical: {
                                    compare: function () {
                                        return stepsValidationFormStep1.querySelector('[name="pswd"]').value;
                                    },
                                    message: '비밀번호와 비밀번호 확인이 다릅니다.'
                                }
                            }
                        },
                        chk01: {
                            validators: {
                                notEmpty: {
                                    message: '서비스 이용약관에 동의해 주세요.'
                                }
                            }
                        },
                        chk02: {
                            validators: {
                                notEmpty: {
                                    message: '개인정보 처리방침에 동의해 주세요.'
                                }
                            }
                        }
                    },
                    plugins: {
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap5: new FormValidation.plugins.Bootstrap5({
                            // Use this for enabling/changing valid/invalid class
                            // eleInvalidClass: '',
                            eleValidClass: '',
                            rowSelector: function (field, ele){
                                return '.form-control-validation';
                            }
                        }),
                        autoFocus: new FormValidation.plugins.AutoFocus(),
                        submitButton: new FormValidation.plugins.SubmitButton()
                    },
                    init: instance => {
                        instance.on('plugins.message.placed', function (e) {
                            if (e.element.parentElement.classList.contains('input-group')) {
                                e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                            }
                        });
                    }
                }).on('core.form.valid', function () {
                    // Jump to the next step when all fields in the current step are valid
                    validationStepper.next();
                });

                // Personal info
                const multiSteps2 = FormValidation.formValidation(stepsValidationFormStep2, {
                    fields: {
                        mbrNm: {
                            validators: {
                                notEmpty: {
                                    message: '이름을 입력해 주세요.'
                                }
                            }
                        },
                        emlAddr: {
                            validators: {
                                notEmpty: {
                                    message: '이메일을 입력해 주세요.'
                                },
                                emailAddress: {
                                    message: '유효한 이메일 주소를 입력해주세요.'
                                }
                            }
                        },
                        verificationCode: {
                            validators: {
                                callback: {
                                    message: '인증코드를 입력해 주세요.',
                                    callback: function(input) {
                                        if (document.getElementById('emailVerified').value === 'Y') {
                                            return {
                                                valid: true,
                                            };
                                        }
                                        return {
                                            valid: input.value !== '',
                                        };
                                    }
                                }
                            }
                        },
                        mblTelno: {
                            validators: {
                                notEmpty: {
                                    message: '핸드폰 번호를 입력해 주세요.'
                                },
                                regexp: {
                                    regexp: /^01+[0-9]{8,9}$/,
                                    message: "유효하지 않은 핸드폰 번호입니다."
                                }
                            }
                        }
                    },
                    plugins: {
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap5: new FormValidation.plugins.Bootstrap5({
                            eleValidClass: '',
                            rowSelector: function (field, ele) {
                                return '.form-control-validation';
                            }
                        }),
                        autoFocus: new FormValidation.plugins.AutoFocus(),
                        submitButton: new FormValidation.plugins.SubmitButton()
                    },
                    init: instance => {
                        instance.on('plugins.message.placed', function (e) {
                            if (e.element.parentElement.classList.contains('input-group')) {
                                e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                            }
                        });
                    }
                }).on('core.form.valid', function() {
                    // Jump to the next step when all fields in the current step are valid
                    validationStepper.next();
                });

                // Social links
                const multiSteps3 = FormValidation.formValidation(stepsValidationFormStep3, {
                    fields: {
                        fxno: {

                        },
                        zip: {

                        },
                        addr: {

                        },
                        daddr: {

                        }
                    },
                    plugins: {
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap5: new FormValidation.plugins.Bootstrap5({
                            // Use this for enabling/changing valid/invalid class
                            // eleInvalidClass: '',
                            eleValidClass: '',
                            rowSelector: function (field, ele) {
                                // field is the field name
                                // ele is the field element
                                console.log("field: ", field, ", ele: ", ele);
                                return '.form-control-validation';
                            }
                        }),
                        autoFocus: new FormValidation.plugins.AutoFocus(),
                        submitButton: new FormValidation.plugins.SubmitButton()
                    },
                    init: instance => {
                        instance.on('plugins.message.placed', function (e) {
                            if (e.element.parentElement.classList.contains('input-group')) {
                                e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                            }
                        });
                    }
                }).on('core.form.valid', function () {
                    // You can submit the form
                    // stepsValidationForm.submit()
                    // or send the form data to server via an Ajax request
                    // To make the demo simple, I just placed an alert
                    console.log(stepsValidationForm);
//                    alert('가입되었습니다.');
                    // stepsValidationForm.submit();

                    // get datas from the form
                    const id = stepsValidationForm.querySelector("#mberid")?.value;
                    const pswd = stepsValidationForm.querySelector("#pswd")?.value;
                    const mbrNm = stepsValidationForm.querySelector("#mbrNm")?.value;
                    const emlAddr = stepsValidationForm.querySelector("#emlAddr")?.value;
                    const mblTelno = stepsValidationForm.querySelector("#mblTelno")?.value;
                    const fxno = stepsValidationForm.querySelector("#fxno")?.value;
                    const zip = stepsValidationForm.querySelector("#zip")?.value;
                    const addr = stepsValidationForm.querySelector("#addr")?.value;
                    const daddr = stepsValidationForm.querySelector("#daddr")?.value;
//                    const dvcPushToken = "";

                    // setup data for ajax request
                    const data = {
                        "id": id,
                        "pswd": pswd,
                        "mbrNm": mbrNm,
                        "emlAddr": emlAddr,
                        "mblTelno": mblTelno,
                        "fxno": fxno,
                        "zip": zip,
                        "addr": addr,
                        "daddr": daddr,
                        "dvcPushToken": dvcPushToken
                    }

                    console.log(data);

                    // send request
                    Ajax.post('/api/join', successJoin, fail, { data: JSON.stringify(data) });
                });

                console.log(stepsValidationNext, stepsValidationPrev);

                stepsValidationNext.forEach(item => {
                    console.log(item);
                    item.addEventListener('click', event => {
                        console.log("current Index: ", validationStepper._currentIndex)
                        // When click the Next button, we will validate the current step
                        switch (validationStepper._currentIndex) {
                            case 0: {
                                console.log(multiSteps1);
                                multiSteps1.validate();
                                break;
                            }
                            case 1:
                                multiSteps2.validate();
                                break;

                            case 2:
                                multiSteps3.validate();
                                break;

                            default:
                                break;
                        }
                    });
                });

                stepsValidationPrev.forEach(item => {
                    item.addEventListener('click', event => {
                        switch (validationStepper._currentIndex) {
                            case 2:
                                validationStepper.previous();
                                break;

                            case 1:
                                validationStepper.previous();
                                break;

                            case 0:

                            default:
                                break;
                        }
                    });
                });
            }
        })();
    });

    // 이메일 인증코드 발송 버튼 클릭 이벤트
    document.getElementById('btnSendVerification').addEventListener('click', function () {
        const emlAddr = document.getElementById('emlAddr').value;

        if (isEmpty(emlAddr)) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '이메일을 입력해주세요.',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('emlAddr').focus();
                }
            });
            return;
        }

        // 이메일 형식 검증
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailRegex.test(emlAddr)) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '유효한 이메일 주소를 입력해주세요.',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('emlAddr').focus();
                }
            });
            return;
        }

        const data = {
            emlAddr: emlAddr
        };

        // 인증코드 발송 API 호출
        Ajax.post('/api/emailVerification/sendCode', function (response) {
            if (response.success) {
                document.getElementById('verificationCodeArea').style.display = 'block';
                document.getElementById('verificationMessage').className = 'text-primary';
                document.getElementById('verificationMessage').textContent = '인증 코드가 발송되었습니다. 이메일을 확인해주세요.';
                
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '인증 코드가 발송되었습니다. 이메일을 확인해주세요.',
                    showCancel: false,
                    onConfirm: function() {}
                });
            } else {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '인증 코드 발송에 실패했습니다. 다시 시도해주세요.',
                    showCancel: false,
                    onConfirm: function() {}
                });
            }
        }, fail, {data: JSON.stringify(data)});
    });

    // 이메일 인증코드 확인 버튼 클릭 이벤트
    document.getElementById('btnVerifyCode').addEventListener('click', function () {
        const emlAddr = document.getElementById('emlAddr').value;
        const verificationCode = document.getElementById('verificationCode').value;

        if (isEmpty(verificationCode)) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '인증코드를 입력해주세요.',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('verificationCode').focus();
                }
            });
            return;
        }

        const data = {
            emlAddr: emlAddr,
            verificationCode: verificationCode
        };

        // 인증코드 검증 API 호출
        Ajax.post('/api/emailVerification/verify', function (response) {
            if (response.verified) {
                document.getElementById('emailVerified').value = 'Y';
                document.getElementById('verificationMessage').className = 'text-success';
                document.getElementById('verificationMessage').textContent = '이메일 인증이 완료되었습니다.';
                
                // 인증 완료 후 입력 필드 비활성화
                document.getElementById('verificationCode').disabled = true;
                document.getElementById('btnVerifyCode').disabled = true;
                document.getElementById('btnSendVerification').disabled = true;
                
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이메일 인증이 완료되었습니다.',
                    showCancel: false,
                    onConfirm: function() {}
                });
            } else {
                document.getElementById('verificationMessage').className = 'text-danger';
                document.getElementById('verificationMessage').textContent = '인증 코드가 일치하지 않습니다. 다시 확인해주세요.';
                
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '인증 코드가 일치하지 않습니다. 다시 확인해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('verificationCode').focus();
                    }
                });
            }
        }, fail, {data: JSON.stringify(data)});
    });
</script>
</body>
</html>
