<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered"  dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>대시보드</title>
    <link rel="stylesheet" href="/static/pages/mber/css/common-custom.css" />
    <style>
        @media (max-width: 768px) {
            #weeklyVisitorsChart {
                max-width: 100px !important;
                height: auto !important;
                overflow: hidden !important;
            }
            
            .table-wrap {
                width: 100%;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            
            .visitor-stats {
                width: 100% !important;
                flex-wrap: wrap !important;
            }
            
            .visitor-stats > div {
                padding-right: 5px !important;
            }
            
            .stats-container {
                padding: 10px !important;
            }
            
            /* 차트 내부 요소 강제 축소 */
            #weeklyVisitorsChart svg,
            #weeklyVisitorsChart .apexcharts-canvas {
                max-width: 100px !important;
                overflow: hidden !important;
            }
        }
    </style>
</head>
<body>
<!-- Layout wrapper -->
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
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <%--TODO--%>
                        <div class="row">
                            <div class="col-md-12 col-xxl-4 mb-6">
                                <div class="card h-100">
                                        <div class="card-body pb-0">
                                            <h5 class="mb-0">디스크 사용량</h5>
                                        </div>
                                        <div id="diskChart" class="mb-2"></div>
                                        <div class="p-4 pt-2">
                                            <small id="diskSubTitle" class="d-block text-center">대충 얼마만큼 남았다는 문구</small>
                                        </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xxl-4 mb-6">
                                <div class="card h-100">
                                    <div class="card-body p-0">
                                        <div class="col-12">
                                            <div class="stats-container p-6">
                                                <div class="card-title d-flex align-items-start justify-content-between">
                                                    <h5 class="mb-0">주간 방문자</h5>
                                                </div>
                                                <div class="visitor-stats d-flex justify-content-between">
                                                    <div id="compareWeeklyVisitorPercent" class="mt-auto">
                                                        <h3 id="weeklyVisitorPercent" class="mb-1"></h3>
                                                    </div>
                                                    <div id="weeklyVisitorsChart"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xxl-4 mb-6">
                                <div class="card h-100">
                                    <div class="card-header d-flex align-items-center justify-content-between">
                                        <div class="card-title mb-0">
                                            <h5 class="mb-1">회원 수</h5>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div id="userCountChart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xxl-12 mb-6">
                                <div class="card h-100">
                                    <div class="row row-bordered g-0">
                                        <div class="col-md-8">
                                            <div class="card-header d-flex justify-content-between">
                                                <div>
                                                    <h5 class="card-title mb-1">게시판 현황</h5>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div id="boardStaticsChart"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card-header d-flex align-items-center justify-content-between">
                                                <div class="card-title mb-0">
                                                    <h5 id="userRankingTitle" class="m-0 me-2">회원 랭킹</h5>
                                                </div>
                                            </div>
                                            <div class="px-5 py-4 border border-start-0 border-end-0">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <p class="mb-0 text-uppercase">회원명</p>
                                                    <p class="mb-0 text-uppercase">게시글 수</p>
                                                </div>
                                            </div>
                                            <div id="userRankingList" class="card-body" style="display: none;"></div>
                                            <div id="emptyUserRanking"
                                                 class="alert alert-outline-secondary"
                                                 role="alert"
                                                 style="display: none; border-color: white; margin: 0; font-weight: bold">게시글을 작성한 회원이 없습니다 ...
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xxl-12 mb-6">
                                <div class="card">
                                    <h5 class="card-header">결제 요청 문서</h5>
                                    <div class="table-wrap">
                                        <table class="table table-fixed">
                                            <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>기안자</th>
                                                <th>기안일시</th>
                                                <th>결재문서</th>
                                            </tr>
                                            </thead>
                                            <tbody id="approvalDocumentsInputTableBody" class="table-border-bottom-0">
                                            </tbody>
                                        </table>
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

</body>
<script src="/static/vendor/apex-charts/apexcharts.js"></script>
<script src="/static/pages/sys/js/dashboard/dashboard.js"></script>
<script>
// 차트 최적화
document.addEventListener('DOMContentLoaded', function() {
    // 모바일 환경에서 차트 크기 조정
    if (window.innerWidth <= 768) {
        const weeklyChart = document.querySelector('#weeklyVisitorsChart');
        if (weeklyChart) {
            weeklyChart.style.maxWidth = '100px';
            weeklyChart.style.overflow = 'hidden';
            
            // 차트 내부 캔버스 요소도 스타일 적용
            setTimeout(function() {
                const chartCanvas = weeklyChart.querySelector('.apexcharts-canvas');
                if (chartCanvas) {
                    chartCanvas.style.maxWidth = '100px';
                    chartCanvas.style.overflow = 'hidden';
                }
            }, 1000);
        }
    }
});
</script>
</html>
