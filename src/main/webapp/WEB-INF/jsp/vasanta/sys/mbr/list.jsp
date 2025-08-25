<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>회원관리</title>
    <script type="text/javascript">
        <%-- 삭제 성공 시 Callback 함수 --%>
        let successDelete = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.delete"/>',
                showCancel: false,
                onConfirm: function() {
                    new DataTable('.datatables-users').draw();
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
                    console.log(xhr + ", " + status + " : " + error)
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
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0"><c:out value="${menuTitle}"/></h5>
                        </div>
                        <div class="card-body">
                            <div class="card-datatable">
                                <div class="dt-container dt-bootstrap5 dt-empty-footer border-bottom">
                                    <div class="justify-content-between">
                                        <div>
                                            <div class="mb-4 col-12 justify-content-between">
                                                <div class="form-control-validation fv-plugins-icon-container">
                                                    <label class="form-label" for="ntce">등록일자 범위 선택</label>
                                                    <div class="d-flex justify-content-start" id="ntce">
                                                        <div class="mb-0 me-4">
                                                            <div class="input-group input-group-merge">
                                                                <input type="text"
                                                                       class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.stDt'/>"
                                                                       id="stDt" name="stDt" readonly>
                                                                <span class="input-group-text cursor-pointer" onclick="openStDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-0 me-4 d-flex align-items-center">
                                                            <span class="form-label"><i class="icon-base bx bx-minus"></i></span>
                                                        </div>
                                                        <div class="mb-0 me-4">
                                                            <div class="input-group input-group-merge">
                                                                <input type="text"
                                                                       class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.endDt'/>"
                                                                       id="endDt" name="endDt" readonly>
                                                                <span class="input-group-text cursor-pointer" onclick="openEndDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
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
                                    <table class="datatables-users table border-top dataTable dtr-column"
                                           id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                                    </table>
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

<script src="/static/pages/sys/js/mbr/list.js?ver=20250611_001"></script>
<script type="text/javascript">
    $(function () {
        let dt_user = new DataTable('.datatables-users');
        // Refilter the table
        document.querySelectorAll('#stDt, #endDt').forEach((el) => {
            el.addEventListener('change', () => dt_user.draw());
        });

        dt_user.draw();
    });

    function deleteUser(uuid) {
        if (confirm('<spring:message code="confirm.common.delete"/>')) {
            const data = {
                "uuid": uuid
            };
            Ajax.post('/api/sys/mbr/delete', successDelete, fail, {data: JSON.stringify(data)});
        }
    }

    function openStDt(e) {
        $('#stDt').focus();
    }

    function openEndDt(e) {
        $('#endDt').focus();
    }
</script>
</body>
</html>
