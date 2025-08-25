<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html  lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
       data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <link rel="stylesheet" href="/static/css/custom-form-validation.css" />
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <script type="text/javascript">
        let init = function (data) {
            const count = data.count;
            $('#popupCount').text(count);

            if (count >= 10) {
                $('#ntceY').prop('disabled', true);
                $('#ntceN').prop('checked', true);
                showInlineError('ntceAt', "※ 현재 최대 등록 수에 도달했습니다. 더 이상 게시할 수 없습니다.");
            }
        }

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

        let fail = function (xhr, status, error) {
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
                            <div class="card mb-6" id="frm">
                                <div class="card-header">
                                    <h5 class="mb-0">팝업 등록</h5>
                                </div>
                                <div class="card-body pt-0 form-validation-enabled">
                                    <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                           value="<c:out value="${anticsrf.token}"/>">
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
                                                    <label class="form-label" for="popupNm">
                                                        <spring:message code="popup"/><spring:message code="name"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="popupNm"
                                                                   id="popupNm" placeholder="예시팝업1">
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="ntceAt">
                                                        <spring:message code="ntceAt"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td>
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="alert alert-warning" role="alert"
                                                             style="margin-bottom: 0.5rem;">
                                                            현재 게시된 팝업:
                                                            <span id="popupCount">0</span> / 10개 (최대 10개까지 등록할 수 있습니다)
                                                        </div>
                                                        <div class="d-flex justify-content-start" id="ntceAt">
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="ntceAt"
                                                                       id="ntceY" value="Y" checked>
                                                                <label class="form-check-label"
                                                                       for="ntceY"><spring:message
                                                                        code="ntceY"/></label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="ntceAt"
                                                                       id="ntceN" value="N">
                                                                <label class="form-check-label"
                                                                       for="ntceN"><spring:message
                                                                        code="ntceN"/></label>
                                                            </div>
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                                <th>
                                                    <label class="form-label" for="sortOrdr">
                                                        <spring:message code="ntce"/><spring:message code="order"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td>
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="number" name="sortOrdr"
                                                                   id="sortOrdr" value="1">
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="ntce">
                                                        <spring:message code="ntceY"/><spring:message code="period"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex flex-column flex-sm-row align-items-center justify-content-start w-100"
                                                             id="ntce">
                                                            <div class="mb-0 me-4 w-sm-100">
                                                                <div class="input-group input-group-merge">
                                                                    <input type="text"
                                                                           class="dt-datetime form-control flatpickr-input"
                                                                           placeholder="<spring:message code='table.header.stDt'/>"
                                                                           id="ntceBgnde" name="ntceBgnde" readonly>
                                                                    <span class="input-group-text cursor-pointer"
                                                                          onclick="openNtceBgnde(this)"><i
                                                                            class="icon-base bx bx-calendar"></i></span>
                                                                </div>
                                                            </div>
                                                            <div class="mb-0 me-sm-4 d-flex align-items-center align-self-sm-center">
                                                                <span class="form-label"><i
                                                                        class="icon-base bx bx-minus"></i></span>
                                                            </div>
                                                            <div class="mb-0 me-4 w-sm-100">
                                                                <div class="input-group input-group-merge">
                                                                    <input type="text"
                                                                           class="dt-datetime form-control flatpickr-input"
                                                                           placeholder="<spring:message code='table.header.endDt'/>"
                                                                           id="ntceEndde" name="ntceEndde" readonly>
                                                                    <span class="input-group-text cursor-pointer"
                                                                          onclick="openNtceEndde(this)"><i
                                                                            class="icon-base bx bx-calendar"></i></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="url"><spring:message
                                                            code="banner.url"/></label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="url" id="url"
                                                                   placeholder="https://example.com">
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="imgFile">
                                                        <spring:message code="popup"/><spring:message code="img"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex flex-column gap-3 justify-content-start w-100">
                                                            <div class="file-preview" name="imgFilePreview">
                                                                <img src="/static/pages/sys/assets/image/common/file-preview.jpg" alt="팝업 이미지" id="imgFilePreviewImg">
                                                                <button type="button"
                                                                        class="btn btn-xs btn-secondary banner-delete-btn"
                                                                        style="display: none;" data-target="imgFile"><i
                                                                        class="icon-base bx bx-x"></i></button>
                                                            </div>
                                                            <div class="has-validation">
                                                                <input class="form-control fileItem banner-upload"
                                                                       type="file" id="imgFile"
                                                                       name="imgFile" placeholder="파일을 선택하세요"
                                                                       title="파일을 선택하세요"
                                                                       accept="image/png, image/jpg, image/jpeg"
                                                                       data-preview="imgFilePreviewImg">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </div>
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
        Ajax.get(setUrl('/api/sys/popup/active-count'), init, fail);
        initFvPopup();

        const ntceBgnde = document.querySelector('#ntceBgnde'),
            ntceEndde = document.querySelector('#ntceEndde')

        // Date
        if (ntceBgnde) {
            ntceBgnde.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d H:i",
                enableTime: true,
                monthSelectorType: "static",
            });
        }

        if (ntceEndde) {
            ntceEndde.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d H:i",
                enableTime: true,
                monthSelectorType: "static",
            });
        }

        // 이미지 프리뷰 기능 - 팝업용
        $('.banner-upload').on('change', function() {
            const file = this.files[0];
            const previewId = $(this).data('preview');
            const inputId = $(this).attr('id');

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    $('#' + previewId).attr('src', e.target.result);
                    $('.banner-delete-btn[data-target="' + inputId + '"]').show();
                };
                reader.readAsDataURL(file);
            }
        });

        // 삭제 버튼 기능 - 팝업용
        $('.banner-delete-btn').on('click', function() {
            const target = $(this).data('target');

            $('#' + target + 'PreviewImg').attr('src', '/static/pages/sys/assets/image/common/file-preview.jpg');
            $('#' + target).val('');
            $(this).hide();
        });

        document.getElementById('btnSave').addEventListener('click', function () {
            fvPopupInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const popupNm = document.getElementById('popupNm').value;
                            const url = document.getElementById('url').value;
                            const sortOrdr = document.getElementById('sortOrdr').value;
                            const imgFile = document.getElementById('imgFile').files[0];
                            const ntceBgnde = document.getElementById('ntceBgnde').value;
                            const ntceEndde = document.getElementById('ntceEndde').value;
                            const ntceAt = document.querySelector('[name="ntceAt"]:checked').value;

                            const data = {
                                "popupNm": popupNm.trim(),
                                "url": url.trim(),
                                "sortOrdr": parseInt(sortOrdr),
                                "imgFile": imgFile,
                                "ntceBgnde": ntceBgnde,
                                "ntceEndde": ntceEndde,
                                "ntceAt": ntceAt
                            };

                            var form_data = new FormData();
                            for (var key in data) {
                                form_data.append(key, data[key]);
                            }
                            Ajax.upload('/api/sys/popup/save', success, fail, { data: form_data });
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

    function openNtceBgnde(e) {
        $('#ntceBgnde').focus();
    }

    function openNtceEndde(e) {
        $('#ntceEndde').focus();
    }
</script>
</body>
</html>
