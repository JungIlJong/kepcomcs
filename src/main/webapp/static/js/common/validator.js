$(function () {
    jQuery.validator.setDefaults({
        onkeyup: false,
        onclick: false,
        onfocusout: false,
        showErrors: function (errorMap, errorList) {
            if (this.numberOfInvalids()) {
                alert(errorList[0].message);
            }
        },
        ignore: [],
        errorPlacement: function (error, element) {
            return false;
        },
    });

    jQuery.validator.addMethod("validPassword", function (value, element) {
        if (/(.)\1{2,}/.test(value)) {
            return false;
        }

        return /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*?])[a-zA-Z0-9~!@#$%^&*?]{8,20}(?!.*(012|123|234|345|456|567|678|789|890|098|987|876|765|654|543|432|321|210))(?!.*(.)\1{2,})$/.test(value);
    }, "유효하지 않은 비밀번호입니다.");

    jQuery.validator.addMethod("validId", function (value, element) {
        // 아이디가 소문자로 시작하고, 소문자와 숫자로만 구성되어 있는지 확인하는 정규표현식
        if (!/^[a-z][a-z0-9]*$/.test(value)) {
            return false;
        }

        return true;
    }, "올바르지 않은 아이디입니다.");

    jQuery.validator.addMethod("validCellPhoneNumber", function (value, element) {
        // 010으로 시작하는 한국의 휴대폰 번호 형식을 나타내는 정규표현식
        if (!/^010[0-9]{8}$/.test(value)) {
            return false;
        }

        return true;
    }, "올바르지 않은 핸드폰번호입니다.");

    jQuery.validator.addMethod("validMenuId", function (value, element) {
        return /^[a-z][a-z0-9]{3,9}$/.test(value);
    }, "유효하지 않은 메뉴ID 입니다.");

    jQuery.validator.addMethod("validMenuNm", function (value, element) {
        return /^[가-힣a-zA-Z0-9\s]{1,10}$/.test(value);
    }, "유효하지 않은 메뉴명 입니다.");

    jQuery.validator.addMethod("validMberId", function (value, element) {
        return /^[a-z][a-z0-9]{5,11}$/.test(value);
    }, "유효하지 않은 아이디입니다.");

    jQuery.validator.addMethod("validMberNm", function (value, element) {
        return /^[가-힣a-zA-Z]{2,20}$/.test(value);
    }, "유효하지 않은 이름입니다.");

    jQuery.validator.addMethod("validMbtlnum", function (value, element) {
        return /^(010)\d{8}$/.test(value);
    }, "유효하지 않은 핸드폰번호입니다.");

    jQuery.validator.addMethod("validMenuId", function (value, element) {
        return /^[a-z][a-z0-9]{3,9}$/.test(value);
    }, "유효하지 않은 메뉴ID 입니다.");

    jQuery.validator.addMethod("validMenuNm", function (value, element) {
        return /^[가-힣a-zA-Z0-9\s]{1,10}$/.test(value);
    }, "유효하지 않은 메뉴명 입니다.");

    jQuery.validator.addMethod("validOrgId", function (value, element) {
        return /^[a-z][a-z0-9]{3,9}$/.test(value);
    }, "유효하지 않은 부서ID 입니다.");

    jQuery.validator.addMethod("validOrgNm", function (value, element) {
        return /^[가-힣a-zA-Z0-9\s]{1,10}$/.test(value);
    }, "유효하지 않은 부서명 입니다.");

    jQuery.validator.addMethod('fileMbSize', function (value, element, param) {
        let size = 0;
        for(let i = 0; i < element.files.length; i++) {
            size += element.files[i].size
        }
        size = size / (1024 * 1024);
        return param >= size
    }, '파일은 최대 {0} MB 사이즈까지 허용합니다.');

    jQuery.validator.addMethod('fileKbSize', function (value, element, param) {
        let size = 0;
        for(let i = 0; i < element.files.length; i++) {
            size += element.files[i].size
        }
        size = size / (1024);
        return param >= size
    }, '파일은 최대 {0} KB 사이즈까지 허용합니다.');

    jQuery.validator.addMethod('fileCount', function (value, element, param) {
        return param >= element.files.length
    }, '파일은 최대 {0}개 허용합니다.');

    jQuery.validator.addMethod('editor', function (value, element, param) {
        return !isEmpty(getEditorData())
    }, '내용을 입력해주세요.');

    jQuery.validator.addMethod('compareDate', function (value, element, param) {
        return value > $(param).val();
    }, '시작날짜는 종료날짜 이후여야 합니다.')

    jQuery.validator.addMethod('cellOneYear', function (value, element, param) {
        const stDt = new Date($(param).val());
        const endDt = new Date(value);
        const timeDiff = Math.abs(endDt.getTime() - stDt.getTime());
        // 두 날짜의 차이를 일 단위로 변환
        const daysDiff = timeDiff / (1000 * 60 * 60 * 24);
        // 365일이 넘어갈 경우 true 반환
        return !(daysDiff > 365);
    }, '검색날짜 범위는 최대 1년까지 허용합니다.')

    jQuery.validator.addMethod('future', function (value, element, param) {
        return formatDate(new Date(value))>= formatDate(new Date());
    }, '시작날짜는 최소 지금이후여야 합니다.')
    jQuery.validator.addMethod("validProgrmNm", function (value, element) {
        return /^[가-힣a-zA-Z0-9]{2,20}$/.test(value);
    }, "유효하지 않은 프로그램명입니다.");

    jQuery.validator.addMethod('isInteger', function (value, element, param) {
        console.log(Number.isInteger(Number(value)));
        return Number.isInteger(Number(value));
    }, "정수를 입력해주세요.");

    jQuery.validator.addMethod("validRoleCode", function (value, element) {
        return /^ROLE_[A-Z0-9]+$/.test(value);
    }, "유효하지 않은 롤코드입니다.");

    jQuery.validator.addMethod("validRoleNm", function (value, element) {
        return /^[a-zA-Z0-9가-힣]{2,20}$/.test(value);
    }, "유효하지 않은 롤명입니다.");

    jQuery.validator.addMethod("validRequstSj", function (value, element) {
        return /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s!@#$%^&*()?.]{2,50}$/.test(value);
    }, "유효하지 않은 제목입니다.");

    jQuery.validator.addMethod("validRequstCn", function (value, element) {
        return /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s!@#$%^&*()?.]{1,2000}$/.test(value);
    }, "유효하지 않은 내용입니다.");

    jQuery.validator.addMethod("fileUpdate", function (value, element, param) {
        return param >= (element.files.length + $('input[name="atchFile"]').length) ;
    }, "잘못된 파일 업데이트 방식입니다.");

    jQuery.validator.addMethod("validIpAdres", function (value, element, param) {
        return /^([0-9]{1,3}\.){3}[0-9]{1,3}(\/([0-9]|[1-2][0-9]|3[0-2]))?$/.test(value);
    }, "잘못된 IP주소입니다.");
});