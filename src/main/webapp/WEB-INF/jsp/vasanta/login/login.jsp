<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script src="/static/js/common/getToken.js"></script>
    <title>로그인</title>
    <script type="text/javascript">
        function validateLogin(username, password) {
            if (isEmpty(username)) {
                alert('아이디를 입력해주세요.');
                document.getElementById('username').focus();
                return false;
            }

            if (isEmpty(password)) {
                alert('비밀번호를 입력해주세요.');
                document.getElementById('password').focus();
                return false;
            }

            return true;
        }

        function login() {
            let username = document.getElementById('username').value;
            let password = document.getElementById('password').value;
            if (validateLogin(username, password)) {
                let data = {
                    'id': username,
                    'pswd': password,
                    'dvcPushToken': dvcPushToken
                };

                Ajax.post('/api/login', success, fail, {data: JSON.stringify(data)});
            }
        }

        function jwtLogin() {
            let username = document.getElementById('username').value;
            let password = document.getElementById('password').value;
            let rememberMe = document.getElementById('rememberMe').checked;
            if (validateLogin(username, password)) {
                let data = {
                    username, password, dvcPushToken, rememberMe
                };

                Ajax.post('/api/v1/login', successJwt, jwtFail, {data: JSON.stringify(data)});
            }
        }

        let successJwt = (result) => {
            console.log(result)
            const tokenParts = result.accessToken.split('.');
            if (tokenParts.length === 3) {
                const payload = JSON.parse(atob(tokenParts[1]));
                if (payload.exp) {
                    const expiresAt = payload.exp * 1000; // JS는 밀리초 단위이므로 변환
                    localStorage.setItem('access_time', expiresAt.toString());
                }
            }
            goPage('/index');
        }


        let jwtFail = (result) => {
            customAlert({title: result.responseJSON.errorMessage, showCancel: false});
        }

        let success = function (data) {
            goPage('/index');
        }

        let fail = function (xhr, status, error) {
            const responseJSON = xhr.responseJSON;

            if (!responseJSON) {
                alert('<spring:message code="fail.common.msg"/>');
                return;
            }

            switch (responseJSON.body.data.status) {
                case 'L':
                    alert('계정이 잠금상태입니다.');
                    break;

                case 'P':
                    alert('계정이 신청상태입니다.');
                    break;

                case 'B':
                    alert('계정이 차단상태입니다.');
                    break;

                case 'D':
                    alert('계정이 탈퇴상태입니다.');
                    break;

                case 'E':
                    alert('계정이 만료상태입니다.');
                    break;

                default:
                    alert('아이디 혹은 비밀번호가 틀립니다.');
                    break;
            }
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
                <div class="authentication-wrapper authentication-basic container-p-y">
                        <div class="container-xxl">
                            <div class="authentication-inner row justify-content-center">
                                <div class="col-sm-8 col-md-6 col-lg-5 col-xl-5">
                                    <div class="card px-sm-6 px-4">
                                        <div class="card-body">

                                            <h4 class="mb-1">로그인이 필요합니다 👋</h4>
                                            <p class="mb-4">아이디와 비밀번호를 입력해주세요.</p>

                                            <!-- 로그인 폼 -->
                                            <form id="frmLogin" action="/mber/support/login-proc" method="post"
                                                  class="mb-4">
                                                <input type="hidden" name="<c:out value='${anticsrf.parameterName}'/>"
                                                       value="<c:out value='${anticsrf.token}'/>">

                                                <!-- 아이디 -->
                                                <div class="mb-3">
                                                    <label for="username" class="form-label">아이디</label>
                                                    <input type="text" id="username" name="username"
                                                           class="form-control" placeholder="아이디를 입력해주세요."
                                                           autocomplete="off"/>
                                                </div>

                                                <!-- 비밀번호 -->
                                                <div class="mb-3 form-password-toggle">
                                                    <label for="password" class="form-label">비밀번호</label>
                                                    <div class="input-group input-group-merge">
                                                        <input type="password" id="password" name="password"
                                                               class="form-control" placeholder="비밀번호를 입력해주세요."
                                                               autocomplete="off"/>
                                                        <span class="input-group-text cursor-pointer"><i
                                                                class="bx bx-hide"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-check form-switch mb-2">
                                                    <input class="form-check-input" type="checkbox" id="rememberMe" />
                                                    <label class="form-check-label" for="rememberMe">자동 로그인</label>
                                                </div>

                                                <!-- 로그인 버튼 -->
                                                <div class="mb-3">
                                                    <button type="button" id="btnLogin"
                                                            class="btn btn-primary d-grid w-100">
                                                        <spring:message code="button.login"/>
                                                    </button>
                                                </div>
                                                <!-- 하단 링크 -->
                                                <div class="text-center mt-3">
                                                    <a href="/mber/support/findid/findId" class="text-body small mx-2">아이디
                                                        찾기</a>
                                                    <span class="text-muted">|</span>
                                                    <a href="/mber/support/findpw/findPw" class="text-body small mx-2">비밀번호
                                                        찾기</a>
                                                    <span class="text-muted">|</span>
                                                    <a href="/mber/support/join/join/step1"
                                                       class="text-body small mx-2">회원가입</a>
                                                </div>

                                                <div class="divider my-6">
                                                    <div class="divider-text">or</div>
                                                </div>

                                                <div class="d-flex justify-content-center">
                                                    <a href="/oauth2/authorization/naver" class="btn btn-sm btn-icon me-1_5" style="padding: 0; overflow: hidden;">
                                                        <img src="/static/assets/images/login/naver.png" alt="Naver Login" style="width: 100%; height: 100%; object-fit: cover;">
                                                    </a>

<%--                                                    <a href="/oauth2/authorization/kakao" class="btn btn-sm btn-icon me-1_5" style="padding: 0; overflow: hidden;">--%>
<%--                                                        <img src="/static/assets/images/login/kakao.png" alt="Kakao Login" style="width: 100%; height: 100%; object-fit: cover;">--%>
<%--                                                    </a>--%>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
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

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->

<!-- script -->
<script type="text/javascript">
    $(function () {
        <%-- 로그인 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnLogin').addEventListener('click', function () {
            jwtLogin();
        });

        document.getElementById('username').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                jwtLogin();
            }
        });

        document.getElementById('password').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                jwtLogin();
            }
        });
    });
</script>
</body>

</html>
