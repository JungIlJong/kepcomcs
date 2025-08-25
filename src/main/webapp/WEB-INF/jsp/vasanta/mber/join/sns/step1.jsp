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
            alert('사용가능한 아이디입니다.');
        }

        <%-- 회원가입 성공 시 Callback 함수 --%>
        let successJoin = function (data) {
            document.getElementById('multiStepsForm').submit();
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            const responseJSON = xhr.responseJSON;

            if (!responseJSON) {
                alert('<spring:message code="fail.common.msg"/>');
                return;
            }

            if (responseJSON.errorCode === 400001000) {
                document.getElementById('chkDup').value = 'N';
            }

            alert(responseJSON.errorMessage);
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
                            <div class="d-flex col-lg-8 align-items-center justify-content-center">
                                <div class="card px-sm-6 px-4">
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
                                                            <h4 class="mb-0">계정 생성</h4>
                                                            <p class="mb-0">계정 정보를 입력해 주세요.</p>
                                                        </div>
                                                        <div class="row g-6">
                                                            <div type="hidden" class="form-control-validation">
                                                                <input type="hidden" name="chkDup" id="chkDup" value="N">
                                                            </div>
                                                            <div class="col-md-12 form-control-validation">
                                                                <label class="form-label" for="mberid">아이디</label>
                                                                <div class="input-group mb-5">
                                                                    <input
                                                                            type="text"
                                                                            name="mberid"
                                                                            id="mberid"
                                                                            class="form-control"
                                                                            autocomplete="one-time-code"
                                                                            maxlength="12"
                                                                            placeholder="" />
                                                                    <button id="btnDuplicateId" class="btn btn-primary">중복 확인</button>
                                                                </div>
                                                            </div>

                                                            <div class="col-mb-12 form-password-toggle form-control-validation">
                                                                <label class="form-label" for="pswd">비밀번호</label>
                                                                <div class="input-group input-group-merge">
                                                                    <input
                                                                            type="password"
                                                                            id="pswd"
                                                                            name="pswd"
                                                                            class="form-control"
                                                                            placeholder=""
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
                                                                            placeholder=""
                                                                            aria-describedby="pswdConfirmIcon" />
                                                                    <span class="input-group-text cursor-pointer" id="pswdConfirmIcon">
                                                                        <i class="icon-base bx bx-hide"></i>
                                                                    </span>
                                                                </div>
                                                            </div>

                                                            <div class="col-mb-12 form-control-validation">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" name="chk01" id="chk01" aria-label="Checkbox for following text input">
                                                                    <label class="form-check-label" for="chk01">
                                                                        <a href="/mber/support/trmuse/cntnts/1/view" class="hoverTxt" target="_blank">
                                                                            [필수]서비스 이용약관 동의
                                                                            <%--                                                                            <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">--%>
                                                                        </a>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-mb-12 form-control-validation">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" name="chk02" id="chk02" aria-label="Checkbox for following text input">
                                                                    <label class="form-check-label" for="chk02">
                                                                        <a href="/mber/support/prvplc/cntnts/2/view" class="hoverTxt" target="_blank">
                                                                            [필수]개인정보 처리방침 동의
                                                                            <%--                                                                            <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">--%>
                                                                        </a>
                                                                    </label>
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
                                                            <h4 class="mb-0">필수 정보</h4>
                                                            <p class="mb-0">필수 정보를 입력해 주세요.</p>
                                                        </div>
                                                        <div class="row g-6">
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="mbrNm">이름</label>
                                                                <input
                                                                        type="text"
                                                                        id="mbrNm"
                                                                        name="mbrNm"
                                                                        class="form-control"
                                                                        placeholder=""
                                                                        autocomplete="one-time-code"
                                                                        maxlength="20"
                                                                />
                                                            </div>
                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="emlAddr">이메일</label>
                                                                <input
                                                                        type="email"
                                                                        name="emlAddr"
                                                                        id="emlAddr"
                                                                        class="form-control"
                                                                        autocomplete="one-time-code"
                                                                />
                                                            </div>

                                                            <div class="col-mb-12 form-control-validation">
                                                                <label class="form-label" for="mblTelno">휴대폰 번호</label>
                                                                <input
                                                                        type="text"
                                                                        id="mblTelno"
                                                                        name="mblTelno"
                                                                        class="form-control multi-steps-mobile"
                                                                        placeholder="'-' 없이 입력해주세요." />
                                                            </div>

                                                            <div class="col-12 d-flex justify-content-between">
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
                                                            <h4 class="mb-0">선택 정보</h4>
                                                            <p class="mb-0">사용자 선택 정보를 입력해 주세요.</p>
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
                                                                        maxlength="5" />
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
                                                                <button class="btn btn-success btn-next btn-submit" id="btnSave">회원가입</button>
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
<script type="text/javascript">
    $(function () {
        <%-- 중복체크튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateId').addEventListener('click', function () {
            const id = document.getElementById('mberid').value;

            if (isEmpty(id)) {
                alert('아이디를 입력해주세요.');
                document.getElementById('mberid').focus();
                return;
            }

            if (!/^[a-z][a-z0-9]{5,11}$/.test(id)) {
                alert('유효하지 않은 아이디입니다.');
                document.getElementById('mberid').focus();
                return;
            }

            const data = {
                id: id.trim()
            };

            Ajax.post('/api/duplicateId', successDuplicate, fail, {data: JSON.stringify(data)} );
        });
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
                                    message: '유효한 이메일 주소가 아닙니다.'
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
                            // Use this for enabling/changing valid/invalid class
                            // eleInvalidClass: '',
                            eleValidClass: '',
                            rowSelector: function (field, ele) {
                                // field is the field name
                                // ele is the field element
                                return '.form-control-validation';
                            }
                        }),
                        autoFocus: new FormValidation.plugins.AutoFocus(),
                        submitButton: new FormValidation.plugins.SubmitButton()
                    }
                }).on('core.form.valid', function () {
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
                    console.log(stepsValidationForm);
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

</script>
</body>
</html>
