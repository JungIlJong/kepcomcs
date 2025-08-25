/**
 * 공통 Ajax 정의
 * @author: 박규영
 * @since 2024.02.01
 */
let defaultGetOptions = {
    method: 'GET',
    contentType: 'text/plain; charset=UTF-8',
}

let defaultPostOptions = {
    method: 'POST',
    contentType: 'application/json; charset=utf-8',
    dataType: 'json'
}

let defaultUploadOptions = {
    method: 'POST',
    enctype: 'multipart/form-data',
    contentType: false,
    processData: false
}

let setCsrfHeaders = function (xhr) {
    let csrfToken = document.querySelector('meta[name="anticsrf"]').getAttribute('content');
    let csrfHeader = document.querySelector('meta[name="anticsrf_header"]').getAttribute('content');
    xhr.setRequestHeader(csrfHeader, csrfToken);
}

let commonErrorCallback = function (jqXHR, textStatus, errorThrown, defaultValue) {
    defaultFailCallback.call(jqXHR, textStatus, errorThrown);
};

let defaultFailCallback = function (response, status, error) {
    console.log(response + " : " + status + " : " + error);
};

let baseAjax = function (url, options, successCallback, failCallback, defaultValue) {
    let callBack = function (data) {
        if (data !== undefined) {
            successCallback.call(this, data, defaultValue);
        }  else {
            failCallback === undefined ? defaultFailCallback.call(data, this, defaultValue) : failCallback.call(data, this, defaultValue);
        }
    };

    $.ajax(url, options)
        .done(callBack)
        .fail(failCallback === undefined ? commonErrorCallback : failCallback);
}

let getAjax = function (url, successCallback, failCallback, extendOptions, defaultValue) {
    baseAjax(url, $.extend(defaultGetOptions, extendOptions), successCallback, failCallback, defaultValue);
}

let postAjax = function (url, successCallback, failCallback, extendOptions, defaultValue) {
    baseAjax(url, $.extend(defaultPostOptions, extendOptions, {beforeSend: setCsrfHeaders}), successCallback, failCallback, defaultValue);
}

let uploadAjax = function (url, successCallback, failCallback, extendOptions, defaultValue) {
    baseAjax(url, $.extend(defaultUploadOptions, extendOptions, {beforeSend: setCsrfHeaders}), successCallback, failCallback, defaultValue);
}

/**
 * async/await 기반 Ajax Wrapper (CSRF는 setCsrfHeaders 함수 활용)
 */
const asyncAjaxWrapper = async (url, options = {}) => {
    // CSRF 처리: setCsrfHeaders 함수 활용
    if (options.method && options.method.toUpperCase() === 'POST') {
        // setCsrfHeaders는 xhr 객체에 헤더를 추가하는 함수이므로, 값을 추출해 직접 headers에 세팅
        let csrfToken, csrfHeader;
        try {
            csrfToken = document.querySelector('meta[name="anticsrf"]').getAttribute('content');
            csrfHeader = document.querySelector('meta[name="anticsrf_header"]').getAttribute('content');
        } catch (e) {
            // 메타 태그가 없을 경우 무시
        }
        if (csrfToken && csrfHeader) {
            if (!options.headers) options.headers = {};
            options.headers[csrfHeader] = csrfToken;
        }
    }
    try {
        const response = await fetch(url, options);
        const contentType = response.headers.get('content-type');
        let data;
        if (contentType && contentType.includes('application/json')) {
            data = await response.json();
        } else {
            data = await response.text();
        }
        if (!response.ok) {
            throw { response, data };
        }
        return data;
    } catch (err) {
        if (err.response) {
            console.log(err.response.status + ' : ' + err.response.statusText + ' : ' + (err.data || ''));
        } else {
            console.log(err);
        }
        throw err;
    }
};

const asyncAjaxGet = async (url, extendOptions = {}) => {
    const options = Object.assign({}, defaultGetOptions, extendOptions, { method: 'GET' });
    return asyncAjaxWrapper(url, options);
};

const asyncAjaxPost = async (url, body = {}, extendOptions = {}) => {
    const options = Object.assign({}, defaultPostOptions, extendOptions, {
        method: 'POST',
        body: JSON.stringify(body)
    });
    return asyncAjaxWrapper(url, options);
};

const asyncAjaxUpload = async (url, formData, extendOptions = {}) => {
    // formData는 FormData 객체여야 함
    const options = Object.assign({}, defaultUploadOptions, extendOptions, {
        method: 'POST',
        body: formData
    });
    return asyncAjaxWrapper(url, options);
};

let Ajax = {
    get: getAjax,
    post: postAjax,
    upload: uploadAjax,
    async: {
        get: asyncAjaxGet,
        post: asyncAjaxPost,
        upload: asyncAjaxUpload
    }
};