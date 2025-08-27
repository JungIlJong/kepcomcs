<script src="/static/vendor/sneat/libs/swiper/swiper.js"></script>
<link rel="stylesheet" href="/static/vendor/sneat/libs/swiper/swiper.css" />

<div class="modal fade popup-modal" id="fullscreenModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen" role="document">
        <div class="modal-content">
            <div class="modal-header p-0">
                <div class="form-check popup-day-close">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1"/>
                    <label class="form-check-label" for="defaultCheck1"> 오늘 하루 열지 않기</label>
                </div>
                <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body flex-c">
                <div class="inner w-xl-100 mx-auto">
                    <h1 class="text-center mb-1">POPUPZONE</h1>
                    <div class="pop_num">팝업 총 <span id="popup-count">0</span>건</div>
                    <div class="swiper mySwiper popup-swiper">
                        <div class="swiper-wrapper" id="swiper-wrapper">
                        <%-- 이미지 들어가는 곳 --%>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let init = function (data) {
        if (!data || !Array.isArray(data.data) || data.data.length === 0) {
            return;
        }

        let popupList = data.data;
        let slides = [];

        $('#popup-count').text(data.data.length);

        popupList.forEach(popup => {
            const {
                popupNm,
                url,
                atchFileId
            } = popup;
console.log(popup);
            const imageUrl = '/file/' + atchFileId;
            const safePopupNm = (popupNm || '').replace(/</g, "&lt;").replace(/>/g, "&gt;");
            const hasUrl = url && url.trim() !== '';

            let slideHtml = '<div class="swiper-slide">';
            if (hasUrl) {
                slideHtml += '<a href="' + url + '" target="_blank">';
            }
            slideHtml += '<img src="' + imageUrl + '" alt="' + safePopupNm + '" onerror="this.onerror=null; this.src=\'/static/assets/images/no_image.jpg\';" />';
            if (hasUrl) {
                slideHtml += '</a>';
            }
            slideHtml += '</div>';

            slides.push(slideHtml);
        });

        $('#swiper-wrapper').html(slides.join(''));

        const mainPopupSwiper = new Swiper(".mySwiper", {
            slidesPerView: 3,
            spaceBetween: 30,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            // ✅ 반응형 설정
            breakpoints: {
                // 화면 너비가 992px 이상일 때
                992: {
                    slidesPerView: 3,
                    spaceBetween: 20,
                },
                // 화면 너비가 400px일 때
                500: {
                    slidesPerView: 2,
                    spaceBetween: 10,
                },
                // 화면 너비가 0px 이상일 때
                0: {
                    slidesPerView: 1,
                    spaceBetween: 10,
                },
            },
        });

        $('#fullscreenModal').modal('show');
    }

    let fail = function (xhr, status, error) {
        // alert('<spring:message code="fail.common.msg"/>');
        console.log(xhr + ", " + status + " : " + error)
    }

    $(function () {
        function getCookie(name) {
            const value = "; " + document.cookie;
            const parts = value.split("; " + name + "=");
            if (parts.length === 2) return parts.pop().split(";").shift();
            return null;
        }

        let hidePopup = getCookie("hidePopup");

        if (hidePopup !== 'Y') {
            console.log('?');
//             Ajax.get(setUrl('/api/mber/popups/active-list'), init, fail);
            $.ajax(
        			{
        				method : "get",
        				url : '/api/mber/popups/stop',
        				contentType: "application/json; charset=utf-8",
        				async : false,
        				success : function(data) {
        					init();
        				},
        				error : function(e) {
        					rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
        				}
        			}
        		);
        }

        let doNotShowToday = false;

        $('#defaultCheck1').on('change', function () {
            doNotShowToday = $(this).is(':checked');
        });

        $('#fullscreenModal').on('hide.bs.modal', function () {
            if (doNotShowToday) {
//                 Ajax.get(setUrl('/api/mber/popups/stop'), function () {}, fail);
                $.ajax(
            			{
            				method : "get",
            				url : '/api/mber/popups/stop',
            				contentType: "application/json; charset=utf-8",
            				async : false,
            				success : function(data) {
            				},
            				error : function(e) {
            					rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
            				}
            			}
            		);
            }
            document.activeElement.blur();
        });
    })
</script>
