<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <script type="text/javascript">
        <%-- 저장 성공 시 Callback 함수 --%>
        let successSave = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function () {
                    goPage('list');
                }
            });
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
                    <div class="row">
                        <div class="order-0 order-md-1">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="mb-0">프로그램 등록</h5>
                                </div>
                                <div class="card-body pt-0">
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
                                                        <label class="form-label" for="progrmNm">
                                                            <spring:message code="title.progrmNm"/>
                                                            <span class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td>
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <input class="form-control" type="text" name="progrmNm"
                                                                       id="progrmNm" maxlength="20"
                                                                       placeholder="프로그램명을 입력하세요.">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                    <th>
                                                        <label class="form-label" for="progrmUrl">
                                                            <spring:message code="title.url"/>
                                                            <span class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td>
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <input class="form-control" type="text" name="progrmUrl"
                                                                       id="progrmUrl" maxlength="100"
                                                                       placeholder="URL을 입력하세요.">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="progrmDc">
                                                            <spring:message code="title.progrmDc"/>
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <textarea class="form-control" name="progrmDc" id="progrmDc"
                                                                          rows="10" maxlength="200" placeholder="프로그램 설명을 입력하세요."></textarea>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary" id="btnList"><spring:message
                                                code="button.list"/></button>
                                        <button type="submit" class="btn btn-primary" id="btnSave"><spring:message
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
<script src="/static/js/common/validator.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script type="text/javascript">
    $(function () {
        initFvProgram();

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

        <%-- 저장버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            fvProgramInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const data = bindingData(document.getElementById('frm'));
                            Ajax.post('/api/sys/progrm/save', successSave, fail, {data: JSON.stringify(data)});
                        }
                    });
                }
            });
        });
    });
</script>
</body>

</html>
