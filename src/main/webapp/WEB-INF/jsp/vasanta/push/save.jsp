<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template"
      data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>Push</title>
    <script type="text/javascript">
        // 수신자 수 업데이트 함수
        function updateReceiverCount() {
            const receiveList = document.getElementById('receive-list');
            document.getElementById('receiveCount').textContent = receiveList.children.length; // 총 인원 업데이트
        }

        function getReceiverTokens() {
            const receiveList = document.getElementById('receive-list'); // 수신자 목록 테이블
            const rows = receiveList.querySelectorAll("tr"); // 모든 행 가져오기
            let tokens = [];

            rows.forEach((row, index) => {
                const id = row.children[1].textContent.trim(); // 아이디 추출
                const name = row.children[2].textContent.trim(); // 이름 추출
                const token = row.querySelector("#dvcPushToken")?.value.trim() || "null"; // dvcPushToken 값 가져오기

                tokens.push({
                    id: id,
                    name: name,
                    token: token
                });
            });

            return tokens;
        }

        <%-- 저장 성공 시 Callback 함수 --%>
        let successSave = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save" />',
                showCancel: false,
                onConfirm: function() {
                    goPage('list');
                }
            });
        }

        <%-- 팝업리스트 조회 함수 --%>

        function search(pageIndex) {
            let data = bindingData(document.getElementById('frmSearch'));
            data["pageIndex"] = pageIndex;
            Ajax.get(dataToQueryString('/api/sys/mbr/push/list', data), successSearch, fail);
        }

        <%-- 팝업리스트 조회 성공 시 Callback 함수 --%>
        let successSearch = function (data) {
            let paginationInfo = data.paginationInfo;
            document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;
            renderPagination(paginationInfo, document.getElementById('pagination'));
            let tableBody = document.getElementById('table-body');
            removeAllChild(tableBody);
            data.data.forEach(function (element, index) {
                if (index >= paginationInfo.pageSize) return false;
                let node = `<tr>
                                <td class="tblBodyItem">
                                    <fieldset class="flex-c">
                                        <input type="checkbox" name="mbrChk"/>
                                        <label></label>
                                    </fieldset>
                                </td>
                                <td class="tblBodyItem tit">\${element.id}</td>
                                <td class="tblBodyItem tit">\${element.mbrNm}</td>
                                <input type="hidden" id="dvcPushToken" value="\${element.dvcPushToken}" />
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
                    console.log(xhr + ", " + status + " : " + error)
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
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row mb-6 gy-6">
                        <div class="col-xl">
                            <div class="card h-100">
                                <div class="card-header">
                                    <h5 class="mb-0">수신자 관리</h5>
                                </div>
                                <div class="row card-body">
                                    <div class="card-datatable mb-6">
                                        <div class="justify-content-between dt-layout-table">
                                            <div class="justify-content-between align-items-center dt-layout-full table">
                                                <table class="datatables-pushs table border-top dataTable dtr-column"
                                                       id="DataTables_Table_0"
                                                       aria-describedby="DataTables_Table_0_info">
                                                    <thead>
                                                    <tr>
                                                        <th class="w-px-40">
                                                            <input class="form-check-input"
                                                                   type="checkbox"
                                                                   name="checkBox" id="chkAll"/>
                                                        </th>
                                                        <th>아이디</th>
                                                        <th>이름</th>
                                                    </tr>
                                                    </thead>

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="card-datatable">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <h5>수신자 목록</h5>
                                                <div class="dt-container dt-bootstrap5 dt-empty-footer">
                                                    <div class="justify-content-between dt-layout-table">
                                                        <div class="d-md-flex justify-content-between align-items-center dt-layout-full table-responsive">
                                                            <table class="table dataTable dtr-column w-100"
                                                                   id="roleTable">
                                                                <thead>
                                                                <tr>
                                                                    <th class="w-px-40">
                                                                        <input type="checkbox"
                                                                               class="form-check-input"
                                                                               name="checkBox"
                                                                               style="width: 1.125rem; height: 1.125rem;"
                                                                               id="receiveChkAll"
                                                                               onclick="receiveChkAllFunc()"/>
                                                                    </th>
                                                                    <th>아이디</th>
                                                                    <th>이름</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="receive-list">

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-dark" id="btnDelete">수신자
                                            <spring:message
                                                    code="button.delete"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl">
                            <div class="card h-100">
                                <div class="card-header">
                                    <h5 class="mb-0"><c:out value="${menuTitle}"/></h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container"
                                                 id="bbsIdDiv">
                                                <label class="form-label" for="messageTitle">제목</label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="text" name="messageTitle"
                                                           id="messageTitle" maxlength="20" placeholder="제목을 입력해주세요">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div>
                                                <label class="form-label" for="messageBody"><spring:message
                                                        code="cn"/></label>
                                                <div class="has-validation">
                                                    <textarea class="form-control" name="messageBody" id="messageBody"
                                                              rows="5" placeholder="내용을 입력해주세요"></textarea>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-5">
                                            <button type="button" class="btn btn-secondary me-2" id="btnList"><spring:message code="button.list"/></button>
                                            <button type="button" class="btn btn-primary" id="btnSave"><spring:message
                                                    code="button.create"/></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Content -->
                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
</div>

<%--<%@ include file="/WEB-INF/jsp/vasanta/sys/include/header.jsp" %>--%>
<%--<div class="wrapper">--%>
<%--    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/nav.jsp" %>--%>
<%--    <div class="contentWrap">--%>
<%--        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/conTit.jsp" %>--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col m12">--%>
<%--                    <div class="container">--%>
<%--                        <form id="frm">--%>
<%--                            <div class="adminTable">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col tit required">제목</div>--%>
<%--                                    <div class="col txt">--%>
<%--                                        <input type="text" name="messageTitle" id="messageTitle" maxlength="20">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col tit required">내용</div>--%>
<%--                                    <div class="col txt">--%>
<%--                                        <textarea name="messageBody" id="messageBody" cols="30" rows="10"></textarea>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                        <div class="flex-js">--%>
<%--                            <p class="adminTableTit" style="border-bottom: 0; margin-top: 0">수신설정</p>--%>
<%--                            <a href="javascript:void(0);" id="btnAdd" class="btn sml line popupOpen popup01"><img src="/sys/assets/icon/Basic_Icon/plus.svg" alt="" width="20px" height="20px"/>추가</a>--%>
<%--                        </div>--%>
<%--                        <div class="adminTable">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col tit required">수신자 목록</div>--%>
<%--                                <div class="col txt">--%>
<%--                                    <div class="popupCon max-height1" style="width: 100%">--%>
<%--                                        <div class="table-top">--%>
<%--                                            <div class="boardCount">총 <span id="receiveCount">000</span>명</div>--%>
<%--                                            <a href="javascript:void(0);" id="btnDelete" class="btn sml dark"><img src="/sys/assets/icon/content/smlbtn_delete.svg" alt=""/>삭제</a>--%>
<%--                                        </div>--%>
<%--                                        <div class="table-area">--%>
<%--                                            <table class="tbl board ellipsis" style="width: 100%">--%>
<%--                                                <colgroup>--%>
<%--                                                    <col width="60px"/>--%>
<%--                                                    <col width="%"/>--%>
<%--                                                </colgroup>--%>
<%--                                                <thead class="tblHeader">--%>
<%--                                                <tr>--%>
<%--                                                    <th class="tblHeaderItem">--%>
<%--                                                        <fieldset class="flex-c">--%>
<%--                                                            <input type="checkbox" name="checkBox" id="receiveChkAll" />--%>
<%--                                                            <label for="receiveChkAll"></label>--%>
<%--                                                        </fieldset>--%>
<%--                                                    </th>--%>
<%--                                                    <th class="tblHeaderItem">아이디</th>--%>
<%--                                                    <th class="tblHeaderItem">이름</th>--%>
<%--                                                </tr>--%>
<%--                                                </thead>--%>
<%--                                                <tbody id="receive-list">--%>
<%--                                                </tbody>--%>
<%--                                            </table>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="buttonArea">--%>
<%--                            <button type="button" id="btnList" class="btn dark"><spring:message code="button.list"/></button>--%>
<%--                            <button type="button" id="btnSave" class="btn"><spring:message code="button.create"/></button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Modal(popup) -->--%>
<%--<div class="popupWrap">--%>
<%--    <div class="popupInner popup01">--%>
<%--        <div class="popupTop">--%>
<%--            <h4>회원 목록</h4>--%>
<%--        </div>--%>
<%--        <div class="popupCon">--%>
<%--            <form id="frmSearch">--%>
<%--                <div class="srchFltrWrap">--%>
<%--                    <div class="srchFltrItem">--%>
<%--                        <div class="subsearch">--%>
<%--                            <div class="selectWrap">--%>
<%--                                <select id="searchCondition" name="searchCondition" class="selectBox">--%>
<%--                                    <option value="">선택</option>--%>
<%--                                    <option value="ID">아이디</option>--%>
<%--                                    <option value="NAME">이름</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                            <div class="rightItem">--%>
<%--                                <input type="search" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요" />--%>
<%--                                <button type="button" id="btnSearch" class="btn searchBtn">검색</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--            <div class="table-top">--%>
<%--                <div class="boardCount">총 <span id="totCnt">0</span>명</div>--%>
<%--            </div>--%>
<%--            <div class="table-area">--%>
<%--                <table class="tbl board ellipsis">--%>
<%--                    <colgroup>--%>
<%--                        <col width="60px" />--%>
<%--                        <col width="%" />--%>
<%--                    </colgroup>--%>
<%--                    <thead class="tblHeader">--%>
<%--                    <tr>--%>
<%--                        <th class="tblHeaderItem">--%>
<%--                            <fieldset class="flex-c">--%>
<%--                                <input type="checkbox" name="checkBox" id="chkAll" />--%>
<%--                                <label for="chkAll"></label>--%>
<%--                            </fieldset>--%>
<%--                        </th>--%>
<%--                        <th class="tblHeaderItem">아이디</th>--%>
<%--                        <th class="tblHeaderItem">이름</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody id="table-body">--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--                <div class="pagination-area">--%>
<%--                    <ul id="pagination" class="pagination">--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="buttonArea flex-jend">--%>
<%--            <div class="buttonSec">--%>
<%--                <button type="button" class="btn line popupClose">취소</button>--%>
<%--
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script src="/sys/js/Component_1_0_231220.js"></script>--%>
<%--<script src="/sys/js/lib/slick.min.js"></script>--%>
<%--<script src="/sys/js/lib/flatpickr.js"></script>--%>
<%--<script src="/sys/js/lib/l10n_ko.js"></script>--%>
<%--<script src="/sys/js/lib/jquery.selectric.min.js"></script>--%>
<%--<script src="/sys/js/common.js"></script>--%>
<script src="/static/pages/sys/js/push/save.js"></script>
<script type="text/javascript">
    $(function () {
        const chkAll = document.getElementById("chkAll");

        let dt_push = new DataTable('.datatables-pushs');
        // Refilter the table
        dt_push.draw();

        <%-- 삭제 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDelete').addEventListener('click', function () {
            const receiveList = document.getElementById('receive-list'); // 수신자 목록 테이블
            const selectedCheckboxes = document.querySelectorAll("input[name='receiveChk']:checked"); // 체크된 항목들

            if (selectedCheckboxes.length === 0) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: "삭제할 수신자를 선택하세요.",
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            selectedCheckboxes.forEach(checkbox => {
                checkbox.closest("tr").remove(); // 체크된 항목의 행 삭제
            });

            // 수신자 수 업데이트
            updateReceiverCount();
        });

        <%-- chkAll 클릭 시 이벤트 --%>
        chkAll.addEventListener('change', function () {
            const checkboxes = document.querySelectorAll("input[name='mbrChk']");
            checkboxes.forEach(checkbox => {
                checkbox.checked = chkAll.checked;
            });
        });

        <%-- 저장버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {

            const messageTitle = document.getElementById('messageTitle').value;

            if (isEmpty(messageTitle)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: "제목을 입력해주세요.",
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('messageTitle').focus();
                    }
                });
                return;
            }

            const messageBody = document.getElementById('messageBody').value;

            if (isEmpty(messageBody)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '내용을 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('messageBody').focus();
                    }
                });
                return;
            }

            const data = {
                "messageTitle": messageTitle,
                "messageBody": messageBody,
                "tokens": getReceiverTokens()
            };

            Ajax.post("/api/sys/push/save", successSave, () => {
            }, {data: JSON.stringify(data)})
        });

        // 체크박스 선택 시 전체선택 체크박스도 자동으로 체크되도록 함
        document.addEventListener('change', function (e) {
            if (e.target && e.target.name === 'receiveChk') {
                const all = document.querySelectorAll("input[name='receiveChk']");
                const checked = document.querySelectorAll("input[name='receiveChk']:checked");
                document.getElementById('receiveChkAll').checked = all.length === checked.length;
            }

            if (e.target && e.target.name === 'mbrChk') {
                const all = document.querySelectorAll("input[name='mbrChk']");
                const checked = document.querySelectorAll("input[name='mbrChk']:checked");
                document.getElementById('chkAll').checked = all.length === checked.length;
            }
        });

        <%-- 목록버튼 클릭 시 이벤트 --%>
        document.getElementById('btnList').addEventListener('click', function () {
            if (confirm('목록 페이지로 이동하면 현재까지 작성한 내용이 사라집니다.\n이동하시겠습니까?')) {
                goPage('list');
            }
        });
    });

    const receiveChkAll = document.getElementById('receiveChkAll');

    <%-- receiveChkAll 클릭 시 이벤트 --%>

    function receiveChkAllFunc() {
        const checkboxes = document.querySelectorAll("input[name='receiveChk']");
        checkboxes.forEach(checkbox => {
            checkbox.checked = receiveChkAll.checked;
        });
    }

    <%-- 수신자 추가 버튼 클릭 시 이벤트 --%>

    function btnAddReceiveFunc() {
        const receiveList = document.getElementById('receive-list');
        const selectedCheckboxes = document.querySelectorAll("input[name='mbrChk']:checked"); // 체크된 항목들

        if (selectedCheckboxes.length === 0) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '추가할 회원을 선택하세요.',
                showCancel: false,
                onConfirm: function() {
                }
            });
            return;
        }

        selectedCheckboxes.forEach(checkbox => {
            const row = checkbox.closest("tr"); // 체크박스가 포함된 행
            const id = row.children[1].textContent.trim(); // 아이디 추출
            const name = row.children[2].textContent.trim(); // 이름 추출

            // 중복 방지 (이미 추가된 ID인지 확인)
            const isDuplicate = [...receiveList.children].some(tr => tr.children[1].textContent.trim() === id);
            if (isDuplicate) return;

            // 새로운 행 추가
            let node = `<tr>
                        <td>
                           <input class="form-check-input" type="checkbox" style="width: 1.125rem; height: 1.125rem;" name="receiveChk" />
                        </td>
                        <td>\${id}</td>
                        <td>\${name}</td>
                    </tr>`;
            receiveList.insertAdjacentHTML('beforeend', node);
        });

        $(".popupWrap").removeClass("on");
        $("html").removeClass("noScroll");
    }
</script>
</body>

</html>
