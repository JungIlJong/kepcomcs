$(() => {
    const options = document.querySelectorAll('.dropdown-item');
    let selectButton = document.getElementById('searchCondition');
    options.forEach(option => {
        option.addEventListener('click', (event) => {
            selectButton.innerText = option.textContent;
            selectButton.dataset.type = option.dataset.type;
        })
    })
    fetchNttList();

    $('#frmSearch').on('submit', (e) => e.preventDefault());
    $('#searchKeyword').on('keyup', (event) => event.key === 'Enter' && fetchNttList());
    $('#btnSearch').on('click', () => fetchNttList());
    $('#pagination').on('click', (event) =>fetchNttList(event.target.dataset.value));
})

const fetchNttList = (pageIndex = 1) => {
    const bbsId = $('#bbsId').val();
    const bbsType = $('#bbsType').val();
    const searchCondition = $('#searchCondition').data('type');
    const searchKeyword = $('#searchKeyword').val();
    const recordCountPerPage = bbsType === 'BBS_ALBUM' ? 12 : 10;
    const data = {pageIndex, searchCondition, searchKeyword, recordCountPerPage}
    Ajax.get(dataToQueryString(`/api/mber/bbs/${bbsId}`, data), successNttList, fail);
}

const fail = () => console.log('fail');

const successNttList = (result) => {
    const { data, paginationInfo } = result;
    const renderConfig = {
        'BBS_ALBUM': {
            tableId: 'albumTable',
            renderFn: renderBbsAlbumType,
            isTable: false
        },
        'BBS_QNA': {
            tableId: 'lineTable',
            renderFn: renderBbsDefaultType,
            isTable: true
        },
        'DEFAULT': {
            tableId: 'lineTable',
            renderFn: renderBbsDefaultType,
            isTable: true
        }
    };
    const config = renderConfig[$('#bbsType').val()] || renderConfig.DEFAULT;
    const $container = $(`#${config.tableId}`);

    if (config.isTable) {
        const $tableBody = $('#table-body').empty();
        data.forEach((element, index) => {
            $tableBody.append(config.renderFn(element, index, paginationInfo));
        });
    } else {
        $container.empty();
        data.forEach((element, index) => {
            $container.append(config.renderFn(element, index, paginationInfo));
        });
    }

    $container.removeClass('d-none');
    renderPagination(paginationInfo, document.getElementById('pagination'));
    document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;
};

const renderBbsDefaultType = (element, index, paginationInfo) => `<tr>
                            <th class="postNum" scope="row">
                                ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo - 1) * paginationInfo.pageSize) - index}
                            </th>
                            <td class="title">
                                <a href="detail?id=${element.id}" class="ellipsis">${element.notice ? '(공지)' : ''} ${element.nttSj}</a>
                            </td>
                            <td class="text-center">
                                ${element.wrterNm}
                            </td>
                            <td class="text-center">
                                ${element.frstRegistDt}
                            </td>
                            <td class="text-center">
                                ${element.rdcnt}
                            </td>
                        </tr>`

const renderBbsAlbumType = (element, index, paginationInfo) => `<a href="detail?id=${element.id}"<div class="col">
                                            <div class="card h-200">
                                                <img class="card-img-top h-150" src="${element.thumbUrl}" alt="Card image cap" 
                                                 onerror="this.onerror=null; this.src='/static/assets/images/no_image.jpg';"
                                                />
                                                <div class="card-body">
                                                    <h5 class="card-title">${element.nttSj}</h5>
                                                    <p class="card-text">
                                                        <small class="text-body-secondary">${element.frstRegistDt}</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </div></a>`

