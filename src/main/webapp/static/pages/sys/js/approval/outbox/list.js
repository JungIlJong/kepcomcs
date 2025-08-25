let dt_inboxes;
const labelMap = {
    '결재요청': 'bg-label-primary',
    '결재중': 'bg-label-success',
    '결재완료': 'bg-label-Info',
    '반려': 'bg-label-danger',
    '취소': 'bg-label-secondary',
}

const getFormDataFromForm = (selector) => {
    const formData = $(selector).serializeArray();
    const data = {};
    $.each(formData, function(_, field) {
        data[field.name] = field.value;
    });
    return data;
}

const renderInboxRender = () => {

    const dt_inbox_table = document.querySelector('.datatables-inboxes');
    console.log(dt_inbox_table);
    if (dt_inbox_table) {
        dt_inboxes = new DataTable(dt_inbox_table, {
            processing: true,
            serverSide: true,
            ajax: function (data, callback, settings) {
                const searchKeyword = data.search?.value || '';

                const params = {
                    ...getFormDataFromForm('#inboxSearchForm'), // form 데이터
                    searchKeyword,
                    page: data.start / data.length + 1,
                    perPage: data.length,
                    searchCondition: 'approval_title'
                };
                Ajax.get(dataToQueryString('/api/sys/approval_documents/outboxes', params), function (res) {
                    callback({
                        draw: data.draw,
                        recordsTotal: res.paginationInfo.totalRecordCount,
                        recordsFiltered: res.paginationInfo.totalRecordCount,
                        data: res.data
                    });
                }, fail);
            },
            columns: [
                { data: 'approvalDocumentId', title: '' },
                { data: 'approvalTitle', title: '제목' },
                { data: 'mbrNm', title: '기안자' },
                { data: 'createdAt', title: '기안일시' },
                { data: 'approvalStatusNm', title: '상태' },
                { data: 'approvalDocumentId', title: '' },
            ],
            columnDefs: [
                {
                    targets: 0,
                    render: function (data, type, row, meta) {
                        return meta.settings.fnRecordsDisplay() - (meta.row + meta.settings._iDisplayStart);
                    }
                },
                {
                    targets: -2,
                    title: 'label',
                    searchable: false,
                    orderable: false,
                    render: (data, type, full, meta) => {
                        return `<span class="badge rounded-pill ${labelMap[data]}">${data}</span>`
                    }
                },
                {
                    targets: 5,
                    title: '액션',
                    searchable: false,
                    orderable: false,
                    render: (data, type, full, meta) => {
                        return `
              <div class="d-flex align-items-center cursor-pointer">
                <a href="detail?approvalDocumentId=${full.approvalDocumentId}" class="btn btn-icon delete-record">
                  <i class="icon-base bx bxs-detail icon-md"></i>
                </a>
              </div>`;
                    }
                }
            ],
            language: {
                sLengthMenu: '_MENU_',
                search: '',
                searchPlaceholder: '검색어를 입력하세요',
                paginate: {
                    next: '<i class="icon-base bx bx-chevron-right icon-18px"></i>',
                    previous: '<i class="icon-base bx bx-chevron-left icon-18px"></i>'
                }
            },
            topEnd: {
                features: [
                    {
                        search: {
                            placeholder: '검색어를 입력하세요',
                            text: '_INPUT_'
                        }
                    },
                    {
                        buttons: [
                            {
                                extend: 'collection',
                                className: 'btn btn-label-secondary dropdown-toggle',
                                text: '<span class="d-flex align-items-center gap-2"><i class="icon-base bx bx-export icon-sm"></i> <span class="d-none d-sm-inline-block">내보내기</span></span>',
                                buttons: [
                                    {
                                        extend: 'print',
                                        text: `<span class="d-flex align-items-center"><i class="icon-base bx bx-printer me-2"></i>인쇄</span>`,
                                        className: 'dropdown-item',
                                        exportOptions: {
                                            columns: [0, 1, 2, 3, 4],
                                            format: {
                                                body: function (inner, coldex, rowdex) {
                                                    if (inner.length <= 0) return inner;
                                                    const el = new DOMParser().parseFromString(inner, 'text/html').body.childNodes;
                                                    let result = '';
                                                    el.forEach(item => {
                                                        if (item.classList && item.classList.contains('user-name')) {
                                                            result += item.lastChild.firstChild.textContent;
                                                        } else {
                                                            result += item.textContent || item.innerText || '';
                                                        }
                                                    });
                                                    return result;
                                                }
                                            }
                                        },
                                        customize: function (win) {
                                            win.document.body.style.color = config.colors.headingColor;
                                            win.document.body.style.borderColor = config.colors.borderColor;
                                            win.document.body.style.backgroundColor = config.colors.bodyBg;
                                            const table = win.document.body.querySelector('table');
                                            table.classList.add('compact');
                                            table.style.color = 'inherit';
                                            table.style.borderColor = 'inherit';
                                            table.style.backgroundColor = 'inherit';
                                        }
                                    },
                                    {
                                        extend: 'csv',
                                        text: `<span class="d-flex align-items-center"><i class="icon-base bx bx-file me-2"></i>Csv</span>`,
                                        className: 'dropdown-item',
                                        exportOptions: {
                                            columns: [0, 1, 2, 3, 4],
                                            format: {
                                                body: function (inner, coldex, rowdex) {
                                                    if (inner.length <= 0) return inner;
                                                    const el = new DOMParser().parseFromString(inner, 'text/html').body.childNodes;
                                                    let result = '';
                                                    el.forEach(item => {
                                                        if (item.classList && item.classList.contains('user-name')) {
                                                            result += item.lastChild.firstChild.textContent;
                                                        } else {
                                                            result += item.textContent || item.innerText || '';
                                                        }
                                                    });
                                                    return result;
                                                }
                                            }
                                        }
                                    },
                                    {
                                        extend: 'excel',
                                        text: `<span class="d-flex align-items-center"><i class="icon-base bx bxs-file-export me-2"></i>Excel</span>`,
                                        className: 'dropdown-item',
                                        exportOptions: {
                                            columns: [0, 1, 2, 3, 4],
                                            format: {
                                                body: function (inner, coldex, rowdex) {
                                                    if (inner.length <= 0) return inner;
                                                    const el = new DOMParser().parseFromString(inner, 'text/html').body.childNodes;
                                                    let result = '';
                                                    el.forEach(item => {
                                                        if (item.classList && item.classList.contains('user-name')) {
                                                            result += item.lastChild.firstChild.textContent;
                                                        } else {
                                                            result += item.textContent || item.innerText || '';
                                                        }
                                                    });
                                                    return result;
                                                }
                                            }
                                        }
                                    },
                                    {
                                        extend: 'pdf',
                                        text: `<span class="d-flex align-items-center"><i class="icon-base bx bxs-file-pdf me-2"></i>Pdf</span>`,
                                        className: 'dropdown-item',
                                        exportOptions: {
                                            columns: [0, 1, 2, 3, 4],
                                            format: {
                                                body: function (inner, coldex, rowdex) {
                                                    if (inner.length <= 0) return inner;
                                                    const el = new DOMParser().parseFromString(inner, 'text/html').body.childNodes;
                                                    let result = '';
                                                    el.forEach(item => {
                                                        if (item.classList && item.classList.contains('user-name')) {
                                                            result += item.lastChild.firstChild.textContent;
                                                        } else {
                                                            result += item.textContent || item.innerText || '';
                                                        }
                                                    });
                                                    return result;
                                                }
                                            }
                                        }
                                    },
                                    {
                                        extend: 'copy',
                                        text: `<i class="icon-base bx bx-copy me-1"></i>복사`,
                                        className: 'dropdown-item',
                                        exportOptions: {
                                            columns: [0, 1, 2, 3, 4],
                                            format: {
                                                body: function (inner, coldex, rowdex) {
                                                    if (inner.length <= 0) return inner;
                                                    const el = new DOMParser().parseFromString(inner, 'text/html').body.childNodes;
                                                    let result = '';
                                                    el.forEach(item => {
                                                        if (item.classList && item.classList.contains('user-name')) {
                                                            result += item.lastChild.firstChild.textContent;
                                                        } else {
                                                            result += item.textContent || item.innerText || '';
                                                        }
                                                    });
                                                    return result;
                                                }
                                            }
                                        }
                                    }
                                ]
                            },
                            {
                                text: '<i class="icon-base bx bx-plus icon-sm me-0 me-sm-2"></i><span class="d-none d-sm-inline-block">등록</span>',
                                className: 'add-new btn btn-primary',
                                attr: {
                                    'onclick': "location.href='save'"
                                }
                            }
                        ]
                    }
                ]
            },
            bottomStart: {
                rowClass: 'row mx-3 justify-content-between',
                features: ['info']
            },
            bottomEnd: {
                paging: {
                    firstLast: false
                }
            }

        });
    }
}

$(() => {
    $('#inboxSearchForm').on('input change', 'input, select', () => {
        dt_inboxes.ajax.reload();
    });
    renderInboxRender();
})