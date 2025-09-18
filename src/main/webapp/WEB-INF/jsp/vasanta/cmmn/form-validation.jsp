<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/static/vendor/sneat/libs/@form-validation/form-validation.css" />
<script src="/static/vendor/sneat/libs/@form-validation/popular.js"></script>
<script src="/static/vendor/sneat/libs/@form-validation/bootstrap5.js"></script>
<script src="/static/vendor/sneat/libs/@form-validation/auto-focus.js"></script>
<script src="/static/js/common/form-validation.js"></script>

<script type="text/javascript">
    const banExtesn = new Set(['sh', 'bat', 'exe', 'vbs', 'js', 'docm', 'xlsm', 'pptm', 'rar']);

    const VALIDATION_MESSAGES = {
        menu: {
            menuIdRequired: '<spring:message code="menu.menuId.required"/>',
            menuIdLength: '<spring:message code="menu.menuId.length"/>',
            menuIdStartWithLowercase: '<spring:message code="menu.menuId.startWithLowercase"/>',
            menuIdInvalid: '<spring:message code="menu.menuId.validMenuId"/>',
            menuIdDuplicated: '<spring:message code="menu.menuId.duplicated"/>',
            menuIdAvailable: '<spring:message code="menu.menuId.available"/>',
            menuIdDupCheckRequired: '<spring:message code="menu.menuId.dupCheckRequired"/>',

            menuNmRequired: '<spring:message code="menu.menuNm.required"/>',
            menuNmLength: '<spring:message code="menu.menuNm.length"/>',
            menuNmInvalid: '<spring:message code="menu.menuNm.validMenuNm"/>',

            menuOrdrRequired: '<spring:message code="menu.menuOrdr.required"/>',
            menuOrdrMin: '<spring:message code="menu.menuOrdr.min"/>',
            menuOrdrMax: '<spring:message code="menu.menuOrdr.max"/>',

            urlRequired: '<spring:message code="menu.url.required"/>',
            urlMaxlength: '<spring:message code="menu.url.maxlength"/>',
            urlInvalidFormat: '<spring:message code="menu.url.invalidFormat"/>',
            urlSelectContent: '<spring:message code="menu.url.selectContent"/>',
            urlSelectBbs: '<spring:message code="menu.url.selectBbs"/>',
            urlSelectProgram: '<spring:message code="menu.url.selectProgram"/>'
        },
        member: {
            idRequired: '아이디를 입력해주세요.',
            idStartLowercase: '아이디는 반드시 영문 소문자로 시작해야 합니다.',
            idMustContainNumber: '아이디에는 숫자가 반드시 포함되어야 합니다.',
            idLengthInvalid: '아이디는 4자 이상 12자 이하로 입력해야 합니다.',
            idReserved: 'admin, root 등의 예약어는 사용할 수 없습니다.',
            idDupCheckRequired: '아이디 중복체크를 해주세요.',
            idDuplicated: '중복된 아이디입니다.',
            idAvailable: '사용 가능한 아이디입니다.',

            nameRequired: '이름을 입력해주세요.',
            nameInvalid: '이름은 한글 2~6자여야 합니다.',

            emailRequired: '이메일을 입력해주세요.',
            emailInvalid: '올바른 이메일 형식이 아닙니다.',
            emailDupCheckRequired: '이메일 중복확인을 해주세요.',
            emailDuplicated: '중복된 이메일입니다.',
            emailAvailable: '사용 가능한 이메일입니다.',

            passwordRequired: '비밀번호를 입력해주세요.',
            passwordLength: '비밀번호는 8자 이상 20자 이하로 입력해야 합니다.',
            passwordComplexity: '비밀번호는 영문자, 숫자, 특수문자(~!@#$%^&*?)를 모두 포함해야 합니다.',
            passwordRepeat: '같은 문자를 3번 이상 반복할 수 없습니다. 예: aaa, 111 등',
            passwordSequence: '3자리 이상 연속된 문자나 숫자는 사용할 수 없습니다. 예: abc, 123, cba, 321 등',
            passwordConfirmRequired: '비밀번호 확인을 입력해주세요.',
            passwordMismatch: '비밀번호와 비밀번호 확인이 일치하지 않습니다.',

            phoneRequired: '휴대폰 번호를 입력해주세요.',
            phoneInvalid: '숫자만 입력하며, 7~11자리여야 합니다.',

            faxInvalid: '팩스 번호는 숫자만 입력해주세요.',
            faxLength: '팩스 번호는 최대 20자리까지 입력 가능합니다.',

            zipInvalid: '우편번호는 숫자 5자리여야 합니다.',

            authrtRequired: '회원권한을 최소 1개 이상 선택해주세요.'
        },
        program: {
            progrmNmRequired: '<spring:message code="progrm.progrmNm.required"/>',
            progrmNmMinlength: '<spring:message code="progrm.progrmNm.minlength"/>',
            progrmNmMaxlength: '<spring:message code="progrm.progrmNm.maxlength"/>',
            progrmNmInvalid: '<spring:message code="progrm.progrmNm.validProgrmNm"/>',

            progrmUrlRequired: '<spring:message code="progrm.progrmUrl.required"/>',
            progrmUrlMaxlength: '<spring:message code="progrm.progrmUrl.maxlength"/>',
            progrmUrlInvalid: '<spring:message code="progrm.progrmUrl.invalidFormat"/>',

            progrmDcMaxlength: '<spring:message code="progrm.progrmDc.maxlength"/>'
        },
        authrt: {
            authrtCdRequired: '권한코드를 입력해주세요.',
            authrtCdFormat: '권한코드는 영문 대문자와 언더바(_)만 사용할 수 있습니다.',
            authrtCdMaxlength: '권한코드는 15자 이하로 입력해주세요.',

            authrtNmRequired: '권한명을 입력해주세요.',
            authrtNmMaxlength: '권한명은 15자 이하로 입력해주세요.',

            authrtExplnRequired: '설명을 입력해주세요.',
            authrtExplnMaxlength: '설명은 50자 이하로 입력해주세요.'
        },
        accessIp: {
            ipRequired: 'IP 주소를 입력해주세요.',
            ipInvalid: '유효한 IP 형식이 아닙니다.',

            ipDcMaxlength: '설명은 50자 이하로 입력해주세요.'
        },
        banner: {
            bannerNmRequired: '배너명을 입력해주세요.',
            bannerNmMaxlength: '배너명은 최대 60자까지 입력 가능합니다.',

            urlMaxlength: 'URL은 최대 200자까지 입력 가능합니다.',
            urlInvalidFormat: '올바른 URL 형식이 아닙니다.',

            sortOrderRequired: '게시순위를 입력해주세요.',
            sortOrderInvalid: '게시순위는 숫자여야 합니다.',

            bannerSeCodeRequired: '배너 위치를 선택해주세요.',

            ntceBgndeRequired: '시작일자를 선택해주세요.',
            ntceEnddeRequired: '종료일자를 선택해주세요.',
            ntceRangeInvalid: '잘못된 범위의 시작일자와 종료일자입니다.',

            webBannerRequired: '웹 배너를 선택해주세요.',
            webBannerInvalidType: '허용되지 않는 이미지 형식입니다.',
            webBannerTooLarge: '웹 배너는 최대 700KB까지 허용합니다.',

            mobBannerRequired: '모바일 배너를 선택해주세요.',
            mobBannerInvalidType: '허용되지 않는 이미지 형식입니다.',
            mobBannerTooLarge: '모바일 배너는 최대 700KB까지 허용합니다.',
        },
        popup: {
            popupNmRequired: '팝업명은 필수 입력값입니다.',
            popupNmMaxlength: '팝업명은 최대 60자까지 입력 가능합니다.',

            urlMaxlength: 'URL은 최대 200자까지 입력 가능합니다.',
            urlInvalidFormat: '올바른 URL 형식이 아닙니다.',

            sortOrdrRequired: '게시순위는 필수 입력값입니다.',
            sortOrdrInvalid: '게시순위는 숫자만 입력 가능합니다.',

            ntceBgndeRequired: '시작일자를 입력해주세요.',
            ntceEnddeRequired: '종료일자를 입력해주세요.',
            ntceRangeInvalid: '시작일은 종료일보다 이전이어야 합니다.',

            imgFileRequired: '팝업 이미지를 선택해주세요.',
            imgFileInvalidType: '이미지 파일 형식이 아닙니다.',
            imgFileTooLarge: '팝업 이미지는 최대 800KB까지 허용됩니다.',

            popupLcRequired: '팝업 위치(가로/세로)를 모두 입력해주세요.',
            popupLcInvalid: '팝업 위치는 가로 300~400, 세로 300~400 사이여야 합니다.',

            popupSizeRequired: '팝업 크기(가로/세로)를 모두 입력해주세요.',
            popupSizeInvalid: '팝업 크기는 가로 300~400, 세로 300~400 사이여야 합니다.'
        },
        bbs: {
            bbsNmRequired: '게시판명은 필수 입력값입니다.',
            bbsNmLength: '게시판명은 최대 255자까지 허용합니다.',

            bbsTyCodeRequired: '게시판 유형을 선택해주세요.',

            fileAtchCoRequired: '첨부파일 갯수를 선택해주세요.',
            fileAtchCoMax: '첨부파일은 최대 10개까지 허용합니다.',

            fileAtchSizeRequired: '첨부파일 용량은 필수 입력값입니다.',
            fileAtchSizeRange: '첨부파일 용량은 0 이상 50 이하로 입력해주세요.',

            permExtsnRequired: '첨부파일 허용 확장자는 필수 입력값입니다.',
            permExtsnLength: '첨부파일 허용 확장자는 최대 200자까지 허용합니다.',
            permExtsnBanned: '첨부파일 허용 확장자는 다음과 같은 확장자를 포함할 수 없습니다. (' + Array.from(banExtesn).join(', ') + ')'
        },
        cntnts: {
            cntntsNmRequired: '콘텐츠명은 필수 입력값입니다.',
            cntntsCnRequired: '콘텐츠 내용은 필수 입력값입니다.',
            cntntsDcMaxlength: '설명은 최대 200자까지 입력할 수 있습니다.'
        },
        ntt: {
            nttSjRequired: '제목은 필수 입력값입니다.',
            nttSjTooLong: '제목은 최대 2000자까지 허용합니다.',

            nttCnRequired: '콘텐츠 내용은 필수 입력값입니다.',

            fileCountExceeded: '파일은 최대 {0}개까지 허용합니다.',
            fileTypeInvalid: '허용되지 않은 확장자가 포함되어 있습니다. 허용 확장자: {0}',
            fileSizeExceeded: '첨부파일은 최대 {0}MB까지 허용합니다.',
            fileRequired: '첨부파일은 필수 입력값입니다.'
        },
        mapmarker: {
            nameRequired: '마커 이름은 필수 입력값입니다.',
            roadAddressRequired: '도로명 주소는 필수 입력값입니다. 주소를 검색해주세요.',
            jibunAddressRequired: '지번 주소는 필수 입력값입니다. 주소를 검색해주세요.',
            categoryCode1Required: '대분류 카테고리는 필수 선택 항목입니다.',
            categoryCode2Required: '소분류 카테고리는 필수 선택 항목입니다.',
            coordinatesRequired: '위치(위도/경도)는 필수 항목입니다. 지도에서 위치를 선택하거나 주소 검색을 이용해주세요.',
            nameTooLong: '마커 이름은 최대 255자까지 허용합니다.'
        }
    };
</script>
