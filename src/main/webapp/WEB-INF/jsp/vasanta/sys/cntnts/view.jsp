<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/vasanta/sys/include/header.jsp" %>
<div class="wrapper">

    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/nav.jsp" %>

    <!-- 콘텐츠 영역 start -->
    <div class="contentWrap">
        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/conTit.jsp" %>
        <div class="container">
            <jsp:include page="/WEB-INF/jsp/vasanta/cntnts/${id}.jsp"></jsp:include>
        </div>
    </div>
</div>

</body>
</html>

