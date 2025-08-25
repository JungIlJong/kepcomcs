<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>설정</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/header.jsp" %>
<div class="wrapper sub container" id="contents">
    <div class="contentWrap">
        <div class="contentBox">
            <div class="topBox">
                <div class="leftItem">
                    <a href="/mber/support/mypage/myinfo/mypage/myinfo">
                        <div class="userwrap">
                            <div class="profile"></div>
                            <div class="userInfo">
                                <p class="name"><c:out value="${name}"/></p>
<%--                                <p class="email">abcde@gmail.com</p>--%>
                            </div>
                        </div>
                        <p class="set-pf-btn"></p>
                    </a>
                </div>
                <button type="button" id="btnLogout" class="set-logout"><spring:message code="button.logout"/></button>
            </div>
            <div class="divideBold"></div>
            <ul class="set-list">
                <li>
                    <a>
                        <p><span><img src="/mber/assets/icon/App_Bar/alarm.svg" alt=""></span>앱 알림</p>
                        <div class="switchWrap"><input type="checkbox" checked /></div>
                    </a>
                </li>
                <li><a>
                    <p><span><img src="/mber/assets/icon/App_Bar/location.svg" alt=""></span>위치정보</p>
                    <div class="switchWrap"><input type="checkbox" checked /></div>
                </a></li>
<%--                <li><a><p><span><img src="/mber/assets/icon/App_Bar/leave.svg" alt=""></span>회원탈퇴</p></a></li>--%>
<%--                <li><a><p><span><img src="/mber/assets/icon/App_Bar/version.svg" alt=""></span>버전 정보</p>1.1.5</a></li>--%>
            </ul>

        </div>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/vasanta/mber/include/footer.jsp" %>

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
       const btnLogout = document.getElementById('btnLogout');
        btnLogout.addEventListener('click', function () {
            location.href="/mber/support/logout";
        });
    });
</script>
</body>
</html>
