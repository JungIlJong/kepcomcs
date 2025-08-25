<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light"  dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>비밀번호 재설정</title>
    <script type="text/javascript">
        let success = function (data) {
            alert('비밀번호가 재설정되었습니다.');
            goPage('/mber/support/login/login');
        }

        let fail = function (xhr, status, error) {
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
                                        <div class="card-body">

                                            <h4 class="mb-1">비밀번호 변경 🔒</h4>
                                            <p class="mb-6">새 비밀번호를 입력해 주세요.</p>

                                            <form id="frm" class="mb-6" onsubmit="return false">
                                                <div class="mb-3 form-control-validation">
                                                    <label for="pswd" class="form-label">새로운 비밀번호</label>
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
                                                </div>

                                                <div class="mb-3 form-password-toggle form-control-validation">
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

                                                <button class="btn btn-primary d-grid w-100" id="btnResetPw">비밀번호 재설정하기</button>
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
        </div>
    </div>
</div>

<!-- script -->
<script type="text/javascript">
    $(function () {
        document.getElementById('btnResetPw').addEventListener('click', function () {
            const pswd = document.getElementById('pswd').value;
            if (isEmpty(pswd)) {
                alert('새로운 비밀번호를 입력해주세요.');
                document.getElementById('pswd').focus();
                return;
            }

            const pswdConfirm = document.getElementById('pswdConfirm').value;
            if (isEmpty(pswdConfirm)) {
                alert('비밀번호 확인을 입력해주세요.');
                document.getElementById('pswdConfirm').focus();
                return;
            }

            if (pswd !== pswdConfirm) {
                alert('비밀번호와 비밀번호 확인이 다릅니다.');
                document.getElementById('pswdConfirm').focus();
                return;
            }

            const data = {
                "pswd": pswd
            };

            Ajax.post('/api/resetPw', success, fail, {data : JSON.stringify(data)});
        });
    });
</script>
</body>

</html>
