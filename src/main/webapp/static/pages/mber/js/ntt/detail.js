$(() => {
    const bbsId = $('#bbsId').val();
    const nttId = getUrlParameter('id');
    searchNttDetail(bbsId, nttId);
    Ajax.get(`/api/mber/bbs/${bbsId}/side?nttId=${nttId}`, renderSide, fail);

    $('#updateUBtn1').on('click', () => handleClickAuthorUpdate());
    $('#deleteUBtn1').on('click', () => handleClickAuthorDelete());
    $('#deleteGBtn1, #updateGBtn1').on('click', function () {
        $('#step1, .sideBox').addClass('d-none');
        $('#step2').removeClass('d-none');
        $('#action').val($(this).data('type'));
    });
    $('#submitBtn').on('click', () => handleSubmitPassword());
    $('#reportNttBtn1').on('click', () => reportNtt());
    $('#reportMbrBtn1').on('click', () => reportMbr());
    $('#blockMbrBtn1').on('click', () => blockMbr());
    $('#blockNttBtn1').on('click', () => blockNtt());
});

const searchNttDetail = (bbsId, nttId) => {
    Ajax.get(dataToQueryString(`/api/mber/bbs/${bbsId}/detail`, {nttId}), successNttDetail, fail);
}

const fail = () => console.log('fail');

const successNttDetail = (result) => {

    document.getElementById('nttSj').innerText = result.nttSj;
    document.getElementById('nttId').value = result.nttId;
    document.getElementById('writer').innerText = result.wrterNm;
    document.getElementById('regDt').innerText = result.frstRegistDt;
    document.getElementById('rdcnt').innerText = result.rdcnt;
    // add post 페이지에서 텍스트 에디터를 통해 입력된 내용(HTML 태그를 포함한 문자열)을
    // 제대로 표기하기 위해 dom parser로 문자열 변환
    const parser = new DOMParser();
    const desc = parser.parseFromString(result.nttCn, "text/html");
    document.getElementById('nttCn').insertAdjacentHTML('beforeend', desc.body.textContent);


    if(result.files.length > 0) {
        let node = `<div><p class="text-body-secondary mb-2">첨부파일</p>`;
        for(let i = 0; i < result.files.length; i++) {
            node += `<a href="/file/download?fileId=${result.files[i].id}" class="text-body-secondary"><div class="cursor-pointer">
                            <i class="icon-base bx bx-file"></i>
                            <span class="align-middle ms-1">${result.files[i].name}</span>
                          </div></a>`;
        }
        node += `</div>`;
        document.getElementById('fileItem').insertAdjacentHTML('beforeend', node);
    }
}

const renderSide = (data) => {
    if(isEmpty(data)) {
        return;
    }
    const sideBox = document.getElementById('sideBox');
    let node = '';

    if(!isEmpty(data.nextId)) {
        const {nextId, nextSecret, nextSj} = data
        const url = `detail?id=${nextId}`;
        node += `<a id="" href="${url}" class="list-group-item list-group-item-action list-group-item-light border-none" style="background: transparent;">
                            <div class="d-flex align-items-center py-0 gap-6 my-1 mx-0">
                                <div class="d-flex align-content-center flex-wrap gap-1">
                                    <span>
                                        <i class="icon-base bx bx-chevron-up icon-sm"></i>
                                    </span>
                                    <p class="mb-0">
                                        다음글
                                    </p>
                                </div>
                                <div class="d-flex align-content-start">
                                    <p class="mb-0 text-wrap" style="text-overflow: ellipsis;">${nextSj}</p>
                                </div>
                            </div>
                            </a>`
    }

    if(!isEmpty(data.prevId)) {
        const {prevId, prevSecret, prevSj} = data
        const url = `detail?id=${prevId}`;
        node += `<a id="" href="${url}" class="list-group-item list-group-item-action list-group-item-light border-none" style="background: transparent;">
                            <div class="d-flex align-items-center py-0 gap-6 my-1 mx-0">
                                <div class="d-flex align-content-center flex-wrap gap-1">
                                    <span>
                                        <i class="icon-base bx bx-chevron-down icon-sm"></i>
                                    </span>
                                    <p class="mb-0">
                                        이전글
                                    </p>
                                </div>
                                <div class="d-flex align-content-start">
                                    <p class="mb-0 text-wrap" style="text-overflow: ellipsis;">${prevSj}</p>
                                </div>
                            </div>
                            </a>`
    }
    sideBox.insertAdjacentHTML('beforeend', node);
}

const handleClickAuthorUpdate = () => {
    const id = getUrlParameter('id');
    goPage(`update?id=${id}`);
}

const handleClickAuthorDelete = () => {
    if(!confirm('해당 글을 삭제하시겠습니까?')) {
        return;
    }
    const nttId = getUrlParameter('id');
    Ajax.post('/api/mber/bbs/delete', () => {alert('삭제되었습니다.'); goPage('list')}, fail, {data: JSON.stringify({nttId})})
}

const handleSubmitPassword = () => {
    const bbsId = $('#bbsId').val();
    const nttId = getUrlParameter('id');
    const password = $('#password').val()
    if(isEmpty(password)) {
        alert('비밀번호를 입력해주세요.');
        return;
    }
    Ajax.post(`/api/mber/bbs/${bbsId}/detail?nttId=${nttId}`, successSubmitPassword, () => alert('잘못된 비밀번호 입니다.'), {data: JSON.stringify({password})})
}

const successSubmitPassword = (result) => {
    const action = $('#action').val();
    const call = action === 'update' ? updateCall : deleteCall
    call(result)
}

const deleteCall = () => {
    if(!confirm('삭제하시겠습니까?')) {
        return
    }
    const password = $('#password').val()
    const nttId = getUrlParameter('id');
    Ajax.post('/api/mber/bbs/delete', ()=> {
        alert('삭제되었습니다.');
        goPage('list');
    }, fail,
        {data: JSON.stringify({password, nttId})})
}

let removeFileList = []
const updateCall = (result) => {
    const commentEditor = document.querySelector('.comment-editor');
    if (commentEditor) {
        quill = new Quill(commentEditor, {
            modules: {
                toolbar: '.comment-toolbar'
            },
            placeholder: '',
            theme: 'snow'
        })
    }

    const parser = new DOMParser();
    const desc = parser.parseFromString(result.nttCn, "text/html");
    $('#nttSj2').val(result.nttSj);
    $('#wrterNm').val(result.wrterNm);
    quill.root.innerHTML =desc.body.firstChild.textContent;

    if($('#secretAtN').length > 0) {
        $('#secretAtY').prop('checked', result.secret);
    }

    if(result.files.length > 0) {
        let node = `<div><p class="text-body-secondary mb-2">첨부파일</p>`;
        for(let i = 0; i < result.files.length; i++) {
            node += `<div id="file${result.files[i].id}">
                            <i class="icon-base bx bx-file"></i>
                            <span class="align-middle ms-1">${result.files[i].name}</span>
                            <i class="icon-base bx bx-x cursor-pointer text-danger fs-1" onclick="removeFile(${result.files[i].id})"></i></div>`;
        }
        node += `</div>`;
        document.getElementById('fileItem').insertAdjacentHTML('beforeend', node);
    }

    $('#step2').addClass('d-none');
    $('#step3').removeClass('d-none');
    $('#btnSave').on('click', () => submit());
}

const removeFile = (id) => {
    removeFileList.push(id);
    $(`#file${id}`).remove();
}

const submit = () => {
    const data = new FormData($('#frm')[0]);
    data.set("nttCn", quill.getSemanticHTML());
    data.set('nttId', getUrlParameter('id'));
    data.set('confirmPassword', $('#password').val());
    removeFileList.forEach((i) => data.append('removeFileList', i));
    Ajax.upload('/api/mber/bbs/update', () => {
        alert('수정되었습니다.');
        goPage(setUrl('detail'));
    }, () => alert('수정할 수 없습니다.'), {data});
}

const reportNtt = () => {
    customAlert({
        title: '해당 게시글을 신고하시겠습니까?',
        content: '신고하시면 해당 게시글은 즉시 가려지며, 관리자 검토를 거쳐 처리됩니다.',
        showCancel: true,
        onConfirm: () => {
            const nttId = getUrlParameter('id');
            Ajax.post('/api/mber/bbs/report', () => successReportNtt(), failReportNtt, {data: JSON.stringify({nttId})})
        }
    })
}

const successReportNtt = () => {
    customAlert({
        title: '신고가 완료되었습니다.',
        onConfirm: () => goPage('list')
    })
}

const blockNtt = () => {
    customAlert({
        title: '해당 게시글을 차단하시겠습니까?',
        showCancel: true,
        onConfirm: () => {
            const nttId = getUrlParameter('id');
            Ajax.post('/api/mber/bbs/block', () => {customAlert({title: '차단이 완료되었습니다.', onConfirm: () => goPage('list'), showCancel: false})}, failBlockNtt, {data: JSON.stringify({nttId})})
        }
    })
}

const reportMbr = () => {
    if(!confirm('해당 게시글 작성자를 신고하시겠습니까?')) {
        return;
    }
    const frstRgstId = document.getElementById('frstRgstId').value;
    if(frstRgstId == null || frstRgstId == "") {
        alert("비회원 게시글은 작성자를 신고할 수 없습니다.");
        return;
    }
    Ajax.post('/api/mber/report', () => {alert('신고가 완료되었습니다.'); goPage('list')}, failReportMbr, {data: JSON.stringify({frstRgstId})})
}

const blockMbr = () => {
    customAlert({
        title: '해당 게시글 작성자를 차단하시겠습니까?',
        showCancel: true,
        onConfirm: () => {
            const frstRgstId = document.getElementById('frstRgstId').value;
            if(frstRgstId == null || frstRgstId == "") {
                alert("비회원 게시글은 작성자를 차단할 수 없습니다.");
                return;
            }
            Ajax.post('/api/mber/block', () => {customAlert({title: '차단이 완료되었습니다.', onConfirm: () => goPage('list'), showCancel: false})}, failBlockMbr, {data: JSON.stringify({frstRgstId})})
        }
    })
}

const sendLoginPg = () => {
    goPage("/mber/support/login/login");
}

const failReportMbr = function (xhr, status, error) {
    alert('관리 계정은 신고할 수 없습니다.');
    console.log(xhr + ", " + status + " : " + error)
}

const failBlockMbr = function (xhr, status, error) {
    alert('관리 계정은 차단할 수 없습니다.');
    console.log(xhr + ", " + status + " : " + error)
}

const failReportNtt = function (xhr, status, error) {
    alert('공지 게시글은 신고할 수 없습니다.');
    console.log(xhr + ", " + status + " : " + error)
}

const failBlockNtt = function (xhr, status, error) {
    alert('공지 게시글은 차단할 수 없습니다.');
    console.log(xhr + ", " + status + " : " + error)
}
