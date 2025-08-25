<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <link rel="stylesheet" href="/static/css/custom-form-validation.css" />
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <script type="text/javascript">
        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
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
                                    <h5 class="mb-0">배너 등록</h5>
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
                                                                <div class="mb-0 me-sm-4 d-flex align-items-center align-self-start" style="height: calc(1.5em + 0.75rem + 2px);">
                                                                    <span class="form-label"><i
                                                                            class="icon-base bx bx-minus"></i></span>
                                                                </div>
                                                                <div class="mb-0 me-4  w-sm-100">
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
                                                                    <img src="/static/pages/sys/assets/image/common/file-preview.jpg" alt="" id="webBannerImg">
                                                                    <button type="button" class="btn btn-xs btn-secondary banner-delete-btn" style="display: none;" data-target="webBanner"><i class="icon-base bx bx-x"></i></button>
                                                                </div>
                                                                <div class="has-validation">
                                                                    <input class="form-control fileItem banner-upload" type="file"
                                                                           id="webBanner"
                                                                           name="webBanner" placeholder="파일을 선택하세요"
                                                                           title="파일을 선택하세요"
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
                                                                    <img src="/static/pages/sys/assets/image/common/file-preview.jpg" alt="" id="mobBannerImg">
                                                                    <button type="button" class="btn btn-xs btn-secondary banner-delete-btn" style="display: none;" data-target="mobBanner"><i class="icon-base bx bx-x"></i></button>
                                                                </div>
                                                                <div class="has-validation">
                                                                    <input class="form-control fileItem banner-upload" type="file"
                                                                           id="mobBanner"
                                                                           name="mobBanner" placeholder="파일을 선택하세요"
                                                                           title="파일을 선택하세요"
                                                                           accept="image/png, image/jpg, image/jpeg"
                                                                           data-preview="mobBannerImg">
                                                                </div>
                                                                <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label class="form-label" for="dc"><spring:message
                                                            code="banner.dc"/></label></th>
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
        <!-- 콘텐츠 영역 end -->

        <!-- Contents end -->
    </div>
</div>
<script src="/static/js/common/validation.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
    $(function () {
        initFvBanner();

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

        // 이미지 프리뷰 기능 - 공통 처리
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

        // 삭제 버튼 기능 - 공통 처리
        $('.banner-delete-btn').on('click', function() {
            const target = $(this).data('target');

            $('#' + target + 'Img').attr('src', '/static/pages/sys/assets/image/common/file-preview.jpg');
            $('#' + target).val('');
            $(this).hide();
        });

        document.getElementById('btnSave').addEventListener('click', function () {
            fvBannerInstance.validate().then(function (status) {
                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.save"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const bannerNm = document.getElementById('bannerNm').value;
                            const url = document.getElementById('url').value;
                            const sortOrder = document.getElementById('sortOrder').value;
                            const bannerSeCode = document.querySelector('#bannerSeCode > option:checked').value;
                            const webBanner = document.getElementById('webBanner').files[0];
                            const mobBanner = document.getElementById('mobBanner').files[0];
                            const ntceBgnde = document.getElementById('ntceBgnde').value;
                            const ntceEndde = document.getElementById('ntceEndde').value;
                            const dc = document.getElementById('dc').value;
                            const reflctAt = document.querySelector('[name="reflctAt"]:checked').value;
                            const newBrwsAt = document.querySelector('[name="newBrwsAt"]:checked').value;

                            const data = {
                                "bannerNm": bannerNm.trim(),
                                "url": url.trim(),
                                "sortOrder": parseInt(sortOrder),
                                "bannerSeCode": bannerSeCode,
                                "webBanner": webBanner,
                                "mobBanner": mobBanner,
                                "ntceBgnde": ntceBgnde,
                                "ntceEndde": ntceEndde,
                                "dc": dc,
                                "reflctAt": reflctAt,
                                "newBrwsAt": newBrwsAt
                            };

                            var form_data = new FormData();
                            for (var key in data) {
                                form_data.append(key, data[key]);
                            }
                            Ajax.upload('/api/sys/banner/save', success, fail, {data: form_data});
                        }
                    });
                }

            });
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

    function openNtceBgnde(e) {
        $('#ntceBgnde').focus();
    }

    function openNtceEndde(e) {
        $('#ntceEndde').focus();
    }
</script>
</body>
</html>
