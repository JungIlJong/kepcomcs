/**
 *  에디터 초기화
 *  editor: textarea의 id
 */
let editorInit = function (value = '', id = 'editor') {
    CKEDITOR.replace( id, {
        enterMode: CKEDITOR.ENTER_DIV,
        disallowedContent: 'img{width,height};'
    });
    CKEDITOR.instances[id].setData(replaceSpecialCharacters(value));
}

function replaceSpecialCharacters(str) {
    if (str == null) {
        return "";
    }

    return str
        .replace(/&amp;/g, '&')
        .replace(/amp;/g, '')
        .replace(/&ndash;/g, '-')
        .replace(/&lt;/g, '<')
        .replace(/&gt;/g, '>')
        .replace(/&quot;/g, '"')
        .replace(/&#039;/g, "'")
        .replace(/&#39;/g, "'")
        .replace(/&middot;/g, "·")
        .replace(/&sdot;/g, "⋅");
}

let getEditorData = function() {
    return CKEDITOR.instances.editor.getData();
}

let imgTag = function() {
    const imgTags =  $(getEditorData()).find('img');
    if(imgTags.length === 0) {
        return undefined;
    }
    return $(imgTags[0]).attr('src');
}