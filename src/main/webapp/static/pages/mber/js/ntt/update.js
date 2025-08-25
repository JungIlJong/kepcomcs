let quill = null;
let removeFileList = []

$(() => {
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

    const bbsId = $('#bbsId').val();
    const nttId = getUrlParameter('id');
    Ajax.get(dataToQueryString(`/api/mber/bbs/${bbsId}/detail`, {nttId}), init, fail);

    $('#btnSave').on('click', () => {
        if(validForm()) {
            submitForm();
        }
    })
})

const fail = () => console.log('fail');

const init = (result) => {
    console.log(result);
    const parser = new DOMParser();
    const desc = parser.parseFromString(result.nttCn, "text/html");
    $('#nttSj').val(result.nttSj);
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
}

const removeFile = (id) => {
    removeFileList.push(id);
    $(`#file${id}`).remove();
}

const validForm = () => {
    const $bbsId = $('#bbsId');
    if(isEmpty($bbsId.val())) {
        alert('잘못된 게시판 입니다.');
        return false;
    }

    const $wrterNm = $('#wrterNm');
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

    const $password = $('#password');
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

    const $nttSj = $('#nttSj');
    if(isEmpty($nttSj.val())) {
        alert('제목은 필수 입력값입니다.');
        $nttSj.focus();
        return false;
    }
    if(!isStringLengthInRange($nttSj.val(), 1, 2000)) {
        alert('제목은 최대 2000자까지 허용합니다.');
        $nttSj.focus();
        return false;
    }

    if (quill != null) {
        const contentHtml = quill.getSemanticHTML();
        const tempDiv = document.createElement("div");
        tempDiv.innerHTML = contentHtml;
        const plainText = tempDiv.textContent.trim();
        if (plainText === "") {
            alert("콘텐츠 내용은 필수 입력값입니다.");
            quill.focus();
            return false;
        }
    }

    const $files = $('#files');
    const $fileAtchCo = $('#fileAtchCo');
    const $fileAtchSize = $('#fileAtchSize');
    const $permExtsn = $('#permExtsn');
    const permExtsns = $permExtsn.val().split(',');

    if($files.length > 0) {
        if($files[0].files.length > $fileAtchCo.val()) {
            alert('파일은 최대 ' + $fileAtchCo.val() + "개를 허용합니다.");
            return false;
        }
        let sumSize = 0;
        for (const f of $files[0].files) {
            sumSize += f.size;
            if(!isValidFileExtension(f, permExtsns)) {
                alert('해당 확장자는 허용하지 않습니다. 허용된 첨부파일 확장자는 다음과 같습니다.\n' + permExtsns)
                return false;
            }
        }

        if(sumSize > ($fileAtchSize.val() * 1024 * 1024)) {
            alert('첨부파일은 최대 ' + $fileAtchSize.val() +'MB까지 허용합니다.');
            return false;
        }
    }
    return confirm('수정하시겠습니까?');
}

const submitForm = () => {
    const data = new FormData($('#frm')[0]);
    data.set("nttCn", quill.getSemanticHTML());
    data.set('nttId', getUrlParameter('id'));
    removeFileList.forEach((i) => data.append('removeFileList', i));
    Ajax.upload('/api/mber/bbs/update', () => {
        alert('수정되었습니다.');
        goPage(setUrl('detail'));
    }, fail, {data});
}