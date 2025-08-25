<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title><c:out value="${menuTitle}"/></title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
<%--    <script type="text/javascript">--%>
<%--        function search(pageIndex) {--%>
<%--            const stDt = new Date(document.getElementById('stDt').value);--%>
<%--            const endDt = new Date(document.getElementById('endDt').value);--%>

<%--            if(stDt > endDt) {--%>
<%--                alert('<spring:message code="fail.common.date.search" />')--%>
<%--                return;--%>
<%--            }--%>

<%--            if(celOneYear(stDt, endDt)) {--%>
<%--                alert('<spring:message code="fail.common.date.year" />');--%>
<%--                return;--%>
<%--            }--%>

<%--            let data = bindingData(document.getElementById('frmSearch'));--%>
<%--            data["pageIndex"] = pageIndex;--%>
<%--            Ajax.get(dataToQueryString('/api/sys/cntntshist/list', data), success, fail);--%>
<%--        }--%>

<%--        let success = function (data) {--%>
<%--            let paginationInfo = data.paginationInfo;--%>
<%--            document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;--%>
<%--            renderPagination(paginationInfo, document.getElementById('pagination'));--%>
<%--            console.log(data);--%>
<%--            let tableBody = document.getElementById('table-body');--%>
<%--            removeAllChild(tableBody);--%>
<%--            data.data.forEach(function (element, index) {--%>
<%--                if (index >= paginationInfo.pageSize) return false;--%>
<%--                const histSeCode = element.histSeCode === 'SAVE' ? '<spring:message code="button.create"/>' : (element.histSeCode === 'UPDATE' ? '<spring:message code="button.modify"/>' : '<spring:message code="button.delete"/>')--%>
<%--                let node = `<tr>--%>
<%--                      <td class="tblBodyItem num">--%>
<%--                        ${'${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo - 1) * paginationInfo.pageSize) - index}'}--%>
<%--                      </td>--%>
<%--                      <td class="tblBodyItem item01">--%>
<%--                        ${'${element.cntntsId}'}--%>
<%--                      </td>--%>
<%--                      <td class="tblBodyItem tit">--%>
<%--                        ${'${histSeCode}'}--%>
<%--                      </td>--%>
<%--                      <td class="tblBodyItem item01">--%>
<%--                        ${'${element.mngrId}'}--%>
<%--                      </td>--%>
<%--                      <td class="tblBodyItem item01">--%>
<%--                        ${'${element.lastUpdtDt}'}--%>
<%--                      </td>--%>
<%--                    </tr>`;--%>
<%--                tableBody.insertAdjacentHTML('beforeend', node);--%>


<%--            });--%>
<%--        }--%>

<%--        let fail = function (xhr, status, error) {--%>
<%--            alert('<spring:message code="fail.common.msg"/>');--%>
<%--            console.log(xhr + ", " + status + " : " + error)--%>
<%--        }--%>
<%--    </script>--%>
    <script type="text/javascript">
        <%-- 삭제 성공 시 Callback 함수 --%>
        let successDelete = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.delete"/>',
                showCancel: false,
                onConfirm: function() {
                    new DataTable('.datatables-cntntshist').draw();
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
                                                <div class="form-control-validation fv-plugins-icon-container">
                                                    <label class="form-label" for="ntce">수정일시 범위 선택</label>
                                                    <div class="d-flex justify-content-start" id="ntce">
                                                        <div class="mb-0 me-4">
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
                                                        <div class="mb-0 me-4 d-flex align-items-center">
                                                                <span class="form-label"><i
                                                                        class="icon-base bx bx-minus"></i></span>
                                                        </div>
                                                        <div class="mb-0 me-4">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="justify-content-between dt-layout-table">
                                <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                    <table class="datatables-cntntshists table border-top dataTable dtr-column"
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
<script src="/static/pages/sys/js/cntntshists/list.js"></script>
<script type="text/javascript">
    $(function () {
        let dt_cntntshist = new DataTable('.datatables-cntntshist');
        // Refilter the table
        document.querySelectorAll('#stDt, #endDt').forEach((el) => {
            el.addEventListener('change', () => dt_cntntshist.draw());
        });

        dt_cntntshist.draw();
    });

    <%--function deleteCntnt(cntntsId) {--%>
    <%--    if (confirm('<spring:message code="confirm.common.delete"/>')) {--%>
    <%--        const data = {--%>
    <%--            "cntntsId": cntntsId--%>
    <%--        };--%>
    <%--        Ajax.post('/api/sys/cntnts/delete', successDelete, fail, {data: JSON.stringify(data)});--%>
    <%--    }--%>
    <%--}--%>

    function openStDt(e) {
        $('#stDt').focus();
    }

    function openEndDt(e) {
        $('#endDt').focus();
    }
</script>
</body>
</html>
