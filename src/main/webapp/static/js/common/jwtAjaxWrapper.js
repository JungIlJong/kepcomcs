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

let setToken = function (xhr) {
    let csrfToken = document.querySelector('meta[name="anticsrf"]').getAttribute('content');
    let csrfHeader = document.querySelector('meta[name="anticsrf_header"]').getAttribute('content');

    if(csrfToken.length === 0 || csrfHeader.length === 0) {
        return;
    }

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
    baseAjax(url, $.extend(defaultPostOptions, extendOptions, {beforeSend: setToken}), successCallback, failCallback, defaultValue);
}

let uploadAjax = function (url, successCallback, failCallback, extendOptions, defaultValue) {
    baseAjax(url, $.extend(defaultUploadOptions, extendOptions, {beforeSend: setToken}), successCallback, failCallback, defaultValue);
}

let Ajax = {
    get: getAjax,
    post: postAjax,
    upload: uploadAjax
};