<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:set var="logoUrl" value="${not empty setting.logoUrl.content ? setting.logoUrl.content : '/static/assets/images/logo_color.svg'}" />
<c:set var="footerLogoUrl" value="${not empty setting.footerLogoUrl.content ? setting.footerLogoUrl.content : '/static/assets/images/logo_g.svg'}" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="anticsrf" content="<c:out value="${anticsrf.token}"/>"/>
<meta name="anticsrf_header" content="<c:out value="${anticsrf.headerName}"/>"/>

<!-- Fonts -->
<link rel="stylesheet" href="/static/assets/fonts/google/css2.css"/>
<link rel="stylesheet" href="/static/vendor/sneat/fonts/iconify-icons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="/static/vendor/sneat/libs/pickr/pickr-themes.css" />
<link rel="stylesheet" href="/static/vendor/sneat/css/core.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-datetime/dataTables.dateTime.min.css" />

<link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-bs5/datatables.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-buttons-bs5/buttons.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-fixedcolumns-bs5/fixedcolumns.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-fixedheader-bs5/fixedheader.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-rowgroup-bs5/rowgroup.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/datatables-select-bs5/select.bootstrap5.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/select2/select2.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/bootstrap-select/bootstrap-select.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/@form-validation/form-validation.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/flatpickr/flatpickr.css" />
<link rel="stylesheet" href="/static/vendor/jquery-timepicker/jquery-timepicker.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/notiflix/notiflix.css" />
<c:if test="${not empty naverClientId}">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpKeyId=${naverClientId}&submodules=geocoder"></script>
</c:if>
<!-- lib css -->

<!-- common css -->
<link rel="stylesheet" href="/static/pages/sys/css/custom.css" />

<!-- page css -->

<!-- script -->
<script src="/static/vendor/sneat/js/helpers.js"></script>
<script src="/static/vendor/sneat/js/main.js" defer></script> <%-- TODO login 화면, 에러 화면에서는 포함하지 않도록 처리 --%>
<script src="/static/vendor/sneat/js/menu.js"></script>

<script src="/static/vendor/jquery/jquery-3.6.4.min.js"></script>
<script src="/static/vendor/jquery-validate/jquery.validate.min.js"></script>
<script src="/static/vendor/jquery-validate/additional-methods.min.js"></script>
<script src="/static/vendor/l10n_ko.js"></script>
<%--  필요 시 사용
<script src="/static/vendor/FileSaver.min.js"></script>
--%>

<script src="/static/js/common/commonFn.js"></script>
<script src="/static/js/common/ajaxWrapper.js"></script>

<%-- 필요 시 사용
<script src="/static/js/common/pagination.js"></script>
<script src="/static/js/common/validator.js"></script>
<script src="/static/js/common/validation.js"></script>
<script src="/static/js/common/xlsxDownload.js"></script>
<script src="/static/js/lib/xlsx.full.min.js"></script>
<script src="/static/js/common/base64Util.js"></script>
--%>
<script src="/static/vendor/sneat/js/bootstrap.js"></script>
<script src="/static/vendor/sneat/libs/moment/moment.js"></script>
<script src="/static/vendor/sneat/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/static/vendor/sneat/libs/datatables-datetime/dataTables.dateTime.min.js"></script>
<script src="/static/vendor/sneat/libs/flatpickr/flatpickr.js"></script>
<script src="/static/vendor/sneat/libs/flatpickr/l10n_ko.js"></script>
<script src="/static/vendor/sneat/libs/select2/select2.js"></script>
<script src="/static/vendor/sneat/libs/@form-validation/popular.js"></script>
<script src="/static/vendor/sneat/libs/@form-validation/bootstrap5.js"></script>
<script src="/static/vendor/sneat/libs/@form-validation/auto-focus.js"></script>
<script src="/static/vendor/sneat/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.js"></script>
<script src="/static/vendor/sneat/libs/bootstrap-select/bootstrap-select.js"></script>
<script src="/static/pages/sys/js/config.js"></script>
<script src="/static/pages/sys/js/dt_kor.js"></script>
<script type="module" src="/static/vendor/browser-image-compression/browser-image-compression.js"></script>


<script src="/static/vendor/jquery-repeater/jquery-repeater.js"></script>
<script src="/static/vendor/jquery-idletimer/jquery-idletimer.js"></script>
<script src="/static/vendor/jquery-timepicker/jquery-timepicker.js"></script>

<script src="/static/pages/sys/js/lib/chart.umd.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Notiflix Loading and Block UI Library -->
<script src="/static/vendor/sneat/libs/notiflix/notiflix-3.2.8.min.js"></script>
<script src="/static/js/common/datatableUtil.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="/static/assets/vasanta_favicon.jpg" type="images/ico" />

<script>
    $(function () {
        var currentDate = new Date();
        // 한 달 전의 날짜 계산
        var oneMonthAgo = new Date();
        oneMonthAgo.setMonth(currentDate.getMonth() - 1);

        // 오늘
        var oneMonthLater = new Date();

        const stDt = $('#stDt');
        if(!isEmpty(stDt)) {
            stDt.val(formatDate(oneMonthAgo));
        }

        const endDt = $('#endDt')
        if(!isEmpty(endDt)) {
            endDt.val(formatDate(oneMonthLater));
        }
    })

    function passwordFlag(elem) {
        let target = elem.previousElementSibling
        if (target.type == "password") {
            target.type = "text";
            elem.querySelector("i").classList.replace("bx-show", "bx-hide");
        } else {
            target.type = "password";
            elem.querySelector("i").classList.replace("bx-hide", "bx-show");
        }
    }
</script>

<%-- 테마 설정 --%>
<script>
    (function () {
        const savedTheme = localStorage.getItem('templateCustomizer-sneat--Theme') || 'light';
        document.documentElement.setAttribute('data-bs-theme', savedTheme);
    })();
</script>
