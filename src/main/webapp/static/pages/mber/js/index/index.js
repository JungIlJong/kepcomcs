$(() => {
    gAjax('/api/banners', renderBanner, () => console.log);
    gAjax('/api/mber/bbs/1', (result) => renderNtt(result, 'boardBody1', '/mber/bscbrd/bscbrd01/bbs/1/detail?id='), () => console.log);
    gAjax('/api/mber/bbs/2', (result) => renderNtt(result, 'boardBody2', '/mber/bscbrd/bscbrd02/bbs/2/detail?id='), () => console.log);
    gAjax('/api/mber/bbs/3', (result) => renderNtt(result, 'boardBody3', '/mber/glrbrd/glrbrd01/bbs/3/detail?id='), () => console.log);
    gAjax('/api/mber/bbs/4', (result) => renderNtt(result, 'boardBody4', '/mber/qnabrd/qnabrd01/bbs/4/detail?id='), () => console.log);
    gAjax('/api/mber/bbs/5', (result) => renderNtt(result, 'boardBody5', '/mber/qnabrd/faq01/bbs/5/detail?id='), () => console.log);
    gAjax('/api/mber/bbs/10', (result) => renderNtt(result, 'boardBody6', '/mber/contpg/bbstyest/bbs/10/detail?id='), () => console.log);
})

const gAjax = function(url, callback, fail) {
	$.ajax(
		{
			method : "get",
			url : url,
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if (typeof callback === "function") {
			        callback(data);
			    }
			},
			error : function(e) {
				console.log("관리자에게 문의바랍니다.");
			}
		});
};

const renderBanner = (result) => {
    const $bannerList = $('#bannerList');
    const $indicatorWrap = $('.carousel-indicators');

    $bannerList.empty(); // 기존 배너 초기화
    $indicatorWrap.empty(); // 기존 dot 초기화

    result.forEach((value, index) => {
        // 반응형 이미지 태그 구성
        const content = `
      <picture class="banner-picture">
        <source media="(max-width: 768px)" srcset="/file/${value.mobId}" />
        <img class="d-block w-100" src="/file/${value.webId}" alt="${index}번째 배너" style="height: 450px" />
      </picture>
    `;

        // 배너 박스 구성
        const bannerItem = `
      <div class="carousel-item ${index === 0 ? 'active' : ''}">
        ${value.url ? `<a href="${value.url}" target="${value.newBrwsAt === 'Y' ? '_blank' : '_self'}">${content}</a>` : content}
      </div>
    `;
        $bannerList.append(bannerItem);

        // 인디케이터 구성
        const indicator = `
      <button
        type="button"
        data-bs-target="#carouselExample"
        data-bs-slide-to="${index}"
        ${index === 0 ? 'class="active" aria-current="true"' : ''}
        aria-label="슬라이드 ${index + 1}"></button>
    `;
        $indicatorWrap.append(indicator);
    });
}

const renderNtt = (result, id, link) => {
    const {data} = result;

    data.forEach((element, i) => {
        // 5개까지 출력
        if (i > 4) {
            return;
        }
        $(`#${id}`).append(
            `<li class="mb-2">
            <a href="${link}${element.id}"
                class="text-heading d-flex justify-content-between align-items-center">
                    <span class="text-truncate me-2 me-lg-4">${element.notice ? '(공지)' : ''} ${element.nttSj}</span>
                    <i class="icon-base bx bx-chevron-right scaleX-n1-rtl text-body-secondary"></i>
            </a>
           </li>`);
    });
}

const renderPopup = (result) => {
    if (!Array.isArray(result)) return;

    result.forEach(popup => {
        const {
            popupId,
            popupNm,
            popupWidthLc,
            popupVrticlLc,
            popupWidthSize,
            popupVrticlSize,
            url,
            atchFileId,
            stopvewSetupAt = 'Y' // 기본값 Y
        } = popup;

        const imageUrl = `/file/${atchFileId}`;
        const windowFeatures = `width=${popupWidthSize},height=${popupVrticlSize},left=${popupWidthLc},top=${popupVrticlLc},resizable=no,scrollbars=no`;

        const popupWindow = window.open('', popupNm, windowFeatures);
        console.log(3);
        if (popupWindow) {
            popupWindow.document.write(`
                <html>
                <head>
                    <title>${popupNm}</title>
                    <style>
                        body {
                            margin: 0;
                            background: transparent;
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            justify-content: center;
                            height: 100vh;
                            color: white;
                            font-family: sans-serif;
                        }
                        img {
                            width: 100%;
                            height: 100%;
                            max-width: 100%;
                            max-height: calc(100% - 40px);
                            object-fit: contain;
                        }
                        .popup-footer {
                            margin-top: 10px;
                            display: flex;
                            align-items: center;
                            gap: 8px;
                            font-size: 14px;
                            color: black;
                        }
                        .popup-footer input {
                            width: 16px;
                            height: 16px;
                            cursor: pointer;
                        }
                    </style>
                </head>
                <body>
                    <img src="${imageUrl}" alt="${popupNm}" onerror="this.onerror=null; this.src='/static/assets/images/no_image.jpg';"
                        ${url ? `onclick="window.open('${url}', '_blank')"` : ''}
                    />
                    ${stopvewSetupAt === 'Y' ? `
                    <div class="popup-footer">
                        <input type="checkbox" id="stopViewToday" />
                        <label for="stopViewToday">하루 동안 보지 않기</label>
                    </div>
                    <script>
                        document.getElementById('stopViewToday').addEventListener('click', async function(e) {
                            console.log(2);
                            if (e.target.checked) {
                                  const response = await fetch('/api/mber/popup/stop?id=${popupId}');
                                  console.log(response);
                                  window.close(); // 팝업 강제 종료
                            }
                        });
                    </script>
                    ` : ''}
                </body>
                </html>
            `);
            popupWindow.document.close();

        } else {
            console.warn(`${popupNm} 팝업이 차단되었습니다.`);
        }
    });
};

