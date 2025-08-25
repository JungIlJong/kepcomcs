<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/></title>
    <script type="text/javascript">
        <%-- 저장 성공 시 Callback 함수 --%>
        let successSave = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '저장하였습니다.',
                showCancel: false,
                onConfirm: function() {
                    goPage('/sys/approval/approvbox/sentappr/outbox/list')
                }
            });
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false,
                onConfirm: function() {
                    console.log(xhr + ", " + status + " : " + error);
                }
            });
        }
    </script>
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
                    <div class="row invoice-preview">
                        <div class="col-xl-8 col-md-8 col-12 mb-md-0 mb-6">
                            <div class="card invoice-preview-card p-sm-12 p-6">
                                <div class="card-header">
                                    <h5 class="card-tile mb-0">기안하기</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-6">
                                        <label class="form-label" for="approvalTitle">제목</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="approvalTitle"
                                                name="approvalTitle"
                                                aria-label="approvalTitle" />
                                    </div>
                                    <div>
                                        <label for="approvalContent" class="form-label">내용</label>
                                        <textarea class="form-control" id="approvalContent" rows="10"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-4 col-12 invoice-actions">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">결제자</h5>
                                </div>
                                <div class="card-body">
                                    <form class="form-repeater">
                                        <div data-repeater-list="group-a">
                                            <div data-repeater-item>
                                                <div class="row g-6 mb-6">
                                                    <div class="col-12">
                                                        <select
                                                                id="form-repeater-1-1"
                                                                name="approvalLine"
                                                                class="select2 form-select"
                                                                data-order="1">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <button id="addBtn" class="btn btn-info d-grid w-100 mb-4 display-1" type="button" data-repeater-create>
                                                <span class="d-flex align-items-center justify-content-center text-nowrap">
                                                    결제자 추가
                                                </span>
                                            </button>
                                        </div>
                                    </form>
                                    <button id="btnSubmit" class="btn btn-primary d-grid w-100 mb-4" type="button">제출</button>
                                </div>
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
<script src="/static/pages/sys/js/approval/draft/save.js"></script>
</body>

</html>
