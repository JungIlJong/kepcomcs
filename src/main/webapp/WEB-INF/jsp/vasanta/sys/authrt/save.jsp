<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>권한관리</title>
    <link rel="stylesheet" href="/static/vendor/plugins/jstree/dist/themes/default/style.min.css"/>
    <script src="/static/vendor/plugins/jstree/dist/jstree.min.js"></script>
    <script type="text/javascript">
        let success = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function () {
                    goPage('list');
                }
            });
        }


        let successMenu = function (data) {
            let nodeArray = [];
            $.each(data, function (idx, item) {
                let menuId = item.menuId;
                let id = item.id;
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

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.error"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false
            });
            console.log(xhr + ", " + status + " : " + error)
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

                        <!-- 트리 -->
                        <div class="col-xl-4 col-12">
                            <div class="card h-100">
                                <h5 class="card-header"><c:out value="${menuTitle}"/></h5>
                                <div class="card-body">
                                    <div class="mb-6">
                                        <div class="card p-2 shadow-none border">
                                            <div id="tree"
                                                 class="sidebar-body ps position-relative"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- 입력 폼 -->
                        <div class="col-xl">
                            <div class="card h-100">
                                <h5 class="card-header">권한 정보 등록</h5>
                                <form id="frm">
                                    <div class="card-body">
                                        <input type="hidden" name="authrtId" id="authrtId">
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="authrtCd">권한코드
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="text" name="authrtCd"
                                                           id="authrtCd" maxlength="30"
                                                           placeholder="권한코드를 입력하세요.">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                            <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="authrtNm">권한명
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="text" name="authrtNm"
                                                           id="authrtNm" maxlength="60"
                                                           placeholder="권한명을 입력하세요.">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6">
                                            <div class="form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="authrtExpln">권한설명
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="has-validation">
                                                    <textarea class="form-control" name="authrtExpln" id="authrtExpln"
                                                              rows="10" maxlength="200" placeholder="권한 설명을 입력하세요. (200자 이내)"></textarea>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                            <div class="d-flex justify-content-between mt-5">
                                                <button type="button" class="btn btn-secondary me-2" id="btnList"><spring:message code="button.list"/></button>
                                                <button type="button" class="btn btn-primary" id="btnSave">
                                                    <spring:message
                                                            code="button.create"/></button>
                                            </div>
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

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script type="text/javascript">
    $(function () {
        initFvAuthrt();

        <%-- 메뉴트리 초기화 --%>
        $('#tree').jstree({
            "core": {
                "check_callback": true,
                "data": []
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

        Ajax.get('/api/sys/mngrmenu/list', successMenu, fail);

        <%-- 등록버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            let menuList = [];
            let selectedNodes = $('#tree').jstree('get_checked', true);

            selectedNodes.forEach(function (element, index) {
                let id = element.id;
                let menuTy = element.data.menuTy;
                let url = element.data.url;
                let subUrl = url.substring(0, url.lastIndexOf('/'));
                let menu = {
                    menuId: id,
                    url: subUrl
                };
                menuList.push(menu);
            });

            if (menuList.length <= 0) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '권한 설정 할 게시판을 선택 해주세요.',
                    showCancel: false,
                    onConfirm: function () {
                        document.getElementById('tree').focus();
                    }
                });
                return;
            }

            fvAuthrtInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    const authrtCd = document.getElementById('authrtCd').value;
                    const authrtNm = document.getElementById('authrtNm').value;
                    const authrtExpln = document.getElementById('authrtExpln').value;

                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const data = {
                                authrtCd:   authrtCd.trim(),
                                authrtNm:   authrtNm.trim(),
                                authrtExpln: authrtExpln,
                                menuList:   menuList
                            };
                            Ajax.post('/api/sys/authrt/save', success, fail, { data: JSON.stringify(data) });
                        }
                    });
                }
            });
        });

        document.getElementById('btnList').addEventListener('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '목록 페이지로 이동하면 현재까지 작성한 내용이 사라집니다.<br/>이동하시겠습니까?',
                showCancel: true,
                onConfirm: function () {
                    goPage('list');
                }
            });
        });
    });
</script>
</body>
</html>
