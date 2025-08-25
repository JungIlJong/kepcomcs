let answerList = [];

$(function () {
    searchAnswerList();
    $('#answerCn').on('keyup', function(key) {
        if(key.keyCode==13) {
            submitForm();
        }
    })

    $('#passwordTypeChange2').on('click', () => {
        const $passwordInput = $('#answerPassword');
        const $icon = $('#passwordTypeChange2 i');
        const isPassword = $passwordInput.attr('type') === 'password';

        // type 변경
        $passwordInput.attr('type', isPassword ? 'text' : 'password');

        // 아이콘 변경
        $icon.removeClass(isPassword ? 'bx-hide' : 'bx-show')
            .addClass(isPassword ? 'bx-show' : 'bx-hide');
    });

    $('#rvList').on('click', (e) => handleAnswerActions(e));
})

const submitUpdate = () => {
    const answerId = $('#updateAnswerId').val();
    const password = $('#updatePassword').val();
    const wrterNm = $('#updateWriter').val();
    const answerCn = $('#content').val();

    if(isEmpty(answerId)) {
        alert('잘못된 댓글 입니다.');
        return;
    }
    if(!$('#updatePassword').prop('disabled') && password.length < 10) {
        alert('비밀번호는 최소 10자리를 입력해주세요.');
        return;
    }

    if(!$('#updateWriter').prop('disabled') && wrterNm.length === 0) {
        alert('작성자를 입력해주세요.');
        return;
    }

    if(answerCn.length === 0) {
        alert('내용을 입력해주세요.');
        return;
    }

    Ajax.post('/api/mber/answer/update', () => {alert('수정되었습니다.');reload();}, () => alert('잘못된 비밀번호 입니다.'), {data: JSON.stringify({
            answerId,
            password,
            wrterNm,
            answerCn})})
}

const submitDelete = () => {
    const password = $('#deletePassword').val();
    const id = $('#deleteAnswerId').val();
    if(isEmpty(id)) {
        alert('잘못된 댓글입니다.');
        return;
    }

    if(password.length < 10) {
        alert('비밀번호는 최소 10자리를 입력해주세요.');
        return;
    }
    Ajax.post('/api/mber/answer/delete', () => {alert('삭제되었습니다.');reload()}, fail, {data: JSON.stringify({id, password})});
}

const submitForm = () => {
    if(!validForm()) {
        return;
    }
    if(!confirm('등록하시겠습니까?')) {
        return;
    }
    const nttId = getUrlParameter('id');
    let data = formToJSON($('#answerFrm')[0]);
    data.nttId = nttId;
    let options = {
        dataType: 'text',
        data : JSON.stringify(data)
    }
    Ajax.post('/api/mber/answer/save', () => {alert('등록되었습니다.');reload();}, fail, options);
}

const validForm = () => {
    const nttId = getUrlParameter('id');
    console.log(nttId);
    if(isEmpty(nttId)) {
        return false;
    }

    const $wrterNm = $('#answerWrterNm');
    if($wrterNm.length > 0 && isEmpty($wrterNm.val())) {
        alert('작성자를 입력해주세요.');
        $wrterNm.focus();
        return false;
    }
    if($wrterNm.length > 0 && $wrterNm.val().length > 10) {
        alert('작성자는 최대 10자까지 허용합니다.');
        $wrterNm.focus();
        return false;
    }

    const $password = $('#answerPassword');
    if($password.length > 0 && isEmpty($password.val())) {
        alert('비밀번호를 입력해주세요.');
        $password.focus();
        return false;
    }
    if($password.length > 0 && $password.val().length < 10) {
        alert('비밀번호는 최소 10자리를 입력해주세요.');
        $password.focus();
        return false;
    }

    const $answerCn = $('#answerCn');
    if(isEmpty($answerCn.val())) {
        alert('내용을 입력해주세요.')
        $answerCn.focus();
        return false;
    }


    return true;
}

const searchAnswerList = (pageIndex = 1) => {
    const nttId = getUrlParameter('id');
    const data = {
        pageIndex, nttId
    }
    Ajax.get(dataToQueryString('/api/mber/answer/list', data), setAnswerList, () => console.log('error'));
}

const setAnswerList = (data) => {
    console.log(data);
    const tableBody = document.getElementById('rvList');
    const paginationInfo = data.paginationInfo;

    // 페이지네이션 렌더링
    renderPagination(paginationInfo, document.getElementById('pagination'));

    // 기존 내용 제거
    removeAllChild(tableBody);

    // 데이터 저장
    answerList = data.data;

    // 목록 생성
    // HTML 삽입
    const dropdownTemplate = document.getElementById('answerContextMenu').innerHTML;
    tableBody.innerHTML = data.data
        .slice(0, paginationInfo.pageSize)
        .map(element => {
            const modifyNode = (isEmpty(element.frstRegisterId) || element.frstRegisterId === 'Y')
                ? `<div class="d-flex align-content-center flex-wrap gap-4">
                      <div class="d-flex gap-2">
                        <div class="d-inline-block">
                          <a href="javascript:;" class="btn btn-icon dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                            <i class="bx bx-dots-vertical-rounded icon-base"></i>
                          </a>
                          <div class="dropdown-menu dropdown-menu-end m-0" data-answer-id="${element.answerId}">
                                ${dropdownTemplate}
                          </div>
                        </div>
                      </div>
                    </div>`
                : '';

            return `
                <li class="d-flex flex-column mb-2 row-gap-2" data-answer-id="${element.answerId}">
                    <hr/>
                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                        <p class="name mb-0"><strong>${element.wrterNm}</strong></p>
                        ${modifyNode}
                    </div>
                    <p class="conItem text-body">${element.answerCn}</p>
                    <small class="p-0 m-0 text-body-secondary text">${element.frstRegistDt}</small>
                </li>
            `;
        }).join('');
}

// 이벤트 위임 처리 함수
const handleAnswerActions = (event) => {
    const actionElement = event.target.closest('[data-action]');
    // 액션 버튼이 아니면 무시
    if (!actionElement) return;
    // 이벤트 전파 중단
    event.preventDefault();
    // 상위 드롭다운 메뉴에서 ID 가져오기
    const dropdownMenu = actionElement.closest('.dropdown-menu');
    if (!dropdownMenu) return;
    const answerId = parseInt(dropdownMenu.dataset.answerId, 10);
    const action = actionElement.dataset.action;

    // 액션에 따른 처리
    switch (action) {
        case 'update':
            updateAnswerClick(answerId);
            break;
        case 'delete':
            deleteAnswerClick(answerId);
            break;
        case 'report':
            reportAnswer(answerId);
            break;
        case 'block':
            blockUser(answerId);
            break;
        case 'login':
            goPage("/mber/support/login/login");
            break;
    }
}

const updateAnswerClick = (id) => {
    const res = answerList.find((answer) => answer.answerId == id);
    const updateWriter = document.getElementById('updateWriter');
    const updatePassword = document.getElementById('updatePassword');
    const updateContent = document.getElementById('content');
    const updateAnswerId = document.getElementById('updateAnswerId');
    if(isEmpty(res.frstRegisterId)) {
        updateWriter.value = res.wrterNm;
        updateWriter.setAttribute('disabled', false);
        updateWriter.parentElement.hidden = false;
        updatePassword.parentElement.hidden = false;
    } else {
        updateWriter.setAttribute('disabled', true);
        updatePassword.setAttribute('disabled', true);
        updateWriter.parentElement.hidden = true;
        updatePassword.parentElement.hidden = true;
    }
    updatePassword.value = '';
    updateContent.innerHTML = res.answerCn;
    $('#updateAnswerId').val(res.answerId);
    updateAnswerId.value = res.answerId;
    $('.deletePopup').removeClass('on');
    $('.updatePopup').addClass('on');
}

const deleteAnswerClick = (id) => {
    const res = answerList.find((answer) => answer.answerId == id);
    if(isEmpty(res.frstRegisterId)) {
        $('#deleteAnswerId').val(res.answerId)
        $('#deletePassword').val('');
        $('.updatePopup').removeClass('on');
        $('.deletePopup').addClass('on');
        return;
    }
    if(!confirm('삭제하시겠습니까?')) {
        return;
    }
    Ajax.post('/api/mber/answer/delete', () => {alert('삭제되었습니다.');reload()}, () => alert('잘못된 비밀번호 입니다.'), {data: JSON.stringify({id})});
}


// 필요한 추가 함수들 (기존 코드에 없다면 구현 필요)
const reportAnswer = (id) => {
    const data = {id};
    customAlert({
        title: '댓글을 신고하시겠습니까?',
        content: '신고하시면 해당 댓글은 즉시 가려지며, 관리자 검토를 거쳐 처리됩니다.',
        showCancel: true,
        onConfirm: function () {
            Ajax.post(`/api/mber/answer/${id}/report`, customAlert({
                title: '신고 확인',
                content: '신고 접수 시 해당 댓글은 관리자 검토 후 조치됩니다. 신고해주셔서 감사합니다.',
                onConfirm: () => reload()
            }
            ),
                () => customAlert({title: '신고에 실패하였습니다. 관리자에게 문의주세요.', showCancel: false},)
            , {data: JSON.stringify(data)}
            )
        }
    });
}

const  blockUser = (id) => {
    console.log('차단:', id);
    // 사용자 차단 로직
}