<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <script type="text/javascript">
        let success = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save" />',
                showCancel: false,
                onConfirm: function() {
                    goPage('list');
                }
            });
        }

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
                                    <h5 class="mb-0">접근IP 등록</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <div class="row gx-6">
                                            <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                                <label class="form-label" for="ipAdres">
                                                    IP 주소
                                                    <span class="text-danger ms-1">*</span>
                                                </label>
                                                <div class="has-validation">
                                                    <input class="form-control" type="text"  name="ipAdres" id="ipAdres" placeholder="0.0.0.0">
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                        <div class="row gx-6 form-control-validation fv-plugins-icon-container">
                                            <div>
                                                <label class="form-label" for="ipDc">IP 설명</label>
                                                <div class="has-validation">
                                                    <textarea class="form-control" name="ipDc" id="ipDc"
                                                              rows="10" maxlength="200" placeholder="IP 설명을 입력하세요."></textarea>
                                                </div>
                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary me-2" id="btnList"><spring:message code="button.list"/></button>
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

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script type="text/javascript">
    $(function () {
        initFvAccessIp();

        <%-- 저장버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            fvAccessIpInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            let data = bindingData(document.getElementById('frm'));
                            Ajax.post('/api/sys/accessip/save', success, fail, { data: JSON.stringify(data) });
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
    });
</script>
</body>

</html>
