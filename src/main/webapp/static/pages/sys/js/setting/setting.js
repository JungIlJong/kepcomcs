const uploadLogo = (file, avatar, input) => {
    if (!file) {
        alert('파일이 선택되지 않았습니다.');
        return;
    }

    const fileName = file.name;
    const extension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
    const fileSize = file.size;
    const MAX_LOGO_SIZE = 716800; // 700KB
    const ALLOWED_EXTENSIONS = ['jpeg', 'jpg', 'png', 'svg'];

    if(!ALLOWED_EXTENSIONS.includes(extension)) {
        alert(`로고의 확장자는 ${ALLOWED_EXTENSIONS}만 허용합니다.`);
        return;
    }

    if(fileSize > MAX_LOGO_SIZE) {
        alert('로고 이미지는 최대 700KB까지 허용합니다.');
        return;
    }
    const data = new FormData();
    data.set('file', file);
    data.set('fileSe', 'logo');
    Ajax.upload('/file', ({fileId}) => {
        $(`#${avatar}`).attr("src", "/file/"+ fileId);
        $(`#${input}`).val("/file/"+ fileId);
    }, alert, {data})
}

$(() => {
    $('#btnSave').on('click', () => {
        const values = $('input.setting, textarea.setting').map(function() {
            return {
                key: $(this).attr('id'),
                content: $(this).val()
            };
        }).get();
        console.log(values);
        Ajax.post('/api/sys/settings', () => alert('수정되었습니다.'), alert, {data: JSON.stringify(values)});
    });

    $('#upload').on('change', function () {
        uploadLogo(this.files[0], 'uploadedAvatar', 'logoUrl')
    })

    $('#footerUpload').on('change', function () {
        uploadLogo(this.files[0], 'footerUploadedAvatar', 'footerLogoUrl')
    })
});
