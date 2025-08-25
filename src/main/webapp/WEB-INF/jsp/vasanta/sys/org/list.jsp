<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>조직도 관리</title>
    <link rel="stylesheet" href="/static/vendor/plugins/jstree/dist/themes/default/style.min.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <script src="/static/vendor/plugins/jstree/dist/jstree.min.js"></script>
    <script type="text/javascript">
        <%-- 메뉴조회 성공 시 Callback 함수 --%>
        let success = function (data) {
            reset();
            let nodeArray = [];
            $.each(data, function (idx, item) {
                let orgId = item.orgId;
                let id = isEmpty(item.id) ? '' : item.id;
                let orgNm = item.orgNm;
                let upperOrgId = (isEmpty(item.upperOrgId) || item.upperOrgId === 0) ? '#' : item.upperOrgId;
                let orgOrdr = isEmpty(item.orgOrdr) ? 0 : item.orgOrdr;
                let useAt = item.useAt;
                let type = 'default';

                nodeArray[idx] = {
                    "id": orgId,
                    "parent": upperOrgId,
                    "text": orgNm,
                    "data": {
                        type: "ORG",
                        orgId: id,
                        orgOrdr: orgOrdr,
                        useAt: useAt,
                    },
                    "type": type
                };
            });

            $('#tree').jstree(true).settings.core.data = nodeArray;
            $('#tree').jstree(true).refresh();

            Ajax.get('/api/sys/org/mbrList', successMbr, fail);
        }

        let successMbr = function (data) {
            reset();
            let nodeArray = [];
            $.each(data, function (idx, item) {
                console.log(item);
                let mbrId = item.mbrId;
                let id = isEmpty(item.id) ? "" : item.id;
                let mbrNm = item.mbrNm;
                let upperOrgId = (isEmpty(item.upperOrgId) || item.upperOrgId === 0) ? '#' : item.upperOrgId;
                let orgOrdr = isEmpty(item.orgOrdr) ? 0 : item.orgOrdr;
                let sttsCd = item.sttsCd;
                let type = 'file';

                let uuid = item.uuid;
                let pswd = item.pswd;
                let emlAddr = item.emlAddr
                let mblTelno = item.mblTelno;
                let fxno = item.fxno;
                let zip = item.zip;
                let addr = item.addr;
                let daddr = item.daddr;
                let lgnLckYn = item.lgnLckYn;
                let lgnFailNmtm = item.lgnFailNmtm;
                let frstRgtrId = item.frstRgtrId;
                let frstRegDt = item.frstRegDt;
                let lastMdfrId = item.lastMdfrId;
                let lastMdfcnDt = item.lastMdfcnDt;
                let authrtList = item.authrtList;
                let dvcPushToken = item.dvcPushToken;

                nodeArray[idx] = {
                    "id": isEmpty(id) ? "New" : id,
                    "parent": upperOrgId,
                    "text": mbrNm,
                    "data": {
                        type: "MBR",
                        upperOrgId: upperOrgId,
                        orgOrdr: orgOrdr,
                        id: id,
                        mbrId: mbrId,
                        mbrNm: mbrNm,
                        sttsCd: sttsCd,
                        uuid: uuid,
                        pswd: pswd,
                        emlAddr: emlAddr,
                        mblTelno: mblTelno,
                        fxno: fxno,
                        zip: zip,
                        addr: addr,
                        daddr: daddr,
                        lgnLckYn: lgnLckYn,
                        lgnFailNmtm: lgnFailNmtm,
                        frstRgtrId: frstRgtrId,
                        frstRegDt: frstRegDt,
                        lastMdfrId: lastMdfrId,
                        lastMdfcnDt: lastMdfcnDt,
                        authrtList: authrtList,
                        dvcPushToken: dvcPushToken
                    },
                    "type": type
                };
            });

            $('#tree').jstree(true).settings.core.data.push(...nodeArray);
            $('#tree').jstree(true).refresh();
        }

        let successPopup = function (data) {
            reset();
            let nodeArray = [];
            $.each(data, function (idx, item) {
                let orgId = item.orgId;
                let id = isEmpty(item.id) ? '' : item.id;
                let orgNm = item.orgNm;
                let upperOrgId = (isEmpty(item.upperOrgId) || item.upperOrgId === 0) ? '#' : item.upperOrgId;
                let orgOrdr = isEmpty(item.orgOrdr) ? 0 : item.orgOrdr;
                let useAt = item.useAt;
                let type = 'default';

                nodeArray[idx] = {
                    "id": orgId,
                    "parent": upperOrgId,
                    "text": orgNm,
                    "data": {
                        type: "ORG",
                        orgId: id,
                        orgOrdr: orgOrdr,
                        useAt: useAt,
                    },
                    "type": type
                };
            });

            $('#treePopup').jstree(true).settings.core.data = nodeArray;
            $('#treePopup').jstree(true).refresh();
        }

        <%-- 메뉴ID 중복체크 성공 시 Callback 함수 --%>
        let successDuplicate = function (data) {
            if (data === 0) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '사용가능한 아이디입니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('chkDup').value = 'Y';
                    }
                });
            } else {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이미 사용중인 아이디입니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('chkDup').value = 'N';
                    }
                });
            }
        }

        let successDuplicateMbr = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '사용가능한 아이디입니다.',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('chkDupMbrID').value = 'Y';
                }
            });
        }

        let successDuplicateEmail = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '사용가능한 이메일입니다.',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('chkDupEmlAddr').value = 'Y';
                }
            });
        }

        <%-- 메뉴추가 성공 시 Callback 함수 --%>
        let successAdd = function (data) {
            let orgId = data.orgId;
            console.log(orgId);
            // let orgId =  data.orgId;
            let orgNm = data.orgNm;
            let orgOrdr = data.orgOrdr;
            let useAt = data.useAt;
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            $('#tree').jstree(true).create_node(selectedNode.id, {
                id: orgId,
                text: orgNm,
                data: {
                    type: "ORG",
                    orgOrdr: orgOrdr,
                    orgId: "",
                    useAt: useAt}
            }, 'last');
            $('#tree').jstree("deselect_all", selectedNode);
            $('#tree').jstree('select_node', orgId);
        }

        let successAddMbr = function (data) {
            let mbrId = data.mbrId;
            let id = isEmpty(data.id) ? "" : data.id;
            let mbrNm = data.mbrNm;
            let upperOrgId = (isEmpty(data.upperOrgId) || data.upperOrgId === 0) ? '#' : data.upperOrgId;
            let orgOrdr = isEmpty(data.orgOrdr) ? 0 : data.orgOrdr;
            let sttsCd = data.sttsCd;
            let type = 'file';

            let uuid = data.uuid;
            let pswd = data.pswd;
            let emlAddr = data.emlAddr
            let mblTelno = data.mblTelno;
            let fxno = data.fxno;
            let zip = data.zip;
            let addr = data.addr;
            let daddr = data.daddr;
            let lgnLckYn = data.lgnLckYn;
            let lgnFailNmtm = data.lgnFailNmtm;
            let frstRgtrId = data.frstRgtrId;
            let frstRegDt = data.frstRegDt;
            let lastMdfrId = data.lastMdfrId;
            let lastMdfcnDt = data.lastMdfcnDt;
            let authrtList = data.authrtList;
            let dvcPushToken = data.dvcPushToken;

            let selectedNode = $('#tree').jstree('get_selected', true)[0];

            $('#tree').jstree(true).create_node(selectedNode.id, {
                "id": isEmpty(id) ? "New" : id,
                "parent": upperOrgId,
                "text": mbrNm,
                "data": {
                    type: "MBR",
                    upperOrgId: upperOrgId,
                    orgOrdr: orgOrdr,
                    id: id,
                    mbrId: mbrId,
                    mbrNm: mbrNm,
                    sttsCd: sttsCd,
                    uuid: uuid,
                    pswd: pswd,
                    emlAddr: emlAddr,
                    mblTelno: mblTelno,
                    fxno: fxno,
                    zip: zip,
                    addr: addr,
                    daddr: daddr,
                    lgnLckYn: lgnLckYn,
                    lgnFailNmtm: lgnFailNmtm,
                    frstRgtrId: frstRgtrId,
                    frstRegDt: frstRegDt,
                    lastMdfrId: lastMdfrId,
                    lastMdfcnDt: lastMdfcnDt,
                    authrtList: authrtList,
                    dvcPushToken: dvcPushToken
                },
                "type": type
            }, 'last');

            $('#tree').jstree("deselect_all", selectedNode);
            $('#tree').jstree("open_all");
            $('#tree').jstree('select_node', id);
        }

        <%-- 메뉴저장 성공 시 Callback 함수 --%>
        let successSave = function (data) {
            if (data !== null && data !== "") {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="success.common.save"/>',
                    showCancel: false,
                    onConfirm: function() {
                        Ajax.get('/api/sys/org/orgList', success, fail);
                    }
                });
            }
        }

        <%-- 메뉴삭제 성공 시 Callback 함수 --%>
        let successDelete = function (data) {
            if (data === 1) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="success.common.delete"/>',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('id').value = "";
                        document.getElementById('id').disabled = false;
                        document.getElementById('btnDuplicateMenuId').disabled = false;
                        document.getElementById('chkDup').value = 'N';
                        Ajax.get('/api/sys/org/orgList', success, fail);
                    }
                });
            }
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

        <%-- 메뉴정보 초기화 함수 --%>

        function reset() {
            document.getElementById('orgNm').value = '';
            document.getElementById('orgOrdr').value = '';
            document.getElementById('useAt1').checked = true;
        }

        <%-- 팝업ON 함수 --%>

        function popupOn() {
            basicModal.show();
        }

        <%-- 팝업OFF 함수 --%>

        function popupOff() {
            basicModal.hide();
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
                    <div class="row mb-6 gy-6">
                        <div class="col-xl">
                            <div class="card h-100">
                                <h5 class="card-header"><c:out value="${menuTitle}"/></h5>
                                <div class="card-body">
                                    <div class="mb-6">
                                        <div class="treeControl d-flex justify-content-end"
                                             style="border-top: 1px solid var(--Greyscale4);border-bottom: 0;">
                                            <button type="button" id="btnAllOpen" class="btn btn-primary me-2">
                                                <spring:message
                                                        code="button.allOpen"/></button>
                                            <button type="button" id="btnAllClose" class="btn btn-primary">
                                                <spring:message
                                                        code="button.allClose"/></button>
                                        </div>
                                    </div>
                                    <div class="mb-6">
                                        <div class="card p-2 shadow-none border h-px-400" id="treeScroll">
                                            <div id="tree" class="sidebar-body ps ps--active-y position-relative"></div>
                                        </div>
                                    </div>
                                    <div class="mb-6">
                                        <div class="treeControl d-flex justify-content-end">
                                            <button type="button" id="btnAddMenu" class="btn btn-primary me-2">
                                                조직 <spring:message
                                                    code="button.add"/></button>
                                            <button type="button" id="btnAddMbr" class="btn btn-primary me-2">
                                                회원 <spring:message
                                                    code="button.add"/></button>
                                            <button type="button" id="btnDeleteMenu" class="btn btn-primary">
                                                <spring:message
                                                        code="button.delete"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl" id="orgInputCard">
                            <div class="card h-100">
                                <h5 class="card-header">부서 정보 등록/수정</h5>
                                <form id="frm">
                                    <div class="card-body">
                                        <input type="hidden" id="orgSe" name="orgSe"
                                               value="<c:out value="${orgSe}"/>">
                                        <input type="hidden" name="chkDup" id="chkDup" value="N">
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="id"><spring:message
                                                        code="title.orgId"/></label>
                                                <div class="input-group input-group-merge has-validation">
                                                    <input class="form-control" type="text" id="id" name="id"
                                                           maxlength="10">
                                                    <button type="button" id="btnDuplicateMenuId"
                                                            class="btn btn-primary"><spring:message
                                                            code="button.duplicate"/></button>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="orgNm"><spring:message
                                                        code="title.orgNm"/></label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="text" name="orgNm" id="orgNm"
                                                           maxlength="10">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="orgOrdr"><spring:message
                                                        code="title.orgOrdr"/></label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="number" name="orgOrdr"
                                                           id="orgOrdr"
                                                           min="1"
                                                           max="99">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="useAt"><spring:message
                                                        code="title.useAt"/></label>
                                                <div class="d-flex justify-content-start" id="useAt">
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="useAt"
                                                               id="useAt1"
                                                               value="N"
                                                               checked>
                                                        <label class="form-check-label" for="useAt1"><spring:message
                                                                code="title.use.n"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="useAt"
                                                               id="useAt2"
                                                               value="Y">
                                                        <label class="form-check-label" for="useAt2"><spring:message
                                                                code="title.use.y"/></label>
                                                    </div>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-end">
                                            <button type="button" id="btnReset" class="btn btn-dark me-2">
                                                <spring:message
                                                        code="button.reset"/></button>
                                            <button type="button" id="btnSave" class="btn btn-primary">
                                                <spring:message
                                                        code="button.save"/></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-xl" id="mbrInputCard" style="display: none">
                            <div class="card h-100">
                                <h5 class="card-header">회원 등록/수정</h5>
                                <div class="card-body pt-0">
                                    <div class="row gx-6">
                                        <input type="hidden" name="prevMbrId" id="prevMbrId">
                                        <input type="hidden" name="uuid" id="uuid">
                                        <input type="hidden" name="mbrUid" id="mbrUid">
                                        <input type="hidden" name="chkDupMbrID" id="chkDupMbrID" value="N">
                                        <input type="hidden" name="chkDupEmlAddr" id="chkDupEmlAddr" value="N">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="id"><spring:message code="title.id"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="text" id="mbrId" name="mbrId"
                                                       maxlength="12" placeholder="daonplace">
                                                <button type="button" id="btnDuplicateId" class="btn btn-primary">
                                                    <spring:message code="button.duplicate"/></button>
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="mbrNm"><spring:message
                                                    code="title.name"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="mbrNm" id="mbrNm"
                                                       maxlength="20" placeholder="홍길동">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="emlAddr">소속 부서 선택</label>
                                            <input type="hidden" name="upperOrgId" id="upperOrgId">
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="text" name="upperOrgNm"
                                                       id="upperOrgNm"
                                                       placeholder="미분류" readonly>
                                                <button type="button" id="btnSelectOrg" class="btn btn-primary"
                                                        onclick="popupOn();">
                                                    선택
                                                </button>
                                            </div>
                                        </div>
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="mbrNm">조직도 순서</label>
                                            <div class="has-validation">
                                                <input class="form-control" type="number" name="orgOrdrMbr"
                                                       id="orgOrdrMbr"
                                                       min="1"
                                                       max="99">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="basicModal" tabindex="-1" style="display: none;"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalTitle">소속 부서 선택</h5>
                                                    <button type="button" class="btn-close bg-danger"
                                                            data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="card p-2 shadow-none border h-px-400"
                                                         id="treeScrollPopup">
                                                        <div id="treePopup"
                                                             class="sidebar-body ps ps--active-y position-relative"></div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-label-primary"
                                                            id="btnSelect">
                                                        선택
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row gx-6">
                                        <div class="alert alert-danger" role="alert">
                                            <h5 class="alert-heading mb-1">비밀번호는 수정이 필요한 경우에만 입력해주세요.</h5>
                                        </div>
                                        <div class="alert alert-warning alert-dismissible" role="alert">
                                            <h5 class="alert-heading mb-1">비밀번호는 아래 규칙에 맞게 작성해주세요.</h5>
                                            <span>
                                                <ul>
                                                    <li><spring:message code="title.password.valid.length"/></li>
                                                    <li><spring:message code="title.password.valid.complexity"/></li>
                                                    <li><spring:message
                                                            code="title.password.valid.prohibit.patterns"/></li>
                                                </ul>
                                            </span>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-password-toggle form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="pswd"><spring:message
                                                    code="title.password"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="password" name="pswd" id="pswd"
                                                       maxlength="20" placeholder="변경 시에만 입력해주세요">
                                                <span class="input-group-text cursor-pointer"
                                                      onclick="passwordFlag(this)"><i class="icon-base bx bx-show"></i></span>
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-password-toggle form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="pswdConfirm"><spring:message
                                                    code="title.password.confirm"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="password" name="pswdConfirm"
                                                       id="pswdConfirm" maxlength="20"
                                                       placeholder="입력한 비밀번호와 동일하게 입력해주세요">
                                                <span class="input-group-text cursor-pointer"
                                                      onclick="passwordFlag(this)"><i class="icon-base bx bx-show"></i></span>
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="emlAddr"><spring:message
                                                    code="title.email"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="text" name="emlAddr" id="emlAddr"
                                                       placeholder="example@gmail.com">
                                                <button type="button" id="btnDuplicateEmail" class="btn btn-primary">
                                                    <spring:message code="button.duplicate"/></button>
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="mbrNm"><spring:message
                                                    code="title.cellphone.number"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="mblTelno" id="mblTelno"
                                                       maxlength="11" placeholder="'-' 제외하고 입력해주세요">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="fxno"><spring:message
                                                    code="title.fax"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="fxno" id="fxno"
                                                       maxlength="20" placeholder="'-' 제외하고 입력해주세요">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="zip"><spring:message
                                                    code="title.zip"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="zip" id="zip"
                                                       maxlength="5" placeholder="우편번호 5자리를 입력해주세요">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="addr"><spring:message
                                                    code="title.addres"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="addr" id="addr"
                                                       maxlength="100" placeholder="전남 나주시 우정로 56">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="daddr"><spring:message
                                                    code="title.detail.addres"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="daddr" id="daddr"
                                                       maxlength="100" placeholder="B 204호">
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="sttsCd"><spring:message
                                                    code="title.member.status"/></label>

                                            <div class="d-flex justify-content-start" id="sttsCd">
                                                <div class="form-check mb-0 me-4 me-lg-12">
                                                    <input class="form-check-input" type="radio" name="sttsCd"
                                                           id="sttsCd1" value="P" checked>
                                                    <label class="form-check-label" for="sttsCd1"><spring:message
                                                            code="title.member.status.apply"/></label>
                                                </div>
                                                <div class="form-check mb-0 me-4 me-lg-12">
                                                    <input class="form-check-input" type="radio" name="sttsCd"
                                                           id="sttsCd2" value="A">
                                                    <label class="form-check-label" for="sttsCd2"><spring:message
                                                            code="title.member.status.approval"/></label>
                                                </div>
                                                <div class="form-check mb-0 me-4 me-lg-12">
                                                    <input class="form-check-input" type="radio" name="sttsCd"
                                                           id="sttsCd3" value="D">
                                                    <label class="form-check-label" for="sttsCd3"><spring:message
                                                            code="title.member.status.withdrawal"/></label>
                                                </div>
                                                <div class="form-check mb-0">
                                                    <input class="form-check-input" type="radio" name="sttsCd"
                                                           id="sttsCd4" value="B">
                                                    <label class="form-check-label" for="sttsCd4"><spring:message
                                                            code="title.member.status.block"/></label>
                                                </div>
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="role"><spring:message
                                                    code="title.member.authority"/></label>
                                            <div class="input-group has-validation" id="role">
                                                <c:forEach var="item" items="${authrtList}" varStatus="status">
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="checkbox" name="authrt"
                                                               id="role<c:out value="${status.count}"/>"
                                                               value="<c:out value="${item.authrtId}"/>">
                                                        <label class="form-check-label"
                                                               for="role<c:out value="${status.count}"/>"><c:out
                                                                value="${item.authrtNm}"/></label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" id="btnReleaseLock" class="btn btn-primary me-2">
                                            <spring:message code="button.lockRelease"/></button>
                                        <button type="submit" class="btn btn-primary" id="btnUpdate"><spring:message
                                                code="button.save"/></button>
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
<script src="/static/js/common/validator.js"></script>
<script src="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script type="text/javascript">
    let basicModal = new bootstrap.Modal(document.getElementById('basicModal'), {
        keyboard: false
    })

    $(function () {
        $("#basicModal").on('hide.bs.modal', function () {
            //모달이 꺼질때 모든 버튼 인풋 셀렉트 텍스트 에어리어의 포커스를 날린다.
            $('button, input, select, textarea').each(function () {
                $(this).blur();
            });
        })

        $('#treePopup').jstree({
            "core": {
                "check_callback": true,
                "data": [],
                "multiple": false
            },
            "plugins": [
                "sort",
                "types",
                "checkbox"
            ],
            "sort": function (node1, node2) {
                var a1 = this.get_node(node1);
                var b1 = this.get_node(node2);
                return a1.data.menuOrdr > b1.data.menuOrdr ? 1 : -1;
            },
            "types": {
                "#": { // ROOT
                    // "max_depth": 4 // 하위 depth 제한
                },
                "file": { /// type이 file인 경우
                    "icon": "jstree-file", // file 아이콘
                    "max_children": 0, // leaf 이므로 자식을 못가도록 설정
                    "max_depth": 0
                },
            },
            "checkbox": {
                "three_state": false
            }
        }).bind("refresh.jstree", function (e, data) {
            $(this).jstree("open_all");
        });

        <%-- 메뉴트리 초기화 --%>
        $('#tree').jstree({
            "core": {
                "check_callback": true,
                "data": [],
                "multiple": false,
            },
            "plugins": [
                "sort",
                "types"
            ],
            "sort": function (node1, node2) {
                var a1 = this.get_node(node1);
                var b1 = this.get_node(node2);
                return a1.data.orgOrdr > b1.data.orgOrdr ? 1 : -1;
            },
            "types": {
                "#": { // ROOT
                    // "max_depth": 4 // 하위 depth 제한
                },
                "file": { /// type이 file인 경우
                    "icon": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAYAAADgKtSgAAAAAXNSR0IArs4c6QAAAOhJREFUSEu9lGEOwiAMhV+9mNttnOEOzjsQ523cyaypQrLhaBkG+Qt8fW1fS2h4qCEbRfCz45GBI4BOxBBwvXkaLWEmfHD8iNAUxkB/9zTngqjwoPiiKJwnT30VfHDMVuqa+qzyk+OOACmJeqrgQixRrjVXrbnWzJjO5CnLUOFWaSxLmlbMOcYCh3mwWva5lyDx5ROYNX/Hd6ZyKY08PoTp3BMgCy8YoHec3W4pcUnJKvhSXqp4q1OpLVfwX8Ah2GrXrOA15UgzWKpP4eaisoy73DX/gzetuaQch8ZKf+s+nVpzQmuCxD8vSzhvGFDb99cAAAAASUVORK5CYII=",
                    "max_children": 0, // leaf 이므로 자식을 못가도록 설정
                    "max_depth": 0
                },
            }
        }).bind("refresh.jstree", function (e, data) {
            $(this).jstree("open_all");
        });

        new PerfectScrollbar(document.getElementById('treePopup'), {
            wheelPropagation: false
        });

        new PerfectScrollbar(document.getElementById('tree'), {
            wheelPropagation: false
        });

        $("#basicModal").on('shown.bs.modal', function () {
            const prevOrgId = document.getElementById("upperOrgId").value;
            if (prevOrgId) {
                // $('#tree').jstree(true).get_node(prevOrgId);
                $("#treePopup").jstree(true).uncheck_all();
                $('#treePopup').jstree(true).check_node(parseInt(prevOrgId));
            }
        })

        <%-- form validate --%>
        $('#frm').validate({
            rules: {
                id: {
                    required: true,
                    minlength: 4,
                    maxlength: 10,
                    validOrgId: true,
                },
                orgNm: {
                    required: true,
                    minlength: 1,
                    maxlength: 10,
                    validOrgNm: true,
                },
                orgOrdr: {
                    required: true,
                    min: 1,
                    max: 99,
                },
                useAt: {
                    required: true,
                }
            },
            messages: {
                orgId: {
                    required: '<spring:message code="org.orgId.required"/>',
                    minlength: '<spring:message code="org.orgId.minlength"/>',
                    maxlength: '<spring:message code="org.orgId.maxlength"/>',
                    validOrgId: '<spring:message code="org.orgId.validOrgId"/>',
                },
                orgNm: {
                    required: '<spring:message code="org.orgNm.required"/>',
                    minlength: '<spring:message code="org.orgNm.minlength"/>',
                    maxlength: '<spring:message code="org.orgNm.maxlength"/>',
                    validMenuNm: '<spring:message code="org.orgNm.validOrgNm"/>',
                },
                orgOrdr: {
                    required: '<spring:message code="org.orgOrdr.required"/>',
                    min: '<spring:message code="org.orgOrdr.min"/>',
                    max: '<spring:message code="org.orgOrdr.max"/>',
                },
                useAt: {
                    required: '<spring:message code="menu.useAt.required"/>'
                }
            },
            submitHandler: function (form) {
                if (confirm('<spring:message code="confirm.common.save"/>')) {
                    let selectedNode = $('#tree').jstree('get_selected', true)[0];
                    let data = bindingData(form);
                    data["orgId"] = selectedNode.id;
                    data["upperOrgId"] = selectedNode.parent;
                    Ajax.post('/api/sys/org/update', successSave, fail, {data: JSON.stringify(data)});
                }
            }
        });

        Ajax.get('/api/sys/org/orgList', success, fail);
        Ajax.get('/api/sys/org/orgList', successPopup, fail);

        <%-- 메뉴 선택 시 이벤트 --%>
        $('#tree').on("select_node.jstree", function (event, data) {
            let node = data.node;

            if (node.data.type == "ORG") {
                let id = node.data.orgId;
                if (isEmpty(id)) {
                    document.getElementById('chkDup').value = 'N';
                    document.getElementById('id').disabled = false;
                    document.getElementById('btnDuplicateMenuId').disabled = false;
                } else {
                    document.getElementById('chkDup').value = 'Y';
                    document.getElementById('id').disabled = true;
                    document.getElementById('btnDuplicateMenuId').disabled = true;
                }

                document.getElementById('id').value = id;
                document.getElementById('orgNm').value = node.text;
                document.getElementById('orgOrdr').value = node.data.orgOrdr;

                let useAt = node.data.useAt;
                let useAtList = document.getElementsByName('useAt');
                for (let i = 0; i < useAtList.length; i++) {
                    if (useAtList[i].value === useAt) {
                        useAtList[i].checked = true;
                        break;
                    }
                }

                $("#orgInputCard").show();
                $("#mbrInputCard").hide();
            } else if (node.data.type == "MBR") {
                document.getElementById('prevMbrId').value = node.data.id

                if (!isEmpty(node.data.id)) {
                    document.getElementById('mbrId').disabled = true;
                    document.getElementById('btnDuplicateId').disabled = true;
                    document.getElementById('chkDupMbrID').value = "Y";
                } else {
                    document.getElementById('mbrId').disabled = false;
                    document.getElementById('btnDuplicateId').disabled = false;
                    document.getElementById('chkDupMbrID').value = "N";
                }

                document.getElementById('uuid').value = node.data.uuid;
                document.getElementById('mbrId').value = node.data.id;
                document.getElementById('mbrUid').value = node.data.mbrId;
                document.getElementById('mbrNm').value = node.data.mbrNm;
                document.getElementById('emlAddr').value = node.data.emlAddr;
                document.getElementById('fxno').value = node.data.fxno;
                document.getElementById('zip').value = node.data.zip;
                document.getElementById('addr').value = node.data.addr;
                document.getElementById('daddr').value = node.data.daddr;
                document.getElementById('mblTelno').value = node.data.mblTelno;
                document.getElementById('upperOrgId').value = node.data.upperOrgId;
                document.getElementById('upperOrgNm').value = $('#tree').jstree(true).get_node(node.data.upperOrgId).text
                document.getElementById('orgOrdrMbr').value = node.data.orgOrdr;

                let authrtList = node.data.authrtList;
                authrtList.forEach(function (authrt) {
                    $("input[id*='role'][value='" + authrt.authrtId + "']").attr("checked", true);
                    // document.getElementById('role' + authrt.authrtId).checked = true;
                });

                let sttsCd = node.data.sttsCd;
                if (sttsCd === 'P') document.getElementById('sttsCd1').checked = true;
                else if (sttsCd === 'A') document.getElementById('sttsCd2').checked = true;
                else if (sttsCd === 'D') document.getElementById('sttsCd3').checked = true;
                else if (sttsCd === 'B') document.getElementById('sttsCd4').checked = true;

                let lgnLckYn = node.data.lgnLckYn;
                if (lgnLckYn === 'Y') {
                    document.getElementById('btnReleaseLock').classList.remove('disabled');
                } else {
                    document.getElementById('btnReleaseLock').classList.add('disabled');
                }

                $("#orgInputCard").hide();
                $("#mbrInputCard").show();
            }
        });

        <%-- 메뉴ID가 변경됬을 시 이벤트 --%>
        document.getElementById('id').addEventListener('change', function (event) {
            document.getElementById('chkDup').value = 'N';
        });

        document.getElementById('btnDuplicateEmail').addEventListener('click', function () {
            const emlAddr = document.getElementById('emlAddr').value;
            if (isEmpty(emlAddr)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이메일을 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('emlAddr').focus();
                    }
                });
                return;
            }

            if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emlAddr)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '유효하지 않은 이메일입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            const data = {
                emlAddr: emlAddr.trim(),
                uuid: document.getElementById('uuid').value
            };

            Ajax.get(dataToQueryString('/api/sys/mbr/duplicateEmail', data), successDuplicateEmail, fail);
        });

        <%-- 중복체크버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateId').addEventListener('click', function () {
            const mbrId = document.getElementById('mbrId').value;
            if (isEmpty(mbrId)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '아이디를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mbrId').focus();
                    }
                });
                return;
            }

            if (!/^[a-z][a-z0-9]{5,11}$/.test(mbrId)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '유효하지 않은 아이디입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            <%-- GS인증 아이디 생성 규칙 예약어 조치 --%>
            if (mbrId.toLowerCase().includes('admin') || mbrId.toLowerCase().includes('administrator') || mbrId.toLowerCase().includes('root') || mbrId.toLowerCase().includes('system')) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '유효하지 않은 아이디입니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            const data = {
                id: mbrId.trim()
            };

            Ajax.get(dataToQueryString('/api/sys/mbr/duplicateId', data), successDuplicateMbr, fail);
        });

        <%-- 중복체크 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateMenuId').addEventListener('click', function () {
            let id = document.getElementById('id');
            if (isEmpty(id.value)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="org.valid.orgId"/>',
                    showCancel: false,
                    onConfirm: function() {
                        id.focus();
                    }
                });
                return;
            }

            if (!/^[a-z][a-z0-9]{3,9}$/.test(id.value)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="org.orgId.validOrgId"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            let data = {
                id: id.value
            };

            Ajax.get(dataToQueryString('/api/sys/org/duplicateOrgId', data), successDuplicate, fail);
        });

        <%-- 저장 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="org.select.required"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            let chkDup = document.getElementById('chkDup').value;
            if (chkDup !== 'Y') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="org.valid.chkDup"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            let orgNm = document.getElementById('orgNm').value;
            document.getElementById('orgNm').value = orgNm.trim();

            $('#frm').submit();
        });

        <%-- 추가 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnAddMenu').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.select.required"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            if (selectedNode.type === 'file') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.valid.menuTy"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            let data = {
                id: '',
                orgNm: 'New',
                upperOrgId: selectedNode.id,
                orgDp: selectedNode.parents.length + 1,
                useAt: 'N'
            }

            Ajax.post('/api/sys/org/save', successAdd, fail, {data: JSON.stringify(data)});
        });

        <%-- 추가 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnAddMbr').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.select.required"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            if (selectedNode.type === 'file') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.valid.menuTy"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            let data = {
                id: '',
                mbrNm: '',
                sttsCd: 'P',
                pswd: '',
                orgOrdr: 99,
                upperOrgId: selectedNode.id
            }

            Ajax.post('/api/sys/mbrOrg/save', successAddMbr, fail, {data: JSON.stringify(data)});
        });

        <%-- 삭제 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDeleteMenu').addEventListener('click', function () {
            if (confirm('<spring:message code="confirm.common.delete"/>')) {
                let selectedNode = $('#tree').jstree('get_selected', true)[0];
                if (selectedNode.parent === '#') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: 'ROOT 메뉴는 삭제할 수 없습니다.',
                        showCancel: false,
                        onConfirm: function() {
                        }
                    });
                    return;
                }

                let type = selectedNode.data.type;

                if (type == "ORG") {
                    let data = {
                        orgId: selectedNode.id,
                        childrenList: selectedNode.children_d
                    }

                    Ajax.post('/api/sys/org/delete', successDelete, fail, {data: JSON.stringify(data)});
                } else if (type == "MBR") {
                    let data = {
                        uuid: selectedNode.data.uuid,
                    }

                    Ajax.post('/api/sys/mbrOrg/delete', successDelete, fail, {data: JSON.stringify(data)});
                }
            }
        });

        <%-- 전체열기 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnAllOpen').addEventListener('click', function () {
            $('#tree').jstree("open_all");
        });

        <%-- 전체닫기 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnAllClose').addEventListener('click', function () {
            $('#tree').jstree("close_all");
            document.getElementById("tree").scrollTop = 0;
        });

        <%-- 초기화 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnReset').addEventListener('click', function () {
            reset();
        });

        document.getElementById('btnSelect').addEventListener('click', function () {
            let selectedNodes = $('#treePopup').jstree('get_checked', true);

            if (isEmpty(selectedNodes)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '소속 부서를 선택해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            selectedNodes.forEach(function (element, index) {
                document.getElementById("upperOrgId").value = element.id;
                document.getElementById("upperOrgNm").value = $('#treePopup').jstree(true).get_node(element.id).text;
            });

            popupOff();
        });

        $(".datatables-lists").DataTable().draw();

        document.getElementById('btnUpdate').addEventListener('click', function () {
            const uuid = document.getElementById('uuid').value;
            const prevMbrId = document.getElementById('prevMbrId').value;

            const mbrId = document.getElementById('mbrId').value;
            if (isEmpty(mbrId)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '아이디를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mbrId').focus();
                    }
                });
                return;
            }

            const chkDupMbrID = document.getElementById('chkDupMbrID').value;
            if (chkDupMbrID !== 'Y') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '아이디 중복체크를 해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('btnDuplicateId').focus();
                    }
                });
                return;
            }

            const chkDupEmlAddr = document.getElementById('chkDupEmlAddr').value;
            if (chkDupEmlAddr !== 'Y') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이메일 중복체크를 해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('btnDuplicateEmail').focus();
                    }
                });
                return;
            }

            const mbrNm = document.getElementById('mbrNm').value;
            const nmRegex = /^[가-힣]{2,6}$/;
            if (isEmpty(mbrNm)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이름을 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mbrNm').focus();
                    }
                });
                return;
            } else if (!nmRegex.test(mbrNm)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이름이 유효하지 않습니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mbrNm').focus();
                    }
                });
                return;
            }

            const pswd = document.getElementById('pswd').value;
            const pswdConfirm = document.getElementById('pswdConfirm').value;

            const emlAddr = document.getElementById('emlAddr').value;
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (isEmpty(emlAddr)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이메일주소를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('emlAddr').focus();
                    }
                });
                return;
            } else if (!emailRegex.test(emlAddr)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '이메일주소를 유효하지 않습니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('emlAddr').focus();
                    }
                });
                return;
            }


            const mblTelno = document.getElementById('mblTelno').value;
            const phoneRegex = /^[0-9]{7,11}$/;
            if (isEmpty(mblTelno)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '핸드폰번호를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mblTelno').focus();
                    }
                });
                return;
            } else if (!phoneRegex.test(mblTelno)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '핸드폰번호를 유효하지 않습니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('mblTelno').focus();
                    }
                });
                return;
            }


            const fxno = document.getElementById('fxno').value;

            const zip = document.getElementById('zip').value;

            const addr = document.getElementById('addr').value;

            const daddr = document.getElementById('daddr').value;

            const sttsCd = document.querySelector('input[name="sttsCd"]:checked').value;

            const upperOrgId = document.getElementById('upperOrgId').value;
            const orgOrdrMbr = document.getElementById('orgOrdrMbr').value;

            const mbrUid = document.getElementById('mbrUid').value;
            const authrtList = [];
            document.querySelectorAll('input[name="authrt"]:checked').forEach(function (checkbox) {
                authrtList.push({
                    "authrtId": checkbox.value
                });
            });

            if (authrtList.length <= 0) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '회원권한을 최소 1개 이상 선택해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('role').focus();
                    }
                });
                return;
            }

            if (isEmpty(upperOrgId)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '소속 부서를 선택해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('btnSelectOrg').focus();
                    }
                });
                return;
            }

            if (isEmpty(orgOrdrMbr)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.menuOrdr.required"/>',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('orgOrdrMbr').focus();
                    }
                });
                return;
            }

            let data = {};
            if (prevMbrId !== null && prevMbrId !== "") {
                if (pswd !== pswdConfirm) {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '비밀번호와 비밀번호 확인이 다릅니다.',
                        showCancel: false,
                        onConfirm: function() {
                            document.getElementById('pswdConfirm').focus();
                        }
                    });
                    return;
                }

                data = {
                    "uuid": uuid,
                    "mbrId": mbrUid,
                    "mbrNm": mbrNm.trim(),
                    "pswd": pswd,
                    "emlAddr": emlAddr.trim(),
                    "mblTelno": mblTelno.trim(),
                    "fxno": fxno.trim(),
                    "zip": zip,
                    "addr": addr,
                    "daddr": daddr,
                    "sttsCd": sttsCd,
                    "authrtList": authrtList,
                    "upperOrgId": upperOrgId,
                    "orgOrdr": orgOrdrMbr
                };
            } else {
                if (isEmpty(pswd)) {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '비밀번호를 입력해주세요.',
                        showCancel: false,
                        onConfirm: function() {
                            document.getElementById('pswd').focus();
                        }
                    });
                    return;
                }

                if (isEmpty(pswdConfirm)) {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '비밀번호 확인을 입력해주세요.',
                        showCancel: false,
                        onConfirm: function() {
                            document.getElementById('pswdConfirm').focus();
                        }
                    });
                    return;
                }

                if (pswd !== pswdConfirm) {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '비밀번호와 비밀번호 확인이 다릅니다.',
                        showCancel: false,
                        onConfirm: function() {
                            document.getElementById('pswdConfirm').focus();
                        }
                    });
                    return;
                }

                data = {
                    "uuid": uuid,
                    "mbrId": parseInt(mbrUid),
                    "id": mbrId.trim(),
                    "mbrNm": mbrNm.trim(),
                    "pswd": pswd,
                    "emlAddr": emlAddr.trim(),
                    "mblTelno": mblTelno.trim(),
                    "fxno": fxno.trim(),
                    "zip": zip,
                    "addr": addr,
                    "daddr": daddr,
                    "sttsCd": sttsCd,
                    "authrtList": authrtList,
                    "upperOrgId": upperOrgId,
                    "orgOrdr": orgOrdrMbr
                };
            }

            if (confirm('<spring:message code="confirm.common.update"/>')) {
                Ajax.post('/api/sys/mbrOrg/update', successSave, fail, {data: JSON.stringify(data)});
            }
        });

        document.getElementById('pswdConfirm').addEventListener('change', function () {
            if (document.getElementById("pswd").value !== document.getElementById("pswdConfirm").value) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '비밀번호와 비밀번호 확인이 다릅니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('pswdConfirm').focus();
                    }
                });
            }
        })
    });
</script>
</body>
</html>
