<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script src="/js/getToken.js"></script>
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
<!-- Header -->
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/header.jsp" %>
<!-- Header end -->

<!-- Contents -->
<div class="wrapper sub container">

    <!-- SNB 네비게이션 start -->
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/nav.jsp" %>
    <!-- SNB 네비게이션 end -->

    <!-- 콘텐츠 영역 start -->
    <div class="contentWrap">
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/conTit.jsp" %>

        <form id="frmLogin" action="/mber/support/login-proc" method="post">
            <input type="hidden" name="<c:out value='${anticsrf.parameterName}'/>" value="<c:out value='${anticsrf.token}'/>">
            <div class="contentBox">
                <div class="loginBox">
                    <ul>
                        <li>
                            <input type="text" id="username" name="username" autocomplete='off' placeholder="아이디를 입력해주세요.">
                        </li>
                        <li>
                            <input type="password" id="password" name="password" autocomplete='off' placeholder="비밀번호를 입력해주세요.">
                        </li>
                    </ul>
                    <div class="buttonArea">
                        <a href="javascript:void(0);" id="btnLogin" class="btn"><spring:message code="button.login"/></a>
                    </div>
                    <div class="logtinEtc">
                        <a href="/mber/support/findid/findId"><spring:message code="button.findId"/></a>
                        <a href="/mber/support/findpw/findPw"><spring:message code="button.findPw"/></a>
                        <a href="/mber/support/join/join/step1"><spring:message code="button.signup"/></a>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- Contents end -->

</div>

<!-- Footer -->
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/footer.jsp" %>
<!-- Footer end -->


<!-- script -->
<script src="/mber/js/Component_1_0_231220.js"></script>
<script src="/mber/js/lib/slick.min.js"></script>
<script src="/mber/js/lib/flatpickr.js"></script>
<script src="/mber/js/lib/l10n_ko.js"></script>
<script src="/mber/js/lib/jstree.js"></script>
<script src="/mber/js/lib/jquery.selectric.min.js"></script>

<script src="/mber/js/common.js"></script>
<script src="/mber/js/content.js"></script>
<script type="text/javascript">
    $(function () {
        <%-- 로그인 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnLogin').addEventListener('click', function () {
            login();
        });

        document.getElementById('username').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                login();
            }
        });

        document.getElementById('password').addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                login();
            }
        });
    });
</script>
</body>

</html>
