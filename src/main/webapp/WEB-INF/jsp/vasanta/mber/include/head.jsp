<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<c:set var="logoUrl" value="${not empty setting.logoUrl.content ? setting.logoUrl.content : '/static/assets/images/logo_color.svg'}" />
<c:set var="footerLogoUrl" value="${not empty setting.footerLogoUrl.content ? setting.footerLogoUrl.content : '/static/assets/images/logo_g.svg'}" />
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, user-scalable=no"/>
<meta name="anticsrf" content="<c:out value="${anticsrf.token}"/>"/>
<meta name="anticsrf_header" content="<c:out value="${anticsrf.headerName}"/>"/>

<!-- Fonts -->
<link rel="stylesheet" href="/static/assets/fonts/google/css2.css"/>
<link rel="stylesheet" href="/static/vendor/sneat/fonts/iconify-icons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="/static/vendor/sneat/libs/pickr/pickr-themes.css" />
<link rel="stylesheet" href="/static/vendor/sneat/css/core.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet" href="/static/vendor/sneat/libs/notiflix/notiflix.css" />

<!-- lib css -->

<!-- common css -->
<link rel="stylesheet" href="/static/pages/mber/css/common-custom.css" />
<link rel="stylesheet" href="/static/pages/mber/css/sneat-custom-footer.css" />

<!-- page css -->

<!-- script -->
<script src="/static/vendor/sneat/js/helpers.js"></script>
<script src="/static/vendor/sneat/js/main.js" defer></script> <%-- TODO login 화면, 에러 화면에서는 포함하지 않도록 처리 --%>
<script src="/static/vendor/sneat/js/menu.js"></script>
<script src="/static/vendor/sneat/js/bootstrap.js"></script>

<script src="/static/vendor/jquery/jquery-3.6.4.min.js"></script>
<script src="/static/vendor/jquery-validate/jquery.validate.min.js"></script>
<script src="/static/vendor/jquery-validate/additional-methods.min.js"></script>
<script src="/static/vendor/l10n_ko.js"></script>
<%--  필요 시 사용
<script src="/static/vendor/FileSaver.min.js"></script>
--%>
<!-- Notiflix Loading and Block UI Library -->
<script src="/static/vendor/sneat/libs/notiflix/notiflix-3.2.8.min.js"></script>

<script src="/static/js/common/commonFn.js"></script>
<script src="/static/js/common/jwtAjaxWrapper.js"></script>
<script src="/static/js/common/pagination.js"></script>

<link rel="stylesheet" href="/static/vendor/sneat/libs/quill/katex.css"/>
<link rel="stylesheet" href="/static/vendor/sneat/libs/quill/editor.css"/>

<!-- script -->
<script type="text/javascript" src="/static/js/common/validation.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/cleave-zen/cleave-zen.js"></script>

<script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/popular.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/bootstrap5.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/auto-focus.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/quill/katex.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/quill/quill.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="module" src="/static/vendor/browser-image-compression/browser-image-compression.js"></script>

<%-- 필요 시 사용
<script src="/static/js/common/pagination.js"></script>
<script src="/static/js/common/validator.js"></script>
<script src="/static/js/common/validation.js"></script>
<script src="/static/js/common/xlsxDownload.js"></script>
<script src="/static/js/lib/xlsx.full.min.js"></script>
<script src="/static/js/common/base64Util.js"></script>
--%>

<%-- 테마 설정 --%>
<script>
    (function () {
        const savedTheme = localStorage.getItem('templateCustomizer-sneat--Theme') || 'light';
        document.documentElement.setAttribute('data-bs-theme', savedTheme);
    })();
</script>

<!-- favicon -->
<link rel="shortcut icon" href="/static/assets/vasanta_favicon.jpg" type="images/ico"/>
<style>
    a {
        text-decoration: none; /* 밑줄 제거 */
        color: var(--bs-a-text-color); /* 원하는 색으로 변경 (예: 검정색) */
    }

    [data-bs-theme=light][data-skin=bordered] {
        --bs-a-text-color: black;
    }

    [data-bs-theme=dark][data-skin=bordered] {
        --bs-a-text-color: white;
    }
</style>
