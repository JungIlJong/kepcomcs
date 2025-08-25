/**
 * 공통 함수 정의
 * @author: 박규영
 * @since 2024.02.01
 */
(function (g) {
    'use strict';

    /* ───── ① 내부 구현 (private) ───── */
    const isEmpty = arg => {
        try {
            return arg == null || arg == undefined || (arg + '').trim() === '';
        } catch (_) {
            return true;
        }
    };

    const goPage = url => {
        location.href = url;
    };

    const goBack = () => {
        window.history.back();
    };

    const reload = () => {
        location.reload();
    };

    const bindingData = form => {
        const obj = {};
        $.each($(form).find("input, select, textarea"), function (i, v) {
            if ($(this).attr("type") === "radio") {
                if ($(this).is(":checked")) {
                    obj[$(this).attr("name")] = $(this).val();
                }
            } else {
                if (isEmpty($(this).attr("id"))) return;
                obj[$(this).attr("id")] = $(this).val();
            }
        });

        /**
         *  추가 필요 시
         obj["inform_yn"] = $("input[type=radio][name=inform_yn]:checked").val();
         obj["gubun1"] = $("input[type=radio][name=gubun1]:checked").val();
         */

        return obj;
    };

    const removeAllChild = target => {
        while (target.firstChild) {
            target.removeChild(target.firstChild);
        }
    };

    const dataToQueryString = (url, data) => {
        const queryString = Object.keys(data)
            .map(key => `${encodeURIComponent(key)}=${encodeURIComponent(data[key])}`)
            .join('&');

        return `${url}?${queryString}`;
    };

    const formatDate = date => {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    };

    const formatDateTime = date => {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const hours = String(date.getHours()).padStart(2, '0');
        const minutes = String(date.getMinutes()).padStart(2, '0');

        return `${year}-${month}-${day} ${hours}:${minutes}`;
    };

    const celOneYear = (stDt, endDt) => {
        // 두 날짜의 차이를 밀리초로 계산
        const timeDiff = Math.abs(endDt.getTime() - stDt.getTime());
        // 두 날짜의 차이를 일 단위로 변환
        const daysDiff = timeDiff / (1000 * 60 * 60 * 24);
        // 365일이 넘어갈 경우 true 반환
        return daysDiff > 365;
    };

    const setUrl = url => {
        return url + "?" + new URL(document.location).searchParams.toString();
    };

    const getUrlParameter = paramName => {
        const params = new URL(document.location).searchParams;
        return params.get(paramName);
    };

    const getUrlDepth = () => {
        return document.location.pathname.replace(".vst", "").split("/");
    };

    const addSelectOption = (select, name, value, option) => {
        document.getElementById(select).insertAdjacentHTML('beforeend', `<option ${option} value="${value}">${name}</option>`);
    };

    const inintSelect = (select, number = 0) => {
        $(select).prop('selectedIndex', number).selectric('refresh');
    };

    const formToJSON = formElement => {
        const formData = new FormData(formElement);
        const jsonObject = {};

        for (const [key, value] of formData.entries()) {
            if (jsonObject.hasOwnProperty(key)) {
                // 이미 key가 존재하면 배열로 처리
                if (!Array.isArray(jsonObject[key])) {
                    jsonObject[key] = [jsonObject[key]];
                }
                jsonObject[key].push(value);
            } else {
                jsonObject[key] = value;
            }
        }

        return jsonObject;
    };

    /**
     * 커스텀 Alert 모달 호출 함수
     * @param {Object} options - 모달 설정 옵션
     * @param {string} options.title - 모달 제목 (기본값: '알림')
     * @param {string} options.content - 모달 내용 텍스트
     * @param {string} options.confirmText - 확인 버튼 텍스트 (기본값: '확인')
     * @param {string} options.cancelText - 취소 버튼 텍스트 (기본값: '취소')
     * @param {Function} options.onConfirm - 확인 버튼 클릭 시 실행할 함수
     * @param {boolean} options.showCancel - 취소 버튼 표시 여부 (기본값: true)
     */
    const customAlert = (options = {}) => {
        const {
            title = '알림',
            content = '',
            confirmText = '확인',
            cancelText = '취소',
            onConfirm = null,
            showCancel = true
        } = options;

        // 모달 ID 생성
        const modalId = 'customAlert_' + Date.now();

        // 모달 HTML 생성
        const modalHtml = `
            <div class="modal modal-top fade" id="${modalId}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">${title}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>${content}</p>
                        </div>
                        <div class="modal-footer">
                            ${showCancel ? `<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">${cancelText}</button>` : ''}
                            <button type="button" class="btn btn-primary" id="${modalId}_confirm">${confirmText}</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        // 기존 커스텀 모달 제거
        document.querySelectorAll('[id^="customAlert_"]').forEach(modal => {
            modal.remove();
        });

        // 모달을 body에 추가
        document.body.insertAdjacentHTML('beforeend', modalHtml);

        // 모달 인스턴스 생성 및 표시
        const modalElement = document.getElementById(modalId);
        const modal = new bootstrap.Modal(modalElement);

        // aria-hidden 경고 방지용: 모달이 닫히기 직전 모달 내부에 포커스가 있다면 포커스 해제
        modalElement.addEventListener('hide.bs.modal', function() {
            if (modalElement.contains(document.activeElement)) {
                document.activeElement.blur(); // 이 한 줄이 핵심!
            }
        });

        // 확인 버튼 이벤트 리스너
        const confirmBtn = document.getElementById(modalId + '_confirm');
        confirmBtn.addEventListener('click', function() {
            if (onConfirm && typeof onConfirm === 'function') {
                onConfirm();
            }
            modal.hide();
        });

        // 모달이 완전히 숨겨진 후 DOM에서 제거
        modalElement.addEventListener('hidden.bs.modal', function() {
            modalElement.remove();
        });

        // 모달 표시
        modal.show();
    };

    /**
     * Promise 기반 커스텀 Alert 모달 함수
     * @param {Object} options - 모달 설정 옵션
     * @param {string} options.title - 모달 제목 (기본값: '알림')
     * @param {string} options.content - 모달 내용 텍스트
     * @param {string} options.confirmText - 확인 버튼 텍스트 (기본값: '확인')
     * @param {string} options.cancelText - 취소 버튼 텍스트 (기본값: '취소')
     * @param {boolean} options.showCancel - 취소 버튼 표시 여부 (기본값: true)
     * @returns {Promise<boolean>} 확인(true), 취소(false)
     */
    const customAlertAsync = (options = {}) => {
        const {
            title = '알림',
            content = '',
            confirmText = '확인',
            cancelText = '취소',
            showCancel = true
        } = options;

        return new Promise(resolve => {
            // 모달 ID 생성
            const modalId = 'customAlert_' + Date.now();
            // 모달 HTML 생성
            const modalHtml = `
                <div class="modal modal-top fade" id="${modalId}" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">${title}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>${content}</p>
                            </div>
                            <div class="modal-footer">
                                ${showCancel ? `<button type="button" class="btn btn-label-secondary" id="${modalId}_cancel">${cancelText}</button>` : ''}
                                <button type="button" class="btn btn-primary" id="${modalId}_confirm">${confirmText}</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            // 기존 커스텀 모달 제거
            document.querySelectorAll('[id^="customAlert_"]').forEach(modal => {
                modal.remove();
            });
            // 모달을 body에 추가
            document.body.insertAdjacentHTML('beforeend', modalHtml);
            // 모달 인스턴스 생성 및 표시
            const modalElement = document.getElementById(modalId);
            const modal = new bootstrap.Modal(modalElement);

            // aria-hidden 경고 방지용: 모달이 닫히기 직전 모달 내부에 포커스가 있다면 포커스 해제
            modalElement.addEventListener('hide.bs.modal', function() {
                if (modalElement.contains(document.activeElement)) {
                    document.activeElement.blur();
                }
            });

            // 확인 버튼 이벤트 리스너
            const confirmBtn = document.getElementById(modalId + '_confirm');
            confirmBtn.addEventListener('click', function() {
                resolve(true);
                modal.hide();
            });

            // 취소 버튼 이벤트 리스너
            if (showCancel) {
                const cancelBtn = document.getElementById(modalId + '_cancel');
                cancelBtn.addEventListener('click', function() {
                    resolve(false);
                    modal.hide();
                });
            }
            // 모달이 완전히 숨겨진 후 DOM에서 제거
            modalElement.addEventListener('hidden.bs.modal', function() {
                modalElement.remove();
            });
            // 모달 바깥 클릭/ESC로 닫힐 때도 취소로 처리
            modalElement.addEventListener('hide.bs.modal', function() {
                // 만약 이미 resolve 됐다면 무시
                if (!modalElement.dataset.resolved) {
                    resolve(false);
                    modalElement.dataset.resolved = '1';
                }
            });
            // 확인/취소 버튼 클릭 시 resolve 후 중복 호출 방지
            const safeResolve = val => {
                if (!modalElement.dataset.resolved) {
                    resolve(val);
                    modalElement.dataset.resolved = '1';
                }
            };
            confirmBtn.addEventListener('click', () => safeResolve(true));
            if (showCancel) {
                const cancelBtn = document.getElementById(modalId + '_cancel');
                cancelBtn.addEventListener('click', () => safeResolve(false));
            }
            // 모달 표시
            modal.show();
        });
    };

    /**
     * Sneat Template의 Notiflix를 활용한 Loading 함수들
     */

    /**
     * 페이지 전체 로딩 표시
     * @param {string} message - 표시할 메시지 (선택사항)
     */
    const showLoading = (message) => {
        if (typeof Notiflix !== 'undefined' && Notiflix.Loading) {
            if (message) {
                Notiflix.Loading.standard(message, {
                    backgroundColor: 'rgba(' + (window.Helpers?.getCssVar('black-rgb') || '0, 0, 0') + ', 0.5)',
                    messageColor: window.config?.colors?.white || '#ffffff',
                    svgColor: window.config?.colors?.white || '#ffffff'
                });
            } else {
                Notiflix.Loading.circle({
                    backgroundColor: 'rgba(' + (window.Helpers?.getCssVar('black-rgb') || '0, 0, 0') + ', 0.5)',
                    svgColor: window.config?.colors?.white || '#ffffff'
                });
            }
        } else {
            console.warn('Notiflix Loading library not found');
        }
    };

    /**
     * 페이지 전체 로딩 해제
     */
    const hideLoading = () => {
        if (typeof Notiflix !== 'undefined' && Notiflix.Loading) {
            Notiflix.Loading.remove();
        }
    };

    /**
     * 특정 요소에 블록 UI 적용
     * @param {string} selector - CSS 선택자 또는 요소 ID
     * @param {string} message - 표시할 메시지 (선택사항)
     */
    const showBlockUI = (selector, message) => {
        if (typeof Notiflix !== 'undefined' && Notiflix.Block) {
            if (message) {
                Notiflix.Block.standard(selector, message, {
                    backgroundColor: 'rgba(' + (window.Helpers?.getCssVar('black-rgb') || '0, 0, 0') + ', 0.5)',
                    messageColor: window.config?.colors?.white || '#ffffff',
                    svgColor: window.config?.colors?.white || '#ffffff'
                });
            } else {
                Notiflix.Block.circle(selector, {
                    backgroundColor: 'rgba(' + (window.Helpers?.getCssVar('black-rgb') || '0, 0, 0') + ', 0.5)',
                    svgColor: window.config?.colors?.white || '#ffffff'
                });
            }
        } else {
            console.warn('Notiflix Block library not found');
        }
    };

    /**
     * 특정 요소의 블록 UI 해제
     * @param {string} selector - CSS 선택자 또는 요소 ID
     */
    const hideBlockUI = (selector) => {
        if (typeof Notiflix !== 'undefined' && Notiflix.Block) {
            Notiflix.Block.remove(selector);
        }
    };

    /* ───── ② 공개 API 객체 ───── */
    const api = {
        isEmpty,
        goPage, goBack, reload,
        bindingData, removeAllChild,
        dataToQueryString, formatDate, formatDateTime,
        celOneYear, setUrl, getUrlParameter, getUrlDepth,
        addSelectOption, inintSelect, formToJSON,
        customAlert,
        customAlertAsync,
        // Loading 함수들 추가
        showLoading, hideLoading,
        showBlockUI, hideBlockUI
    };

    /* ───── ③ 전역 호환 레이어───── */
    g.CommonFn = api;          // 새 네임스페이스
    Object.assign(g, api);     // 기존 isEmpty() 방식도 그대로 사용

})(window);
