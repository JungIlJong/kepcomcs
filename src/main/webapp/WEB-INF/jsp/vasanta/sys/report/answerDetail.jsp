<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>답변(댓글) 신고 상세</title>
    <script src="/static/pages/sys/js/report/answerDetail.js"></script>
</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-menu.jsp" %>
        <div class="layout-page">
            <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-nav.jsp" %>
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="order-0 order-md-1">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="mb-0">답변(댓글) 신고 상세</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <div class="table-responsive text-nowrap">
                                        <table class="table table-bordered">
                                            <colgroup>
                                                <col style="width:20%;">
                                                <col style="width:80%;">
                                            </colgroup>
                                            <tbody>
                                            <tr><th>신고 ID</th><td id="reportId"></td></tr>
                                            <%-- <tr><th>신고 사유</th><td id="reasonCode"></td></tr> --%>
                                            <%-- <tr><th>상세 사유</th><td id="detailMessage"></td></tr> --%>
                                            <tr><th>신고자</th><td id="reporterName"></td></tr>
                                            <tr><th>신고일시</th><td id="createdAt"></td></tr>
                                            <tr><th>답변 내용</th><td id="answerContent"></td></tr>
                                            <tr><th>게시글 제목</th><td id="postTitle"></td></tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary me-2" id="btnList" onclick="goBack()">
                                            목록</button>
                                        <div>
                                            <button type="button" class="btn btn-danger me-2" id="btnDelete">
                                                삭제</button>
                                            <button type="button" class="btn btn-primary" id="btnInit">초기화</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
