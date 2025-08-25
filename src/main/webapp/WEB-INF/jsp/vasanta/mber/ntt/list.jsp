<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <script src="/static/js/common/getToken.js"></script>
    <title><c:out value="${menuTitle}"/></title>
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

                <%-- 페이지 타이틀 영역(S) --%>
                <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sub-title.jsp" %>
                <%-- 페이지 타이틀 영역(E) --%>

                <!-- Content -->
                <div class="container-xxl container-p-y">
                    <div class="row">
                        <%--서브페이지 사이드 메뉴 영역(S)--%>
                        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sub-menu.jsp" %>
                        <%--서브페이지 사이드 메뉴 영역(E)--%>

                            <div class="col-lg-10 col-md-9 col-12">
                                <div class="card">
                                    <div class="card-header border-bottom">
                                        <h4 class="card-title">게시글 목록</h4>
                                        <div class="d-flex justify-content-end mb-3">
                                            <form id="frmSearch" class="mb-0" onsubmit="return false;">
                                                <input id="bbsId" type="hidden" value="<c:out value="${bbs.bbsId}" />">
                                                <input id="bbsType" type="hidden"
                                                       value="<c:out value="${bbs.bbsTyCode}" />">
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary dropdown-toggle"
                                                            type="button"
                                                            data-bs-toggle="dropdown" aria-expanded="false"
                                                            id="searchCondition" name="searchCondition" data-type="all">
                                                        전체
                                                    </button>
                                                    <ul class="dropdown-menu" aria-labelledby="searchCondition">
                                                        <li><a class="dropdown-item" href="javascript:void(0);"
                                                               data-type="all">전체</a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0);"
                                                               data-type="title"><spring:message code="title"/></a></li>
                                                        <li><a class="dropdown-item" href="javascript:void(0);"
                                                               data-type="writer"><spring:message code="writer"/></a>
                                                        </li>
                                                    </ul>
                                                    <input id="searchKeyword" name="searchKeyword" type="text"
                                                           class="form-control"
                                                           placeholder="<spring:message code='table.searchKeyWord.placeholder'/>">
                                                    <button id="btnSearch" type="button"
                                                            class="btn btn-outline-primary">
                                                        검색
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="container-p-y">
                                            <div id="lineTable" class="table-responsive d-none">
                                                <div class="d-flex my-3 justify-content-start">
                                                    <div class="col-md-auto me-auto mt-0">
                                                        <p class="text-light">
                                                            <spring:message code="table.total.start"/> <span
                                                                id="totCnt">000</span> <spring:message
                                                                code="table.total.end"/>
                                                        </p>
                                                    </div>
                                                </div>
                                                <table class="table mb-0">
                                                    <thead>
                                                    <tr>
                                                        <th class="postNum">순번</th>
                                                        <th class="title text-center w-50">제목</th>
                                                        <th class="writer text-center">작성자</th>
                                                        <th class="regDate text-center">등록날짜</th>
                                                        <th class="viewCnt text-center">조회수</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="table-body">
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="albumTable" class="row row-cols-1 row-cols-md-4 g-6 mb-12 d-none">
                                            </div>
                                            <c:if test="${bbs.authorList.contains('SAVE')}">
                                            <div class="d-flex justify-content-end mt-4">
                                                <button id="saveBtn" class="btn btn-primary add-new mb-0" tabindex="0"
                                                            type="button" onclick="location.href='save'">
                                                    <span>
                                                        <i class="icon-base bx bx-plus me-0 me-sm-1 icon-xs"></i>
                                                        <span class="d-none d-sm-inline-block">작성</span>
                                                    </span>
                                                </button>
                                            </div>
                                            </c:if>
                                            <div class="d-flex justify-content-center mt-10">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination pagination-rounded" id="pagination">
                                                    </ul>
                                                </nav>
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
            <!--/ Content wrapper -->
        </div>

        <!--/ Layout container -->

    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->

<!-- script -->
<script src="/static/pages/mber/js/ntt/list.js"></script>
</body>

</html>
