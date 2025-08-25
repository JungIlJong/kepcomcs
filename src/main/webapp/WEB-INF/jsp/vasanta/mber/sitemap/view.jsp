<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>사이트맵</title>
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
                            <div class="card-header border-bottom">
                                <h4 class="card-title">사이트맵</h4>
                            </div>
                            <div class="card-body">
                                <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
                                    <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
                                    <div class="container-p-x">
                                        <div class="divider text-start">
                                            <div class="divider-text text-body">
                                                <c:out value="${depth1.menuNm}"/>
                                            </div>
                                        </div>
                                        <div class="row row-cols-2 row-cols-md-4 g-0">
                                            <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                                                <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}"/>
                                                <div class="col px-2 mb-4">
                                                    <a href="<c:url value="${depth2Url}"/>">
                                                        <div class="card bg-label-primary shadow-none">
                                                            <div class="card-body p-3 mb-0 ps-4 text-primary">
                                                                <h6 class="card-title text-primary mb-0">
                                                                    <c:out value="${depth2.menuNm}"/>
                                                                </h6>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <div class="container-p-x pt-2 pe-0">
                                                        <c:if test="${depth2 != null && fn:length(depth2.childList) > 0}">
                                                            <ul class="list-group">
                                                                <c:forEach var="depth3" items="${depth2.childList}" varStatus="depth3Status">
                                                                    <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}"/>
                                                                    <a href="<c:url value="${depth3Url}"/>">
                                                                        <div class="card bg-label-secondary shadow-none">
                                                                            <div class="card-body p-3 mb-0 ps-4 text-secondary">
                                                                            <h6 class="card-title text-secondary mb-0">
                                                                                    <c:out value="${depth3.menuNm}"/>
                                                                                </h6>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </c:forEach>
                                                            </ul>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:forEach>
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

</body>

</html>
