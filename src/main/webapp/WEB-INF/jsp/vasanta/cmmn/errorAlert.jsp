<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>

<c:set var="errorCode" value="${empty errorCode ? 500 : errorCode}"/>
<c:set var="errorTitle" value=""/>
<c:set var="errorMessage" value=""/>

<c:choose>
    <c:when test="${errorCode == 400}">
        <c:set var="errorTitle" value="잘못된 요청"/>
        <c:set var="errorMessage" value="잘못된 요청입니다."/>
    </c:when>
    <c:when test="${errorCode == 401}">
        <c:set var="errorTitle" value="인증 실패"/>
        <c:set var="errorMessage" value="인증에 실패하였습니다."/>
    </c:when>
    <c:when test="${errorCode == 403}">
        <c:set var="errorTitle" value="페이지 접근 제한"/>
        <c:set var="errorMessage" value="접근 제한된 페이지입니다."/>
    </c:when>
    <c:when test="${errorCode == 404}">
        <c:set var="errorTitle" value="페이지를 찾을 수 없음"/>
        <c:set var="errorMessage" value="원하시는 페이지의 주소가 잘못 입력되었거나,<br>
                                변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다."/>
    </c:when>
    <c:when test="${errorCode == 423}">
        <c:set var="errorTitle" value="권한 없음"/>
        <c:set var="errorMessage" value="페이지에 접근할 수 있는 권한이 없습니다."/>
    </c:when>
    <c:when test="${errorCode == 500}">
        <c:set var="errorTitle" value="페이지가 작동하지 않음"/>
        <c:set var="errorMessage" value="요청을 처리할 수 없습니다."/>
    </c:when>
    <c:otherwise>
        <c:set var="errorTitle" value="시스템 오류"/>
        <c:set var="errorMessage" value="일시적인 오류입니다. 잠시 후 다시 시도해 주세요.<br>
                                오류가 지속되는 경우 관리자에게 문의하세요."/>
    </c:otherwise>
</c:choose>

<html lang="ko" data-theme="light">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>

    <title>Error ${errorCode}</title>
    <link rel="stylesheet" href="/static/vendor/sneat/css/core.css"/>
    <link rel="stylesheet" href="/static/css/page-misc.css"/>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Error -->
                <div class="container-xxl container-p-y">
                    <div class="misc-wrapper">
                        <div class="card p-5 w-auto" style="min-width: 25%;">
                            <h1 class="mb-2 mx-2" style="line-height: 6rem; font-size: 4rem">
                                ${errorCode}
                            </h1>
                            <h4 class="mb-2 mx-2" style="font-size: clamp(1.5rem, 4vw, 1.5rem); white-space: nowrap;">⚠️ ${errorTitle}</h4>
                            <p class="mb-6 mx-2">${errorMessage}</p>

                            <c:choose>
                                <c:when test="${redirectTo == 'back'}">
                                    <button class="btn btn-primary" onclick="goBack();">이전으로</button>
                                </c:when>
                                <c:when test="${redirectTo == 'home' || empty redirectTo}">
                                    <a href="/index" class="btn btn-primary">홈으로</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${redirectTo}" class="btn btn-primary">돌아가기</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!-- /Error -->

                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
