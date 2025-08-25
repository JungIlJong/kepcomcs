<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title><c:out value="${menuTitle}"/></title>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/@form-validation/form-validation.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/fonts/iconify-icons.css"/>
    <link rel="stylesheet" href="/static/vendor/sneat/css/core.css"/>
    <script>
        let success = function (data) {
            alert('<spring:message code="success.common.save"/>');
            goPage('list');
        }

        let fail = function (xhr, status, error) {
            alert('<spring:message code="fail.common.msg"/>');
        }
    </script>
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

                        <%-- add post --%>
                        <div class="col-lg-10 col-md-9 col-12">
                            <div class="card">
                                <div class="card-header border-bottom">
                                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                                        <div class="d-flex flex-column justify-content-center">
                                            <h4 class="card-title mb-1">글 쓰기</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="container-p-y">
                                        <form id="frm" onsubmit="return false;" autocomplete="off">
                                            <input id="fileAtchSize" name="fileAtchSize" type="hidden"
                                                   value="<c:out value='${bbs.fileAtchSize}'/>"/>
                                            <input id="fileAtchCo" name="fileAtchCo" type="hidden"
                                                   value="<c:out value='${bbs.fileAtchCo}'/>"/>
                                            <input id="permExtsn" name="permExtsn" type="hidden"
                                                   value="<c:out value='${bbs.permExtsn}'/>"/>
                                            <input id="bbsId" name="bbsId" type="hidden"
                                                   value="<c:out value='${bbs.bbsId}' />">
                                            <c:if test="${bbs.secretUseAt == 'Y'}">
                                                <div class="mb-6 p-0">
                                                    <div class="col-md mb-md-0 mb-5">
                                                        <div class="form-check custom-option custom-option-basic">
                                                            <label class="form-check-label custom-option-content"
                                                                   for="secretAtN">
                                                                <input
                                                                        name="secretAt"
                                                                        class="form-check-input"
                                                                        type="radio"
                                                                        value="N"
                                                                        id="secretAtN"
                                                                        checked/>
                                                                <span class="custom-option-header">
                                                                    <span class="h6 mb-0">일반글</span>
                                                                </span>
                                                                <span class="custom-option-body">
                                                                    <small>모든 사용자가 조회할 수 있습니다.</small>
                                                                </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md">
                                                        <div class="form-check custom-option custom-option-basic">
                                                            <label class="form-check-label custom-option-content"
                                                                   for="secretAtY">
                                                                <input
                                                                        name="secretAt"
                                                                        class="form-check-input"
                                                                        type="radio"
                                                                        value="Y"
                                                                        id="secretAtY"/>
                                                                <span class="custom-option-header">
                                                                <span class="h6 mb-0">비밀글</span>
                                                              </span>
                                                                <span class="custom-option-body">
                                                                <small>본인과 관리자만이 조회할 수 있습니다.</small>
                                                              </span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="p-0">
                                                <!-- title -->
                                                <div class="mb-6">
                                                    <label class="form-label" for="nttSj">
                                                        <spring:message code="title"/>
                                                        <span class="text-danger ms-1">*</span>
                                                    </label>
                                                    <input
                                                            type="text"
                                                            class="form-control"
                                                            id="nttSj"
                                                            name="nttSj"
                                                            placeholder=""
                                                            aria-label="Title"/>
                                                </div>

                                                <!-- id, pw -->
                                                <sec:authorize access="!isAuthenticated()">
                                                    <div class="row g-6 mb-6">
                                                        <div class="col-md-6">
                                                            <label class="form-label" for="wrterNm"><spring:message
                                                                    code="writer"/></label>
                                                            <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="wrterNm"
                                                                    name="wrterNm"
                                                                    placeholder=""
                                                                    aria-label="Author"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label" for="password"><spring:message
                                                                    code="password"/></label>
                                                            <input
                                                                    type="password"
                                                                    class="form-control"
                                                                    id="password"
                                                                    name="password"/>
                                                        </div>
                                                    </div>
                                                </sec:authorize>
                                            </div>

                                            <div class="mb-6 p-0">
                                                <%@ include file="/WEB-INF/jsp/vasanta/cmmn/quill-editor.jsp" %>
                                            </div>
                                            <!-- / Description -->

                                            <c:if test="${bbs.fileAtchCo > 0}">
                                                <div class="mb-3">
                                                    <div class="input-file inLine">
                                                        <input type="file" id="files" name="files" class="form-control"
                                                               placeholder="파일을 선택하세요" title="파일을 선택하세요" multiple/>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </form>
                                        <div class="d-flex justify-content-end  flex-wrap gap-4">
                                            <div class="d-flex gap-4">
                                                <button class="btn btn-label-secondary" onclick="goBack()">목록</button>
                                                <%-- 임시 저장 버튼 기능 예정 있는지? --%>
                                                <%--                                                <button class="btn btn-label-primary">Save Draft</button>--%>
                                            </div>
                                            <button type="submit" class="btn btn-primary" id="btnSave"><spring:message
                                                    code="button.create"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- / add post--%>
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
        <!-- Layout container -->
    </div>
</div>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- script -->
<script type="text/javascript" src="/static/js/common/getToken.js"></script>
<script type="text/javascript" src="/static/js/common/validation.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/cleave-zen/cleave-zen.js"></script>

<script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/popular.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/bootstrap5.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/@form-validation/auto-focus.js"></script>

<script type="text/javascript">
    $(function () {
        let btnSave = document.getElementById('btnSave');
        btnSave.addEventListener('click', function () {
            const $bbsId = $('#bbsId');
            if (isEmpty($bbsId.val())) {
                alert('잘못된 게시판 입니다.');
                return false;
            }

            const $wrterNm = $('#wrterNm');
            if ($wrterNm.length > 0 && isEmpty($wrterNm.val())) {
                alert('작성자를 입력해주세요.');
                $wrterNm.focus();
                return false;
            }
            if ($wrterNm.length > 0 && $wrterNm.val().length > 10) {
                alert('작성자는 최대 10자까지 허용합니다.');
                $wrterNm.focus();
                return false;
            }

            const $password = $('#password');
            if ($password.length > 0 && isEmpty($password.val())) {
                alert('비밀번호를 입력해주세요.');
                $password.focus();
                return false;
            }
            if ($password.length > 0 && $password.val().length < 10) {
                alert('비밀번호는 최소 10자리를 입력해주세요.');
                $password.focus();
                return false;
            }

            const $nttSj = $('#nttSj');
            if (isEmpty($nttSj.val())) {
                alert('제목은 필수 입력값입니다.');
                $nttSj.focus();
                return false;
            }
            if (!isStringLengthInRange($nttSj.val(), 1, 2000)) {
                alert('제목은 최대 2000자까지 허용합니다.');
                $nttSj.focus();
                return false;
            }

            if (!isValidQuillContent()){
                return false;
            }

            const $files = $('#files');
            const $fileAtchCo = $('#fileAtchCo');
            const $fileAtchSize = $('#fileAtchSize');
            const $permExtsn = $('#permExtsn');
            const permExtsns = $permExtsn.val().split(',');

            if ($files.length > 0) {
                if ($files[0].files.length > $fileAtchCo.val()) {
                    alert('파일은 최대 ' + $fileAtchCo.val() + "개를 허용합니다.");
                    return false;
                }
                let sumSize = 0;
                for (const f of $files[0].files) {
                    sumSize += f.size;
                    if (!isValidFileExtension(f, permExtsns)) {
                        alert('해당 확장자는 허용하지 않습니다. 허용된 첨부파일 확장자는 다음과 같습니다.\n' + permExtsns)
                        return false;
                    }
                }

                if (sumSize > ($fileAtchSize.val() * 1024 * 1024)) {
                    alert('첨부파일은 최대 ' + $fileAtchSize.val() + 'MB까지 허용합니다.');
                    return false;
                }

                if (!confirm('<spring:message code="confirm.common.save" />')) {
                    return;
                }
            }
            const data = new FormData($('#frm')[0]);
            data.set("nttCn", quill.getSemanticHTML());
            Ajax.upload('/api/mber/bbs/save', success, fail, {data: data})
        });
    });
</script>
</body>
</html>
