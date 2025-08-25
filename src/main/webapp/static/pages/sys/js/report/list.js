$(() => {
    const targetBadgesMap = {
        'ntt': `<span class="badge text-bg-primary">게시글</span>`,
        'answer': `<span class="badge text-bg-info">댓글</span>`,
        'mbr': `<span class="badge text-bg-danger">회원</span>`
    };

    const dt = DataTableUtil.create('#DataTables_Table_0', {
        ajax: { url: '/api/sys/reports', type: 'GET' },
        showAddButton: false,
        columns: [
            {data: null},
            {data: row => ({ id: row.reportId, target: row.target, type: row.targetType }),},
            {data: 'targetType'},
            {data: 'reporter'},
            {data: 'createdAt'},
            {data: row => ({ id: row.reportId, target: row.target, type: row.targetType }),},
        ],
        columnDefs: [
            {
                targets: 0,
                searchable: false,
                orderable: false,
                title: '번호',
                className: 'dt-col-num',
                render: function (data, type, full, meta) {
                    // 현재 페이지의 첫번째 row index(meta.settings._iDisplayStart)에
                    // 0-based row 번호(meta.row) 를 더한 뒤 1 보정
                    return meta.settings._iDisplayStart + meta.row + 1;
                }
            },
            {
                targets: 1,
                title: '신고 대상',
                className: 'dt-col-title',
                render: function (data, type, full, meta) {
                    return `${data.target.targetName}`;
                }
            },
            {
                targets: 2,
                title: '대상 유형',
                render: function (data, type, full, meta) {
                    return targetBadgesMap[data];
                }
            },
            {
                targets: 3,
                title: '신고자',
                render: function (data, type, full, meta) {
                    return data['mbrNm'];
                }
            },
            {
                targets: 4,
                title: '등록 날짜',
                className: 'dt-col-date',
                render: function (data, type, full, meta) {
                    return data;
                }
            },
            {
                targets: 5,
                render: function (data, type, full, meta) {
                    return `<div class="d-flex gap-1 justify-content-center" data-report-id="${data.id}">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>                
              </div>`
                }
            }
        ]
    });

    $('#DataTables_Table_0').on('click', 'button[data-action]', e => {
        e.preventDefault();

        const $btn      = $(e.currentTarget);          // 위임 시엔 currentTarget 사용
        const action    = $btn.data('action');         // "detail" | "delete"
        const reportId  = $btn.closest('[data-report-id]').data('report-id');
        const rowData   = dt.row($btn.closest('tr')).data();

        action === 'delete'
            ? deleteReport(rowData)
            : detailReport(rowData);
    });
})

// 4. 예시 삭제 함수
function deleteReport(row) {
    const targetType = {
        'ntt': '게시글',
        'answer': '댓글',
        'mbr': '회원'
    }

    const title = '다음 신고를 삭제하시겠습니까?';
    const content = `
신고 대상: ${row.target.targetName}<br />
대상 유형: ${targetType[row.targetType]}<br />
신고자: ${row.reporter.mbrNm}<br />
신고 날짜: ${row.createdAt}<br />
`;
    const onConfirm = () => {
        Ajax.post(`/api/sys/reports/delete/${row.reportId}`, () => customAlert({
            title: '삭제되었습니다.',
            onConfirm: reload,
            showCancel: false
        }));
    }
    customAlert({
        title,
        content,
        onConfirm
    })
}

const detailReport = (row) => {
    goPage(dataToQueryString('detail', {id: row.reportId, type: row.targetType, targetId: row.target.targetId}));
}

