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
                            <h5 class="mb-0"><c:out value="${menuTitle}"/></h5>
                        </div>
                        <div class="row card-body">
                            <div class="card-datatable">
                                <div class="dt-container dt-bootstrap5 dt-empty-footer border-bottom">
                                    <div class="row mx-3 my-0 justify-content-between">
                                        <div>
                                            <div class="row me-4 mb-4 col-12 justify-content-between">
                                                <div class="col-6">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="form-label" for="ntce">등록일자 범위 선택</label>
                                                                <div class="d-flex justify-content-start" id="ntce">
                                                                    <div class="mb-0 me-2 col-5">
                                                                        <div class="input-group input-group-merge">
                                                                            <input type="text"
                                                                                   class="dt-datetime form-control flatpickr-input"
                                                                                   placeholder="<spring:message code='table.header.stDt'/>"
                                                                                   id="stDt" name="stDt" readonly>
                                                                            <span class="input-group-text cursor-pointer"
                                                                                  onclick="openStDt(this)"><i
                                                                                    class="icon-base bx bx-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mb-0 me-2 d-flex align-items-center">
                                                                        <span class="form-label"><i
                                                                                class="icon-base bx bx-minus"></i></span>
                                                                    </div>
                                                                    <div class="mb-0 col-5">
                                                                        <div class="input-group input-group-merge">
                                                                            <input type="text"
                                                                                   class="dt-datetime form-control flatpickr-input"
                                                                                   placeholder="<spring:message code='table.header.endDt'/>"
                                                                                   id="endDt" name="endDt" readonly>
                                                                            <span class="input-group-text cursor-pointer"
                                                                                  onclick="openEndDt(this)"><i
                                                                                    class="icon-base bx bx-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">카테고리</label>
                                                                <div class="d-flex">
                                                                    <div class="mb-0 me-3 col-5">
                                                                        <select id="categoryCode1" name="categoryCode1" class="select2 form-select form-select-lg" data-allow-clear="false">
                                                                            <option value="">선택하세요</option>
                                                                            <option value="A1">경찰서</option>
                                                                            <option value="A2">병원</option>
                                                                            <option value="A3">시청</option>
                                                                            <option value="A4">기타</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="mb-0 col-5">
                                                                        <select id="categoryCode2" name="categoryCode2" class="select2 form-select form-select-lg" data-allow-clear="false" disabled>
                                                                            <option value="">선택하세요</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="justify-content-between dt-layout-table">
                                    <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                        <table class="datatables-ntts table border-top dataTable dtr-column"
                                               id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                                        </table>
                                    </div>
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
<script src="/static/pages/sys/js/mapmarker/list.js"></script>
<!--/ Layout wrapper -->
</body>

</html>
