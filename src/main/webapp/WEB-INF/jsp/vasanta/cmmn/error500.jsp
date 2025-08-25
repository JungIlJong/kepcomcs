<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>Error 500</title>
    <link rel="stylesheet" href="/static/vendor/sneat/css/core.css"/>
    <link rel="stylesheet" href="/static/css/page-misc.css"/>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Error -->
                <div class="container-xxl container-p-y">
                    <div class="misc-wrapper row">
                        <div class="card p-10 col-10 col-xl-6">
                            <div class="flex-c mb-3"><img src="/static/pages/sys/assets/image/err-img.png" alt=""></div>
                            <h1>500</h1>
                            <h4>페이지가 작동하지 않음</h4>
                            <p>요청을 처리할 수 없습니다.</p>

                            <button class="btn btn-primary" onclick="goBack();">이전으로</button>
                        </div>
                    </div>
                </div>
                <!-- /Error -->

                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
