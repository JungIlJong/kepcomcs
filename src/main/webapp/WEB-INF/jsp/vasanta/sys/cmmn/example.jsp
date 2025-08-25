<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>Vasanta-CMS 샘플 페이지</title>
</head>
<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Layout page -->
        <div class="layout-page">


            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4">
                        <span class="text-muted fw-light">샘플 /</span> 예제 페이지 목록
                    </h4>
                    
                    <div class="row mb-5">
                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">목록 페이지 템플릿</h5>
                                    <p class="card-text">기본 목록 페이지 레이아웃 및 구성 예제입니다.</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="/sample/list" class="btn btn-primary">
                                            <i class="bx bx-link-external me-1"></i>
                                            <span>페이지 보기</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">데이터테이블 예제</h5>
                                    <p class="card-text">고급 테이블 기능을 포함한 데이터테이블 구현 예제입니다.</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="/sample/example-datatable" class="btn btn-primary">
                                            <i class="bx bx-link-external me-1"></i>
                                            <span>페이지 보기</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Java 코드 예제</h5>
                                    <p class="card-text">Vasanta-CMS의 패키지 구조 및 코드 작성 가이드라인입니다.</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="/sample/java" class="btn btn-primary">
                                            <i class="bx bx-code me-1"></i>
                                            <span>페이지 보기</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Content -->
                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>
        <!--/ Layout page -->

    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->
</body>

</html>
