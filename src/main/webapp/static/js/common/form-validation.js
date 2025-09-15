'use strict';

/*-- 관리자 시스템 > 시스템관리 --*/

/*-- 메뉴 관리 --*/
let fvMenuInstance = null;

window.initFvMenu = function () {
    const menuFormElement = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.menu;

    const fvMenu = FormValidation.formValidation(menuFormElement, {
        fields: {
            formValidationMenuId: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            if (!isNewMenu) return true;

                            const value = input.value.trim();

                            if (!value) {
                                return {valid: false, message: msg.menuIdRequired};
                            }

                            if (value.length < 4 || value.length > 15) {
                                return {
                                    valid: false,
                                    message: msg.menuIdLength
                                };
                            }

                            if (/^[0-9]/.test(value)) {
                                return {valid: false, message: msg.menuIdStartWithLowercase};
                            }

                            if (!/^[a-z][a-z0-9]{3,15}$/.test(value)) {
                                return {valid: false, message: msg.menuIdInvalid};
                            }

                            if (isSubmitAttempted && !isIdDupAttempted) {
                                return {valid: false, message: msg.menuIdDupCheckRequired};
                            }

                            if (isIdDupAttempted && !isIdChecked) {
                                return {valid: false, message: msg.menuIdDuplicated};
                            }

                            return true;
                        }
                    }
                }
            },
            formValidationMenuNm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value;

                            if (!value || value.trim() === '') {
                                return {valid: false, message: msg.menuNmRequired};
                            }

                            if (value.length < 1 || value.length > 20) {
                                return {
                                    valid: false,
                                    message: msg.menuNmLength
                                };
                            }

                            /*if (!/^[가-힣a-zA-Z0-9\s]{1,10}$/.test(value)) {
                                return {valid: false, message: msg.menuNmInvalid};
                            }*/

                            return true;
                        }
                    }
                }
            },
            formValidationMenuOrdr: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value;
                            const num = Number(value);

                            if (!value || isNaN(num)) {
                                return {valid: false, message: msg.menuOrdrRequired};
                            }

                            if (num < 1) {
                                return {
                                    valid: false,
                                    message: msg.menuOrdrMin
                                };
                            }
                            if (num > 99) {
                                return {
                                    valid: false,
                                    message: msg.menuOrdrMax
                                };
                            }

                            return true;
                        }
                    }
                }
            },
            formValidationUrl: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value;
                            const menuTy = document.querySelector('input[name="menuTy"]:checked')?.value;

                            if (menuTy === 'LINK' && !value) {
                                return {valid: false, message: msg.urlRequired};
                            }

                            if (menuTy === 'LINK' && value) {
                                try {
                                    new URL(value);
                                } catch (_) {
                                    return {valid: false, message: msg.urlInvalidFormat};
                                }
                            }

                            if (menuTy === 'CNTNTS' && !value) {
                                return {valid: false, message: msg.urlSelectContent};
                            }

                            if (menuTy === 'BBS' && !value) {
                                return {valid: false, message: msg.urlSelectBbs};
                            }

                            if (menuTy === 'PROGRM' && !value) {
                                return {valid: false, message: msg.urlSelectProgram};
                            }

                            if (value.length > 200) {
                                return {valid: false, message: msg.urlMaxlength};
                            }

                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger({
                event: 'input blur change keyup'
            }),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvMenuInstance = fvMenu;
}


/*-- 회원 관리 --*/
let fvMbrInstance = null;

window.initFvMbr = function () {
    const mbrFormElement = document.getElementById('mbrForm');
    const msg = VALIDATION_MESSAGES.member;

    const fvMbr = FormValidation.formValidation(mbrFormElement, {
        fields: {
            id: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (typeof isUpdatePage !== "undefined" && isUpdatePage) return true;

                            if (!value) {
                                return {valid: false, message: msg.idRequired};
                            }

                            if (!/^[a-z]/.test(value)) {
                                return {valid: false, message: msg.idStartLowercase};
                            }

                            if (!/[0-9]/.test(value)) {
                                return {valid: false, message: msg.idMustContainNumber};
                            }

                            if (value.length < 6 || value.length > 12) {
                                return {valid: false, message: msg.idLengthInvalid};
                            }

                            const reserved = ['admin', 'administrator', 'root', 'system'];
                            for (const word of reserved) {
                                if (value.toLowerCase().includes(word)) {
                                    return {valid: false, message: msg.idReserved};
                                }
                            }

                            if (isSubmitAttempted && !isIdDupAttempted) {
                                return {valid: false, message: msg.idDupCheckRequired};
                            }

                            if (isIdDupAttempted && !isIdChecked) {
                                return {valid: false, message: msg.idDuplicated};
                            }

                            return true;
                        }
                    }
                }
            },
            mbrNm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (!value) {
                                return {valid: false, message: msg.nameRequired};
                            }

                            if (!/^[가-힣]{2,6}$/.test(value)) {
                                return {valid: false, message: msg.nameInvalid};
                            }

                            return true;
                        }
                    }
                }
            },
            emlAddr: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (typeof isUpdatePage !== "undefined" && isUpdatePage && value === initEmail) {
                                return true;
                            }

                            if (!value) {
                                return {valid: false, message: msg.emailRequired};
                            }

                            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                            if (!emailRegex.test(value)) {
                                return {valid: false, message: msg.emailInvalid};
                            }

                            if (isSubmitAttempted && !isEmailDupAttempted) {
                                return {valid: false, message: msg.emailDupCheckRequired};
                            }

                            if (isEmailDupAttempted && !isEmailChecked) {
                                return {valid: false, message: msg.emailDuplicated};
                            }

                            return true;
                        }
                    }
                }
            },
            pswd: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value;

                            if (!value && typeof isUpdatePage !== "undefined" && isUpdatePage) {
                                return true;
                            }

                            if (!value) {
                                return {valid: false, message: msg.passwordRequired};
                            }

                            // 1. 길이 체크
                            if (value.length < 8 || value.length > 20) {
                                return {valid: false, message: msg.passwordLength};
                            }

                            // 2. 영문자, 숫자, 특수문자 포함 확인
                            const hasLetter = /[a-zA-Z]/.test(value);
                            const hasNumber = /[0-9]/.test(value);
                            const hasSpecial = /[~!@#$%^&*?]/.test(value);

                            if (!(hasLetter && hasNumber && hasSpecial)) {
                                return {valid: false, message: msg.passwordComplexity};
                            }

                            // 3. 3자리 이상 반복 문자 금지 (aaa, 111 등)
                            if (/([a-zA-Z0-9~!@#$%^&*?])\1\1/.test(value)) {
                                return {valid: false, message: msg.passwordRepeat};
                            }

                            // 4. 3자리 이상 연속 문자/숫자 금지
                            const sequences = 'abcdefghijklmnopqrstuvwxyz0123456789';
                            const reverseSequences = sequences.split('').reverse().join('');

                            for (let i = 0; i < value.length - 2; i++) {
                                const substr = value.substring(i, i + 3).toLowerCase();
                                if (sequences.includes(substr) || reverseSequences.includes(substr)) {
                                    return {valid: false, message: msg.passwordSequence};
                                }
                            }

                            return true;
                        }
                    }
                }
            },
            pswdConfirm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const pswd = document.getElementById('pswd').value;
                            const confirm = input.value;

                            if (!pswd && typeof isUpdatePage !== "undefined" && isUpdatePage) {
                                return true;
                            }

                            if (!confirm) {
                                return {valid: false, message: msg.passwordConfirmRequired};
                            }

                            if (pswd !== confirm) {
                                return {valid: false, message: msg.passwordMismatch};
                            }

                            return true;
                        }
                    }
                }
            },
            mblTelno: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (!value) {
                                return {valid: false, message: msg.phoneRequired};
                            }

                            const phoneRegex = /^[0-9]{7,11}$/;
                            if (!phoneRegex.test(value)) {
                                return {valid: false, message: msg.phoneInvalid};
                            }

                            return true;
                        }
                    }
                }
            },
            fxno: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (!value) {
                                return true;
                            }

                            const numericOnly = /^[0-9]+$/.test(value);
                            if (!numericOnly) {
                                return {valid: false, message: msg.faxInvalid};
                            }

                            if (value.length > 20) {
                                return {valid: false, message: msg.faxLength};
                            }

                            return true;
                        }
                    }
                }
            },
            zip: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (!value) {
                                return true;
                            }

                            const zipRegex = /^[0-9]{5}$/;
                            if (!zipRegex.test(value)) {
                                return {valid: false, message: msg.zipInvalid};
                            }

                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger({
                event: 'input blur change keyup'
            }),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvMbrInstance = fvMbr;
}

/*-- 프로그램 관리 --*/
let fvProgramInstance = null;

window.initFvProgram = function () {
    const programForm = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.program;

    const fvProgram = FormValidation.formValidation(programForm, {
        fields: {
            progrmNm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();
                            if (!value) {
                                return {valid: false, message: msg.progrmNmRequired};
                            }
                            if (value.length < 2) {
                                return {valid: false, message: msg.progrmNmMinlength};
                            }
                            if (value.length > 20) {
                                return {valid: false, message: msg.progrmNmMaxlength};
                            }
                            const regex = /^[가-힣a-zA-Z0-9\s·]+$/;
                            if (!regex.test(value)) {
                                return {valid: false, message: msg.progrmNmInvalid};
                            }
                            return true;
                        }
                    }
                }
            },
            progrmUrl: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();
                            if (!value) {
                                return {valid: false, message: msg.progrmUrlRequired};
                            }
                            if (value.length > 100) {
                                return {valid: false, message: msg.progrmUrlMaxlength};
                            }

                            const urlRegex = /^\/([a-zA-Z0-9-]+\/?)*$/;
                            if (!urlRegex.test(value)) {
                                return {valid: false, message: msg.progrmUrlInvalid};
                            }
                            return true;
                        }
                    }
                }
            },
            progrmDc: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();
                            if (value.length > 200) {
                                return {valid: false, message: msg.progrmDcMaxlength};
                            }
                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger({
                event: 'input blur change keyup'
            }),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvProgramInstance = fvProgram;
};

/*-- 권한 관리 --*/
let fvAuthrtInstance = null;

window.initFvAuthrt = function () {
    const authrtForm = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.authrt;

    const fvAuthrt = FormValidation.formValidation(authrtForm, {
            fields: {
                authrtCd: {
                    validators: {
                        callback: {
                            message: '',
                            callback: function (input) {
                                const value = input.value.trim();

                                if (!value) {
                                    return {valid: false, message: msg.authrtCdRequired};
                                }

                                if (value.length > 30) {
                                    return {valid: false, message: msg.authrtCdMaxlength};
                                }

                                const regex = /^[A-Z_]+$/;
                                if (!regex.test(value)) {
                                    return {valid: false, message: msg.authrtCdFormat};
                                }

                                return true;
                            }
                        }
                    }
                },
                authrtNm: {
                    validators: {
                        callback: {
                            message: '',
                            callback: function (input) {
                                const value = input.value.trim();

                                if (!value) {
                                    return {valid: false, message: msg.authrtNmRequired};
                                }

                                if (value.length > 60) {
                                    return {valid: false, message: msg.authrtNmMaxlength};
                                }

                                return true;
                            }
                        }
                    }
                },
                authrtExpln: {
                    validators: {
                        callback: {
                            message: '',
                            callback: function (input) {
                                const value = input.value.trim();

                                if (!value) {
                                    return {valid: false, message: msg.authrtExplnRequired};
                                }

                                if (value.length > 200) {
                                    return {valid: false, message: msg.authrtExplnMaxlength};
                                }

                                return true;
                            }
                        }
                    }
                }
            },
            plugins: {
                trigger: new FormValidation.plugins.Trigger({
                    event: 'input blur change keyup'
                }),
                bootstrap5: new FormValidation.plugins.Bootstrap5({
                    rowSelector: '.form-control-validation',
                    eleInvalidClass: 'is-invalid',
                    eleValidClass: ''
                }),
                autoFocus: new FormValidation.plugins.AutoFocus()
            },
            init: instance => {
                instance.on('plugins.message.placed', function (e) {
                    if (e.element.parentElement.classList.contains('input-group')) {
                        e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                    }
                });
            }
        }
    );

    fvAuthrtInstance = fvAuthrt;
}

/*-- 접근IP관리 --*/
let fvAccessIpInstance = null;

window.initFvAccessIp = function () {
    const ipForm = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.accessIp;

    const fvAccessIp = FormValidation.formValidation(ipForm, {
        fields: {
            ipAdres: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (!value) {
                                return {valid: false, message: msg.ipRequired};
                            }

                            const ipRegex = /^(25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)){3}$/;
                            if (!ipRegex.test(value)) {
                                return {valid: false, message: msg.ipInvalid};
                            }

                            return true;
                        }
                    }
                }
            },
            ipDc: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();

                            if (value.length > 200) {
                                return {valid: false, message: msg.ipDcMaxlength};
                            }

                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger({
                event: 'input blur change keyup'
            }),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvAccessIpInstance = fvAccessIp;
}


/*-- 관리자 시스템 > 운영관리 --*/

/*-- 배너관리 --*/
let fvBannerInstance = null;

window.initFvBanner = function () {
    const form = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.banner;

    const fvBanner = FormValidation.formValidation(form, {
        fields: {
            bannerNm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const val = input.value.trim();
                            if (!val) return {valid: false, message: msg.bannerNmRequired};
                            if (val.length > 60) return {valid: false, message: msg.bannerNmMaxlength};
                            return true;
                        }
                    }
                }
            },
            url: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const val = input.value.trim();

                            if (!val) return true;

                            if (val && val.length > 200) {
                                return {valid: false, message: msg.urlMaxlength};
                            }

                            try {
                                new URL(val);
                            } catch (_) {
                                return {valid: false, message: msg.urlInvalidFormat};
                            }

                            return true;
                        }
                    }
                }
            },
            sortOrder: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const val = input.value;
                            if (!val) return {valid: false, message: msg.sortOrderRequired};
                            if (isNaN(val) || Number(val) < 0) return {valid: false, message: msg.sortOrderInvalid};
                            return true;
                        }
                    }
                }
            },
            bannerSeCode: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            if (!input.value) return {valid: false, message: msg.bannerSeCodeRequired};
                            return true;
                        }
                    }
                }
            },
            ntceBgnde: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const start = input.value.trim();
                            const end = document.getElementById('ntceEndde')?.value.trim();

                            if (!start) {
                                return {valid: false, message: msg.ntceBgndeRequired};
                            }

                            if (end && !isStartDateBeforeEndDate(start, end)) {
                                return {valid: false, message: msg.ntceRangeInvalid};
                            }

                            return true;
                        }
                    }
                }
            },
            ntceEndde: {
                validators: {
                    notEmpty: {
                        message: msg.ntceEnddeRequired
                    }
                }
            },
            webBanner: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const fileInput = input.element || document.getElementById('webBanner');
                            const file = fileInput?.files?.[0];

                            if (!file) {
                                if (typeof isUpdatePage !== "undefined" && isUpdatePage) return true;

                                return {
                                    valid: false,
                                    message: VALIDATION_MESSAGES.banner.webBannerRequired
                                };
                            }
                            if (!isImgFile(file)) {
                                return {valid: false, message: msg.webBannerInvalidType};
                            }
                            if (!isFileSizeUnderKb(file, 700)) {
                                return {valid: false, message: msg.webBannerTooLarge};
                            }
                            return true;
                        }
                    }
                }
            },
            mobBanner: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const fileInput = input.element || document.getElementById('mobBanner');
                            const file = fileInput?.files?.[0];

                            if (!file) {
                                if (typeof isUpdatePage !== "undefined" && isUpdatePage) return true;

                                return {valid: false, message: msg.mobBannerRequired};
                            }
                            if (!isImgFile(file)) {
                                return {valid: false, message: msg.mobBannerInvalidType};
                            }
                            if (!isFileSizeUnderKb(file, 700)) {
                                return {valid: false, message: msg.mobBannerTooLarge};
                            }
                            return true;
                        }
                    }
                }
            },
            dc: {
                validators: {
                    stringLength: {
                        max: 50,
                        message: msg.authrtExplnMaxlength
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvBannerInstance = fvBanner;
}

/*-- 팝업관리 --*/
let fvPopupInstance = null;

window.initFvPopup = function () {
    const form = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.popup;

    const fvPopup = FormValidation.formValidation(form, {
        fields: {
            popupNm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const val = input.value.trim();
                            if (!val) return {valid: false, message: msg.popupNmRequired};
                            if (val.length > 60) return {valid: false, message: msg.popupNmMaxlength};
                            return true;
                        }
                    }
                }
            },
            url: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const val = input.value.trim();

                            if (!val) return true;

                            if (val && val.length > 200) {
                                return {valid: false, message: msg.urlMaxlength};
                            }

                            try {
                                new URL(val);
                            } catch (_) {
                                return {valid: false, message: msg.urlInvalidFormat};
                            }

                            return true;
                        }
                    }
                }
            },
            sortOrdr: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const val = input.value;
                            if (!val) return {valid: false, message: msg.sortOrdrRequired};
                            if (isNaN(val) || Number(val) < 0) {
                                return {valid: false, message: msg.sortOrdrInvalid};
                            }
                            return true;
                        }
                    }
                }
            },
            ntceBgnde: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const start = input.value.trim();
                            const end = document.getElementById('ntceEndde')?.value.trim();

                            if (!start) {
                                return {valid: false, message: msg.ntceBgndeRequired};
                            }

                            if (end && !isStartDateBeforeEndDate(start, end)) {
                                return {valid: false, message: msg.ntceRangeInvalid};
                            }

                            return true;
                        }
                    }
                }
            },
            ntceEndde: {
                validators: {
                    notEmpty: {
                        message: msg.ntceEnddeRequired
                    }
                }
            },
            imgFile: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const fileInput = input.element || document.getElementById('imgFile');
                            const file = fileInput?.files?.[0];
                            if (!file) {
                                if (typeof isUpdatePage !== "undefined" && isUpdatePage) return true;

                                return {valid: false, message: msg.imgFileRequired};
                            }
                            if (!isImgFile(file)) {
                                return {valid: false, message: msg.imgFileInvalidType};
                            }
                            if (!isFileSizeUnderKb(file, 800)) {
                                return {valid: false, message: msg.imgFileTooLarge};
                            }
                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvPopupInstance = fvPopup;
};


let fvBbsInstance = null;

window.initFvBbs = function () {
    const form = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.bbs;

    const fvBbs = FormValidation.formValidation(form, {
        fields: {
            bbsNm: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();
                            if (value === '') {
                                return {
                                    valid: false,
                                    message: msg.bbsNmRequired
                                };
                            }
                            if (value.length > 255) {
                                return {
                                    valid: false,
                                    message: msg.bbsNmLength
                                };
                            }
                            return true;
                        }
                    }
                }
            },
            bbsTyCode: {
                validators: {
                    notEmpty: {
                        message: msg.bbsTyCodeRequired
                    }
                }
            },
            fileAtchCo: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value;
                            if (value === '') {
                                return {
                                    valid: false,
                                    message: msg.fileAtchCoRequired
                                };
                            }
                            if (parseInt(value) > 10) {
                                return {
                                    valid: false,
                                    message: msg.fileAtchCoMax
                                };
                            }
                            return true;
                        }
                    }
                }
            },
            fileAtchSize: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value;
                            if (value === '') {
                                return {
                                    valid: false,
                                    message: msg.fileAtchSizeRequired
                                };
                            }
                            const number = parseInt(value);
                            if (number < 0 || number > 50) {
                                return {
                                    valid: false,
                                    message: msg.fileAtchSizeRange
                                };
                            }
                            return true;
                        }
                    }
                }
            },
            permExtsn: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();
                            const banned = ['sh', 'bat', 'exe', 'vbs', 'js', 'docm', 'xlsm', 'pptm', 'rar'];
                            if (value === '') {
                                return {
                                    valid: false,
                                    message: msg.permExtsnRequired
                                };
                            }
                            if (value.length > 200) {
                                return {
                                    valid: false,
                                    message: msg.permExtsnLength
                                };
                            }
                            const extList = value.split(',').map(ext => ext.trim().toLowerCase());
                            if (extList.some(ext => banned.includes(ext))) {
                                return {
                                    valid: false,
                                    message: msg.permExtsnBanned
                                };
                            }
                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvBbsInstance = fvBbs;
};


let fvCntntsInstance = null;

window.initFvCntnts = function () {
    const form = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.cntnts;

    const fv = FormValidation.formValidation(form, {
        fields: {
            cntntsNm: {
                validators: {
                    notEmpty: {
                        message: msg.cntntsNmRequired
                    }
                }
            },
            cntntsDc: {
                validators: {
                    stringLength: {
                        max: 200,
                        message: msg.cntntsDcMaxlength
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvCntntsInstance = fv;
};

let fvNttInstance = null;

window.initFvNtt = function () {
    const form = document.getElementById('frm');
    const msg = VALIDATION_MESSAGES.ntt;

    const fvNtt = FormValidation.formValidation(form, {
        fields: {
            nttSj: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const value = input.value.trim();
                            if (value === '') {
                                return {valid: false, message: msg.nttSjRequired};
                            }
                            if (value.length > 2000) {
                                return {valid: false, message: msg.nttSjTooLong};
                            }
                            return true;
                        }
                    }
                }
            },
            files: {
                validators: {
                    callback: {
                        message: '',
                        callback: function (input) {
                            const fileInput = input.element || document.getElementById('files');
                            const files = fileInput?.files;
                            const maxCount = parseInt($('#fileAtchCo').val(), 10) || 0;
                            const maxSizeMB = parseFloat($('#fileAtchSize').val()) || 0;
                            const extStr = $('#permExtsn').val() || '';
                            const allowedExts = extStr.split(',').map(ext => ext.trim().toLowerCase());
							const fileAt = $('#fileAt').val() || 'N';

                            if (fileAt == 'Y' && (!files || files.length === 0)) {
                                return {
									valid: false,
                                    message: VALIDATION_MESSAGES.ntt.fileRequired
								};
                            }

                            if (files.length > maxCount) {
                                return {
                                    valid: false,
                                    message: VALIDATION_MESSAGES.ntt.fileCountExceeded.replace('{0}', maxCount)
                                };
                            }

                            let totalSize = 0;
                            for (let i = 0; i < files.length; i++) {
                                const file = files[i];
                                const ext = file.name.split('.').pop().toLowerCase();

                                if (!allowedExts.includes(ext)) {
                                    return {
                                        valid: false,
                                        message: VALIDATION_MESSAGES.ntt.fileTypeInvalid.replace('{0}', allowedExts.join(', '))
                                    };
                                }

                                totalSize += file.size;
                            }

                            if (totalSize > maxSizeMB * 1024 * 1024) {
                                return {
                                    valid: false,
                                    message: VALIDATION_MESSAGES.ntt.fileSizeExceeded.replace('{0}', maxSizeMB)
                                };
                            }

                            return true;
                        }
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        },
        init: instance => {
            instance.on('plugins.message.placed', function (e) {
                if (e.element.parentElement.classList.contains('input-group')) {
                    e.element.parentElement.insertAdjacentElement('afterend', e.messageElement);
                }
            });
        }
    });

    fvNttInstance = fvNtt;
};


/*-- 지도 마커 관리 --*/
let fvMapmarkerInstance = null;

window.initFvMapmarker = function () {
    const mapmarkerFormElement = document.getElementById('mapmarkerForm');
    if (!mapmarkerFormElement) return;
    
    const msg = VALIDATION_MESSAGES.mapmarker;

    const fvMapmarker = FormValidation.formValidation(mapmarkerFormElement, {
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: msg.nameRequired
                    },
                    stringLength: {
                        max: 255,
                        message: msg.nameTooLong
                    }
                }
            },
            roadAddress: {
                validators: {
                    notEmpty: {
                        message: msg.roadAddressRequired
                    }
                }
            },
            categoryCode1: {
                validators: {
                    notEmpty: {
                        message: msg.categoryCode1Required
                    }
                }
            }
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap5: new FormValidation.plugins.Bootstrap5({
                rowSelector: '.form-control-validation',
                eleInvalidClass: 'is-invalid',
                eleValidClass: ''
            }),
            autoFocus: new FormValidation.plugins.AutoFocus()
        }
    });
    fvMapmarkerInstance = fvMapmarker;
};


/*------- Utils -------*/

/*-- 해당 필드에 성공 메시지 출력 --*/
function showSuccessMessage(fieldId, message) {
    const input = document.getElementById(fieldId);
    if (!input) return;

    const container = input.closest('.form-control-validation');
    if (!container) return;

    const msgContainer = container.querySelector('.fv-plugins-message-container');
    if (!msgContainer) return;

    msgContainer.classList.remove('invalid-feedback');
    msgContainer.classList.add('valid-feedback');
    msgContainer.innerHTML = `<div class="fv-help-block valid">${message}</div>`;

    input.classList.remove('is-invalid');
    input.classList.add('is-valid');
}

/*-- 성공 메시지 제거 --*/
function clearValidationMessage(fieldId) {
    const input = document.getElementById(fieldId);
    if (!input) return;

    const container = input.closest('.form-control-validation');
    if (!container) return;

    const msgContainer = container.querySelector('.fv-plugins-message-container');
    if (!msgContainer) return;

    msgContainer.classList.remove('valid-feedback');
    msgContainer.classList.add('invalid-feedback');
    msgContainer.innerHTML = '';

    input.classList.remove('is-valid');
    input.classList.add('is-invalid');
}

/*-- 해당 필드에 실패 메시지 출력 --*/
function showInlineError(fieldId, message) {
    const container = document.getElementById(fieldId).closest('.form-control-validation');
    if (!container) return;

    const msgContainer = container.querySelector('.fv-plugins-message-container');
    if (!msgContainer) return;

    msgContainer.classList.add('invalid-feedback');
    msgContainer.innerHTML = `<div class="fv-help-block invalid">${message}</div>`;

    const target = document.getElementById(fieldId);
    target.classList.add('is-invalid');
}

/*-- 실패 메시지 제거 --*/
function clearInlineError(fieldId) {
    const container = document.getElementById(fieldId).closest('.form-control-validation');
    if (!container) return;

    const msgContainer = container.querySelector('.fv-plugins-message-container');
    if (!msgContainer) return;

    msgContainer.classList.remove('invalid-feedback');
    msgContainer.innerHTML = '';

    const target = document.getElementById(fieldId);
    target.classList.remove('is-invalid');
}


/*-- Quill Editor 검증 --*/
function validateQuill(editorInstance, requiredMessage) {
    if (!editorInstance) return false;

    const contentHtml = editorInstance.getSemanticHTML();
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = contentHtml;
    const plainText = tempDiv.textContent.trim();

    if (plainText === '') {
        if (typeof requiredMessage === 'string') {
            showInlineError('quill-editor-group', requiredMessage);
        }
        editorInstance.focus();
        return false;
    }

    clearInlineError('quill-editor-group');
    return true;
}
