<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <link rel="stylesheet" href="/static/css/custom-form-validation.css" />
    <title>회원관리 - 등록</title>
    <script type="text/javascript">
        let isSubmitAttempted = false;
        let isIdDupAttempted = false;
        let isIdChecked = false;
        let isEmailDupAttempted = false;
        let isEmailChecked = false;

        <%-- 아이디 중복체크 시 Callback 함수 --%>
        let successDuplicateId = function (data) {
            isIdChecked = true;
            showSuccessMessage('id', VALIDATION_MESSAGES.member.idAvailable);
        }

        <%-- 이메일 중복체크 시 Callback 함수 --%>
        let successDuplicateEmail = function (data) {
            isEmailChecked = true;
            showSuccessMessage('emlAddr', VALIDATION_MESSAGES.member.emailAvailable);
        }

        <%-- 등록 성공 시 Callback 함수 --%>
        let successSave = function (data) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '저장이 완료되었습니다.',
                showCancel: false,
                onConfirm: function () {
                    goPage('list');
                }
            });
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            if (xhr.responseJSON.errorCode === 400001000) {
                isIdChecked = false;
                fvMbrInstance.revalidateField('id');
            } else if (xhr.responseJSON.errorCode === 400002000) {
                isEmailChecked = false;
                fvMbrInstance.revalidateField('emlAddr');
            } else {
                customAlert({
                    title: '<spring:message code="common.system.error"/>',
                    content: '<spring:message code="fail.common.msg"/>',
                    showCancel: false
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
                                    <h5 class="mb-0">회원 등록</h5>
                                </div>
                                <div class="card-body pt-0 form-validation-enabled" id="mbrForm">
                                    <input type="hidden" name="chkDup" id="chkDup" value="N">
                                    <input type="hidden" name="chkDup2" id="chkDup2" value="N">

                                    <div class="table-responsive text-nowrap">
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="40%">
                                                    <col width="10%">
                                                    <col width="40%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th>아이디<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-control-validation">
                                                        <div class="input-group input-group-merge has-validation">
                                                            <input class="form-control" type="text" id="id" name="id" maxlength="12" placeholder="daonplace">
                                                            <button type="button" id="btnDuplicateId" class="btn btn-primary"><spring:message code="button.duplicate"/></button>
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        <div class="form-text">아이디는 영문 소문자로 시작하고 6~12자여야 합니다.</div>
                                                    </td>
                                                    <th>이름<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-control-validation">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="mbrNm" id="mbrNm" maxlength="20" placeholder="홍길동">
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>비밀번호<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-password-toggle">
                                                        <div class="input-group input-group-merge has-validation form-control-validation">
                                                            <input class="form-control" type="password" name="pswd" id="pswd" maxlength="20" placeholder="example2025!@">
                                                            <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        <div class="form-text">8자 이상 20자리 이하</div>
                                                        <div class="form-text">영문자, 숫자, 특수문자(~!@#$%^&*?)의 조합</div>
                                                        <div class="form-text">3자리 이상 반복 또는 연속된 문자 사용 금지 예) kkk, 321등 사용금지</div>
                                                    </td>
                                                    <th>비밀번호 확인<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-password-toggle">
                                                        <div class="input-group input-group-merge has-validation form-control-validation">
                                                            <input class="form-control" type="password" name="pswdConfirm" id="pswdConfirm" maxlength="20" placeholder="입력한 비밀번호와 동일하게 입력해주세요">
                                                            <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        <div class="form-text">8자 이상 20자리 이하</div>
                                                        <div class="form-text">영문자, 숫자, 특수문자(~!@#$%^&*?)의 조합</div>
                                                        <div class="form-text">3자리 이상 반복 또는 연속된 문자 사용 금지 예) kkk, 321등 사용금지</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>이메일주소<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-control-validation">
                                                        <div class="input-group input-group-merge has-validation">
                                                            <input class="form-control" type="text" name="emlAddr" id="emlAddr" placeholder="example@gmail.com">
                                                            <button type="button" id="btnDuplicateEmail" class="btn btn-primary"><spring:message code="button.duplicate"/></button>
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>핸드폰번호<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-control-validation">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="mblTelno" id="mblTelno" maxlength="11" placeholder="'-' 제외하고 입력해주세요">
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                    <th>팩스번호</th>
                                                    <td class="form-control-validation">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="fxno" id="fxno" maxlength="20" placeholder="'-' 제외하고 입력해주세요">
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>주소</th>
                                                    <td colspan="3" class="form-control-validation">
                                                        <div class="has-validation">
                                                            <input class="form-control w-px-250 w-xl-100" type="text" name="zip" id="zip" maxlength="5" placeholder="우편번호 5자리" disabled>
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        <div class="input-group input-group-merge has-validation">
                                                            <input class="form-control" type="text" name="addr" id="addr" maxlength="100" placeholder="도로명 또는 지번 주소" disabled>
                                                            <button type="button" id="btnSearchAddress" class="btn btn-primary searchAddress">검색</button>
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="daddr" id="daddr" maxlength="100" placeholder="상세주소">
                                                        </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>회원상태<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-control-validation">
                                                        <div class="d-flex justify-content-start" id="sttsCd">
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio" name="sttsCd" id="sttsCd1" value="P" checked>
                                                                <label class="form-check-label" for="sttsCd1"><spring:message code="title.member.status.apply"/></label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio" name="sttsCd" id="sttsCd2" value="A">
                                                                <label class="form-check-label" for="sttsCd2"><spring:message code="title.member.status.approval"/></label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio" name="sttsCd" id="sttsCd3" value="D">
                                                                <label class="form-check-label" for="sttsCd3"><spring:message code="title.member.status.withdrawal"/></label>
                                                            </div>
                                                            <div class="form-check mb-0">
                                                                <input class="form-check-input" type="radio" name="sttsCd" id="sttsCd4" value="B">
                                                                <label class="form-check-label" for="sttsCd4"><spring:message code="title.member.status.block"/></label>
                                                            </div>
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                    <th>회원권한<span class="text-danger ms-1">*</span></th>
                                                    <td class="form-control-validation">
                                                        <div class="input-group has-validation" id="role">
                                                            <c:forEach var="item" items="${authrtList}" varStatus="status">
                                                                <div class="form-check mb-0 me-4 me-lg-12">
                                                                    <input class="form-check-input" type="checkbox" name="authrt" id="role<c:out value="${item.authrtId}"/>" value="<c:out value="${item.authrtId}"/>">
                                                                    <label class="form-check-label" for="role<c:out value="${item.authrtId}"/>"><c:out value="${item.authrtNm}"/></label>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary" id="btnList"><spring:message code="button.list"/></button>
                                        <button type="submit" class="btn btn-primary" id="btnSave"><spring:message code="button.create"/></button>
                                    </div>
                                </div>
                            </div>
                            <!--/ Two-steps verification -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script type="text/javascript">
    $(function () {
        <%-- form validation 초기화 --%>
        initFvMbr();

        document.getElementById('id').addEventListener('input', function () {
            isIdDupAttempted &&= false;
            if (isIdChecked){
                isIdChecked = false;
                clearValidationMessage('id');
            }
        });
        document.getElementById('emlAddr').addEventListener('input', function () {
            isEmailDupAttempted &&= false;
            if (isEmailChecked){
                isEmailChecked = false;
                clearValidationMessage('emlAddr');
            }
        });

        document.querySelectorAll('input[name="authrt"]').forEach(cb => {
            cb.addEventListener('change', function () {
                const checkedCount = document.querySelectorAll('input[name="authrt"]:checked').length;
                if (checkedCount > 0) {
                    clearInlineError('role');
                } else {
                    showInlineError('role', VALIDATION_MESSAGES.member.authrtRequired);
                }
            });
        });

        <%-- 아이디 중복체크 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateId').addEventListener('click', function () {
            const id = document.getElementById('id').value;

            if (!id) return;

            const data = {
                id: id.trim()
            };

            isIdDupAttempted = true;

            Ajax.get(dataToQueryString('/api/sys/mbr/duplicateId', data), successDuplicateId, fail);
        });

        <%-- 이메일 중복체크 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDuplicateEmail').addEventListener('click', function () {
            const emlAddr = document.getElementById('emlAddr').value;

            if (!emlAddr) return;

            const data = {
                emlAddr: emlAddr.trim()
            };

            isEmailDupAttempted = true;

            Ajax.get(dataToQueryString('/api/sys/mbr/duplicateEmail', data), successDuplicateEmail, fail);
        });

        <%-- 저장버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            isSubmitAttempted = true;

            fvMbrInstance.validate().then(function(status) {
                const authrtList = [];
                document.querySelectorAll('input[name="authrt"]:checked').forEach(function (checkbox) {
                    authrtList.push({
                        "authrtId": checkbox.value
                    });
                });

                if (authrtList.length <= 0) {
                    showInlineError('role', VALIDATION_MESSAGES.member.authrtRequired);
                    document.getElementById('role').focus();
                    return;
                }

                if (status === 'Valid') {
                    const id = document.getElementById('id').value;

                    const mbrNm = document.getElementById('mbrNm').value;

                    const pswd = document.getElementById('pswd').value;

                    const emlAddr = document.getElementById('emlAddr').value;

                    const mblTelno = document.getElementById('mblTelno').value;

                    const fxno = document.getElementById('fxno').value;

                    const zip = document.getElementById('zip').value;

                    const addr = document.getElementById('addr').value;

                    const daddr = document.getElementById('daddr').value;

                    const sttsCd = document.querySelector('input[name="sttsCd"]:checked').value;

                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const data = {
                                id: id.trim(),
                                mbrNm:  mbrNm.trim(),
                                pswd:  pswd,
                                emlAddr:  emlAddr.trim(),
                                mblTelno: mblTelno.trim(),
                                fxno:  fxno.trim(),
                                zip:  zip,
                                addr:  addr,
                                daddr:  daddr,
                                sttsCd: sttsCd,
                                authrtList: authrtList
                            };
                            Ajax.post('/api/sys/mbr/save', successSave, fail, { data: JSON.stringify(data) });
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

        $('#btnSearchAddress').on('click', () => {
            new daum.Postcode({
                oncomplete: function(result) {
                    document.getElementById('zip').value = result.zonecode;
                    document.getElementById('addr').value = result.address;
                }
            }).open();
        })
    });
</script>
</body>
</html>
