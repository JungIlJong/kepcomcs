<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>관리자 시스템 로그인</title>
</head>
<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Navbar -->
        <%--<%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-nav.jsp" %>--%>
        <!-- / Navbar -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Menu -->
                <%--<%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>--%>
                <!-- / Menu -->

                <!-- Content -->
                <div class="container-xxl">
                    <div class="authentication-wrapper authentication-basic container-p-y d-flex align-items-center justify-content-center min-vh-100">
                        <div class="authentication-inner w-100 row justify-content-center">
                            <div class="col-sm-8 col-md-6 col-lg-5 col-xl-5 mx-auto">
                                <div class="card px-sm-6 px-0">
                                    <div class="card-body">
                                        <div class="app-brand justify-content-center">
                                            <a href="index.html" class="app-brand-link gap-2">
                                        <span class="app-brand-logo demo">
<!--                                             <img src="/static/assets/images/logo_color.svg" alt="LOGO"> -->
                                            <img src="/resources/landing/images/main/logo.png" alt="LOGO">
                                        </span>
                                            </a>
                                        </div>

                                        <div class="mt-5 mb-10 text-center">
                                            <h4>Sign In Your account</h4>
                                        </div>

                                        <form id="frmLogin" method="post" action="/api/login" class="mb-6">
                                            <input type="hidden" name="<c:out value='${anticsrf.parameterName}'/>"
                                                   value="<c:out value='${anticsrf.token}'/>">

                                            <div class="mb-6">
                                                <label for="id" class="form-label">아이디</label>
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="id"
                                                        name="id"
                                                        placeholder="아이디를 입력하세요."
                                                        autocomplete="off"
                                                        maxlength="12"/>
                                            </div>

                                            <div class="mb-6">
                                                <label for="pswd" class="form-label">비밀번호</label>
                                                <div class="input-group input-group-merge">
                                                    <input
                                                            type="password"
                                                            id="pswd"
                                                            class="form-control"
                                                            name="pswd"
                                                            placeholder="비밀번호를 입력하세요."
                                                            autocomplete="off"
                                                            maxlength="20"/>
                                                    <span class="input-group-text cursor-pointer" id="btnEye">
                                                    <i class="icon-base bx bx-hide"></i></span>
                                                </div>
                                            </div>

                                            <div class="mb-6">
                                                <div id="loginErrorMsg" class="mb-4 text-danger small"
                                                     style="display:none;"></div>

                                                <button type="button" id="btnLogin"
                                                        class="btn btn-primary d-grid w-100">
                                                    <spring:message code="button.login"/>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--/ Content -->
                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>

        <!--/ Layout container -->

    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->


<!-- script -->
<script type="text/javascript">
    function validateLogin(id, pswd) {
        let errorMsg = document.getElementById('loginErrorMsg');

        if (isEmpty(id)) {
            errorMsg.innerText = '아이디를 입력해주세요.';
            errorMsg.style.display = 'block';
            document.getElementById('id').focus();
            return false;
        }

        if (isEmpty(pswd)) {
            errorMsg.innerText = '비밀번호를 입력해주세요.';
            errorMsg.style.display = 'block';
            document.getElementById('pswd').focus();
            return false;
        }
        return true;
    }

    function login() {
        let id = document.getElementById('id').value;
        let pswd = document.getElementById('pswd').value;
        if (validateLogin(id, pswd)) {
            let data = {
                'id': id,
                'pswd': pswd
            };

            Ajax.post('/api/login', success, fail, {data: JSON.stringify(data)});
        }
    }

    let success = function (data) {
        goPage('/sys/system/menu/mngrmenu/list');
    }

    let fail = function (xhr, status, error) {
        const responseJSON = xhr.responseJSON;

        if (!responseJSON) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false,
                onConfirm: function() {
                }
            });
            return;
        }

        switch (responseJSON.body.data.status) {
            case 'L':
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '계정이 잠금상태입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                break;
            case 'P':
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '계정이 신청상태입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                break;
            case 'B':
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '계정이 차단상태입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                break;
            case 'D':
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '계정이 탈퇴상태입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                break;
            case 'E':
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '계정이 만료상태입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                break;
            default:
                let errorMsg = document.getElementById('loginErrorMsg');
                errorMsg.innerText = '아이디 혹은 비밀번호가 틀립니다.';
                errorMsg.style.display = 'block';
                document.getElementById('id').focus();
                break;
        }
    }

    $(function () {
        document.getElementById('btnLogin').addEventListener('click', function () {
            login();
        });

        document.getElementById('id').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                login();
            }
        });

        document.getElementById('pswd').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                login();
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        document.getElementById('btnLogin').addEventListener('click', function () {
            login();
        });

        document.getElementById('id').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                login();
            }
        });

        document.getElementById('pswd').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                login();
            }
        });
    });

    $(function () {
        let pswd = document.getElementById('pswd');
        let btnEye = document.getElementById('btnEye');
        let icon = btnEye.querySelector('i');

        btnEye.addEventListener('click', function () {
            let isPswdVisible = pswd.type === 'text';

            pswd.type = (isPswdVisible) ? 'password' : 'text';
            icon.classList.toggle('bx-show', !isPswdVisible);
            icon.classList.toggle('bx-hide', isPswdVisible);
        });
    });
</script>
</body>
</html>
