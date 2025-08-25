<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/></title>
</head>
<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->
        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-menu.jsp" %>
        <!-- / Menu -->

        <!-- Layout page -->
        <div class="layout-page">

            <!-- Navbar -->
            <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-nav.jsp" %>
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">메뉴 로고 관리</h5>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-start align-items-sm-center gap-6 pb-4 border-bottom">
                                <img src="<c:out value="${logoUrl}" />" alt="user-avatar" class="d-block w-px-150 h-px-150 rounded" id="uploadedAvatar">
                                <div class="button-wrapper">
                                    <label for="upload" class="btn btn-primary me-3 mb-4" tabindex="0">
                                        <span class="d-none d-sm-block">로고 선택하기</span>
                                        <i class="icon-base bx bx-upload d-block d-sm-none"></i>
                                        <input type="file" id="upload" class="account-file-input" hidden="" accept="image/png, image/jpeg">
                                        <input type="hidden" id="logoUrl" class="setting">
                                    </label>
                                    <div>700K 이하의 JPEG, JPG, PNG OR SVG 파일만 허용합니다.</div>
                                </div>
                            </div>
                        </div>
                        <div class="card-header">
                            <h5 class="mb-0">하단 로고 관리</h5>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-start align-items-sm-center gap-6 pb-4 border-bottom">
                                <img src="<c:out value="${footerLogoUrl}" />" alt="user-avatar" class="d-block w-px-150 h-px-150 rounded" id="footerUploadedAvatar">
                                <div class="button-wrapper">
                                    <label for="footerUpload" class="btn btn-primary me-3 mb-4" tabindex="0">
                                        <span class="d-none d-sm-block">로고 선택하기</span>
                                        <i class="icon-base bx bx-upload d-block d-sm-none"></i>
                                        <input type="file" id="footerUpload" class="account-file-input" hidden="" accept="image/png, image/jpeg">
                                        <input type="hidden" id="footerLogoUrl" class="setting">
                                    </label>
                                    <div>700K 이하의 JPEG, JPG, PNG OR SVG 파일만 허용합니다.</div>
                                </div>
                            </div>
                        </div>
                        <div class="card-header">
                            <h5 class="mb-0">저작권 정보</h5>
                        </div>
                        <div class="card-body">
                            <div>
                                <textarea class="form-control setting" id="companyInfo" rows="3">${setting.copyrightInfo.content}</textarea>
                            </div>
                        </div>
                        <div class="card-header">
                            <h5 class="mb-0">회사 정보</h5>
                        </div>
                        <div class="card-body">
                            <div>
                                <textarea class="form-control setting" id="copyrightInfo" rows="3">${setting.companyInfo.content}</textarea>
                            </div>
                        </div>
                        <div class="card-header">
                            <h5 class="mb-0">SNS 링크 관리</h5>
                        </div>
                        <div class="card-body pt-0">
                            <div class="d-flex mb-4 align-items-center">
                                <div class="input-group rounded-pill">
                                    <span class="input-group-text">
                                        <div class="flex-shrink-0">
                                            <img src="/static/pages/mber/assets/icon/sns/youtube.svg" alt="google" class="me-1" height="36">
                                        </div>
                                    </span>
                                    <input type="text" id="youtubeLink" class="form-control setting" placeholder="링크를 입력해주세요." value="<c:out value="${setting.youtubeLink.content}" />">
                                </div>
                            </div>
                            <div class="d-flex mb-4 align-items-center">
                                <div class="input-group rounded-pill">
                                    <span class="input-group-text">
                                        <div class="flex-shrink-0">
                                            <img src="/static/pages/mber/assets/icon/sns/facebook.svg" alt="google" class="me-1" height="36">
                                        </div>
                                    </span>
                                    <input type="text" id="facebookLink" class="form-control setting" placeholder="링크를 입력해주세요." value="<c:out value="${setting.instargramLink.content}" />">
                                </div>
                            </div>
                            <div class="d-flex mb-4 align-items-center">
                                <div class="input-group rounded-pill">
                                    <span class="input-group-text">
                                        <div class="flex-shrink-0">
                                            <img src="/static/pages/mber/assets/icon/sns/instargram.svg" alt="google" class="me-1" height="36">
                                        </div>
                                    </span>
                                    <input type="text" id="instargramLink" class="form-control setting" placeholder="링크를 입력해주세요." value="<c:out value="${setting.instargramLink.content}" />">
                                </div>
                            </div>
                            <div class="d-flex mb-4 align-items-center">
                                <div class="input-group rounded-pill">
                                    <span class="input-group-text">
                                        <div class="flex-shrink-0">
                                            <img src="/static/pages/mber/assets/icon/sns/naverblog.svg" alt="google" class="me-1" height="36">
                                        </div>
                                    </span>
                                    <input type="text" id="naverblogLink" class="form-control setting" placeholder="링크를 입력해주세요." value="<c:out value="${setting.naverblogLink.content}" />">
                                </div>
                            </div>
                                                                <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-primary" id="btnSave"><spring:message
                                                code="button.modify"/></button>
                                    </div>
                        </div>
                    </div>
                </div>
                <!--/ Content -->
                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>
        <!--/ Layout page -->

    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->
<script src="/static/pages/sys/js/setting/setting.js"></script>
</body>

</html>
