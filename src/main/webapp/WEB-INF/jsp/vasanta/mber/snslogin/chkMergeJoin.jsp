<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script src="/static/js/common/getToken.js"></script>
    <title><c:out value="${menuTitle}"/></title>
</head>

<body>
<!-- Header -->
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-nav.jsp" %>
<!-- Header end -->

<!-- Contents -->
<div class="wrapper sub container">

    <!-- SNB 네비게이션 start -->
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
    <!-- SNB 네비게이션 end -->

    <!-- 콘텐츠 영역 start -->
    <div class="contentWrap">
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sub-title.jsp" %>

        <form name="mergeJoinForm" id="mergeJoinForm" action="" method="post">
            <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">
            <input type="hidden" id="email" name="email" value="<c:out value="${email}"/>">
            <input type="hidden" id="provider" name="provider" value="<c:out value="${provider}"/>">
            <input type="hidden" id="providerId" name="providerId" value="<c:out value="${providerId}"/>">
            <input type="hidden" id="mobile" name="mobile" value="<c:out value="${mobile}"/>">
            <input type="hidden" id="snsname" name="snsname" value="<c:out value="${snsname}"/>">

            <div class="contentBox">
                <c:choose>
                    <c:when test="${status eq 'A'}">
                        <div class="errorItem bgGray">
                            <img src="/mber/assets/image/login_error.png" alt="">
                            <b>가입승인 대기중입니다.</b>
                            <p>가입승인 대기중입니다.</p>
                        </div>
                    </c:when>
                    <c:when test="${status eq 'L'}">
                        <div class="errorItem bgGray">
                            <img src="/mber/assets/image/login_error.png" alt="">
                            <b>계정이 잠금상태입니다.</b>
                            <p>계정이 잠금상태입니다.<br/>
                                고객센터로 문의하시기 바랍니다.
                            </p>
                        </div>
                    </c:when>
                    <c:when test="${status eq 'B'}">
                        <div class="errorItem bgGray">
                            <img src="/mber/assets/image/login_error.png" alt="">
                            <b>계정 이용이 차단되었습니다.</b>
                            <p>
                                차단을 해제하고 싶으시면<br />
                                고객센터로 문의하시기 바랍니다.
                            </p>
                        </div>
                    </c:when>
                    <c:when test="${status eq 'D'}">
                        <div class="errorItem bgGray">
                            <img src="/mber/assets/image/login_error.png" alt="">
                            <b>탈퇴한 사용자입니다.</b>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div>
                            <span>${provider} 계정으로 가입된 회원이 없습니다.</span>
                            <span>이미 가입된 일반회원 계정과 연동을 원하시면 계정 아이디와 비밀번호를 입력하신 후 '기존 계정과 연동'버튼을 눌러주세요.</span><br>
                            <span>처음으로 회원가입을 하시거나, 새로운 계정을 원하시면 '신규 회원가입'버튼을 눌러주세요.</span>
                        </div>
                        <div class="loginBox">
                            <ul>
                                <li>
                                    <input type="text" id="username" name="username" autocomplete='off' placeholder="아이디를 입력하세요.">
                                </li>
                                <li>
                                    <input type="password" id="password" name="password" autocomplete='off' placeholder="비밀번호를 입력하세요.">
                                </li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
        <div class="buttonArea bdArea">
            <a href="javascript:void(0);" id="btnLogin" class="btn">기존 계정과 연동</a>
            <a href="javascript:void(0);" id="snsLogin" class="btn">신규 회원가입</a>
        </div>
    </div>
    <!-- Contents end -->
</div>

<!-- Footer -->
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
<!-- Footer end -->

<script type="text/javascript">
    $(document).ready(function () {

        let params = new URLSearchParams(document.location.search);
        let status = params.get("status");
        let failCnt = params.get("failCnt");

        if (status === 'N') {
            alert('아이디 혹은 패스워드를 확인해주세요.');
        }

        if (status === 'C' && !isEmpty(failCnt)) {
            alert(failCnt + "번 틀리셨습니다.\n" + (5 - Number(failCnt)) + "번 더 틀리면 계정이 잠금처리됩니다.");
        }

        // 기존 계정과 연동
        $('#btnLogin').on('click', function () {
            let username = $('#username').val();
            if (isEmpty(username)) {
                alert('<spring:message code="errors.required" arguments="아이디"/>');
                $('#username').focus();
                return;
            }

            let password = $('#password').val();
            if (isEmpty(password)) {
                alert('<spring:message code="errors.required" arguments="비밀번호"/>');
                $('#password').focus();
                return;
            }
            let form = document.mergeJoinForm;
            form.action = "/api/snslogin/snslogin/mergeAccount.vst";
            form.submit();
        });

        // 소셜 신규가입
        $('#snsLogin').on('click', function () {
            let form = document.mergeJoinForm;
            form.action = "/mber/support/snslogin/snslogin/join.vst";
            form.submit();
        });

        <c:choose>
            <c:when test="${mergeSuccess == 'Y'}">
                alert('연동이 완료되었습니다. 로그인 페이지로 이동합니다.');
                location.href="/mber/support/snslogin/snslogin/login.vst";
            </c:when>
            <c:when test="${mergeSuccess == 'N'}">
                alert("${message}");
            </c:when>
        </c:choose>

        $('#password').on('keyup', function (key) {
            if(key.keyCode != '13') {
                return;
            }

            let username = $('#username').val();
            if (isEmpty(username)) {
                alert('<spring:message code="errors.required" arguments="아이디"/>');
                $('#username').focus();
                return;
            }

            let password = $('#password').val();
            if (isEmpty(password)) {
                alert('<spring:message code="errors.required" arguments="비밀번호"/>');
                $('#password').focus();
                return;
            }

            let form = document.mergeJoinForm;
            form.action = "/api/snslogin/snslogin/mergeAccount.vst";
            form.submit();
        });
    });

</script>
</body>

</html>

