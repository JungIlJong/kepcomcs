<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<div id="step1">
    <div class="card-header border-bottom">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
            <div class="d-flex flex-column justify-content-center">
                <h4 class="card-title mb-1" id="nttSj"></h4>
                <p class="mb-0"><c:out value="${bbs.bbsNm}"/></p>
            </div>
            <div class="d-flex align-content-center flex-wrap gap-4">
                <c:set var="frstRgstId">${access.frstRegisterId}</c:set>
                <input type="hidden" id="frstRgstId" value="<c:out value="${frstRgstId}"/>">
                <div class="d-flex gap-4">
                    <div class="d-inline-block">
                        <a href="javascript:;" class="btn btn-icon dropdown-toggle hide-arrow"
                           data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded icon-base"></i></a>
                        <div class="dropdown-menu dropdown-menu-end m-0">
                            <c:if test="${access.frstRegisterId == null}">
                                <a href="javascript:;" class="dropdown-item"
                                   id="deleteGBtn1"><spring:message
                                        code="button.delete"/></a>
                                <a href="javascript:;" class="dropdown-item"
                                   id="updateGBtn1"><spring:message
                                        code="button.modify"/></a>
                            </c:if>
                            <c:if test="${access.author == true}">
                                <a href="javascript:;" class="dropdown-item"
                                   id="deleteUBtn1"><spring:message
                                        code="button.delete"/></a>
                                <a href="javascript:;" class="dropdown-item"
                                   id="updateUBtn1"><spring:message
                                        code="button.modify"/></a>
                            </c:if>
                            <c:choose>
                                <c:when test="${mbrId != 'null' && mbrId != frstRgstId}">
                                    <a href="javascript:;" class="dropdown-item" id="reportNttBtn1">게시글
                                        신고</a>
                                    <a href="javascript:;" class="dropdown-item" id="blockNttBtn1">게시글
                                        차단</a>
                                    <a href="javascript:;" class="dropdown-item" id="reportMbrBtn1">사용자
                                        신고</a>
                                    <a href="javascript:;" class="dropdown-item" id="blockMbrBtn1">사용자
                                        차단</a>
                                </c:when>
                                <c:when test="${mbrId == 'null'}">
                                    <a href="javascript:;" class="dropdown-item" onclick="sendLoginPg()">게시글
                                        신고</a>
                                    <a href="javascript:;" class="dropdown-item" id="blockNttBtn1" onclick="sendLoginPg()">게시글
                                        차단</a>
                                    <a href="javascript:;" class="dropdown-item" onclick="sendLoginPg()">사용자
                                        신고</a>
                                    <a href="javascript:;" class="dropdown-item" onclick="sendLoginPg()">사용자
                                        차단</a>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>

                                    <%--                                <div class="dropdown-menu dropdown-menu-end m-0">--%>
                                    <%--                                    <a href="javascript:;" class="dropdown-item">Details</a>--%>
                                    <%--                                    <a href="javascript:;" class="dropdown-item">Archive</a>--%>
                                    <%--                                    <div class="dropdown-divider"></div>--%>
                                    <%--                                    <a href="javascript:;" class="dropdown-item text-danger delete-record">Delete</a>--%>
                                    <%--                                </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex flex-column flex-md-row align-content-start mb-0">
            <div class="d-flex gap-2">
                <small class="p-0 m-0 text-body-secondary text">작성자</small>
                <small class="p-0 m-0 text-body-secondary" id="writer"></small>
                <span class="d-none d-md-inline-block p-0 m-0 px-3 text-body-secondary">
                <strong> · </strong>
            </span>
            </div>
            <div class="d-flex gap-2">
                <small class="p-0 m-0 text-body-secondary">날짜</small>
                <small class="p-0 m-0 text-body-secondary" id="regDt"></small>
                <span class="d-none d-md-inline-block p-0 m-0 px-3 text-body-secondary">
                <strong> · </strong>
            </span>
            </div>
            <div class="d-flex gap-2">
                <small class="p-0 m-0 text-body-secondary">조회수</small><small class="p-0 m-0 text-body-secondary"
                                                                             id="rdcnt"></small>
            </div>
        </div>
    </div>
    <div class="card-body pt-4">
        <input id="nttId" name="nttId" type="hidden" value=""/>
        <input id="bbsId" name="bbsId" type="hidden" value=""/>
        <div class="d-flex flex-column align-content-between">
            <div class="container-p-y">
                <div class="p-0" id="nttCn">
                </div>
                <div id="fileItem">
                </div>
            </div>

            <div class="d-flex justify-content-end align-items-center flex-wrap">
                <button type="button" onclick="location.href='list'" class="btn btn-primary shadow-none"><spring:message
                        code="button.list"/></button>
            </div>
        </div>
    </div>
</div>
<div id="step2" class="secretItem justify-content-center d-none">
    <input id="action" type="hidden">
    <div class="card-body mt-6">
        <div class="d-flex flex-column mb-4 align-items-center">
            <h4 class="card-title mb-1">비밀글 기능으로 보호된 글입니다.</h4>
            <p class="mb-6 text-center">작성자와 관리자만 변경하실 수 있습니다.<br/>
                본인이라면 비밀번호를 입력하세요.</p>

            <form id="authFrm" onsubmit="return false;" class="px-sm-6 px-4">
                <div class="mb-3 form-password-toggle">
                    <label for="password" class="form-label">비밀번호</label>
                    <div class="input-group input-group-merge">
                        <input type="password" id="password" name="password"
                               class="form-control" placeholder="비밀번호를 입력해주세요."
                               autocomplete="off"/>
                        <span id="passwordTypeChange" class="input-group-text cursor-pointer"><i
                                class="bx bx-hide"></i></span>
                    </div>
                </div>

                <div class="mb-3">
                    <button type="button" id="submitBtn"
                            class="btn btn-primary d-grid w-100 mb-3">
                        확인
                    </button>
                    <button type="button" onclick="goBack()"
                            class="btn btn-secondary d-grid w-100">
                        목록
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="step3" class="d-none">
    <div class="card">
        <div class="card-header border-bottom">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-6 row-gap-4">
                <div class="d-flex flex-column justify-content-center">
                    <h4 class="card-title mb-1">글 수정</h4>
                </div>
                <div class="d-flex align-content-center flex-wrap gap-4">
                    <div class="d-flex gap-4">
                        <button class="btn btn-label-secondary" onclick="goPage('list')">목록</button>
                    </div>
                    <button type="submit" class="btn btn-primary" id="btnSave"><spring:message
                            code="button.modify"/></button>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="container-p-y">
                <form id="frm" onsubmit="return false;" autocomplete="off">
                    <input id="fileAtchSize" name="fileAtchSize" type="hidden"
                           value="<c:out value='${bbs.fileAtchSize}'/>"/>
                    <input id="fileAtchCo" name="fileAtchCo" type="hidden" value="<c:out value='${bbs.fileAtchCo}'/>"/>
                    <input id="permExtsn" name="permExtsn" type="hidden" value="<c:out value='${bbs.permExtsn}'/>"/>
                    <input id="bbsId" name="bbsId" type="hidden" value="<c:out value='${bbs.bbsId}' />">
                    <c:if test="${bbs.secretUseAt == 'Y'}">
                        <div class="row mb-6 p-0">
                            <div class="col-md mb-md-0 mb-5">
                                <div class="form-check custom-option custom-option-basic">
                                    <label class="form-check-label custom-option-content" for="secretAtN">
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
                                    <label class="form-check-label custom-option-content" for="secretAtY">
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
                            <label class="form-label" for="nttSj"><spring:message code="title"/></label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="nttSj2"
                                    name="nttSj"
                                    placeholder=""
                                    aria-label="Title"/>
                        </div>

                        <!-- id, pw -->
                        <sec:authorize access="!isAuthenticated()">
                            <div class="row g-6 mb-6">
                                <div class="col-md-6">
                                    <label class="form-label" for="wrterNm"><spring:message code="writer"/></label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="wrterNm"
                                            name="wrterNm"
                                            placeholder=""
                                            aria-label="Author"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="password"><spring:message code="password"/></label>
                                    <input
                                            type="password"
                                            class="form-control"
                                            id="password2"
                                            name="password"/>
                                </div>
                            </div>
                        </sec:authorize>
                    </div>

                    <div class="row mb-6 p-0">
                        <div class="form-control">
                            <div class="comment-toolbar border-0 border-bottom">
                                <div class="d-flex justify-content-start">
                                                        <span class="ql-formats me-0">
                                                          <button class="ql-bold"></button>
                                                          <button class="ql-italic"></button>
                                                          <button class="ql-underline"></button>
                                                          <button class="ql-list" value="ordered"></button>
                                                          <button class="ql-list" value="bullet"></button>
                                                          <button class="ql-link"></button>
                                                        </span>
                                </div>
                            </div>
                            <div class="comment-editor border-0 pb-6" name="nttCn" id="editor"></div>
                        </div>
                    </div>
                    <!-- / Description -->

                    <c:if test="${bbs.fileAtchCo > 0}">
                        <div class="mb-6">
                            <div class="input-file inLine">
                                <input type="file" id="files" name="files" class="form-control" placeholder="파일을 선택하세요"
                                       title="파일을 선택하세요" multiple/>
                            </div>
                        </div>
                    </c:if>
                    <div id="fileItem"></div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/static/pages/mber/js/ntt/detail.js"></script>
