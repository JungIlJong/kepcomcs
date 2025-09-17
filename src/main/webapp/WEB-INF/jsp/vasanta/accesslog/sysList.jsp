<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
 <html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>로그관리</title>
    <script type="text/javascript">
        <%-- 목록조회 함수 --%>

        <%--function search(pageIndex) {--%>
        <%--    const stDt = new Date(document.getElementById('stDt').value);--%>
        <%--    const endDt = new Date(document.getElementById('endDt').value);--%>

        <%--    if (stDt > endDt) {--%>
        <%--        alert('<spring:message code="fail.common.date.search" />')--%>
        <%--        return;--%>
        <%--    }--%>

        <%--    if (celOneYear(stDt, endDt)) {--%>
        <%--        alert('<spring:message code="fail.common.date.year" />');--%>
        <%--        return;--%>
        <%--    }--%>

        <%--    let data = bindingData(document.getElementById('frmSearch'));--%>
        <%--    data["pageIndex"] = pageIndex;--%>
        <%--    Ajax.get(dataToQueryString('/api/sys/lgnlog/list', data), successSearch, fail);--%>
        <%--}--%>

        <%-- 엑셀다운로드 함수 --%>

        // function getXlsx() {
        //     let data = bindingData(document.getElementById('frmSearch'));
        //     Ajax.get(dataToQueryString('/api/sys/lgnlog/xlsx', data), successXlsx, fail);
        // }
    </script>
</head>
<body>
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
                                        <form id="frmSearch">
                                            <div>
                                                <div class="row me-4 mb-4 col-12 justify-content-between">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <label class="form-label" for="ntce"><spring:message code="title.occrrncDt"/></label>
                                                        <div class="d-flex justify-content-start" id="ntce">
                                                            <div class="mb-0 me-4">
                                                                <div class="input-group input-group-merge">
                                                                <input type="text" class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.stDt'/>"
                                                                       id="stDt" name="stDt" readonly>
                                                                <span class="input-group-text cursor-pointer" onclick="openStDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="mb-0 me-4 d-flex align-items-center">
                                                                <span class="form-label"><i class="icon-base bx bx-minus"></i></span>
                                                            </div>
                                                            <div class="mb-0 me-4 me-lg-12">
                                                                <div class="input-group input-group-merge">
                                                                <input type="text" class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.endDt'/>"
                                                                       id="endDt" name="endDt" readonly>
                                                                    <span class="input-group-text cursor-pointer" onclick="openEndDt(this)"><i
                                                                            class="icon-base bx bx-calendar"></i></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="DatePickerBtn" class="row mb-4 col-12">
                                                    <div class="d-flex justify-content-start">
                                                        <button type="button" id="btnYesterday" class="btn btn-secondary me-2"><spring:message
                                                                code="button.yesterday"/></button>
                                                        <button type="button" id="btn1Week" class="btn btn-secondary me-2"><spring:message
                                                                code="button.1week"/></button>
                                                        <button type="button" id="btn1Month" class="btn btn-secondary me-2"><spring:message
                                                                code="button.1month"/></button>
                                                        <button type="button" id="btn3Months" class="btn btn-secondary me-2"><spring:message
                                                                code="button.3month"/></button>
                                                        <button type="button" id="btn6Months" class="btn btn-secondary me-2"><spring:message
                                                                code="button.6month"/></button>
                                                        <button type="button" id="btn1Year" class="btn btn-secondary me-2"><spring:message
                                                                code="button.1year"/></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="justify-content-between dt-layout-table">
                                    <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                        <table class="datatables-logs table border-top dataTable dtr-column"
                                               id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                                        </table>
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

<script src="/static/pages/sys/js/accesslog/list.js"></script>
<script type="text/javascript">
    $(function () {
        let dt_log = new DataTable('.datatables-logs');
        // Refilter the table
        document.querySelectorAll('#stDt, #endDt').forEach((el) => {
            el.addEventListener('change', () => dt_log.draw());
        });

        dt_log.draw();
        <%-- 날짜버튼 클릭 시 이벤트 --%>
        document.getElementById('DatePickerBtn').addEventListener('click', function (event) {
            let target = event.target;

            let stDt = document.getElementById('stDt');
            let endDt = document.getElementById('endDt');
            let now = new Date();

            if (target.tagName === 'BUTTON') {
                switch (target.getAttribute('id')) {
                    case 'btnYesterday':
                        now.setDate(now.getDate() - 1);
                        break;
                    case 'btn1Week':
                        now.setDate(now.getDate() - 7);
                        break;
                    case 'btn1Month':
                        now.setMonth(now.getMonth() - 1);
                        break;
                    case 'btn3Months':
                        now.setMonth(now.getMonth() - 3);
                        break;
                    case 'btn6Months':
                        now.setMonth(now.getMonth() - 6);
                        break;
                    case 'btn1Year':
                        now.setFullYear(now.getFullYear() - 1);
                        break;
                }
                stDt.value = formatDate(now);
                endDt.value = formatDate(new Date());
                dt_log.draw();
            }
        });
    });

    function openStDt(e) {
        $('#stDt').focus();
    }

    function openEndDt(e) {
        $('#endDt').focus();
    }
</script>
</body>

</html>
