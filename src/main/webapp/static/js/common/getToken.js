let dvcPushToken = '';

function getOperatingSystem() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;

    // iOS 기기인지 확인
    if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream) {
        return "iOS";
    }

    // Android 기기인지 확인
    if (/android/i.test(userAgent)) {
        return "Android";
    }

    return "Unknown"; // 다른 OS는 Unknown 반환
}

const os = getOperatingSystem();

if (os === "Android") {
    // 파라미터 : 토큰을 처리할 콜백함수 이름
    Android.getFcmToken('tokenCallback');
}

if (os === "iOS") {
    let postMsg = {
        'action': 'getFcmToken',
        // 토큰을 처리할 콜백함수 이름
        'callback': 'tokenCallback'
    };
    webkit.messageHandlers.vstNetInterface.postMessage(postMsg)
}

function tokenCallback(token) {
    dvcPushToken = token;
}