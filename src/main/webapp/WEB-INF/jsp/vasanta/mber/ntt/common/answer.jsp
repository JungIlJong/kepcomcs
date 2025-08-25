<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<div class="answer container-xxl border-top p-6 pt-4 mx-0">
        <!-- 댓글 목록 -->
        <h6 class="mb-0 text-secondary">댓글 보기</h6>

        <ul id="rvList" class="list-unstyled mb-6">
        </ul>

        <div class="card shadow-none bg-transparent border border-light text-secondary mb-6">
            <div class="card-body p-3">
                <label for="answerFrm" class="mb-2">새 댓글 달기</label>
                <form id="answerFrm" onsubmit="return false;" autocomplete="off" class="gap-2 mb-0">
                    <!-- 비회원 댓글 생성 시 입력해야 하는 영역 -->
                    <sec:authorize access="!isAuthenticated()">
                        <div class="row mb-3">
                            <!-- 아이디 -->
                            <div class="col-4 pe-1">
                                <input type="text" id="answerWrterNm" name="wrterNm"
                                       class="form-control" placeholder="작성자"
                                       autocomplete="off"/>
                            </div>

                            <!-- 비밀번호 -->
                            <div class="col ps-1">
                                <div class="input-group input-group-merge">
                                    <input type="password" id="answerPassword" name="password"
                                           class="form-control" placeholder="비밀번호를 입력해주세요."
                                           autocomplete="off"/>
                                    <span id="passwordTypeChange2" class="input-group-text cursor-pointer"><i
                                            class="bx bx-hide"></i></span>
                                </div>
                            </div>
                        </div>
                    <!-- 댓글 입력/버튼 영역 -->
                    </sec:authorize>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <input
                                    type="text"
                                    name="answerCn"
                                    id="answerCn"
                                    class="form-control"
                                    placeholder="댓글을 입력하세요."/>
                                <button id="btnSave" type="button" class="btn btn-primary shadow-none" onclick="submitForm()">등록</button>
                            </div>
                        </div>
                    </div>
                    <!-- / 댓글 입력/버튼 영역 -->
                </form>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-rounded" id="pagination">
                </ul>
            </nav>
        </div>

<%--    </div>--%>
</div>

<!-- update reply modal -->
<div class="modal fade" id="updateReplyModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">댓글 수정</h5>
            </div>
            <div class="modal-body">
                <input id="updateAnswerId" type="hidden" />
                <div class="row g-4 mb-4">
                    <div class="col mb-0">
                        <label for="updateWriter" class="form-label">작성자명</label>
                        <input
                                type="text"
                                id="updateWriter"
                                name="updateWriter"
                                class="form-control"
                                placeholder="작성자"/>
                    </div>
                    <div class="col mb-0">
                        <label for="updatePassword" class="form-label">비밀번호</label>
                        <input
                            type="password"
                            id="updatePassword"
                            name="updatePassword"
                            class="form-control"
                            placeholder="기존 비밀번호를 입력하세요."/>
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-0">
                        <label for="content" class="form-label">댓글 내용</label>
                        <textarea
                            type="text"
                            id="content"
                            name="content"
                            class="form-control"
                            placeholder="댓글 내용"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="updateSubmitBtn" onclick="submitUpdate()">수정하기</button>
            </div>
        </div>
    </div>
</div>

<!-- delete reply modal -->
<div class="modal fade" id="deleteReplyModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header flex-column align-items-start">
                <h5 class="modal-title">댓글 삭제</h5>
                <p>댓글 생성 시 입력한 비밀번호를 입력하세요.</p>
            </div>
            <div class="modal-body">
                <input id="deleteAnswerId" type="hidden" />
                <div class="row g-4">
                    <div class="col mb-0">
                        <label for="deletePassword" class="form-label">비밀번호</label>
                        <input
                                type="password"
                                id="deletePassword"
                                name="deletePassword"
                                class="form-control"
                                placeholder="**********"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="deleteSubmitBtn" onclick="submitDelete()">삭제하기</button>
            </div>
        </div>
    </div>
</div>

<sec:authorize access="isAnonymous()">
    <template id="answerContextMenu">
       <a href="javascript:;" class="dropdown-item" data-action="update" data-bs-toggle="modal" data-bs-target="#updateReplyModal">수정</a>
       <a href="javascript:;" class="dropdown-item" data-action="delete" data-bs-toggle="modal" data-bs-target="#deleteReplyModal">삭제</a>
       <a href="javascript:;" class="dropdown-item" data-action="login">댓글 신고</a>
       <a href="javascript:;" class="dropdown-item" data-action="login">사용자 차단</a>
    </template>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <template id="answerContextMenu">
       <a href="javascript:;" class="dropdown-item" data-action="update" data-bs-toggle="modal" data-bs-target="#updateReplyModal">수정</a>
       <a href="javascript:;" class="dropdown-item" data-action="delete" data-bs-toggle="modal" data-bs-target="#deleteReplyModal">삭제</a>
       <a href="javascript:;" class="dropdown-item" data-action="report">댓글 신고</a>
       <a href="javascript:;" class="dropdown-item" data-action="block">사용자 차단</a>
    </template>
</sec:authorize>
<script type="text/javascript" src="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/hammer/hammer.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/popper/popper.js"></script>
<script src="/static/pages/mber/js/ntt/common/answer.js"></script>