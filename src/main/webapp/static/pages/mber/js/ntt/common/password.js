$(() => {
    $('#submitBtn').on('click', () => submitPassword());
    $('#password').on('keyup', (event) => {
        if (event.key === 'Enter') {
            submitPassword();
        }
    });
    $('#passwordTypeChange').on('click', () => {
        const $passwordInput = $('#password');
        const $icon = $('#passwordTypeChange i');
        const isPassword = $passwordInput.attr('type') === 'password';

        // type 변경
        $passwordInput.attr('type', isPassword ? 'text' : 'password');

        // 아이콘 변경
        $icon.removeClass(isPassword ? 'bx-hide' : 'bx-show')
            .addClass(isPassword ? 'bx-show' : 'bx-hide');
    });
})

const submitPassword = () => {
    const password = $('#password').val();
    if(isEmpty(password)) {
        alert('비밀번호를 입력해주세요.');
        return;
    }
    const bbsId = $('#bbsId').val();
    const nttId = getUrlParameter('id');
    const data = JSON.stringify({password});
    console.log()
    Ajax.post(
        dataToQueryString(`/api/mber/bbs/${bbsId}/detail`, {nttId}),
        renderNttDetail,
        () => alert('잘못된 비밀번호 입니다.'),
        {data}
    );
}

const renderNttDetail = (result) => {
    document.getElementById('nttSj').innerText = result.nttSj;
    document.getElementById('writer').innerText = result.wrterNm;
    document.getElementById('regDt').innerText = result.frstRegistDt;
    document.getElementById('rdcnt').innerText = result.rdcnt;
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
    $('#step1, .answer').addClass('d-none');
    $('#step2').removeClass('d-none');
    updateCall(result);
}

const clickUpdate = () => {
    $('#step2').addClass('d-none');
    $('#step3').removeClass('d-none');
}

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
        document.getElementById('fileItem2').insertAdjacentHTML('beforeend', node);
    }
    $('#btnSave').on('click', () => submit());
}
let removeFileList = [];
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

const deleteCall = () => {
    if(!confirm('삭제하시겠습니까?')) {
        return
    }
    const password = $('#password').val()
    const nttId = getUrlParameter('id');
    Ajax.post('/api/mber/bbs/delete', ()=> {
            alert('삭제되었습니다.');
            goPage('list');
        }, () => alert('삭제에 실패하였습니다.'),
        {data: JSON.stringify({password, nttId})})
}