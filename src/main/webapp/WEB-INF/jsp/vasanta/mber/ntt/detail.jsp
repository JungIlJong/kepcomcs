<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>Vasanta - <c:out value="${bbs.bbsNm}" /></title>
    <link rel="stylesheet" href="/static/vendor/sneat/css/core.css" />
    <link rel="stylesheet" href="/static/vendor/sneat/libs/pickr/pickr-themes.css" />
    <link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css" />
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

                <%-- 페이지 타이틀 영역(S) --%>
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sub-title.jsp" %>
                <%-- 페이지 타이틀 영역(E) --%>

                <!-- Content -->
                <div class="container-xxl container-p-y">
                    <div class="row">
                        <%--서브페이지 사이드 메뉴 영역(S)--%>
                        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sub-menu.jsp" %>
                        <%--서브페이지 사이드 메뉴 영역(E)--%>
                        <div class="col-lg-10 col-md-9 col-12">
                        <div class="card">
                        <input id="bbsId" type="hidden" value="<c:out value="${bbs.bbsId}" />">
                        <c:choose>
                            <c:when test="${access.secretAt.equals('Y') && access.frstRegisterId == null}">
                                <!-- 비회원의 비밀글 -->
                                <%@ include file="/WEB-INF/jsp/vasanta/mber/ntt/qna/password.jsp" %>
                            </c:when>
                            <c:when test="${access.secretAt.equals('Y') && !access.author}">
                                <!-- 회원의 비밀글이며 권한이 없을 경우 -->
                                <%@ include file="/WEB-INF/jsp/vasanta/mber/ntt/qna/unauthorized.jsp" %>
                            </c:when>
                            <c:otherwise>
                                <!-- 일반 QNA 혹은 회원의 게시글이며 권한이 있는 경우-->
                                <%@ include file="/WEB-INF/jsp/vasanta/mber/ntt/common/default-post.jsp" %>
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${bbs.secretUseAt.equals('Y') || bbs.answerAt == 'Y'}">
                            <!-- 비밀글 답변 -->
                            <%@ include file="./common/answer.jsp" %>
                        </c:if>
                        <div class="card-footer border-top p-0 pb-6 pt-3 sideBox">
                            <div id="sideBox" class="list-group" style="border-radius: 0;">
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                </div>
                <!-- / Content -->

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- / Content wrapper -->
        </div>
        <!-- /Layout container -->
    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>
</body>
</html>
