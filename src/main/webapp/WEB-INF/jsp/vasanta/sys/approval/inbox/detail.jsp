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
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row invoice-preview">
                        <!-- Invoice -->
                        <div class="col-xl-8 col-md-8 col-12 mb-md-0 mb-6">
                            <div class="card invoice-preview-card p-sm-12 p-6">
                                <h3 id="approvalTitle"></h3>
                                <div id="approvalContent" class="card-body invoice-preview-header rounded">

                                </div>
                            </div>
                        </div>
                        <!-- /Invoice -->

                        <!-- Invoice Actions -->
                        <div class="col-xl-4 col-md-4 col-12 invoice-actions">
                            <div class="card">
                                <div class="card-body">
                                    <div class="mb-4">
                                        <textarea id="comment" class="form-control" rows="5" placeholder="코멘트를 입력해주세요." style="display: none !important"></textarea>
                                    </div>
                                    <div id="myComment" class="mb-4 align-items-center" style="display: none;"></div>
                                    <button id="btnAcceptApproval" class="btn btn-primary d-grid w-100 mb-4" style="display: none !important">
                                        <span class="d-flex align-items-center justify-content-center text-nowrap">
                                            <i class="icon-base bx bx-bxs-check-circle icon-sm me-2"></i>
                                            승인
                                        </span>
                                    </button>
                                    <button id="btnRejectApproval" class="btn btn-danger d-grid w-100 mb-4" style="display: none !important">
                                        <span class="d-flex align-items-center justify-content-center text-nowrap">
                                            <i class="icon-base bx bx-x-circle icon-sm me-2"></i>
                                            반려
                                        </span>
                                    </button>
                                    <button id="btnCancel" class="btn btn-secondary d-grid w-100 mb-4" style="display: none !important">
                                        <span class="d-flex align-items-center justify-content-center text-nowrap">
                                            결제가 취소 상태입니다.
                                        </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /Invoice Actions -->
                    </div>
                    <button id="btnBack" class="btn btn-dark mt-3 left">
                        <span class="d-flex align-items-center justify-content-center text-nowrap">목록</span>
                    </button>
                </div>
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
<script src="/static/pages/sys/js/approval/inbox/detail.js"></script>
</body>

</html>
