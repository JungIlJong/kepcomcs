<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>Push</title>
    <script type="text/javascript">
        <%-- 목록조회 함수 --%>
        function search(pageIndex) {
            let data = bindingData(document.getElementById('frmSearch'));
            data["pageIndex"] = pageIndex;
            Ajax.get(dataToQueryString('/api/sys/push/list', data), successSearch, fail);
        }

        <%-- 목록조회 성공 시 Callback 함수 --%>
        let successSearch = function (data) {
            let paginationInfo = data.paginationInfo;
            document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;
            renderPagination(paginationInfo, document.getElementById('pagination'));

            let tableBody = document.getElementById('table-body');

            removeAllChild(tableBody);
            data.data.forEach(function (element, index) {
                console.log(element.successCount);
                if (index >= paginationInfo.pageSize) return false;
                let node = `<tr>
                                <td class="tblBodyItem num">${'${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo - 1) * paginationInfo.pageSize) - index}'}</td>
                                <td class="tblBodyItem tit">${'${element.messageTitle}'}</td>
                                <td class="tblBodyItem tit">${'${element.messageBody}'}</td>
                                <td class="tblBodyItem tit">${'${element.sentCount}'}</td>
                                <td class="tblBodyItem tit">${'${(element.successCount / element.sentCount) * 100}'}% (\${element.successCount}/\${element.sentCount})</td>
                                <td class="tblBodyItem date">${'${element.sentAt}'}</td>
                                <td class="tblBodyItem item01"><div class="buttonArea center"><a href="javascript:void(0);" class="btn sml line" onclick="downloadPushLog(${'${element.pushLogId}'});">내역</a></div></td>
                            </tr>`;
                tableBody.insertAdjacentHTML('beforeend', node);
            });
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false,
                onConfirm: function() {
                }
            });
        }

        let successXlsx = function (data) {
            xlsxDownload(data, 'PUSH 발송 내역');
        }

        function downloadPushLog(pushLogId) {
            let data = {
                "pushLogId": pushLogId
            }

            Ajax.get(dataToQueryString('/api/sys/push/xlsx', data), successXlsx, fail);
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
                                <div class="justify-content-between dt-layout-table">
                                    <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                        <table class="datatables-pushs table border-top dataTable dtr-column"
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
            </div>
            <!--/ Layout page -->
        </div>
    </div>
    <!-- 콘텐츠 영역 end -->

    <!-- Contents end -->
</div>

<%--<%@ include file="/WEB-INF/jsp/vasanta/sys/include/header.jsp" %>--%>
<%--<div class="wrapper">--%>
<%--    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/nav.jsp" %>--%>
<%--    <div class="contentWrap">--%>
<%--        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/conTit.jsp" %>--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col sm12">--%>
<%--                    <div class="container">--%>
<%--                        <form id="frmSearch">--%>
<%--                            <div class="srchFltrWrap">--%>
<%--                                <div class="srchFltrItem">--%>
<%--                                    <div class="subsearch">--%>
<%--                                        <div class="selectWrap">--%>
<%--                                            <select id="searchCondition" name="searchCondition" class="selectBox">--%>
<%--                                                <option value="" selected>선택</option>--%>
<%--                                                <option value="MESSAGE_TITLE">메시지 제목</option>--%>
<%--                                                <option value="MESSAGE_BODY">메시지 내용</option>--%>
<%--                                            </select>--%>
<%--                                        </div>--%>
<%--                                        <div class="rightItem">--%>
<%--                                            <input type="search" id="searchKeyword" name="searchKeyword" placeholder="<spring:message code="table.searchKeyWord.placeholder"/>">--%>
<%--                                            <button type="button" id="btnSearch" class="btn searchBtn"><spring:message code="button.search"/></button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                        <div class="table-top">--%>
<%--                            <div class="boardCount">--%>
<%--                                <spring:message code="table.total.start"/> <span id="totCnt"></span><spring:message code="table.total.end"/>--%>
<%--                            </div>--%>
<%--                            <div class="buttonArea">--%>
<%--                                <a href="save" class="btn"><spring:message code="button.create"/></a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="table-area">--%>
<%--                            <table class="tbl board">--%>
<%--                                <thead class="tblHeader">--%>
<%--                                <tr>--%>
<%--                                    <th class="tblHeaderItem num">번호</th>--%>
<%--                                    <th class="tblHeaderItem tit">메시지 제목</th>--%>
<%--                                    <th class="tblHeaderItem tit">메시지 내용</th>--%>
<%--                                    <th class="tblHeaderItem item01">발송 수</th>--%>
<%--                                    <th class="tblHeaderItem item01">발송률(%)</th>--%>
<%--                                    <th class="tblHeaderItem date">발송일시</th>--%>
<%--                                    <th class="tblHeaderItem item01">내역</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody id="table-body">--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                            <div class="buttonArea right">--%>
<%--                                <a href="save" class="btn"><spring:message code="button.create"/></a>--%>
<%--                            </div>--%>
<%--                            <div class="pagination-area">--%>
<%--                                <ul id="pagination" class="pagination">--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="/static/vendor/xlsx.full.min.js"></script>
<script src="/static/pages/sys/js/push/list.js"></script>
<script src="/static/js/common/xlsxDownload.js"></script>

<script type="text/javascript">
    $(function () {
        let dt_push = new DataTable('.datatables-pushs');
        // Refilter the table

        dt_push.draw();
    });
</script>
</body>

</html>
