<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template"
      data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/> - 수정</title>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/quill/typography.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/quill/katex.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/quill/editor.css"/>
    <script type="text/javascript">

        let init = function (data) {
            document.getElementById('cntntsId').value = data.cntntsId;
            document.getElementById('cntntsNm').value = data.cntntsNm;
            document.getElementById('cntntsDc').value = data.cntntsDc;

            if (data.cntntsCn && data.cntntsCn.trim() !== '') {
                try {
                    quill.clipboard.dangerouslyPasteHTML(data.cntntsCn);
                } catch (e) {
                    console.warn('HTML 파싱 오류, 텍스트로 설정:', e);
                    quill.setText(data.cntntsCn);
                }
            }
        }

        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.update"/>',
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
                                    <h5 class="mb-0">콘텐츠 수정</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
                                        <input type="hidden" name="cntntsId" id="cntntsId"
                                               value="<c:out value='${data.cntntsId}' />">

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
                                                                       id="cntntsNm" placeholder="예시콘텐츠1"
                                                                       value="<c:out value='${data.cntntsNm}'/>">
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
                                                              rows="5" placeholder="콘텐츠에 대한 설명을 입력해주세요"><c:out
                                                            value='${data.cntntsDc}'/></textarea>
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
                                            <div>
                                                <button type="button" class="btn btn-dark me-2" id="btnDelete">
                                                    <spring:message code="button.delete"/></button>
                                                <button type="button" class="btn btn-primary" id="btnSave"><spring:message
                                                        code="button.modify"/></button>
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
</div>
<script src="/static/js/common/validator.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
    $(function () {
        Ajax.get(setUrl('/api/sys/cntnts/detail'), init, fail);
        initFvCntnts();

        document.getElementById('btnSave').addEventListener('click', function () {
            fvCntntsInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    const $cntntsId = $('#cntntsId');
                    if (isEmpty($cntntsId.val())) {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '잘못된 컨텐츠입니다.',
                            showCancel: false,
                            onConfirm: function () {
                            }
                        });
                        return false;
                    }

                    const validQuill = validateQuill(quill, VALIDATION_MESSAGES.cntnts.cntntsCnRequired);
                    if (!validQuill) return;

                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.update"/>',
                        showCancel: true,
                        onConfirm: function () {
                            let data = bindingData($('#frm'));
                            data.cntntsCn = quill.getSemanticHTML();
                            Ajax.post('/api/sys/cntnts/update', success, fail, {data: JSON.stringify(data)});
                        }
                    });
                }
            });
        });

        $('#btnDelete').on('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="confirm.common.delete"/>',
                showCancel: true,
                onConfirm: function () {
                    const cntntsId = $('#cntntsId').val();
                    if (isEmpty(cntntsId)) {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '잘못된 컨텐츠입니다.',
                            showCancel: false,
                            onConfirm: function () {
                            }
                        });
                        return;
                    }
                    
                    Ajax.post('/api/sys/cntnts/delete?cntntsId=' + cntntsId, function () {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '<spring:message code="success.common.delete"/>',
                            showCancel: false,
                            onConfirm: function () {
                                goPage('list');
                            }
                        });
                    }, fail, {data: JSON.stringify({cntntsId: cntntsId})});
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
        })
</script>
</body>
</html>
