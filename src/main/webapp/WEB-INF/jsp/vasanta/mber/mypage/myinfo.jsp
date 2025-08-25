<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script src="/static/js/common/getToken.js"></script>
    <script type="text/javascript">
        let isUpdatePage = true;
    </script>
    <title>내 정보 수정</title>
</head>
<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- Navbar -->
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-nav.jsp" %>
        <!-- / Navbar -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Menu -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
                <!-- / Menu -->

                <!-- Content -->
<div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="order-0 order-md-1">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="mb-0"><c:out value="${menuTitle}"/></h5>
                                </div>
                                <div class="card-body pt-0" id="mbrForm">
                                    <div class="row gx-6">
                                        <input type="hidden" name="uuid" id="uuid" value="<c:out value='${myInfo.uuid}' />">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="id"><spring:message code="title.id"/></label>
                                            <div class="has-validation">
                                                <input class="form-control readonly" type="text" id="id" name="id" maxlength="12" readonly disabled
                                                    value="<c:out value="${myInfo.id}" />">
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="mbrNm"><spring:message code="title.name"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="mbrNm" id="mbrNm" maxlength="20" placeholder="홍길동"
                                                    value="<c:out value='${myInfo.mbrNm}' />">
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="alert alert-warning alert-dismissible" role="alert">
                                            <h5 class="alert-heading mb-1">비밀번호는 아래 규칙에 맞게 작성해주세요.</h5>
                                            <span>
                                                <ul>
                                                    <li><spring:message code="title.password.valid.length"/></li>
                                                    <li><spring:message code="title.password.valid.complexity"/></li>
                                                    <li><spring:message code="title.password.valid.prohibit.patterns"/></li>
                                                </ul>
                                            </span>
                                        </div>
                                        <div class="mb-4 col-12 col-sm-6 form-password-toggle form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="pswd"><spring:message code="title.password"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="password" name="pswd" id="pswd" maxlength="20" placeholder="변경 시에만 입력해주세요">
                                                <span class="input-group-text cursor-pointer"><i id="toggle-pswd" class="icon-base bx bx-show"></i></span>
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-password-toggle form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="pswdConfirm"><spring:message code="title.password.confirm"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control" type="password" name="pswdConfirm" id="pswdConfirm" maxlength="20" placeholder="입력한 비밀번호와 동일하게 입력해주세요">
                                                <span class="input-group-text cursor-pointer"><i id="toggle-pswd-cfm" class="icon-base bx bx-show"></i></span>
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="emlAddr"><spring:message code="title.email"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="emlAddr" id="emlAddr" placeholder="example@gmail.com"
                                                       value="<c:out value='${myInfo.emlAddr}' />" readonly disabled>
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="mbrNm"><spring:message code="title.cellphone.number"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="mblTelno" id="mblTelno" maxlength="11" placeholder="'-' 제외하고 입력해주세요"
                                                       value="<c:out value='${myInfo.mblTelno}' />">
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="fxno"><spring:message code="title.fax"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="fxno" id="fxno" maxlength="20" placeholder="'-' 제외하고 입력해주세요"
                                                    value="<c:out value='${myInfo.fxno}' />">
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>

                                        <div class="mb-4 col-12 col-sm-6 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="zip"><spring:message code="title.zip"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="zip" id="zip" maxlength="5" placeholder="우편번호 5자리를 입력해주세요"
                                                       value="<c:out value='${myInfo.zip}' />">
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="addr"><spring:message code="title.addres"/></label>
                                            <div class="input-group input-group-merge has-validation">
                                                <input class="form-control searchAddress cursor-pointer" type="text" name="addr" id="addr" maxlength="100" placeholder="전남 나주시 우정로 56"
                                                       value="<c:out value='${myInfo.addr}' />" readonly>
                                                <button type="button" id="btnSearchAddress" class="btn btn-primary searchAddress">검색</button>
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="row gx-6">
                                        <div class="mb-4 col-12 form-control-validation fv-plugins-icon-container">
                                            <label class="form-label" for="daddr"><spring:message code="title.detail.addres"/></label>
                                            <div class="has-validation">
                                                <input class="form-control" type="text" name="daddr" id="daddr" maxlength="100" placeholder="B 204호"
                                                       value="<c:out value='${myInfo.daddr}' />">
                                            </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" id="btnDraw" class="btn btn-danger me-2">회원탈퇴</button>
                                        <button type="submit" class="btn btn-primary" id="btnUpdate"><spring:message code="button.modify"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Content -->

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>

        <!--/ Layout container -->

    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->

<!-- script -->
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>
<script type="text/javascript">
    $(function () {
        initFvMbr(); // form validation 초기화

        <%-- 회원정보 수정 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnUpdate').addEventListener('click', function () {
            fvMbrInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    const uuid = document.getElementById('uuid').value;
                    const mbrNm = document.getElementById('mbrNm').value;
                    const pswd = document.getElementById('pswd').value;
                    const emlAddr = document.getElementById('emlAddr').value;
                    const mblTelno = document.getElementById('mblTelno').value;
                    const fxno = document.getElementById('fxno').value;
                    const zip = document.getElementById('zip').value;
                    const addr = document.getElementById('addr').value;
                    const daddr = document.getElementById('daddr').value;

                    if (confirm('<spring:message code="confirm.common.update"/>')) {
                        const data = {
                            "uuid": uuid,
                            "pswd": pswd,
                            "mbrNm": mbrNm.trim(),
                            "emlAddr": emlAddr.trim(),
                            "mblTelno": mblTelno,
                            "fxno": fxno,
                            "zip": zip,
                            "addr": addr,
                            "daddr": daddr
                        };

                        Ajax.post('/api/mber/mypage/update', successUpdateMyInfo, fail, {data: JSON.stringify(data)});
                    }
                }
            });
        });

        <%-- 회원탈퇴버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDraw').addEventListener('click', function () {
            let uuid = document.getElementById('uuid').value;

            if (confirm('<spring:message code="confirm.common.withdraw"/>')) {
                let data = {
                    uuid: uuid
                };
                Ajax.post('/api/mber/mypage/withDraw', successWithDraw, fail, {data: JSON.stringify(data)});
            }

        });

        $('.searchAddress').on('click', () => {
            new daum.Postcode({
                oncomplete: function(result) {
                    document.getElementById('addr').value = result.address;
                }
            }).open();
        })
    });

    let successUpdateMyInfo = function (data) {
        alert('회원정보가 수정되었습니다.');
        reload();
    };

    <%-- 삭제 성공 시 Callback 함수 --%>
    let successWithDraw = function (data) {
        alert('<spring:message code="success.common.withdraw"/>');
        goPage('/index');
    }

    <%-- Ajax 요청실패 시 Callback 함수 --%>
    let fail = function (xhr, status, error) {
        alert('<spring:message code="fail.common.msg"/>');
        console.log(xhr + ", " + status + " : " + error)
    }
</script>
</body>
</html>
