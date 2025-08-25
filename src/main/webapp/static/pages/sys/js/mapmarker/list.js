$(() => {
    const dt = DataTableUtil.create('#DataTables_Table_0', {
        ajax: { url: '/api/sys/mapmarkers', type: 'GET' },
        columns: [
            {data: null},
            {data: 'name'},
            {data: 'roadAddress'},
            {data: 'categoryCode1'},
            {data: 'createdAt'},
            {data: 'markerId'},
        ],
        columnDefs: [
            {
                targets: 0,
                searchable: false,
                orderable: false,
                title: '번호',
                render: function (data, type, full, meta) {
                    return meta.settings._iDisplayStart + meta.row + 1;
                }
            },
            {
                targets: 1,
                title: '이름',
                render: function (data, type, full, meta) {
                    return data;
                }
            },
            {
                targets: 2,
                title: '주소',
                render: function (data, type, full, meta) {
                    return data;
                }
            },
            {
                targets: 3,
                title: '카테고리',
                render: function (data, type, full, meta) {
                    return data;
                }
            },
            {
                targets: 4,
                title: '생성날짜',
                render: function (data, type, full, meta) {
                    return data;
                }
            },
            {
                targets: 5,
                render: function (data, type, full, meta) {
                    return `<div class="d-flex gap-1 justify-content-center" data-id="${data}">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>                
              </div>`
                }
            }
        ],
        externalFilters: {
            categoryCode1: '#categoryCode1',
            categoryCode2: '#categoryCode2',
            stDt: '#stDt',
            endDt: '#endDt'
        }
    });
    const categoryData = {
        'A1': [
            {id: 'A1-1', text: '지구대'},
            {id: 'A1-2', text: '파출소'},
            {id: 'A1-3', text: '경찰서'}
        ],
        'A2': [
            {id: 'A2-1', text: '이비인후과'},
            {id: 'A2-2', text: '정형외과'},
            {id: 'A2-3', text: '안과'},
            {id: 'A2-4', text: '내과'}
        ],
        'A3': [
            {id: 'A3-1', text: '민원실'},
            {id: 'A3-2', text: '복지과'},
            {id: 'A3-3', text: '세무과'}
        ],
        'A4': [
            {id: 'A4-1', text: '기타1'},
            {id: 'A4-2', text: '기타2'}
        ]
    };

    $('#categoryCode1').select2();

    $('#categoryCode2').select2({
        placeholder: '대분류를 먼저 선택하세요'
    });

    $('#categoryCode1').on('change', function() {
        const parentCategoryId = $(this).val();
        const $childCategory = $('#categoryCode2');

        // 소분류 초기화
        $childCategory.empty().prop('disabled', true);

        // 기본 옵션 추가
        $childCategory.append(new Option('선택하세요', '', false, false));

        // 대분류가 선택되었을 때
        if (parentCategoryId) {
            // 해당 하위 카테고리 데이터 가져오기
            const childCategories = categoryData[parentCategoryId] || [];

            // 하위 카테고리가 있다면
            if (childCategories.length > 0) {
                // 소분류 활성화
                $childCategory.prop('disabled', false);

                // 소분류 옵션 추가
                childCategories.forEach(category => {
                    const option = new Option(category.text, category.id, false, false);
                    $childCategory.append(option);
                });
            }
        }

        // select2 갱신
        $childCategory.trigger('change');
    });

    $('#DataTables_Table_0').on('click', 'button[data-action]', e => {
        e.preventDefault();

        const $btn      = $(e.currentTarget);          // 위임 시엔 currentTarget 사용
        const action    = $btn.data('action');         // "detail" | "delete"
        const rowData   = dt.row($btn.closest('tr')).data();

        action === 'delete'
            ? deleteMarker(rowData)
            : detailMarker(rowData);
    });

    const deleteMarker = (rowData) => {
        customAlert({title: '해당 마커를 삭제하시겠습니까?',
            content: getDetail(rowData), showCancel: true, onConfirm: () => {
            Ajax.post(`/api/sys/mapmarkers/delete/${rowData.markerId}`, () => {
                customAlert({title: '삭제되었습니다.', onConfirm: () => goPage('list'), showCancel: false});})
    }})}


    const detailMarker = (rowData) => {
        goPage(`detail?markerId=${rowData.markerId}`);
    }

    const getDetail = (row) => {
        return `이름: ${row.name}<br>주소: ${row.roadAddress}<br>카테고라: ${row.categoryCode1}<br>생성날짜: ${row.createdAt}`
    }
})