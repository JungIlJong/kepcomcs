<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <script type="text/javascript">
        let bbsList = [];

        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function () {
                    goPage('list');
                }
            });
        }

        let fail = function (xhr) {
            if (isEmpty(xhr.responseJSON)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="fail.common.msg"/>',
                    showCancel: false,
                    onConfirm: function () {
                    }
                });
            } else {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: xhr.responseJSON[0],
                    showCancel: false,
                    onConfirm: function () {
                    }
                });
            }
        }

        let init = function (data) {
            if (data.fileAtchCo === 0 || isEmpty(data.fileAtchCo)) {
                $('#fileRow').hide();
            } else {
                $('#fileRow').show();
            }
            document.getElementById('bbsId').value = data.bbsId;
            document.getElementById('fileAtchCo').value = data.fileAtchCo;
            document.getElementById('fileAtchSize').value = data.fileAtchSize;
            document.getElementById('permExtsn').value = data.permExtsn;

            if (data.bbsTyCode === 'BBS_DEFAULT') {
                document.getElementById('noticeSet').style.display = document.getElementById('noticeSet').style.display === 'none' ? '' : 'none';
            }
        }

        let setSelect = function (data) {
            bbsList = data;
            data.forEach(function (element, index) {
                addSelectOption('bbsId', element.bbsNm, element.bbsId);
            })
            if (bbsList[0]['fileAtchCo'] === 0) {
                $('#fileRow').hide();
            } else {
                document.getElementById('fileAtchSize').value = bbsList[0].fileAtchSize;
                document.getElementById('fileAtchCo').value = bbsList[0].fileAtchCo;
                document.getElementById('permExtsn').value = bbsList[0].permExtsn;
            }
            $("#bbsId option:eq(0)").prop("selected", true);
            $('#bbsId').on('change', function () {
                const bbsId = $(this).val();

                let bbs = bbsList.find((element) => element.bbsId == bbsId);
                if (bbs.fileAtchCo === 0 || isEmpty(bbs.fileAtchCo)) {
                    $('#fileRow').hide();
                } else {
                    $('#fileRow').show();
                }
                document.getElementById('fileAtchSize').value = bbs.fileAtchSize;
                document.getElementById('fileAtchCo').value = bbs.fileAtchCo;
                document.getElementById('permExtsn').value = bbs.permExtsn;
                document.getElementById('files').value = '';
                if (bbs.bbsTyCode !== 'BBS_DEFAULT') {
                    document.getElementById('noticeAt').checked = false;
                    document.getElementById('noticeSet').style.display = 'none';
                } else {
                    document.getElementById('noticeSet').style.removeProperty('display');
                }
            })
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
                    <div class="row">
                        <div class="order-0 order-md-1">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="mb-0">게시물 등록</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <input id="fileAtchSize" name="fileAtchSize" type="hidden" value=""/>
                                    <input id="fileAtchCo" name="fileAtchCo" type="hidden" value=""/>
                                    <input id="permExtsn" name="permExtsn" type="hidden" value=""/>
                                    <form id="frm">
                                        <div class="table-responsive text-nowrap">
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col style="width:10%;">
                                                    <col style="width:40%;">
                                                    <col style="width:10%;">
                                                    <col style="width:40%;">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="bbsId">
                                                            <spring:message code="bbs.bbsNm"/><span
                                                                class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td colspan="3" id="bbsIdDiv">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <select class="form-select" name="bbsId"
                                                                        id="bbsId"></select>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="nttSj">
                                                            <spring:message code="title"/><span
                                                                class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="flex-c gap-2">
                                                                <div class="has-validation w-100">
                                                                    <input class="form-control" type="text" name="nttSj"
                                                                           id="nttSj" placeholder="예시제목1">
                                                                </div>
                                                                <div class="flex-c gap-1 text-nowrap" id="noticeSet">
                                                                    <input class="form-check-input" type="checkbox"
                                                                           name="noticeAt" id="noticeAt" value="Y"/>
                                                                    <label class="form-check-label"
                                                                           for="noticeAt">공지글</label>
                                                                </div>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label">콘텐츠 내용<span
                                                                class="text-danger ms-1">*</span></label>
                                                    </th>
                                                    <td colspan="3">
                                                        <%-- Quill Editor(JS, CSS 포함)를 불러옵니다 --%>
                                                        <%@ include file="/WEB-INF/jsp/vasanta/cmmn/quill-editor.jsp" %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="files"><spring:message
                                                                code="atchfile"/></label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation" id="fileBox">
                                                                <input class="form-control" type="file" id="files"
                                                                       name="files" placeholder="파일을 선택하세요"
                                                                       title="파일을 선택하세요" multiple>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
                                    </form>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary me-2" id="btnList">
                                            <spring:message code="button.list"/></button>
                                        <button type="button" class="btn btn-primary" id="btnSave"><spring:message
                                                code="button.create"/></button>
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

<!-- script -->
<script src="/static/js/common/validator.js"></script>
<script src="/static/js/common/validation.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
    $(function () {
        if (location.href.includes('ntt')) {
            document.getElementById('bbsIdDiv').style.removeProperty('display');
            Ajax.get('/api/sys/bbs/all', setSelect, fail);
        } else {
            const depth = getUrlDepth();
            addSelectOption('bbsId', depth[depth.length - 2], depth[depth.length - 2]);
            $('#bbsId').prop('selectedIndex', 0).find("option:eq(0)").prop("selected", true);
            Ajax.get(dataToQueryString('/api/sys/bbs/info', {bbsId: depth[depth.length - 2]}), init, fail);
        }

        initFvNtt();

        <%-- 게시판 변경 시 이벤트 --%>
        document.getElementById('bbsId').addEventListener('change', function () {
            const selectedBbsId = this.value;
            const bbs = bbsList.find(item => item.bbsId == selectedBbsId);

            if (bbs) {
                document.getElementById('fileAtchSize').value = bbs.fileAtchSize;
                document.getElementById('fileAtchCo').value = bbs.fileAtchCo;
                document.getElementById('permExtsn').value = bbs.permExtsn;

                document.getElementById('files').value = '';

                if (fvNttInstance) {
                    fvNttInstance.revalidateField('files');
                }
            }
        });

        $('#btnSave').on('click', function () {
            fvNttInstance.validate().then(function (status) {
                const validQuill = validateQuill(quill, VALIDATION_MESSAGES.cntnts.cntntsCnRequired);
                if (!validQuill) return;

                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '등록하시겠습니까?',
                        showCancel: true,
                        onConfirm: function () {
                            const data = new FormData($(`#frm`)[0]);
                            data.set('nttCn', quill.getSemanticHTML());
                            data.set('thumbUrl', imgTag());
                            data.set('noticeAt', $("#noticeAt").val() == "on" ? "Y" : "N");
                            uploadAjax('/api/sys/ntt/save', success, fail, { data: data });
                        }
                    });
                }

            });
        })

        <%-- 목록버튼 클릭 시 이벤트 --%>
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

        function imgTag() {
            const html = quill.root.innerHTML;
            const imgTags = $(html).find('img');

            if (imgTags.length === 0) {
                return undefined;
            }

            return $(imgTags[0]).attr('src');
        }
    })
</script>
</body>
</html>
