<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <style>
        .banner-upload.has-file {
            color: transparent;
        }
        .banner-upload.has-file::before {
            content: attr(data-filename);
            position: absolute;
            left: 90px;
            top: 50%;
            transform: translateY(-50%);
            color: #495057;
            pointer-events: none;
            font-size: 14px;
            z-index: 1;
        }
        .banner-upload {
            position: relative;
        }
    </style>
    <title><c:out value="${menuTitle}"/> - 수정</title>
    <script type="text/javascript">
        let isUpdatePage = true;

        let success = function (data) {
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

        let init = function (data) {
            console.log('Received data:', data); // 디버깅용

            $('#bannerId').val(data.bannerId);
            $('#sortOrder').val(data.sortOrdr);
            $('#bannerNm').val(data.bannerNm);
            $('#dc').val(data.dc);
            if (!isEmpty(data.url)) {
                $('#url').val(data.url);
            }

            $("#bannerSeCode").val(data.bannerSeCode).prop("selected", true)

            // 이미지 프리뷰 설정
            console.log('Web banner fields:', {
                webBannerFileNm: data.webBannerFileNm,
                webBannerFileExtsn: data.webBannerFileExtsn,
                webBannerFileId: data.webBannerFileId
            });

            // 웹 배너 이미지 설정
            if (data.webBannerFileId && data.webBannerFileNm && data.webBannerFileExtsn) {
                $('#webBannerImg').attr('src', '/file/download?fileId=' + data.webBannerFileId).show();
                $('.banner-delete-btn[data-target="webBanner"]').show();
                // 기존 파일 ID 저장
                $('#webBanner').data('currentFileId', data.webBannerFileId);
                // 파일명 표시
                $('#webBanner').attr('data-filename', data.webBannerFileNm + '.' + data.webBannerFileExtsn);
                $('#webBanner').addClass('has-file');
            }

            // 모바일 배너 이미지 설정
            if (data.mobBannerFileId && data.mobBannerFileNm && data.mobBannerFileExtsn) {
                $('#mobBannerImg').attr('src', '/file/download?fileId=' + data.mobBannerFileId).show();
                $('.banner-delete-btn[data-target="mobBanner"]').show();
                // 기존 파일 ID 저장
                $('#mobBanner').data('currentFileId', data.mobBannerFileId);
                // 파일명 표시
                $('#mobBanner').attr('data-filename', data.mobBannerFileNm + '.' + data.mobBannerFileExtsn);
                $('#mobBanner').addClass('has-file');
            }

            data.reflctAt === 'Y' ? $('#reflctY').prop('checked', true) : $('#reflctN').prop('checked', true);
            data.newBrwsAt === 'Y' ? $('#newBRWSRY').prop('checked', true) : $('#newBRWSRN').prop('checked', true);

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
                                    <h5 class="mb-0">배너 수정</h5>
                                </div>
                                <div class="card-body pt-0 form-validation-enabled">
                                    <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                           value="<c:out value="${anticsrf.token}"/>">
                                    <input id="bannerId" name="bannerId" value="" type="hidden">

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
                                                    <label class="form-label" for="bannerNm">
                                                        <spring:message code="banner.bannerNm"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="text" name="bannerNm"
                                                                   id="bannerNm" placeholder="이벤트배너1">
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="reflctat">
                                                        <spring:message code="banner.reflctat"/>
                                                    </label>
                                                </th>
                                                <td>
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex justify-content-start" id="reflctat">
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="reflctAt"
                                                                       id="reflctY" value="Y" checked>
                                                                <label class="form-check-label"
                                                                       for="reflctY"><spring:message
                                                                        code="banner.reflctat.y"/></label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="reflctAt"
                                                                       id="reflctN" value="N">
                                                                <label class="form-check-label"
                                                                       for="reflctN"><spring:message
                                                                        code="banner.reflctat.n"/></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <th>
                                                    <label class="form-label" for="bannerSeCode">
                                                        <spring:message code="banner.location"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td>
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                            <select class="form-select" id="bannerSeCode"
                                                                    name="bannerSeCode">
                                                                <option selected value=""><spring:message
                                                                        code="table.header.select"/></option>
                                                                <option value="BA001"><spring:message
                                                                        code="bannner.bannerSeCode.main"/></option>
                                                            </select>
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="sortOrder">
                                                        <spring:message code="banner.order"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td>
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                            <input class="form-control" type="number"
                                                                   name="sortOrder"
                                                                   id="sortOrder" value="1">
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                </td>
                                                <th>
                                                    <label class="form-label" for="newBrws">
                                                        <spring:message code="banner.newBrws"/>
                                                    </label>
                                                </th>
                                                <td>
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex justify-content-start" id="newBrws">
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="newBrwsAt"
                                                                       id="newBRWSRY" value="Y" checked>
                                                                <label class="form-check-label"
                                                                       for="newBRWSRY"><spring:message
                                                                        code="banner.newBrws.y"/></label>
                                                            </div>
                                                            <div class="form-check mb-0 me-4 me-lg-12">
                                                                <input class="form-check-input" type="radio"
                                                                       name="newBrwsAt"
                                                                       id="newBRWSRN" value="N">
                                                                <label class="form-check-label"
                                                                       for="newBRWSRN"><spring:message
                                                                        code="banner.newBrws.n"/></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="ntce">
                                                        <spring:message code="banner.pd"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex flex-column flex-sm-row align-items-center justify-content-start w-100"
                                                             id="ntce">
                                                            <div class="mb-0 me-sm-4 w-100">
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
                                                            <div class="mb-0 w-100">
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
                                                <th><label class="form-label" for="url"><spring:message
                                                        code="banner.url"/></label></th>
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
                                                    <label class="form-label" for="webBanner">
                                                        <spring:message code="banner.pc"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex flex-column gap-3 justify-content-start w-100"
                                                             id="webBannerElem">
                                                            <div class="file-preview" name="webBannerPreview">
                                                                <img src="" alt="PC 배너 이미지" id="webBannerImg"
                                                                     style="display:none;">
                                                                <button type="button"
                                                                        class="btn btn-xs btn-secondary banner-delete-btn"
                                                                        style="display: none;"
                                                                        data-target="webBanner"><i
                                                                        class="icon-base bx bx-x"></i></button>
                                                            </div>
                                                            <div class="has-validation">
                                                                <input class="form-control fileItem banner-upload"
                                                                       type="file"
                                                                       id="webBanner" name="webBanner"
                                                                       placeholder="파일을 선택하세요" title="파일을 선택하세요"
                                                                       accept="image/png, image/jpg, image/jpeg"
                                                                       data-preview="webBannerImg">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <label class="form-label" for="mobBanner">
                                                        <spring:message code="banner.mob"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                </th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="d-flex flex-column gap-3 justify-content-start w-100"
                                                             id="mobBannerElem">
                                                            <div class="file-preview" name="mobBannerPreview">
                                                                <img src="" alt="모바일 배너 이미지" id="mobBannerImg"
                                                                     style="display:none;">
                                                                <button type="button"
                                                                        class="btn btn-xs btn-secondary banner-delete-btn"
                                                                        style="display: none;"
                                                                        data-target="mobBanner"><i
                                                                        class="icon-base bx bx-x"></i></button>
                                                            </div>
                                                            <div class="has-validation">
                                                                <input class="form-control fileItem banner-upload"
                                                                       type="file"
                                                                       id="mobBanner" name="mobBanner"
                                                                       placeholder="파일을 선택하세요" title="파일을 선택하세요"
                                                                       accept="image/png, image/jpg, image/jpeg"
                                                                       data-preview="mobBannerImg">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label class="form-label" for="dc">설명</label></th>
                                                <td colspan="3">
                                                    <div class="form-control-validation fv-plugins-icon-container">
                                                        <div class="has-validation">
                                                                <textarea class="form-control" name="dc" id="dc"
                                                                          rows="10"
                                                                          placeholder="배너에 대한 설명을 입력해주세요"></textarea>
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
                                            <button type="button" class="btn btn-primary" id="btnUpdate"><spring:message
                                                    code="button.modify"/></button>
                                        </div>
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

<script>
    $(function () {
        Ajax.get(setUrl('/api/sys/banner/detail'), init, fail);
        initFvBanner();

        document.getElementById('btnUpdate').addEventListener('click', function () {
            fvBannerInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.update"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const bannerNm = document.getElementById('bannerNm').value;
                            const url = document.getElementById('url').value;
                            const sortOrder = document.getElementById('sortOrder').value;
                            const bannerSeCode = document.querySelector('#bannerSeCode > option:checked').value;
                            const webBanner = document.getElementById('webBanner').files[0];
                            const mobBanner = document.getElementById('mobBanner').files[0];

                            // 기존 파일 ID 가져오기
                            const currentWebFileId = $('#webBanner').data('currentFileId');
                            const currentMobFileId = $('#mobBanner').data('currentFileId');
                            const ntceBgnde = document.getElementById('ntceBgnde').value;
                            const ntceEndde = document.getElementById('ntceEndde').value;
                            const dc = document.getElementById('dc').value;
                            const reflctAt = document.querySelector('[name="reflctAt"]:checked').value;
                            const newBrwsAt = document.querySelector('[name="newBrwsAt"]:checked').value;
                            const bannerId = document.getElementById('bannerId').value;

                            const form_data = new FormData();
                            form_data.append("bannerId", bannerId);
                            form_data.append("bannerNm", bannerNm.trim());
                            form_data.append("url", url.trim());
                            form_data.append("sortOrder", sortOrder);
                            form_data.append("bannerSeCode", bannerSeCode);
                            form_data.append("ntceBgnde", ntceBgnde);
                            form_data.append("ntceEndde", ntceEndde);
                            form_data.append("dc", dc);
                            form_data.append("reflctAt", reflctAt);
                            form_data.append("newBrwsAt", newBrwsAt);

                            // 파일 처리 - 항상 빈 파일이라도 전송
                            if (webBanner && webBanner.size > 0) {
                                form_data.append("webBanner", webBanner);
                            } else {
                                // 빈 파일 전송
                                form_data.append("webBanner", new Blob([]), '');
                                if (currentWebFileId) {
                                    form_data.append("webBannerFileId", currentWebFileId);
                                }
                            }

                            if (mobBanner && mobBanner.size > 0) {
                                form_data.append("mobBanner", mobBanner);
                            } else {
                                // 빈 파일 전송
                                form_data.append("mobBanner", new Blob([]), '');
                                if (currentMobFileId) {
                                    form_data.append("mobBannerFileId", currentMobFileId);
                                }
                            }

                            console.log('FormData contents:');
                            for (let pair of form_data.entries()) {
                                console.log(pair[0] + ': ', pair[1]);
                            }
                            Ajax.upload('/api/sys/banner/update', success, fail, {data: form_data});
                        }
                    });
                }

            });
        });

        // 이미지 프리뷰 기능 - insert.jsp와 동일
        $('.banner-upload').on('change', function () {
            const file = this.files[0];
            const previewId = $(this).data('preview');
            const inputId = $(this).attr('id');

            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $('#' + previewId).attr('src', e.target.result).show();
                    $('.banner-delete-btn[data-target="' + inputId + '"]').show();
                };
                reader.readAsDataURL(file);
            }
        });

        // 삭제 버튼 기능 - insert.jsp와 동일
        $('.banner-delete-btn').on('click', function () {
            const target = $(this).data('target');

            $('#' + target + 'Img').attr('src', '/static/pages/sys/assets/image/common/file-preview.jpg').show();
            $('#' + target).val('').removeAttr('data-filename').removeClass('has-file');
            $('#' + target).removeData('currentFileId');
            $(this).hide();
        });
        $('#btnDelete').on('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="confirm.common.delete"/>',
                showCancel: true,
                onConfirm: function () {
                    const bannerId = $('#bannerId').val();
                    Ajax.post('/api/sys/banner/delete?bannerId=' + bannerId, function () {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '<spring:message code="success.common.delete"/>',
                            showCancel: false,
                            onConfirm: function () {
                                goPage('list');
                            }
                        });
                    }, fail, {data: JSON.stringify({bannerId: bannerId})});
                }
            });
        })
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

    function openNtceBgnde(e) {
        $('#ntceBgnde').focus();
    }

    function openNtceEndde(e) {
        $('#ntceEndde').focus();
    }
</script>
</body>
</html>

