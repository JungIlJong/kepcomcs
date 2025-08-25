\<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light">
<head>
    <title>알림</title>
</head>
<body>
</body>
<script>
    // URL 파라미터에서 코드 가져오기
    const getUrlParameter = (name) => {
        const url = window.location.search;
        const regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        const results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    };

    const code = getUrlParameter('code');

    // 계정 상태별 코드와 메시지 정의
    const codeMap = {
        'joinSuccess': '회원가입에 성공하였습니다. 관리자 승인 후 서비스 이용이 가능합니다.',
        'A': '회원님의 계정은 현재 승인 대기 상태입니다. 승인이 완료되면 서비스를 이용하실 수 있습니다.',
        'B': '회원님의 계정이 차단되었습니다. 자세한 내용은 관리자에게 문의해 주세요.',
        'D': '회원 탈퇴가 완료되었습니다. 그동안 서비스를 이용해 주셔서 감사합니다.',
        'error': '오류가 발생했습니다. 잠시 후 다시 시도해 주세요.'
    };

    // 추가 정보가 필요한 경우 처리 (예: 차단 해제 날짜)
    const additionalInfo = getUrlParameter('info');

    // 코드에 해당하는 메시지 표시
    if (code && codeMap[code]) {
        let message = codeMap[code];

        // 추가 정보가 있는 경우 메시지에 추가
        if (additionalInfo && code === 'tempBlocked') {
            message += additionalInfo;
        }

        alert(message);
    }

    // 특정 상태에서는 리디렉션 방지 (예: 차단된 계정)
    // const blockRedirectCodes = ['blocked', 'tempBlocked'];
    // if (!code || !blockRedirectCodes.includes(code)) {
    //     location.href = '/index';
    // } else {
    //     location.href = '/login';
    // }
</script>
</html>
