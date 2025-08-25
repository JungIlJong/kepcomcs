<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <c:if test="${not empty naverClientId}">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpKeyId=${naverClientId}&submodules=geocoder"></script>
    </c:if>
    <title>지도</title>
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

                <!-- Content -->
                <div class="container-xxl">
                    <div class="container-p-y">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <!-- Marker List Panel -->
                                    <div class="col-md-3 mb-3 mb-md-0">
                                        <div class="card h-100">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">목록</h5>
                                            </div>
                                            <div class="card-body p-0">
                                                <div class="list-group list-group-flush marker-list" style="max-height: 550px; overflow-y: auto;">
                                                    <!-- Markers will be populated here -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Map Container -->
                                    <div class="col-md-9">
                                        <div id="map" style="width: 100%; height: 600px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Content -->

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>

            </div>
            <!-- / Content wrapper -->
        </div>
        <!-- /Layout container -->
    </div>
</div>
<script src="/static/pages/mber/js/map/map.js"></script>
</body>

</html>
