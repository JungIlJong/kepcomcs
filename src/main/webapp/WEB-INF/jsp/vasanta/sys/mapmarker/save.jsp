<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/></title>
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
                    <div class="card mb-4">
                        <div class="card-body">
                            <form id="mapmarkerForm">
                                <div class="table-responsive text-nowrap">
                                        <table class="table table-bordered">
                                            <colgroup>
                                                <col width="10%">
                                                <col width="40%">
                                                <col width="10%">
                                                <col width="40%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>이름<span class="text-danger ms-1">*</span></th>
                                                <td class="form-control-validation">
                                                    <div class="has-validation">
                                                        <input class="form-control" type="text" name="name" id="name" maxlength="20" placeholder="마커의 이름을 입력해주세요.">
                                                    </div><div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                </td>
                                                <th>사용여부</th>
                                                <td class="form-control-validation">
                                                    <div class="form-check form-switch mb-2">
                                                        <input class="form-check-input" type="checkbox" id="useYn" checked>
                                                        <label class="form-check-label" for="useYn">사용여부</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>카테고리<span class="text-danger ms-1">*</span></th>
                                                <td class="form-password-toggle form-control-validation">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-2">
                                                            <div class="has-validation">
                                                                <label for="categoryCode1" class="form-label">대분류</label>
                                                                <select id="categoryCode1" name="categoryCode1" class="select2 form-select form-select-lg" data-allow-clear="false">
                                                                    <option value="">선택하세요</option>
                                                                    <option value="A1">경찰서</option>
                                                                    <option value="A2">병원</option>
                                                                    <option value="A3">시청</option>
                                                                    <option value="A4">기타</option>
                                                                </select>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="categoryCode2" class="form-label">소분류</label>
                                                            <select id="categoryCode2" name="categoryCode2" class="select2 form-select form-select-lg" data-allow-clear="false" disabled>
                                                                <option value="">선택하세요</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <!-- 주소 및 지도 영역 -->
                                    <div class="row mt-4">
                                        <!-- 주소 검색 카드 -->
                                        <div class="col-md-6">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="mb-3 form-control-validation">
                                                        <div class="has-validation">
                                                        <label for="searchAddress" class="form-label">주소 검색</label>
                                                        <div class="input-group input-group-merge">
                                                            <input class="form-control cursor-pointer searchAddress" type="text" id="searchAddress" placeholder="주소 검색" readonly>
                                                            <button type="button" id="btnSearchAddress" class="btn btn-primary searchAddress">검색</button>
                                                        </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="mb-3 form-control-validation">
                                                        <div class="has-validation">
                                                            <label for="roadAddress" class="form-label">도로명 주소</label>
                                                            <input class="form-control" type="text" name="roadAddress" id="roadAddress" maxlength="255" placeholder="주소를 검색해주세요." readonly disabled>
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                    
                                                    <div class="mb-3 form-control-validation">
                                                        <div class="has-validation">
                                                            <label for="jibunAddress" class="form-label">지번 주소</label>
                                                            <input class="form-control" type="text" name="jibunAddress" id="jibunAddress" maxlength="255" placeholder="주소를 검색해주세요."  readonly disabled>
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>
                                                    
                                                    <div class="mb-3 form-control-validation">
                                                        <div class="has-validation">
                                                            <label for="detailAddress" class="form-label">상세 주소</label>
                                                            <input class="form-control" type="text" name="detailAddress" id="detailAddress" maxlength="255" placeholder="상세주소">
                                                        </div>
                                                        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                    </div>

                                                    <input type="hidden" name="latitude" id="latitude">
                                                    <input type="hidden" name="longitude" id="longitude">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- 지도 카드 -->
                                        <div class="col-md-6">
                                            <div class="card mb-4">
                                                <div class="card-body p-0">
                                                    <div id="map" style="width:100%; height:500px; border-radius:0.5rem;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="d-flex justify-content-between mt-5">
                                    <button type="button" class="btn btn-secondary me-2" id="btnList">목록</button>
                                    <div>
                                        <button type="button" class="btn btn-primary" id="btnSave">등록</button>
                                    </div>
                                </div>
                            </form>
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
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>
<script src="/static/pages/sys/js/mapmarker/save.js"></script>
<!--/ Layout wrapper -->
</body>

</html>
