/**
 * 페이징 처리 함수 정의
 * @author: 박규영
 * @since 2024.02.01
 */
let renderPagination = function (paginationInfo, target) {

    const fragment = document.createDocumentFragment();

    let firstPageNo = paginationInfo.firstPageNo;
    let firstPageNoOnPageList = paginationInfo.firstPageNoOnPageList;
    let totalPageCount = paginationInfo.totalPageCount;
    let pageSize = paginationInfo.pageSize;
    let lastPageNoOnPageList = paginationInfo.lastPageNoOnPageList;
    let currentPageNo = paginationInfo.currentPageNo;
    let lastPageNo = paginationInfo.lastPageNo;
    let totalRecordCount = paginationInfo.totalRecordCount;

    if (totalPageCount > pageSize) {
        const firstPageLabel = document.createElement('li');
        const previousPageLabel = document.createElement('li');

        firstPageLabel.classList.add('page-item', 'first');
        previousPageLabel.classList.add('page-item', 'prev');

        if (firstPageNoOnPageList > pageSize) {
            firstPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${firstPageNo}' class="page-link"><i class="icon-base bx bx-chevrons-left icon-sm"></i></a>`);
            previousPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${(firstPageNoOnPageList - 1 === 0) ? 1 : (firstPageNoOnPageList - 1)}'><i class="icon-base bx bx-chevron-left icon-sm"></i></a>`);
        } else {
            firstPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${firstPageNo}' class="page-link"><i class="icon-base bx bx-chevrons-left icon-sm"></i></a>`);
            previousPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${(firstPageNoOnPageList - 1 === 0) ? 1 : (firstPageNoOnPageList - 1)}'><i class="icon-base bx bx-chevron-left icon-sm"></i></a>`);
        }

        fragment.appendChild(firstPageLabel);
        fragment.appendChild(previousPageLabel);
    }

    for (let i = firstPageNoOnPageList; i <= lastPageNoOnPageList; ++i) {
        const pageLabel = document.createElement('li');
        pageLabel.classList.add('page-item');

        if (i == currentPageNo) {
            pageLabel.classList.add('active');
            pageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${i}' class="page-link">${i}</a>`);
        } else {
            pageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${i}' class="page-link">${i}</a>`);
        }

        fragment.appendChild(pageLabel);
    }

    if (totalPageCount > pageSize) {
        const nextPageLabel = document.createElement('li');
        const lastPageLabel = document.createElement('li');

        nextPageLabel.classList.add('page-item', 'next');
        lastPageLabel.classList.add('page-item', 'last');

        if (lastPageNoOnPageList < totalPageCount) {
            nextPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${(lastPageNoOnPageList + 1) >= lastPageNo ? lastPageNo : (lastPageNoOnPageList + 1)}' class="page-link"><i class="icon-base bx bx-chevron-right icon-sm"></i></a>`);
            lastPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${lastPageNo}' class="page-link"><i class="icon-base bx bx-chevrons-right icon-sm"></i></a>`);
        } else {
            nextPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${(lastPageNoOnPageList + 1) >= lastPageNo ? lastPageNo : (lastPageNoOnPageList + 1)}' class="page-link"><i class="icon-base bx bx-chevron-right icon-sm"></i></a>`);
            lastPageLabel.insertAdjacentHTML('beforeend', `<a href='javascript:void(0);' data-value='${lastPageNo}' class="page-link"><i class="icon-base bx bx-chevrons-right icon-sm"></i></a>`);
        }

        fragment.appendChild(nextPageLabel);
        fragment.appendChild(lastPageLabel);
    }

    while (target.firstChild) {
        target.removeChild(target.firstChild);
    }

    target.appendChild(fragment);
}

function pageEventDelegation(event) {
    let target = event.target;
    if (target.tagName === 'IMG') {
        search(target.parentElement.getAttribute('data-value'));
    } else if (target.tagName === 'A') {
        search(target.getAttribute('data-value'));
    }
}

function pageEventDelegation2(search, event) {
    let target = event.target;
    if (target.tagName === 'IMG') {
        search(target.parentElement.getAttribute('data-value'));
    } else if (target.tagName === 'A') {
        search(target.getAttribute('data-value'));
    }
}