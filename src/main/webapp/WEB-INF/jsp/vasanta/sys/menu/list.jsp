<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/></title>
    <link rel="stylesheet" href="/static/vendor/plugins/jstree/dist/themes/default/style.min.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <script src="/static/vendor/plugins/jstree/dist/jstree.min.js"></script>
    <script type="text/javascript">
        let isSubmitAttempted = false;
        let isIdDupAttempted = false;
        let isIdChecked = false;
        let isNewMenu = false;

        <%-- 메뉴조회 성공 시 Callback 함수 --%>
        let success = function (data) {
            reset();
            let nodeArray = [];
            $.each(data, function (idx, item) {
                let menuId = item.menuId;
                let id = isEmpty(item.id) ? '' : item.id;
                let menuNm = item.menuNm;
                let upperMenuId = (isEmpty(item.upperMenuId) || item.upperMenuId === 0) ? '#' : item.upperMenuId;
                let menuOrdr = isEmpty(item.menuOrdr) ? 0 : item.menuOrdr;
                let menuTy = item.menuTy;
                let gnbAt = item.gnbAt;
                let useAt = item.useAt;
                let url = item.url;
                let type = menuTy !== 'DIR' ? 'file' : 'default';

                nodeArray[idx] = {
                    "id": menuId,
                    "parent": upperMenuId,
                    "text": menuNm,
                    "data": {
                        menuId: id,
                        menuTy: menuTy,
                        menuOrdr: menuOrdr,
                        gnbAt: gnbAt,
                        useAt: useAt,
                        url: url
                    },
                    "type": type
                };
            });

            $('#tree').jstree(true).settings.core.data = nodeArray;
            $('#tree').jstree(true).refresh();
        }

        <%-- 메뉴ID 중복체크 성공 시 Callback 함수 --%>
        let successDuplicate = function (data) {
            if (data === 0) {
                isIdChecked = true;
                showSuccessMessage('id', VALIDATION_MESSAGES.menu.menuIdAvailable);
            } else {
                isIdChecked = false;
                fvMenuInstance.revalidateField('id');
            }
        }

        <%-- 메뉴추가 성공 시 Callback 함수 --%>
        let successAdd = function (data) {
            let menuId = data.menuId;
            console.log(menuId);
            // let menuId =  data.menuId;
            let menuNm = data.menuNm;
            let menuOrdr = data.menuOrdr;
            let gnbAt = data.menuDp === 1 ? data.gnbAt : 'N';
            let useAt = data.useAt;
            let url = data.url;
            let menuTy = data.menuTy;
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            $('#tree').jstree(true).create_node(selectedNode.id, {
                id: menuId,
                text: menuNm,
                data: {menuTy: menuTy, menuOrdr: menuOrdr, url: url, menuId: '', gnbAt: gnbAt, useAt: useAt}
            }, 'last');
            $('#tree').jstree("deselect_all", selectedNode);
            $('#tree').jstree('select_node', menuId);

            if (data.menuDp <= 2) {
                document.getElementById('gntView').style.removeProperty('display');
            } else {
                document.getElementById('gntView').style.display = 'none';
            }

        }

        <%-- 메뉴저장 성공 시 Callback 함수 --%>
        let successSave = function (data) {
            if (data === 1) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="success.common.save"/>',
                    showCancel: false,
                    onConfirm: function() {
                        let menuSe = document.getElementById('menuSe').value;
                        Ajax.get('/api/sys/' + menuSe + 'menu/list', success, fail);
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
                        let menuSe = document.getElementById('menuSe').value;
                        document.getElementById('id').value = "";
                        document.getElementById('id').disabled = false;
                        document.getElementById('btnDuplicateMenuId').disabled = false;
                        isSubmitAttempted = false;
                        isIdDupAttempted = false;
                        isIdChecked = false;
                        Ajax.get('/api/sys/' + menuSe + 'menu/list', success, fail);
                    }
                });
            }
        }

        <%-- 팝업리스트 조회 함수 --%>

        function search(pageIndex) {
            let data = bindingData(document.getElementById('frmSearch'));
            data["pageIndex"] = pageIndex;

            let url = '';
            let menuTy = document.querySelector('input[name=menuTy]:checked').value;

            var modalTitle = $("#modalTitle");
            if (menuTy === 'CNTNTS') {
                cntntDtLoad(this);
                modalTitle.text("콘텐츠 선택");
                popupOn();
            } else if (menuTy === 'BBS') {
                bbsDtLoad(this);
                modalTitle.text("게시판 선택");
                popupOn();
            } else if (menuTy === 'PROGRM') {
                progrmDtLoad(this);
                modalTitle.text("프로그램 선택");
                popupOn();
                // url = '/api/sys/progrm/list';
            }
            // Ajax.get(dataToQueryString(url, data), successSearch, fail);
        }

        <%-- 팝업리스트 조회 성공 시 Callback 함수 --%>
        let successSearch = function (data) {
            let paginationInfo = data.paginationInfo;
            document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;
            renderPagination(paginationInfo, document.getElementById('pagination'));

            let selectOption = document.getElementById('searchCondition');
            removeAllChild(selectOption);

            let selectNode = '';

            let menuTy = document.querySelector('input[name=menuTy]:checked').value;
            if (menuTy === 'CNTNTS') {
                selectNode = `<option value="ALL" selected>전체</option>
                              <option value="">콘텐츠명</option>
                              <option value="">콘텐츠ID</option>`;
            } else if (menuTy === 'BBS') {
                selectNode = `<option value="ALL" selected>전체</option>
                              <option value="">게시판명</option>
                              <option value="">게시판ID</option>`;
            } else if (menuTy === 'PROGRM') {
                selectNode = `<option value="ALL" selected>전체</option>
                              <option value="PROGRM_NM">프로그램명</option>
                              <option value="PROGRM_DC">프로그램설명</option>`;
            }

            selectOption.insertAdjacentHTML('beforeend', selectNode);

            $(".selectBox").selectric('refresh');

            let tableHead = document.getElementById('table-head');
            removeAllChild(tableHead);

            let headNode = '';
            if (menuTy === 'CNTNTS') {
                headNode = `<tr>
                                <th class="tblHeaderItem check"></th>
                                <th class="tblHeaderItem tit">콘텐츠명</th>
                                <th class="tblHeaderItem item02">콘텐츠설명</th>
                                <th class="tblHeaderItem date">등록일자</th>
                            </tr>`;
            } else if (menuTy === 'BBS') {
                headNode = `<tr>
                                <th class="tblHeaderItem check"></th>
                                <th class="tblHeaderItem item01">게시판ID</th>
                                <th class="tblHeaderItem item01">타입</th>
                                <th class="tblHeaderItem tit">게시판명</th>
                                <th class="tblHeaderItem item02">등록일자</th>
                             </tr>`;
            } else if (menuTy === 'PROGRM') {
                headNode = `<tr>
                                <th class="tblHeaderItem check"></th>
                                <th class="tblHeaderItem tit">프로그램명</th>
                                <th class="tblHeaderItem tit">프로그램설명</th>
                                <th class="tblHeaderItem item02">URL</th>
                            </tr>`;
            }

            tableHead.insertAdjacentHTML('beforeend', headNode);

            let tableBody = document.getElementById('table-body');
            removeAllChild(tableBody);

            let bodyNode = '';
            data.data.forEach(function (element, index) {
                if (index >= paginationInfo.pageSize) return false;
                if (menuTy === 'CNTNTS') {
                    bodyNode = `<tr>
                                    <td class="tblBodyItem check"><input type="radio" name="checkRadio" value="${'${element.cntntsId}'}"/></td>
                                    <td class="tblBodyItem tit">${'${element.cntntsNm}'}</td>
                                    <td class="tblBodyItem item02">${'${element.cntntsDc}'}</td>
                                    <td class="tblBodyItem date">${'${element.frstRegistDt}'}</td>
                                </tr>`;
                } else if (menuTy === 'BBS') {
                    bodyNode = `<tr>
                                    <td class="tblBodyItem check"><input type="radio" name="checkRadio" value="${'${element.bbsId}'}"/></td>
                                    <td class="tblBodyItem item01">${'${element.bbsId}'}</td>
                                    <td class="tblBodyItem item01">${'${element.bbsTyCode}'}</td>
                                    <td class="tblBodyItem tit">${'${element.bbsNm}'}</td>
                                    <td class="tblBodyItem item02">${'${element.frstRegistDt}'}</td>
                                </tr>`;
                } else if (menuTy === 'PROGRM') {
                    bodyNode = `<tr>
                                    <td class="tblBodyItem check"><input type="radio" name="checkRadio" value="${'${element.progrmUrl}'}"/></td>
                                    <td class="tblBodyItem tit">${'${element.progrmNm}'}</td>
                                    <td class="tblBodyItem tit">${'${element.progrmDc}'}</td>
                                    <td class="tblBodyItem item02">${'${element.progrmUrl}'}</td>
                                </tr>`;
                }

                tableBody.insertAdjacentHTML('beforeend', bodyNode);
            });
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.error"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false
            });
            console.log(xhr + ", " + status + " : " + error);
        }

        let modalOpenedByClick = false;
        let urlSelected = false;

        <%-- 팝업ON 함수 --%>
        function popupOn() {
            // var basicModal = $("#basicModal");
            modalOpenedByClick = true;
            urlSelected = false;
            basicModal.show();
        }

        <%-- 팝업OFF 함수 --%>

        function popupOff() {
            // var basicModal = $("#basicModal");
            urlSelected = true;
            basicModal.hide();
        }

        <%-- 메뉴정보 초기화 함수 --%>

        function reset() {
            document.getElementById('menuNm').value = '';
            document.getElementById('menuOrdr').value = '';
            document.getElementById('menuTy1').checked = true;
            document.getElementById('url').value = '';
            document.getElementById('gnbAt1').checked = true;
            document.getElementById('useAt1').checked = true;
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
                        <div class="col-xl-4 col-12">
                            <div class="card h-100">
                                <h5 class="card-header"><c:out value="${menuTitle}"/></h5>
                                <div class="card-body">
                                    <div class="mb-6">
                                        <div class="treeControl d-flex justify-content-end">
                                            <button type="button" id="btnAllOpen" class="btn btn-secondary me-2">
                                                <spring:message
                                                        code="button.allOpen"/></button>
                                            <button type="button" id="btnAllClose" class="btn btn-secondary">
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
                                            <button type="button" id="btnAddMenu" class="btn btn-label-primary me-2">
                                                <i class="icon-base bx bx-plus icon-sm"></i>
                                                <spring:message
                                                        code="button.add"/></button>
                                            <button type="button" id="btnDeleteMenu" class="btn btn-label-danger">
                                                <i class="icon-base bx bx-trash icon-sm"></i>
                                                <spring:message
                                                        code="button.delete"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl">
                            <div class="card h-100">
                                <h5 class="card-header">메뉴 정보 등록/수정</h5>
                                <form id="frm">
                                    <div class="card-body">
                                        <input type="hidden" id="menuSe" name="menuSe"
                                               value="<c:out value="${menuSe}"/>">
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="id"><spring:message
                                                        code="title.menuId"/>
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="input-group input-group-merge has-validation">
                                                    <input class="form-control" type="text" id="id" name="formValidationMenuId"
                                                           maxlength="15" placeholder="영어 소문자와 숫자로 구성된 아이디를 입력하세요.">
                                                    <button type="button" id="btnDuplicateMenuId"
                                                            class="btn btn-secondary"><spring:message
                                                            code="button.duplicate"/></button>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                <div class="form-text">
                                                    영어 소문자와 숫자로 구성된 아이디를 입력하세요.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="menuNm"><spring:message
                                                        code="title.menuNm"/>
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="text" name="formValidationMenuNm" id="menuNm"
                                                           maxlength="20" placeholder="메뉴명을 입력하세요.">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="menuOrdr"><spring:message
                                                        code="title.menuOrdr"/>
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="number" name="formValidationMenuOrdr"
                                                           id="menuOrdr"
                                                           min="1"
                                                           max="99" placeholder="메뉴 순서를 숫자로 입력하세요.">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="divMenuTy"><spring:message
                                                        code="title.menuTy"/>
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="d-flex flex-wrap" id="divMenuTy">
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="menuTy"
                                                               id="menuTy1" value="DIR" checked>
                                                        <label class="form-check-label" for="menuTy1"><spring:message
                                                                code="title.menuTy.dir"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="menuTy"
                                                               id="menuTy2" value="CNTNTS">
                                                        <label class="form-check-label" for="menuTy2"><spring:message
                                                                code="title.menuTy.contents"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="menuTy"
                                                               id="menuTy3" value="BBS">
                                                        <label class="form-check-label" for="menuTy3"><spring:message
                                                                code="title.menuTy.bbs"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="menuTy"
                                                               id="menuTy4" value="PROGRM">
                                                        <label class="form-check-label" for="menuTy4"><spring:message
                                                                code="title.menuTy.progrm"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="menuTy"
                                                               id="menuTy5" value="LINK">
                                                        <label class="form-check-label" for="menuTy5"><spring:message
                                                                code="title.menuTy.link"/></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade" id="basicModal" tabindex="-1" style="display: none;"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-xl" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="modalTitle"></h5>
                                                        <button type="button" class="btn-close bg-danger" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <table class="datatables-lists table border-top dataTable dtr-column"
                                                               id="DataTables_Table_0"
                                                               aria-describedby="DataTables_Table_0_info">
                                                        </table>
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
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <input class="form-control" type="text" name="formValidationUrl" id="url"
                                                       maxlength="200"
                                                       placeholder="https://example.com"
                                                       aria-label="readonly" readonly>
                                            </div>
                                        </div>

                                        <div class="row gx-6" id="gntView" style="display: none">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="gnbAt"><spring:message
                                                        code="title.gnbAt"/>
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="d-flex justify-content-start" id="gnbAt">
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="gnbAt"
                                                               id="gnbAt1"
                                                               value="N"
                                                               checked>
                                                        <label class="form-check-label" for="gnbAt1"><spring:message
                                                                code="title.use.n"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="gnbAt"
                                                               id="gnbAt2"
                                                               value="Y">
                                                        <label class="form-check-label" for="gnbAt2"><spring:message
                                                                code="title.use.y"/></label>
                                                    </div>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="useAt"><spring:message
                                                        code="title.useAt"/>
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="d-flex flex-wrap" id="useAt">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/js/common/validator.js"></script>
<script src="/static/pages/sys/js/menu/cntntList.js"></script>
<script src="/static/pages/sys/js/menu/bbsList.js"></script>
<script src="/static/pages/sys/js/menu/progrmList.js"></script>
<script src="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.js"></script>


<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script type="text/javascript">
    let basicModal = new bootstrap.Modal(document.getElementById('basicModal'), {
        keyboard: false
    })

    $(function () {
        <%-- form validation inline message 초기화 --%>
        initFvMenu();

        <%-- 메뉴트리 초기화 --%>
        $('#tree').jstree({
            "core": {
                "check_callback": true,
                "data": [],
                "multiple": false
            },
            "plugins": [
                "sort",
                "types"
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
            }
        }).bind("refresh.jstree", function (e, data) {
            $(this).jstree("open_all");
        });

        new PerfectScrollbar(document.getElementById('tree'), {
            wheelPropagation: false
        });

        $("#basicModal").on('hide.bs.modal', function () {
            //모달이 꺼질때 모든 버튼 인풋 셀렉트 텍스트 에어리어의 포커스를 날린다.
            $('button, input, select, textarea').each(function () {
                $(this).blur();
            });
        })

        $("#basicModal").on('shown.bs.modal', function () {
            $(".datatables-lists").DataTable().draw();
        })

        let menuSe = document.getElementById('menuSe').value;
        Ajax.get('/api/sys/' + menuSe + 'menu/list', success, fail);

        <%-- 메뉴 선택 시 이벤트 --%>
        $('#tree').on("select_node.jstree", function (event, data) {
            isSubmitAttempted = false;
            isIdDupAttempted = false;
            isIdChecked = false;
            clearValidationMessage('id');
            fvMenuInstance.updateFieldStatus('formValidationMenuId', 'NotValidated', 'callback');
            fvMenuInstance.updateFieldStatus('formValidationUrl', 'NotValidated', 'callback');

            let node = data.node;

            let id = node.data.menuId;
            if (isEmpty(id)) {
                document.getElementById('id').disabled = false;
                document.getElementById('btnDuplicateMenuId').disabled = false;
                isNewMenu = true;
            } else {
                document.getElementById('id').disabled = true;
                document.getElementById('btnDuplicateMenuId').disabled = true;
                isNewMenu = false;
            }

            document.getElementById('id').value = id;
            document.getElementById('menuNm').value = node.text;
            document.getElementById('menuOrdr').value = node.data.menuOrdr;
            document.getElementById('url').value = node.data.url;

            let menuTy = node.data.menuTy;
            let menuTyList = document.getElementsByName('menuTy');
            for (let i = 0; i < menuTyList.length; i++) {
                if (menuTyList[i].value === menuTy) {
                    menuTyList[i].checked = true;
                    break;
                }
            }

            if (menuTy === 'LINK') {
                document.getElementById('url').readOnly = false;
            }

            if (data.node.parents.length === 2) {
                document.getElementById('gntView').style.removeProperty('display');
            } else {
                document.getElementById('gntView').style.display = 'none';
            }
            let gnbAt = node.data.gnbAt;
            let gnbAtList = document.getElementsByName('gnbAt');
            for (let i = 0; i < gnbAtList.length; i++) {
                if (gnbAtList[i].value === gnbAt) {
                    gnbAtList[i].checked = true;
                    break;
                }
            }

            let useAt = node.data.useAt;
            let useAtList = document.getElementsByName('useAt');
            for (let i = 0; i < useAtList.length; i++) {
                if (useAtList[i].value === useAt) {
                    useAtList[i].checked = true;
                    break;
                }
            }
        });

        <%-- 메뉴ID가 변경됐을 시 이벤트 --%>
        document.getElementById('id').addEventListener('input', function (event) {
            isIdDupAttempted &&= false;
            if (isIdChecked){
                isIdChecked = false;
                clearValidationMessage('id');
            }
        });

        <%-- 중복체크 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateMenuId').addEventListener('click', function () {
            let id = document.getElementById('id').value;

            if (!id) return;

            let data = {
                id: id.trim()
            };

            isIdDupAttempted = true;

            Ajax.get(dataToQueryString('/api/sys/' + document.getElementById('menuSe').value + 'menu/duplicateMenuId', data), successDuplicate, fail);
        });

        <%-- 저장 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.select.required"/>',
                    showCancel: false
                });
                return;
            }

            isSubmitAttempted = true;

            fvMenuInstance.validate().then(function(status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '메뉴 정보를 저장하시겠습니까?',
                        showCancel: true,
                        onConfirm: function() {
                            let data = bindingData(document.getElementById('frm'));
                            data["menuId"] = selectedNode.id;
                            data["upperMenuId"] = selectedNode.parent;
                            Ajax.post('/api/sys/' + data["menuSe"] + 'menu/update', successSave, fail, {data: JSON.stringify(data)});
                        }
                    });
                }
            });
        });

        <%-- 추가 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnAddMenu').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.select.required"/>',
                    showCancel: false
                });
                return;
            }

            if (selectedNode.type === 'file') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.valid.menuTy"/>',
                    showCancel: false
                });
                return;
            }

            let data = {
                menuNm: 'New',
                upperMenuId: selectedNode.id,
                menuTy: 'DIR',
                url: 'DIR',
                menuDp: selectedNode.parents.length + 1,
                gnbAt: 'N',
                useAt: 'N'
            }

            Ajax.post('/api/sys/' + document.getElementById('menuSe').value + 'menu/save', successAdd, fail, {data: JSON.stringify(data)});
        });

        <%-- 삭제 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDeleteMenu').addEventListener('click', function () {
                customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.delete"/>',
                        showCancel: true,                    // 확인·취소 버튼 모두 표시
                        onConfirm: function () {             // 확인(OK)을 눌렀을 때만 실행
                                const selectedNode = $('#tree').jstree('get_selected', true)[0];

                                        // ROOT 메뉴 보호
                                if (selectedNode.parent === '#') {
                                        customAlert({
                                                title: '<spring:message code="common.system.info"/>',
                                                content: 'ROOT 메뉴는 삭제할 수 없습니다.',
                                                showCancel: false
                                        });
                                        return;
                                }

                                // 디렉터리 메뉴인데 하위 메뉴가 존재하는 경우 보호
                                if (selectedNode.data.menuTy === 'DIR' && selectedNode.children.length > 0) {
                                        customAlert({
                                                title: '<spring:message code="common.system.info"/>',
                                                content: '하위 메뉴가 존재하여 삭제할 수 없습니다.',
                                                showCancel: false
                                        });
                                        return;
                                }

                                // 삭제 요청
                                const data = {
                                        menuId:       selectedNode.id,
                                        childrenList: selectedNode.children_d
                                };
                                const menuSe = document.getElementById('menuSe').value;

                                Ajax.post('/api/sys/' + menuSe + 'menu/delete', successDelete, fail, {
                                        data: JSON.stringify(data)
                                });
                        }
                });
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
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '메뉴 정보를 초기화하시겠습니까?',
                showCancel: true,
                onConfirm: function() {
                    reset();
                }
            });
        });

        <%-- 메뉴타입 클릭 시 이벤트 --%>
        document.getElementById('divMenuTy').addEventListener('click', function (event) {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                event.preventDefault();
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="menu.select.required"/>',
                    showCancel: false
                });
                return;
            }

            let id = document.getElementById('id');
            if (isEmpty(id.value)) {
                event.preventDefault();
                id.focus();
                return;
            }

            let menuTy = selectedNode.data.menuTy;
            if (menuTy === 'DIR' && selectedNode.children.length > 0) {
                event.preventDefault();
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '하위 메뉴가 존재하여 메뉴타입을 변경할 수 없습니다.',
                    showCancel: false
                });
                return;
            }

            let target = event.target;
            if (target.tagName === 'INPUT') {
                let menuTy = target.value;
                const urlField = document.getElementById('url');

                if (menuTy === 'DIR') {
                    urlField.value = 'DIR';
                    urlField.readOnly = true;
                } else if (menuTy === 'LINK') {
                    urlField.value = '';
                    urlField.readOnly = false;
                } else if (menuTy === 'CNTNTS' || menuTy === 'BBS' || menuTy === 'PROGRM') {
                    urlField.value = '';
                    urlField.readOnly = true;
                    popupOn();
                    search(1);
                }

                fvMenuInstance.updateFieldStatus('formValidationUrl', 'NotValidated', 'callback');
            }
        });

        <%-- 팝업화면 확인 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSelect').addEventListener('click', function () {
            let checkRadio = document.querySelector('input[name=checkRadio]:checked');
            if (isEmpty(checkRadio)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '선택해주세요.',
                    showCancel: false
                });
                return;
            }

            popupOff();

            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            let urlPath = '';
            for (let i = selectedNode.parents.length - 2; i >= 0; i--) {
                let parentNode = $('#tree').jstree().get_node(selectedNode.parents[i]);
                urlPath = urlPath + '/' + parentNode.data.menuId;
            }

            let id = document.getElementById('id').value;

            urlPath = urlPath + '/' + id;

            let menuTy = document.querySelector('input[name=menuTy]:checked').value;
            if (menuTy === 'CNTNTS') {
                urlPath = urlPath + '/cntnts/' + checkRadio.value + '/view';
            } else if (menuTy === 'BBS') {
                urlPath = urlPath + '/bbs/' + checkRadio.value + '/list';
            } else if (menuTy === 'PROGRM') {
                urlPath = urlPath + checkRadio.value;
            }

            document.getElementById('url').value = urlPath;
            fvMenuInstance.revalidateField('formValidationUrl');
        });

        $(".datatables-lists").DataTable().draw();

        <%-- 모달 닫았을 때 리스트에서 목록 선택 되었는지 검사 --%>
        document.getElementById('basicModal').addEventListener('hide.bs.modal', function () {
            if (modalOpenedByClick && !urlSelected) {
                fvMenuInstance.revalidateField('formValidationUrl');
            }
        });

        <%-- URL 필드 클릭 시 모달 다시 열기 --%>
        document.getElementById('url').addEventListener('click', function () {
            const menuTy = document.querySelector('input[name="menuTy"]:checked')?.value;

            if (menuTy === 'CNTNTS' || menuTy === 'BBS' || menuTy === 'PROGRM') {
                popupOn();
                search(1);
            }
        });
    });
</script>
</body>
</html>
