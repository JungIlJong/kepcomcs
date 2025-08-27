<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>Vasanta - 메인화면</title>
    <link rel="stylesheet" href="/static/pages/mber/css/front-page.css" />
    <link rel="stylesheet" href="/static/vendor/sneat/libs/swiper/swiper.css" />
    <script type="text/javascript" src="/static/vendor/sneat/libs/swiper/swiper.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- Navbar -->
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-nav.jsp" %>
        <!-- / Navbar -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Menu -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
                <!-- / Menu -->

                <%-- Section 1(S)--%>
                <section class="py-5 bg-vasanta-section">
                    <div class="container px-4">
                        <div class="row gx-1 align-items-center vasanta-equal-height">
                            <!-- 텍스트 영역 -->
                            <div class="col-lg-5 d-flex flex-column justify-content-center py-lg-4">
                                <h2 class="fw-bold mb-3 lh-base">
                                    Web/App 하나로 연결되는<br>
                                    <span class="text-primary text-gradient">공공 시스템 통합 구축 솔루션</span>
                                </h2>
                                <div class="vasanta-indent mt-3">
                                    <p class="text-muted fs-6 mb-4">
                                        Vasanta CMS는 전자정부프레임워크 기반의 국산 CMS 솔루션으로,<br>
                                        사이트 운영에 필요한 모든 기능을 통합 제공합니다.
                                    </p>
                                    <ul class="list-unstyled lh-base">
                                        <li class="mb-2">
                                            <i class="bx bx-check-circle text-primary me-3"></i> 표준 준수, 안정성 확보
                                        </li>
                                        <li class="mb-2">
                                            <i class="bx bx-check-circle text-primary me-3"></i> GS 인증 1등급 획득
                                        </li>
                                        <li class="mb-2">
                                            <i class="bx bx-check-circle text-primary me-3"></i> 사용자와 관리자 시스템 구축을 한 번에
                                        </li>
                                    </ul>
                                    <div class="mt-6 mb-4 d-flex flex-wrap gap-2">
                                        <a href="/mber/support/join/join/step1" class="btn btn-primary px-4">
                                            <i class="bx bx-user-plus me-1"></i> 회원가입
                                        </a>
                                        <a href="/mber/support/login/login" class="btn btn-outline-secondary px-4">
                                            <i class="bx bx-log-in me-1"></i> 로그인
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- 배너 carousel 영역 -->
                            <div class="col-lg-7">
                                <div id="carouselExample" class="carousel slide h-100" data-bs-ride="carousel" data-bs-interval="3000">
                                    <div class="carousel-indicators"></div>
                                    <div id="bannerList" class="carousel-inner h-100 rounded-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <%-- Section 1(E)--%>

                <%-- Section 2(S)--%>
                <section class="py-5">
                    <div class="container">
                        <div class="text-center mb-3">
                            <span class="vasanta-section-bar"></span>
                        </div>
                        <h4 class="text-center fw-semibold mb-2">솔루션 특징</h4>
                        <p class="text-center text-muted mb-5 small">손쉬운 정보시스템 구축이 가능합니다.</p>

                        <div class="row g-3">
                            <!-- 카드 1 -->
                            <div class="col-6 col-lg-3">
                                <div class="card h-100 text-center border py-4 px-3">
                                    <div class="icon-wrapper bg-primary text-white rounded-circle mt-2 mb-2 mx-auto">
                                        <i class="bx bx-layout fs-4"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">표준 CMS</h6>
                                    <p class="text-muted small mt-2">전자정부프레임워크 기반의<br/>국산 솔루션</p>
                                </div>
                            </div>

                            <!-- 카드 2 -->
                            <div class="col-6 col-lg-3">
                                <div class="card h-100 text-center border py-4 px-3">
                                    <div class="icon-wrapper bg-warning text-white rounded-circle mt-2 mb-2 mx-auto">
                                        <i class="bx bx-certification fs-4"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">GS인증</h6>
                                    <p class="text-muted small mt-2">Good Software<br/>1등급 획득</p>
                                </div>
                            </div>

                            <!-- 카드 3 -->
                            <div class="col-6 col-lg-3">
                                <div class="card h-100 text-center border py-4 px-3">
                                    <div class="icon-wrapper bg-success text-white rounded-circle mt-2 mb-2 mx-auto">
                                        <i class="bx bx-mobile-alt fs-4"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">사용자 중심</h6>
                                    <p class="text-muted small mt-2">HTML5 기반의<br/>반응형 웹 지원</p>
                                </div>
                            </div>

                            <!-- 카드 4 -->
                            <div class="col-6 col-lg-3">
                                <div class="card h-100 text-center border py-4 px-3">
                                    <div class="icon-wrapper bg-info text-white rounded-circle mt-2 mb-2 mx-auto">
                                        <i class="bx bx-like fs-4"></i>
                                    </div>
                                    <h6 class="fw-semibold mb-1">4.8/5</h6>
                                    <p class="text-muted small mt-2">공공기관 웹 시스템 구축<br/>높은 만족도</p>
                                </div>
                            </div>
                        </div>
                        <div class="text-center mt-5">
                            <a href="https://daonplace.com/#/product/NTT2_000000000000021" class="btn btn-outline-primary btn-sm px-3" target="_blank">
                                Vasanta CMS 소개 보기</a>
                        </div>
                    </div>
                </section>
                <%-- Section 2(E)--%>


                <section class="py-5">
                    <div class="container">
                        <div class="text-center mb-4">
                            <span class="vasanta-section-bar"></span>
                            <h4 class="fw-semibold mt-2 mb-2">솔루션 구성도</h4>
                            <p class="text-muted small">관리자와 사용자의 업무 흐름을 고려한 통합 관리 체계</p>
                        </div>

                        <!-- 사용자와 관리자 -->
                        <div class="d-flex justify-content-center align-items-center mb-4 flex-wrap gap-4">
                            <div class="text-center">
                                <div class="rounded-circle border border-2 shadow-sm mx-auto mb-2" style="width:80px; height:80px; display:flex; align-items:center; justify-content:center;">
                                    <i class="bx bx-desktop fs-3 text-primary"></i>
                                </div>
                                <strong class="d-block">관리자</strong>
                            </div>
                            <div class="text-center">
                                <div class="rounded-circle border border-2 shadow-sm mx-auto mb-2" style="width:80px; height:80px; display:flex; align-items:center; justify-content:center;">
                                    <i class="bx bx-user fs-3 text-success"></i>
                                </div>
                                <strong class="d-block">사용자</strong>
                            </div>
                        </div>

                        <!-- 화살표 -->
                        <div class="text-center mb-3">
                            <i class="bx bx-down-arrow-alt fs-2 text-muted"></i>
                            <div class="small text-muted">업무수행</div>
                        </div>

                        <!-- 관리 시스템 영역 -->
                        <div class="border border-dashed rounded p-4">
                            <h6 class="text-center mb-4 fw-semibold">관리 시스템</h6>
                            <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-3">
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">회원관리</h6>
                                        <p class="mb-1 small">사용자 관리</p>
                                        <p class="mb-0 small">관리자 관리</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">메뉴관리</h6>
                                        <p class="mb-1 small">사용자 메뉴 관리</p>
                                        <p class="mb-0 small">관리자 메뉴 관리</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">콘텐츠</h6>
                                        <p class="mb-1 small">콘텐츠 관리</p>
                                        <p class="mb-0 small">게시글 관리</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">보안관리</h6>
                                        <p class="mb-1 small">권한 관리</p>
                                        <p class="mb-0 small">접근IP 관리</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">메인관리</h6>
                                        <p class="mb-1 small">배너 관리</p>
                                        <p class="mb-0 small">팝업 관리</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">게시판</h6>
                                        <p class="mb-1 small">게시판 관리</p>
                                        <p class="mb-0 small">게시글 관리</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">대시보드</h6>
                                        <p class="mb-1 small">접속자 통계</p>
                                        <p class="mb-0 small">게시글 통계</p>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="p-3 text-center rounded border">
                                        <h6 class="fw-semibold text-primary">시스템관리</h6>
                                        <p class="mb-1 small">로그인 로그 관리</p>
                                        <p class="mb-0 small">프로그램 관리</p>
                                    </div>
                                </div>
                            </div>

                            <!-- 접속 도구 -->
                            <div class="text-center mt-5">
                                <div class="small text-muted mb-2">접속 도구</div>
                                <div class="d-flex justify-content-center flex-wrap gap-3">
                                    <span class="badge bg-light border vasanta-text-dark">PC</span>
                                    <span class="badge bg-light border vasanta-text-dark">노트북</span>
                                    <span class="badge bg-light border vasanta-text-dark">태블릿</span>
                                    <span class="badge bg-light border vasanta-text-dark">스마트폰</span>
                                </div>
                            </div>

                            <!-- 화살표 및 DB -->
                            <div class="d-flex flex-column align-items-center mt-4">
                                <i class="bx bx-down-arrow-alt fs-2 text-muted mb-2"></i>
                                <div class="d-flex flex-column align-items-center">
                                    <div class="d-inline-flex align-items-center justify-content-center border rounded-circle p-4">
                                        <i class="bx bx-data fs-2 text-info"></i>
                                    </div>
                                    <div class="fw-semibold mt-2 text-center">메인<br>데이터베이스</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <%-- Section 3(S)--%>
                <section class="py-5">
                    <div class="container">
                        <div class="text-center mb-3">
                            <span class="vasanta-section-bar"></span>
                        </div>
                        <h4 class="text-center fw-semibold mb-2">솔루션 도입 사례</h4>
                        <p class="text-center text-muted mb-5 small">다양한 현장에서 선택받았습니다.</p>

                        <!-- 1줄차: 3개 -->
                        <div class="row justify-content-center g-4 mb-2">
                            <div class="col-md-4 col-sm-6">
                                <div class="vasanta-logo-box d-flex flex-column align-items-center text-center px-4 py-4 border rounded h-100">
                                    <i class="bx bx-home text-success fs-2 mb-2"></i>
                                    <div class="fw-semibold">담양 군청 홈페이지</div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="vasanta-logo-box d-flex flex-column align-items-center text-center px-4 py-4 border rounded h-100">
                                    <i class="bx bx-heart-circle text-info fs-2 mb-2"></i>
                                    <div class="fw-semibold">담양 스마트 경로당</div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="vasanta-logo-box d-flex flex-column align-items-center text-center px-4 py-4 border rounded h-100">
                                    <i class="bx bx-plug text-primary fs-2 mb-2"></i>
                                    <div class="fw-semibold">한전 KDN 원격 검침 플랫폼</div>
                                </div>
                            </div>
                        </div>

                        <!-- 2줄차: 2개 -->
                        <div class="row justify-content-center g-4">
                            <div class="col-md-4 col-sm-6">
                                <div class="vasanta-logo-box d-flex flex-column align-items-center text-center px-4 py-4 border rounded h-100">
                                    <i class="bx bx-shield-quarter text-danger fs-2 mb-2"></i>
                                    <div class="fw-semibold">한전 KDN 중대재해관리 솔루션</div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="vasanta-logo-box d-flex flex-column align-items-center text-center px-4 py-4 border rounded h-100">
                                    <i class="bx bx-bar-chart-alt-2 text-warning fs-2 mb-2"></i>
                                    <div class="fw-semibold">aT KADX 농식품 빅데이터 거래소</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            <%-- Section 3(E)--%>


                <%-- Section 4(S)--%>
                <section class="section-py pt-6 pb-6">
                    <div class="text-center mb-3">
                        <span class="vasanta-section-bar"></span>
                    </div>
                    <div class="container knowledge-base">
                        <h4 class="text-center fw-semibold mb-2">솔루션 정보</h4>
                        <p class="text-center text-muted mb-5 small">필요한 정보를 빠르게 확인하세요.</p>
                        <div class="row">
                            <div class="col-lg-10 mx-auto">
                                <div class="row g-4">

                                    <!-- 게시판 카드 반복 시작 -->
                                    <div class="col-xl-4 col-sm-6">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="avatar avatar-sm flex-shrink-0 me-3">
                    <span class="avatar-initial rounded bg-label-primary">
                      <i class="icon-base bx bx-chalkboard"></i>
                    </span>
                                                    </div>
                                                    <h6 id="boardHeader1" class="mb-0">공지사항</h6>
                                                </div>
                                                <ul id="boardBody1" class="list-unstyled mb-4"></ul>
                                                <a href="/mber/bscbrd/bscbrd01/bbs/1/list" class="d-flex align-items-center small fw-medium">
                                                    <span class="me-2">게시판 바로가기</span>
                                                    <i class="icon-base bx bx-right-arrow-alt scaleX-n1-rtl icon-sm"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-sm-6">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="avatar avatar-sm flex-shrink-0 me-3">
                    <span class="avatar-initial rounded bg-label-primary">
                      <i class="icon-base bx bx-brush"></i>
                    </span>
                                                    </div>
                                                    <h6 class="mb-0">자유게시판</h6>
                                                </div>
                                                <ul id="boardBody2" class="list-unstyled mb-4"></ul>
                                                <a href="/mber/bscbrd/bscbrd02/bbs/2/list" class="d-flex align-items-center small fw-medium">
                                                    <span class="me-2">게시판 바로가기</span>
                                                    <i class="icon-base bx bx-right-arrow-alt scaleX-n1-rtl icon-sm"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-sm-6">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="avatar avatar-sm flex-shrink-0 me-3">
                    <span class="avatar-initial rounded bg-label-primary">
                      <i class="icon-base bx bx-bxs-paint"></i>
                    </span>
                                                    </div>
                                                    <h6 class="mb-0">갤러리게시판</h6>
                                                </div>
                                                <ul id="boardBody3" class="list-unstyled mb-4"></ul>
                                                <a href="/mber/glrbrd/glrbrd01/bbs/3/list" class="d-flex align-items-center small fw-medium">
                                                    <span class="me-2">게시판 바로가기</span>
                                                    <i class="icon-base bx bx-right-arrow-alt scaleX-n1-rtl icon-sm"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-sm-6">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="avatar avatar-sm flex-shrink-0 me-3">
                    <span class="avatar-initial rounded bg-label-primary">
                      <i class="icon-base bx bx-help-circle"></i>
                    </span>
                                                    </div>
                                                    <h6 class="mb-0">회원 문의 게시판</h6>
                                                </div>
                                                <ul id="boardBody4" class="list-unstyled mb-4"></ul>
                                                <a href="/mber/qnabrd/qnabrd01/bbs/4/list" class="d-flex align-items-center small fw-medium">
                                                    <span class="me-2">게시판 바로가기</span>
                                                    <i class="icon-base bx bx-right-arrow-alt scaleX-n1-rtl icon-sm"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-sm-6">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="avatar avatar-sm flex-shrink-0 me-3">
                    <span class="avatar-initial rounded bg-label-primary">
                      <i class="icon-base bx bx-lock-open"></i>
                    </span>
                                                    </div>
                                                    <h6 class="mb-0">비회원 문의 게시판</h6>
                                                </div>
                                                <ul id="boardBody5" class="list-unstyled mb-4"></ul>
                                                <a href="/mber/qnabrd/faq01/bbs/5/list" class="d-flex align-items-center small fw-medium">
                                                    <span class="me-2">게시판 바로가기</span>
                                                    <i class="icon-base bx bx-right-arrow-alt scaleX-n1-rtl icon-sm"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4 col-sm-6">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="avatar avatar-sm flex-shrink-0 me-3">
                    <span class="avatar-initial rounded bg-label-primary">
                      <i class="icon-base bx bx-bxs-share"></i>
                    </span>
                                                    </div>
                                                    <h6 class="mb-0">공유 게시판</h6>
                                                </div>
                                                <ul id="boardBody6" class="list-unstyled mb-4"></ul>
                                                <a href="/mber/contpg/bbstyest/bbs/10/list" class="d-flex align-items-center small fw-medium">
                                                    <span class="me-2">게시판 바로가기</span>
                                                    <i class="icon-base bx bx-right-arrow-alt scaleX-n1-rtl icon-sm"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <%-- Section 4(E)--%>

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>

        <!--/ Layout container -->

    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!-- 팝업 모달 -->
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/modal-popup.jsp" %>

<!--/ Layout wrapper -->
<script src="/static/pages/mber/js/index/index.js"></script>
</body>

</html>
