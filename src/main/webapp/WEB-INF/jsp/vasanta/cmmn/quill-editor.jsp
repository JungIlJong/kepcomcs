<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/static/vendor/sneat/libs/quill/typography.css"/>
<link rel="stylesheet" href="/static/vendor/sneat/libs/quill/katex.css"/>
<link rel="stylesheet" href="/static/vendor/sneat/libs/quill/editor.css"/>

<div class="mb-6 p-0 form-control-validation fv-plugins-icon-container" id="quill-editor-group">
    <label class="form-label" for="editor">
        내용
        <span class="text-danger ms-1">*</span>
    </label>
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
                        <button class="ql-image"></button>
                    </span>
            </div>
        </div>
        <div class="comment-editor border-0 pb-6" name="nttCn"
             id="editor"></div>
    </div>
    <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
</div>

<script type="text/javascript" src="/static/vendor/sneat/libs/quill/katex.js"></script>
<script type="text/javascript" src="/static/vendor/sneat/libs/quill/quill.js"></script>
<script>
    <%--  init start  --%>
    var quill = null;

    $(document).ready(function () {
        const $commentEditor = $('.comment-editor');

        if ($commentEditor.length > 0) {
            quill = new Quill($commentEditor[0], {
                modules: {
                    toolbar: {
                        container: '.comment-toolbar',
                        handlers: {
                            image: customImageHandler
                        }
                    }
                },
                placeholder: '',
                theme: 'snow'
            });

            const $linkButton = $('.ql-toolbar .ql-link');

            if ($linkButton.length > 0) {
                $linkButton.on('click', function () {
                    const $tooltip = $('.ql-tooltip');
                    if ($tooltip.length > 0) {
                        $tooltip.css('visibility', 'hidden');
                    }

                    setTimeout(function () {
                        adjustTooltipPosition();
                        if ($tooltip.length > 0) {
                            $tooltip.css('visibility', 'visible');
                        }
                    }, 10);
                });
            }
        }
    });

    function adjustTooltipPosition() {
        const $tooltip = $('.ql-tooltip');

        if ($tooltip.length > 0) {
            const isMobile = window.matchMedia('(max-width: 480px)').matches;
            const currentLeft = parseFloat($tooltip.css('left')) || 0;
            let left = isMobile ? 0 : currentLeft;

            if (!isMobile && currentLeft < 0) {
                left = currentLeft + 80;
            }

            $tooltip.css({
                left: left
            });
        }
    }

    <%--  init end  --%>

    function isValidQuillContent() {
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
        return true;
    }

    function customImageHandler() {
        const input = document.createElement('input');
        input.setAttribute('type', 'file');
        input.setAttribute('accept', 'image/*');
        input.click();
        input.addEventListener('change', function () {
            const file = this.files[0];
            if(file) {
                const data = new FormData();
                data.append('file', file);
                data.append('fileSe', 'editor');
                Ajax.upload('/file', (result) => {
                    console.log(result);
                    const imageUrl = result.url;

                    const range = quill.getSelection();
                    quill.insertEmbed(range.index, 'image', imageUrl);
                }, customAlert, {data})
            }
        })
    }

</script>