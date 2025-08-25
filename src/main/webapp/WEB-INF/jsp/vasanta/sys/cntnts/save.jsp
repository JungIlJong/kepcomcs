<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template"
      data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/quill/typography.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/quill/katex.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/quill/editor.css"/>
    <script type="text/javascript">
        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save" />',
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
                                    <h5 class="mb-0">콘텐츠 등록</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
                                        <div class="table-responsive text-nowrap">
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col style="width:10%;">
                                                    <col style="width:auto;">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="cntntsNm">
                                                            <spring:message code="cntnts.cntntsNm"/>
                                                            <span class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td>
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <input class="form-control" type="text" name="cntntsNm"
                                                                       id="cntntsNm" placeholder="예시콘텐츠1">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label">
                                                            콘텐츠 내용<span class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td>
                                                        <%-- Quill Editor(JS, CSS 포함)를 불러옵니다 --%>
                                                        <%@ include file="/WEB-INF/jsp/vasanta/cmmn/quill-editor.jsp" %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="cntntsDc">
                                                            <spring:message code="cntnts.cntntsDc"/>
                                                        </label>
                                                    </th>
                                                    <td>
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                    <textarea class="form-control" name="cntntsDc" id="cntntsDc"
                                                              rows="5" placeholder="콘텐츠에 대한 설명을 입력해주세요"></textarea>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-between mt-5">
                                            <button type="button" class="btn btn-secondary me-2" id="btnList">
                                                <spring:message code="button.list"/></button>
                                            <button type="button" class="btn btn-primary" id="btnSave"><spring:message
                                                    code="button.create"/></button>
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
</div>
<script src="/static/js/common/validator.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<!-- script -->
<script>
    $(function () {
        initFvCntnts();

        document.getElementById('btnSave').addEventListener('click', function () {
            fvCntntsInstance.validate().then(function (status) {
                const validQuill = validateQuill(quill, VALIDATION_MESSAGES.cntnts.cntntsCnRequired);
                if (!validQuill) return;

                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            let data = bindingData($('#frm'));
                            data.cntntsCn = quill.getSemanticHTML();
                            Ajax.post('/api/sys/cntnts/save', success, fail, {data: JSON.stringify(data)});
                        }
                    });
                }
            });
        });

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
    })
</script>
</body>
</html>

