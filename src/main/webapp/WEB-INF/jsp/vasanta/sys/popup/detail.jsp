<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html  lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
       data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/> - 수정</title>
    <script type="text/javascript">
        let isUpdatePage = true;

        let init = function (data) {
            const ntceBgnde = document.querySelector('#ntceBgnde'),
                ntceEndde = document.querySelector('#ntceEndde')

            ntceBgnde.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d H:i",
                enableTime: true,
                monthSelectorType: "static",
                defaultDate: new Date(data.ntceBgnde)
            });

            ntceEndde.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d H:i",
                enableTime: true,
                monthSelectorType: "static",
                defaultDate: new Date(data.ntceEndde)
            });

            document.getElementById('popupId').value = data.popupId;
            document.getElementById('sortOrdr').value = data.sortOrdr;
            document.getElementById('popupNm').value = data.popupNm;
            if (!isEmpty(data.url)) {
                document.getElementById('url').value = data.url;
            }

            // 이미지 프리뷰 설정
            if (data.atchFileId && data.orignlFileNm && data.fileExtsn) {
                $('#imgFilePreviewImg').attr('src', '/file/download?fileId=' + data.atchFileId).show();
                $('.banner-delete-btn[data-target="imgFile"]').show();
                // 기존 파일 ID 저장
                $('#imgFile').data('currentFileId', data.atchFileId);
            }

            data.ntceAt === 'Y' ? document.getElementById('ntceY').checked = true : document.getElementById('ntceN').checked = true;
        }

        let getActivePopupCount = function (data) {
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
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false,
                onConfirm: function () {
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
                                    <h5 class="mb-0">팝업 수정</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <form id="frm">
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
                                        <input id="popupId" name="popupId" type="hidden" value=""/>
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
                                                                <span id="popupCount">0</span> / 10개 (최대 10개까지 등록할 수
                                                                있습니다)
                                                            </div>
                                                            <div class="d-flex justify-content-start" id="ntceAt">
                                                                <div class="form-check mb-0 me-4 me-lg-12">
                                                                    <input class="form-check-input" type="radio"
                                                                           name="ntceAt" id="ntceY" value="Y" checked>
                                                                    <label class="form-check-label"
                                                                           for="ntceY"><spring:message
                                                                            code="ntceY"/></label>
                                                                </div>
                                                                <div class="form-check mb-0 me-4 me-lg-12">
                                                                    <input class="form-check-input" type="radio"
                                                                           name="ntceAt" id="ntceN" value="N">
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
                                                                <input class="form-control" type="number"
                                                                       name="sortOrdr" id="sortOrdr" value="1">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="ntce">
                                                            <spring:message code="ntceY"/><spring:message
                                                                code="period"/>
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
                                                                <input class="form-control" type="text" name="url"
                                                                       id="url" placeholder="https://example.com">
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
                                                            <div class="d-flex flex-column gap-3 justify-content-start w-100"
                                                                 id="imgFileElem">
                                                                <div class="file-preview" name="imgFilePreview">
                                                                    <img src="" alt="팝업 이미지" id="imgFilePreviewImg"
                                                                         style="display:none;">
                                                                    <button type="button"
                                                                            class="btn btn-xs btn-secondary banner-delete-btn"
                                                                            style="display: none;"
                                                                            data-target="imgFile"><i
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
        <!-- 콘텐츠 영역 end -->

        <!-- Contents end -->
    </div>
</div>

<!-- script -->
<script src="/static/js/common/validation.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
    $(function () {
        Ajax.get(setUrl('/api/sys/popup/detail'), init, fail);
        Ajax.get(setUrl('/api/sys/popup/active-count'), getActivePopupCount, fail);
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

        document.getElementById('btnSave').addEventListener('click', function () {
            fvPopupInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.update"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const popupId = document.getElementById('popupId').value;
                            const popupNm = document.getElementById('popupNm').value;
                            const url = document.getElementById('url').value;
                            const sortOrdr = document.getElementById('sortOrdr').value;
                            const imgFile = document.getElementById('imgFile').files[0];
                            const ntceBgnde = document.getElementById('ntceBgnde').value;
                            const ntceEndde = document.getElementById('ntceEndde').value;
                            const ntceAt = document.querySelector('[name="ntceAt"]:checked').value;

                            // 기존 파일 ID 가져오기
                            const currentFileId = $('#imgFile').data('currentFileId');

                            const form_data = new FormData();
                            form_data.append("popupId", popupId);
                            form_data.append("popupNm", popupNm.trim());
                            form_data.append("url", url.trim());
                            form_data.append("sortOrdr", parseInt(sortOrdr));
                            form_data.append("ntceBgnde", ntceBgnde);
                            form_data.append("ntceEndde", ntceEndde);
                            form_data.append("ntceAt", ntceAt);

                            // 파일 처리 - 항상 빈 파일이라도 전송
                            if (imgFile && imgFile.size > 0) {
                                form_data.append("imgFile", imgFile);
                            } else {
                                // 빈 파일 전송
                                form_data.append("imgFile", new Blob([]), '');
                                if (currentFileId) {
                                    form_data.append("imgFileId", currentFileId);
                                }
                            }

                            Ajax.upload('/api/sys/popup/update', success, fail, { data: form_data });
                        }
                    });
                }

            });
        });

        // 이미지 프리뷰 기능 - 팝업용
        $('.banner-upload').on('change', function() {
            const file = this.files[0];
            const previewId = $(this).data('preview');
            const inputId = $(this).attr('id');

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    $('#' + previewId).attr('src', e.target.result).show();
                    $('.banner-delete-btn[data-target="' + inputId + '"]').show();
                };
                reader.readAsDataURL(file);
            }
        });

        // 삭제 버튼 기능 - 팝업용
        $('.banner-delete-btn').on('click', function() {
            const target = $(this).data('target');

            $('#' + target + 'PreviewImg').attr('src', '/static/pages/sys/assets/image/common/file-preview.jpg').show();
            $('#' + target).val('').removeData('currentFileId');
            $(this).hide();
        });

        $('#btnDelete').on('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="confirm.common.delete"/>',
                showCancel: true,
                onConfirm: function () {
                    const popupId = $('#popupId').val();
                    Ajax.post('/api/sys/popup/delete?popupId=' + popupId, function () {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '<spring:message code="success.common.delete"/>',
                            showCancel: false,
                            onConfirm: function () {
                                goPage('list');
                            }
                        });
                    }, fail, {data: JSON.stringify({popupId: popupId})});
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

    function openNtceBgnde(e) {
        $('#ntceBgnde').focus();
    }

    function openNtceEndde(e) {
        $('#ntceEndde').focus();
    }

</script>
</body>

</html>
