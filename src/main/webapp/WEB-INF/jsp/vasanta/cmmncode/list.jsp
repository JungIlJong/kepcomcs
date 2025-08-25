<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
 <html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>공통코드관리</title>
    <link rel="stylesheet" href="/static/vendor/plugins/jstree/dist/themes/default/style.min.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css"/>
    <script src="/static/vendor/plugins/jstree/dist/jstree.min.js"></script>
    <script type="text/javascript">
        const codeRegex = /^[A-Z][A-Z0-9_]{2,19}$/;

        function validCode(code) {
            return codeRegex.test(code);
        }

        <%-- 조회 성공 시 Callback 함수 --%>
        let success = function (data) {
            reset();
            let nodeArray = [];
            $.each(data, function (idx, item) {
                let codeId = item.codeId;
                let code = isEmpty(item.code) ? '' : item.code;
                let codeNm = item.codeNm;
                let upperCodeId = (isEmpty(item.upperCodeId) || item.upperCodeId === 0) ? '#' : item.upperCodeId;
                let codeOrdr = isEmpty(item.codeOrdr) ? 0 : item.codeOrdr;
                let useYn = item.useYn;
                let type = item.upperCodeId ? 'file' : 'DIR';

                nodeArray[idx] = {
                    "id": codeId,
                    "parent": upperCodeId,
                    "text": codeNm,
                    "data": {
                        code: code,
                        codeOrdr: codeOrdr,
                        useYn: useYn,
                    },
                    "type": type
                };
            });

            $('#tree').jstree(true).settings.core.data = nodeArray;
            $('#tree').jstree(true).refresh();
        }

        <%-- 조회 성공 시 Callback 함수 --%>
        let success2 = function (data) {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];

            // $.each(data, function (idx, item) {
            //     let codeId = item.codeId;
            //     let code = isEmpty(item.code) ? '' : item.code;
            //     let codeNm = item.codeNm;
            //     let upperCodeId = (isEmpty(item.upperCodeId) || item.upperCodeId === 0) ? '#' : item.upperCodeId;
            //     let codeOrdr = isEmpty(item.codeOrdr) ? 0 : item.codeOrdr;
            //     let useYn = item.useYn;
            //     let type = item.upperCodeId ? 'file' : 'DIR';
            //
            //     $('#tree').jstree('create_node', selectedNode, {
            //         "id": codeId,
            //         "parent": upperCodeId,
            //         "text": codeNm,
            //         "data": {
            //             code: code,
            //             codeOrdr: codeOrdr,
            //             useYn: useYn,
            //         },
            //         "type": type
            //     }, 'last');
            // });

            $('#tree').jstree('open_node', selectedNode);

            selectedNode.state.pull = true;
        }

        <%-- 코드 중복체크 성공 시 Callback 함수 --%>
        let successDuplicate = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '사용가능한 코드입니다.',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('chkDup').value = 'Y';
                }
            });
        }

        <%-- 코드 추가 성공 시 Callback 함수 --%>
        let successAdd = function (data) {
            console.log(data);
            let code = data.code;
            let codeId = data.codeId;
            let codeNm = data.codeNm;
            let codeOrdr = data.codeOrdr;
            let useYn = data.useYn;
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            $('#tree').jstree(true).create_node(selectedNode.id, {id: codeId, text: codeNm, type: 'file', data: {code: code, codeOrdr: codeOrdr, useYn: useYn}}, 'last');
            $('#tree').jstree("deselect_all", selectedNode);
            $('#tree').jstree('select_node', codeId);
        }

        <%-- 저장 성공 시 Callback 함수 --%>
        let successSave = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function() {
                    Ajax.get('/api/sys/cmmncode/list', success, fail);
                }
            });
        }

        <%-- 삭제 성공 시 Callback 함수 --%>
        let successDelete = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.delete"/>',
                showCancel: false,
                onConfirm: function() {
                    document.getElementById('code').value = "";
                    document.getElementById('code').disabled = false;
                    document.getElementById('btnDuplicateCodeId').disabled = false;
                    document.getElementById('chkDup').value = 'N';
                    Ajax.get('/api/sys/cmmncode/list', success, fail);
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

        <%-- 메뉴정보 초기화 함수 --%>
        function reset() {
            document.getElementById('codeNm').value = '';
            document.getElementById('codeOrdr').value = '';
            document.getElementById('useYn1').checked = true;
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
                                        <div class="card p-2 shadow-none border" id="treeScroll" style="max-height: 50%;">
                                            <div id="tree" class="sidebar-body ps ps--active-y"></div>
                                        </div>
                                    </div>
                                    <div class="mb-6">
                                        <div class="treeControl d-flex justify-content-end">
                                            <button type="button" id="btnAddCode" class="btn btn-label-primary me-2">
                                                <i class="icon-base bx bx-plus icon-sm"></i>
                                                <spring:message
                                                        code="button.add"/></button>
                                            <button type="button" id="btnDeleteCode" class="btn btn-label-danger">
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
                                <h5 class="card-header">공통코드 등록/수정</h5>
                                <form id="frm">
                                    <div class="card-body">
                                        <input type="hidden" name="chkDup" id="chkDup" value="N">
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="code">코드</label>
                                                <div class="input-group input-group-merge has-validation">
                                                    <input class="form-control" name="code" id="code" maxlength="10">
                                                    <button type="button" id="btnDuplicateCodeId"
                                                            class="btn btn-primary"><spring:message
                                                            code="button.duplicate"/></button>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="codeNm">코드명</label>
                                                <div class="input-group has-validation">
                                                    <input class="form-control" type="text" name="codeNm" id="codeNm" maxlength="10" placeholder="코드명을 입력해주세요.">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="codeOrdr">순서</label>
                                                <div class="input-group has-validation">
                                                    <input class="form-control" type="number" name="codeOrdr" id="codeOrdr" min="1" max="99" placeholder="순서를 숫자로 입려해주세요.">
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
                                                        <input class="form-check-input" type="radio" name="useYn"
                                                               id="useYn1"
                                                               value="N"
                                                               checked>
                                                        <label class="form-check-label" for="useYn1"><spring:message
                                                                code="title.use.n"/></label>
                                                    </div>
                                                    <div class="form-check mb-0 me-4 me-lg-12">
                                                        <input class="form-check-input" type="radio" name="useYn"
                                                               id="useYn2"
                                                               value="Y">
                                                        <label class="form-check-label" for="useYn2"><spring:message
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
<script src="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script type="text/javascript">
    $(function () {
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
                return a1.data.codeOrdr > b1.data.codeOrdr ? 1 : -1;
            },
            "types": {
                "#": { // ROOT
                    // "max_depth": 4 // 하위 depth 제한
                },
                "file": { /// type이 file인 경우
                    "icon": "jstree-file", // file 아이콘
                    // "max_children": 0, // leaf 이므로 자식을 못가도록 설정
                    // "max_depth": 0
                },
            }
        }).bind("refresh.jstree", function (e, data) {
            const rootNode = $('#tree').jstree(true).get_node('#');
            const firstNode = $('#tree').jstree(true).get_node(rootNode.children[0]);
            firstNode.state.pull = true;

            $(this).jstree("open_all");
            // $(this).jstree(true).get_container_ul().children("li").each(function () {
            //     // Depth 1의 노드를 열기
            //     $(this).jstree("open_node", $(this));
            // });
        });

        new PerfectScrollbar(document.getElementById('tree'), {
            wheelPropagation: false
        });

        Ajax.get('/api/sys/cmmncode/list', success, fail);

        <%-- 메뉴 선택 시 이벤트 --%>
        $('#tree').on("select_node.jstree", function (event, data) {
            let node = data.node;
            let code = node.data.code;
            if (isEmpty(code)) {
                document.getElementById('chkDup').value = 'N';
                document.getElementById('code').disabled = false;
                document.getElementById('btnDuplicateCodeId').disabled = false;
            } else {
                document.getElementById('chkDup').value = 'Y';
                document.getElementById('code').disabled = true;
                document.getElementById('btnDuplicateCodeId').disabled = true;
            }

            document.getElementById('code').value = code;
            document.getElementById('codeNm').value = node.text;
            document.getElementById('codeOrdr').value = node.data.codeOrdr;

            let useYn = node.data.useYn;
            if (useYn === 'Y') {
                document.getElementById('useYn2').checked = true;
            } else {
                document.getElementById('useYn1').checked = true;
            }

            if (node.state.pull) {
                return;
            }

            Ajax.get('/api/sys/cmmncode/' + node.id, success2, fail);
        });

        <%-- 코드가 변경됬을 시 이벤트 --%>
        document.getElementById('code').addEventListener('change', function (event) {
            document.getElementById('chkDup').value = 'N';
        });

        <%-- 중복확인 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateCodeId').addEventListener('click', function () {
            let code = document.getElementById('code').value;
            if (isEmpty(code)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '코드를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('code').focus();
                    }
                });
                return;
            }

            if (!validCode(code)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '올바르지 않은 코드입니다. 다음 조건을 만족해주세요.\n\n1. 특수문자는 _만 허용됩니다.\n2. 입력 값은 영어 대문자와 숫자의 조합이어야 합니다.\n3. 첫 글자는 반드시 영어 대문자여야 합니다.\n4. 입력 길이는 최소 3자, 최대 20자까지 허용됩니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('code').focus();
                    }
                });
                return;
            }

            let data = {
                code: code.value
            };

            Ajax.get(dataToQueryString('/api/sys/cmmncode/duplicateCodeId', data), successDuplicate, fail);
        });

        <%-- 저장 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (isEmpty(selectedNode)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '공통 코드를 추가하거나, 왼쪽의 코드 목록에서 선택해주세요.',
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
                    content: '<spring:message code="menu.valid.chkDup"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            const code = document.getElementById('code').value;

            if (isEmpty(code)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '코드를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('code').focus();
                    }
                });
                return;
            }

            if (!validCode(code)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '올바르지 않은 코드입니다. 다음 조건을 만족해주세요.\n\n1. 특수문자는 _만 허용됩니다.\n2. 입력 값은 영어 대문자와 숫자의 조합이어야 합니다.\n3. 첫 글자는 반드시 영어 대문자여야 합니다.\n4. 입력 길이는 최소 3자, 최대 20자까지 허용됩니다.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('code').focus();
                    }
                });
                return;
            }

            let codeNm = document.getElementById('codeNm').value;
            document.getElementById('codeNm').value = codeNm.trim();

            if (isEmpty(codeNm)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '코드 이름을 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('codeNm').focus();
                    }
                });
                return;
            }

            const codeOrdr = document.getElementById('codeOrdr').value;

            if (isEmpty(codeOrdr)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '코드 순서를 입력해주세요.',
                    showCancel: false,
                    onConfirm: function() {
                        document.getElementById('codeOrdr').focus();
                    }
                });
                return;
            }

            const useYn = document.querySelector('input[name="useYn"]:checked').value;

            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="confirm.common.save"/>',
                showCancel: true,
                onConfirm: function () {
                    let selectedNode = $('#tree').jstree('get_selected', true)[0];
                    let data = {
                        codeNm:      codeNm,
                        code:        code,
                        codeOrdr:    codeOrdr,
                        useYn:       useYn,
                        upperCodeId: selectedNode.parent,
                        codeId:      selectedNode.id
                    };
                    Ajax.post('/api/sys/cmmncode/update', successSave, fail, { data: JSON.stringify(data) });
                }
            });


        });

        <%-- 추가 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnAddCode').addEventListener('click', function () {
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

            if (selectedNode.parents.length >= 3) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '2 뎁스까지만 추가 가능합니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            let data = {
                codeNm: 'New',
                upperCodeId: selectedNode.id,
                codeDepth: selectedNode.parents.length + 1,
                useYn: 'N'
            };

            Ajax.post('/api/sys/cmmncode/save', successAdd, fail, {data: JSON.stringify(data)});
        });

        <%-- 삭제 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDeleteCode').addEventListener('click', function () {
            let selectedNode = $('#tree').jstree('get_selected', true)[0];
            if (selectedNode.parent === '#') {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: 'ROOT는 삭제할 수 없습니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            if (selectedNode.children.length > 0) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '하위 코드가 존재하여 삭제할 수 없습니다.',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
                return;
            }

            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="confirm.common.delete"/>',
                showCancel: true,
                onConfirm: function () {
                    let data = {
                        codeId: selectedNode.id,
                        // childrenList: selectedNode.children_d
                    };
                    Ajax.post('/api/sys/cmmncode/delete', successDelete, fail, { data: JSON.stringify(data) });
                }
            });

        });

        <%-- 초기화 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnReset').addEventListener('click', function () {
            reset();
        });

    });
</script>
</body>
</html>
