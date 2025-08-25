$(() => {
    let params = new URLSearchParams(document.location.search);
    let approvalDocumentId = params.get("approvalDocumentId");
    Ajax.get(`/api/sys/approval_documents/${approvalDocumentId}`, renderOutboxDetail, fail);
    $('#btnBack').on('click', () => goBack());
    $('#btnCancel').on('click', () => fetchApprovalCancel(approvalDocumentId));
})

const renderOutboxDetail = (res) => {
    const {
        approvalContent,
        approvalDocumentId,
        approvalLines,
        approvalMyLineId,
        approvalStatus,
        approvalTitle,
        approvalYn,
        createdAt,
        creatorId
    } = res;
    $('#approvalTitle').text(approvalTitle);
    $('#approvalContent').text(approvalContent);
    console.log(res);
    approvalLines.forEach((approvalLine, i) => {
        $('#approvalLines').append(renderApprovalLine(approvalLine, i));
    })
    if(approvalStatus === 'N') {
        $('#btnCancel').removeClass('d-none')
    }
}

const renderApprovalLine = (approvalLine, i) => {
    switch (approvalLine.approvalStatus) {
        case 'N':
        case 'P':
            return renderApprovalLineBefore(approvalLine, i);
        case 'A':
        case 'D':
        case 'C':
            return renderApprovalLineAfter(approvalLine, i);
        default:
            return null; // 또는 기본 처리
    }
};

// 결제요청, 결제중 상태 render 함수
const renderApprovalLineBefore = (approvalLine, i) => {
    return `<div class="accordion accordion-flush accordion-arrow-left mb-6" id="approvalLine${i}">
                                            <div class="accordion-item border-bottom">
                                                <div
                                                        class="accordion-header d-flex justify-content-between align-items-center flex-wrap flex-sm-nowrap"
                                                        >
                              <span>
                                <span class="d-flex gap-2 align-items-baseline">
                                  <span class="h5 mb-3">${approvalLine.approverNm}</span>
                                  ${labelMap[approvalLine.approvalStatus]}
                                </span>
                              </span>
                                                </div>
                                            </div>
                                        </div>`;
}

// 반려, 완료 상태 render 함수
const renderApprovalLineAfter = (approvalLine, i) => {
    return `<div class="accordion accordion-flush accordion-arrow-left" id="approvalLine${i}">
                                            <div class="accordion-item border-bottom">
                                                <div
                                                        class="d-flex justify-content-between align-items-center flex-wrap flex-sm-nowrap"
                                                        >
                              <span>
                                <span class="d-flex gap-2 align-items-baseline">
                                  <span class="h5 mb-3">${approvalLine.approverNm}</span>
                                  ${labelMap[approvalLine.approvalStatus]}
                                </span>
                              </span>
                                                </div>
                                                            ${getComment(approvalLine)}
                                            </div>
                                        </div>`;
}

const getComment = (approvalLine) => {
    return approvalLine.approvalComment
        ? `<h5 class="mb-1">${approvalLine.approvalComment}</h5>`
        : ``
}

const fetchApprovalCancel = (approvalDocumentId) => {
    if(!confirm('결제를 취소하겠습니까?')) {
        return;
    }
    Ajax.post('/api/sys/approval_documents/' + approvalDocumentId + '/cancel', successCancel, fail, {data: JSON.stringify({approvalComment: ''})})
}

const successCancel = function (data) {
    alert('결제가 취소되었습니다.');
    goPage('list')
}


const fail = function (xhr, status, error) {
    alert('오류가 발생하였습니다.');
    console.log(xhr + ", " + status + " : " + error)
}

const labelMap = {
    'N': `<span class="badge bg-label-primary">결재요청</span>`,
    'P': '<span class="badge bg-label-success">결재중</span>',
    'A': '<span class="badge bg-label-Info">결재완료</span>',
    'D': '<span class="badge bg-label-danger">반려</span>',
    'C': '<span class="badge bg-label-secondary">취소</span>',
}