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
                        <%-- add post --%>
                        <div class="col-lg-10 col-md-9 col-12">
                            <div class="card">
                                <div class="card-header border-bottom">
                                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                                        <div class="d-flex flex-column justify-content-center">
                                            <h4 class="card-title mb-1">글 수정</h4>
                                        </div>
                                        <div class="d-flex align-content-center flex-wrap gap-4">
                                            <div class="d-flex gap-4">
                                                <button class="btn btn-label-secondary" onclick="goPage('list')">목록
                                                </button>
                                            </div>
                                            <button type="submit" class="btn btn-primary" id="btnSave"><spring:message
                                                    code="button.modify"/></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="container-p-y">
                                        <form id="frm" onsubmit="return false;" autocomplete="off">
                                            <input id="fileAtchSize" name="fileAtchSize" type="hidden"
                                                   value="<c:out value='${bbs.fileAtchSize}'/>"/>
                                            <input id="fileAtchCo" name="fileAtchCo" type="hidden"
                                                   value="<c:out value='${bbs.fileAtchCo}'/>"/>
                                            <input id="permExtsn" name="permExtsn" type="hidden"
                                                   value="<c:out value='${bbs.permExtsn}'/>"/>
                                            <input id="bbsId" name="bbsId" type="hidden"
                                                   value="<c:out value='${bbs.bbsId}' />">
                                            <c:if test="${bbs.secretUseAt == 'Y'}">
                                                <div class="row mb-6 p-0">
                                                    <div class="col-md mb-md-0 mb-5">
                                                        <div class="form-check custom-option custom-option-basic">
                                                            <label class="form-check-label custom-option-content"
                                                                   for="secretAtN">
                                                                <input
                                                                        name="secretAt"
                                                                        class="form-check-input"
                                                                        type="radio"
                                                                        value="N"
                                                                        id="secretAtN"
                                                                        checked/>
                                                                <span class="custom-option-header">
                                                                    <span class="h6 mb-0">일반글</span>
                                                                </span>
                                                                <span class="custom-option-body">
                                                                    <small>모든 사용자가 조회할 수 있습니다.</small>
                                                                </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md">
                                                        <div class="form-check custom-option custom-option-basic">
                                                            <label class="form-check-label custom-option-content"
                                                                   for="secretAtY">
                                                                <input
                                                                        name="secretAt"
                                                                        class="form-check-input"
                                                                        type="radio"
                                                                        value="Y"
                                                                        id="secretAtY"/>
                                                                <span class="custom-option-header">
                                                                <span class="h6 mb-0">비밀글</span>
                                                              </span>
                                                                <span class="custom-option-body">
                                                                <small>본인과 관리자만이 조회할 수 있습니다.</small>
                                                              </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="p-0">
                                                <!-- title -->
                                                <div class="mb-6">
                                                    <label class="form-label" for="nttSj">
                                                        <spring:message code="title"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                    <input
                                                            type="text"
                                                            class="form-control"
                                                            id="nttSj"
                                                            name="nttSj"
                                                            placeholder=""
                                                            aria-label="Title"/>
                                                </div>

                                                <!-- id, pw -->
                                                <sec:authorize access="!isAuthenticated()">
                                                    <div class="row g-6 mb-6">
                                                        <div class="col-md-6">
                                                            <label class="form-label" for="wrterNm"><spring:message
                                                                    code="writer"/></label>
                                                            <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="wrterNm"
                                                                    name="wrterNm"
                                                                    placeholder=""
                                                                    aria-label="Author"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label" for="password"><spring:message
                                                                    code="password"/></label>
                                                            <input
                                                                    type="password"
                                                                    class="form-control"
                                                                    id="password"
                                                                    name="password"/>
                                                        </div>
                                                    </div>
                                                </sec:authorize>
                                            </div>

                                            <div class="mb-6 p-0">
                                                <%@ include file="/WEB-INF/jsp/vasanta/cmmn/quill-editor.jsp" %>
                                            </div>
                                            <!-- / Description -->

                                            <c:if test="${bbs.fileAtchCo > 0}">
                                                <div class="mb-6">
                                                    <div class="input-file inLine">
                                                        <input type="file" id="files" name="files" class="form-control"
                                                               placeholder="파일을 선택하세요" title="파일을 선택하세요" multiple/>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div id="fileItem"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--/ add post--%>
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
<script src="/static/pages/mber/js/ntt/update.js"></script>
</body>

</html>
