<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <script type="text/javascript">
        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function() {
                    goPage('list')
                }
            });
        }

        let fail = function (xhr) {
            if (isEmpty(xhr.responseJSON)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="fail.common.msg"/>',
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
            } else {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: xhr.responseJSON[0],
                    showCancel: false,
                    onConfirm: function() {
                    }
                });
            }
        }

        let init = function (roles) {
            const roleTable = document.querySelector('#roleTable > tbody');
            for (let i = 0; i < roles.length; i++) {

                const isMaster = roles[i].authrtId === 1 ? 'disabled' : '';
                const checked = roles[i].authrtId === 1 ? 'checked' : '';
                let node = `<tr name="role" data-id="<c:out value='${"${roles[i].authrtId}"}' />" >
                                            <td class=" tit"><c:out value='${"${roles[i].authrtNm}"}' /></td>
                                            <td class=" txt" style="justify-content: center;">
                                                <input type="checkbox" class="form-check-input" name="<c:out value='${"${roles[i].authrtId}"}' />" value="LIST" data-auth="1" <c:out value='${"${isMaster}"}' /> <c:out value='${"${checked}"}' />>
                                            </td>
                                            <td class=" txt" style="justify-content: center;">
                                                <input type="checkbox" class="form-check-input" name="<c:out value='${"${roles[i].authrtId}"}' />" value="DETAIL" data-auth="2" <c:out value='${"${isMaster}"}' /> <c:out value='${"${checked}"}' />>
                                            </td>
                                            <td class=" txt" style="justify-content: center;">
                                                <input type="checkbox" class="form-check-input" name="<c:out value='${"${roles[i].authrtId}"}' />" value="SAVE, UPDATE" data-auth="3" <c:out value='${"${isMaster}"}' /> <c:out value='${"${checked}"}' />>
                                            </td>
                                        </tr>`
                roleTable.insertAdjacentHTML('beforeend', node);
            }

            $('input[type="checkbox"]').on('click', function () {
                const name = $(this).attr('name');
                const val = $(this).data('auth');
                if (name === 1) {
                    return;
                }
                if ($(this).is(':checked')) {
                    $('input[name="' + name + '"]').each(function (index, item) {
                        if ($(item).data('auth') < val) {
                            $(item).prop('checked', true);
                        }
                    })
                } else {
                    $('input[name="' + name + '"]').each(function (index, item) {
                        if ($(item).data('auth') > val) {
                            $(item).prop('checked', false);
                        }
                    })
                }
            });
            
           	$('#bbsTyCode').on('change', function () {
                let bbsTyCode = $(this).val();
                if (bbsTyCode == 'BBS_DEFAULT') {
                	$('#cardTh, #cardTd').show();
                } else if(bbsTyCode === 'BBS_DOWNLOAD') {
                	$('#fileAtchCo').val(1);
                	$('#cardTh, #cardTd').hide();
                } else {
                	$('#cardTh, #cardTd').hide();
                }
            });
           	
           	$('#fileAtchCo').on('change', function () {
           		let bbsTyCode = $('#bbsTyCode').val();
           		if (bbsTyCode === 'BBS_DOWNLOAD') {
           			alert('파일도운로드형 게시판의 경우 첨부파일이 1개로 제한됩니다.');
           			$('#fileAtchCo').val(1);
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
                                    <h5 class="mb-0">게시판 등록</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
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
                                                    <th>게시판명<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="form-control-validation">
                                                            <div class="has-validation">
                                                                <input class="form-control" type="text" name="bbsNm"
                                                                       id="bbsNm" placeholder="게시판명을 입력해주세요">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                    <th>게시판유형<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="form-control-validation">
                                                            <div class="has-validation">
                                                                <select class="form-select" id="bbsTyCode" name="bbsTyCode">
                                                                    <option value="BBS_DEFAULT" selected><spring:message
                                                                            code="bbs.bbsTyCode.default"/></option>
                                                                    <option value="BBS_ALBUM"><spring:message
                                                                            code="bbs.bbsTyCode.album"/></option>
                                                                    <option value="BBS_QNA"><spring:message
                                                                            code="bbs.bbsTyCode.qna"/></option>
                                                                    <option value="BBS_DOWNLOAD"><spring:message
                                                                            code="bbs.bbsTyCode.download"/></option>
                                                                </select>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>첨부파일<br/>필수여부<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="d-flex justify-content-start" id="sttsCd">
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="fileAt" id="fileY" value="Y">
                                                                <label class="form-check-label"
                                                                       for="fileY">예</label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="fileAt" id="fileN" value="N" checked>
                                                                <label class="form-check-label"
                                                                       for="fileN">아니오</label>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <th id="cardTh">카드형목록<span class="text-danger ms-1">*</span></th>
                                                    <td id="cardTd">
                                                        <div class="d-flex justify-content-start" id="sttsCd">
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="cardAt" id="cardY" value="Y">
                                                                <label class="form-check-label"
                                                                       for="cardY">예</label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="cardAt" id="cardN" value="N" checked>
                                                                <label class="form-check-label"
                                                                       for="cardN">아니오</label>
                                                            </div>
                                                        </div>
                                                </tr>
                                                <tr>
                                                    <th>첨부파일 개수<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="form-control-validation">
                                                            <div class="has-validation">
                                                                <select class="form-select" id="fileAtchCo" name="fileAtchCo">
                                                                    <option value="0" selected>0</option>
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                    <option value="6">6</option>
                                                                    <option value="7">7</option>
                                                                    <option value="8">8</option>
                                                                    <option value="9">9</option>
                                                                    <option value="10">10</option>
                                                                </select>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                    <th>첨부파일 용량(단위: MB)<span class="text-danger ms-1">*</span></th>
                                                    <td>
                                                        <div class="form-control-validation">
                                                            <div class="has-validation">
                                                                <input class="form-control" type="number" name="fileAtchSize"
                                                                       id="fileAtchSize" value="50" placeholder="50" min="0"
                                                                       max="50">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>첨부파일<br />허용 확장자<span class="text-danger ms-1">*</span></th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation">
                                                            <div class="has-validation">
                                                                <textarea class="form-control" name="permExtsn" id="permExtsn"
                                                                  rows="10"
                                                                  placeholder="<spring:message code='bbs.atchfile.permitextsn.placeholder'/>">JPG,JPEG,PNG,GIF,BMP,TIFF,PSD,SVG,WEBP,HWP,DOCS,XLSX,XLS,XLSB,PPTX,PDF,TXT,CSV</textarea>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>권한설정</th>
                                                    <td colspan="3">
                                                        <table class="table in-table" id="roleTable">
                                                        <thead>
                                                        <tr>
                                                            <th  rowspan="2" style="border-right: 1px solid var(--bs-gray-200);vertical-align: middle;"><spring:message code="bbs.role.se"/></th>
                                                            <th colspan="2"><spring:message
                                                                    code="bbs.role.se.read"/></th>
                                                            <th  colspan="2"><spring:message
                                                                    code="bbs.role.se.write"/></th>
                                                        </tr>
                                                        <tr >
                                                            <th ><spring:message code="bbs.role.list"/></th>
                                                            <th ><spring:message
                                                                    code="bbs.role.detail"/></th>
                                                            <th ><spring:message code="bbs.role.ntt"/></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-between mt-5">
                                            <button type="button" class="btn btn-secondary me-2" id="btnList"><spring:message code="button.list"/></button>
                                            <button type="button" class="btn btn-primary" id="btnSave">
                                                <spring:message
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
        <!-- 콘텐츠 영역 end -->

        <!-- Contents end -->
    </div>
</div>
<script src="/static/js/common/validation.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<!-- script -->
<script>
    $(function () {
        Ajax.get('/api/sys/bbs/role/all', init, fail);
        initFvBbs();

        document.getElementById('btnSave').addEventListener('click', function () {
            fvBbsInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    const roles = [];

                    $('tr[name="role"]').each(function () {
                        let author = [];
                        $(this).find('input[type="checkbox"]:checked').each(function (index, item) {
                            author.push($(item).val())
                        })
                        const newRole = {};
                        newRole.authrtId = $(this).data('id');
                        newRole.author = JSON.stringify(author);
                        roles.push(newRole);
                    })

                    if (roles.length === 0) {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '권한을 선택해주세요',
                            showCancel: false,
                            onConfirm: function() {}
                        });
                        return;
                    }

                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            let data = bindingData($('#frm'));
                            data.roles = roles;
                            Ajax.post('/api/sys/bbs/save', success, fail, { data: JSON.stringify(data) });
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
