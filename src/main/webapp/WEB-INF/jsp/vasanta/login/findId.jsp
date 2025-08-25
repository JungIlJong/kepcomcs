<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light"  dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/popular.js"></script>
    <script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/bootstrap5.js"></script>
    <script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/auto-focus.js"></script>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/@form-validation/form-validation.css"/>

    <title>아이디찾기</title>
    <script type="text/javascript">
        const success = function (data) {
            console.log(JSON.stringify(data));
            console.log("리턴 결과: ", data.mbrNm, data.id);
            let node = ``;
            if (data === 0) {
                node = `<h4 class="mb-1">조회결과가 없습니다.</h4>
                        <p class="mb-6">정보를 다시 한 번 확인해주세요.</p>

                        <div class="text-center">
                            <a href="/mber/support/findid/findId" class="d-flex justify-content-center">
                                <i class="icon-base bx bx-chevron-left scaleX-n1-rtl me-1"></i>
                                뒤로가기
                            </a>
                        </div>`;
            } else {
                node = `<h4 class="mb-1"><b>${'${data.mbrNm}'}님의 아이디는<br/>${'${data.id}'} 입니다.</b></h4>
                        <p class="mb-6">정보 보호를 위해 아이디의 일부만 보여집니다.</p>

                        <div class="mb-3">
                            <button type="button" class="btn btn-primary d-grid w-100" onclick="location.href = '/mber/support/login/login'">
                                로그인하기
                            </button>
                        </div>
                        <div class="mb-3">
                            <button type="button" class="btn btn-secondary d-grid w-100" onclick="location.href = '/mber/support/findpw/findPw'">
                                비밀번호 찾기
                            </button>
                        </div>`;
            }
            console.log(node);
            let contentBox = document.getElementById('contentBox');
            removeAllChild(contentBox);
            contentBox.insertAdjacentHTML('beforeend', node);
        }

        const fail = function (xhr, status, error) {
            alert('<spring:message code="fail.common.msg"/>');
            console.log(xhr + ", " + status + " : " + error)
        }
    </script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- SNB 네비게이션 start -->
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-nav.jsp" %>
        <!-- SNB 네비게이션 end -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Menu -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
                <!-- / Menu -->

                <!-- Content -->
                <div class="container-xxl">
                    <%--TODO Contents here--%>
                    <div class="authentication-wrapper authentication-basic container-p-y">
                        <div class="container-xxl">
                            <div class="authentication-inner row justify-content-center">
                                <div class="col-sm-8 col-md-6 col-lg-5 col-xl-5">
                                    <!-- Forgot Password -->
                                    <div class="card px-sm-6 px-0">
                                        <div class="card-body" id="contentBox">

                                            <h4 class="mb-1">아이디를 잊으셨나요? 🔒</h4>
                                            <p class="mb-6">계정 정보를 입력하시면 아이디를 찾을 수 있게 도와 드릴게요.</p>

                                            <form id="formAuthentication" class="mb-6" onsubmit="return false">
                                                <div class="mb-3 form-control-validation">
                                                    <label for="mbrNm" class="form-label">이름</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="mbrNm"
                                                        name="mbrNm"
                                                        placeholder=""
                                                        autofocus
                                                    />
                                                </div>
                                                <div class="mb-3 form-control-validation">
                                                    <label for="emlAddr" class="form-label">이메일</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="emlAddr"
                                                        name="emlAddr"
                                                        placeholder=""
                                                    />
                                                </div>
                                                <button class="btn btn-primary d-grid w-100" id="btnFindId">아이디 찾기</button>
                                            </form>
                                            <div class="text-center">
                                                <a href="/mber/support/login/login" class="d-flex justify-content-center">
                                                    <i class="icon-base bx bx-chevron-left scaleX-n1-rtl me-1"></i>
                                                    로그인으로 돌아가기
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Forgot Password -->
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Content end -->

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>

            </div>
            <!-- Content wrapper end -->
        </div>
        <!-- Layout container end -->
    </div>
</div>

<!-- script -->
<script type="text/javascript">
    // $(function () {
    //    document.getElementById('btnFindId').addEventListener('click', function () {
    //        const mbrNm = document.getElementById('mbrNm').value;
    //        if (isEmpty(mbrNm)) {
    //            alert('이름을 입력해주세요.');
    //            document.getElementById('mbrNm').focus();
    //            return;
    //        }
    //
    //        const emlAddr = document.getElementById('emlAddr').value;
    //        if (isEmpty(emlAddr)) {
    //            alert('이메일을 입력해주세요.');
    //            document.getElementById('emlAddr').focus();
    //            return;
    //        }
    //
    //         const data = {
    //             "mbrNm": mbrNm.trim(),
    //             "emlAddr": emlAddr.trim()
    //         }
    //
    //        console.log(data);
    //
    //         Ajax.post('/api/findId', success, fail, {data : JSON.stringify(data)});
    //     });
    // });

    // validation
    document.addEventListener('DOMContentLoaded', function (e) {
        (function () {
            const validationForm = document.getElementById("formAuthentication");
            const result = FormValidation.formValidation(validationForm, {
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
                            }
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap5: new FormValidation.plugins.Bootstrap5({
                        eleValidClass: '',
                        rowSelector: function (field, ele){
                            console.log("field: ", field, ", ele: ", ele);

                            return '.form-control-validation';
                        }
                    }),
                    autoFocus: new FormValidation.plugins.AutoFocus(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                },
                init: instance => {
                    instance.on('plugins.message.placed', function (e) {
                        if (e.element.parentElement.classList.contains('input-group')) {
                            e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                        }
                    });
                }
            }).on('core.form.valid', function () {
                console.log(validationForm);

                const mbrNm = validationForm.querySelector("#mbrNm")?.value;
                const emlAddr = validationForm.querySelector("#emlAddr")?.value;

                const data = {
                    "mbrNm": mbrNm,
                    "emlAddr": emlAddr
                }

                console.log(data);

                Ajax.post('/api/findId', success, fail, {data : JSON.stringify(data)});
            })

        })();
    })
</script>
</body>

</html>
