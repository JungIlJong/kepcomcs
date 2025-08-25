const imageFileExtensions = 'JPG|JPEG|PNG|GIF|BMP|TIFF|PSD|SVG|WEBP|ICO|RAW|HEIC|TGA|EPS|AI|PDF|PCX|WMF|EMF|PICT|EXR|HDR|CR2|NEF|ARW|ORF|SR2|DNG|RW2|CRW|PEF|RAF|X3F|DCR|MOS|MPO|KDC|MRW|SRW|XBM|XPM'.split('|');

const isStartDateBeforeEndDate = (startDate = '', endDt = '') => {
    return new Date(startDate) < new Date(endDt);
}

const isStringLengthInRange = (value = '', min = 0, max = 255) => {
    return min <= value.length && value.length <= max;
}

const array = 'JPG|JPEG|PNG|GIF|BMP|TIFF|PSD|SVG|WEBP|ICO|RAW|HEIC|TGA|EPS|AI|PDF|PCX|WMF|EMF|PICT|EXR|HDR|CR2|NEF|ARW|ORF|SR2|DNG|RW2|CRW|PEF|RAF|X3F|DCR|MOS|MPO|KDC|MRW|SRW|XBM|XPM'.split('|');
const isImgFile = (file = File) => {
    return imageFileExtensions.includes(file.name.split('.').pop().toUpperCase());
}

const isValidFileExtension = (file = File, extensions = []) => {
    return extensions.some(ext => ext.toLowerCase() === file.name.split('.').pop().toLowerCase());
}

const isFileSizeUnderKb = (file = File, kb = 1) => {
    return file.size <= (1024 * kb);
}

const isFileSizeUnderMb = (file = File, mb = 1) => {
    return file.size <= (1024 * 1024 * mb);
}

const validSaveNtt = (form = FormData, {fileAtchSize, fileAtchCo, permExtsn}) => {
    if(!form.has('bbsId')) {
        alert('잘못된 게시판입니다.');
        return false;
    }

    const nttSj = form.get('nttSj');
    if(nttSj.length === 0) {
        alert('게시글을 입력해주세요.');
        return false;
    }
    if(nttSj.length > 200) {
        alert('게시글 제목은 200자까지 허용합니다.');
        return false;
    }

    const nttCn = form.get('nttCn');
    if(nttCn.length === 0) {
        alert('내용을 입력해주세요.');
        return false;
    }

    if(form.has('password')) {
        const password = form.get('password');
        if(password.length === 0) {
            alert('비밀번호를 입력해주세요.');
            return false;
        }
        if(password.length < 10) {
            alert('비밀번호는 최소 10자리부터 허용합니다.');
            return false;
        }
    }
    if(form.has('files')) {
        const files = form.getAll('files');
        if(files.length === 1 &&  files[0].name.trim() === '') {
            return true;
        }
        if(files.length > fileAtchCo) {
            alert(`파일 갯수를 줄여주세요.`);
            return false;
        }

        let sum = 0;
        for(const file of files) {
            if(!isValidFileExtension(file, permExtsn)) {
                alert('허용하지 않는 확장자의 파일입니다.: ' + file.name);
                return false;
            }
            sum += file.size;
        }
        if((fileAtchSize * 1024 * 1024) < sum) {
            alert(`파일은 최대 ${fileAtchSize}MB까지 허용합니다.`);
            return false;
        }
    }
    return true;
}