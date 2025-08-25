<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>회원가입</title>
</head>
<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-navbar-full layout-horizontal layout-without-menu">
    <div class="layout-container">
        <!-- SNB 네비게이션 start -->
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-nav.jsp" %>
        <!-- SNB 네비게이션 end -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Menu -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
                <!-- / Menu -->

                <!-- Content -->
                <div class="container-xxl">
                    <%--TODO Contents here--%>
                    <div class="authentication-wrapper container-p-y">
                        <div class="container-xxl">
                            <div class="authentication-inner row justify-content-center">
                                <div class="col-sm-8 col-md-6 col-lg-5 col-xl-5">
                                    <!-- Successfully joined -->
                                    <div class="card px-sm-6 px-4">
                                        <div class="card-body">

                                            <div class="text-center m-5">
                                                <h4>회원가입이<br />
                                                    완료되었습니다.</h4>
                                            </div>

                                            <!-- 로그인 버튼 -->
                                            <div class="mb-3">
                                                <button type="button" class="btn btn-primary w-100 p-3" onclick="location.href = '/'">
                                                    <i class="icon-base bx bx-chevron-left scaleX-n1-rtl me-1"></i>메인으로
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ Content -->

                <!-- Footer -->
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>


            </div>
            <!-- / Content wrapper -->
        </div>
        <!-- / layout container -->
    </div>
</div>

</body>
</html>
