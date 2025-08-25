const renderInboxDetail =  (data) => {
    const { approvalDocumentId, approvalStatus, approvalTitle, approvalContent, approvalLines, approvalYn, approvalMyLineId } = data;
    console.log(data);
    document.getElementById('approvalTitle').textContent = approvalTitle;
    document.getElementById('approvalContent').textContent = approvalContent;

    if (approvalYn === 'N' && (approvalStatus !== 'C' && approvalStatus !== 'D' && approvalStatus !== 'A')) {
        $('#btnRejectApproval').on('click', () => {
            const data = {
                approvalComment: $('#comment').val(),
                approvalLineId: approvalMyLineId
            }
            if(!confirm("반려하시겠습니까?")) {
                return;
            }
            Ajax.post('/api/sys/approval_documents/' + approvalDocumentId + '/reject', successReject, fail, {data : JSON.stringify(data)})
        })

        $('#btnAcceptApproval').on('click',  () => {
            const data = {
                approvalComment: $('#comment').val(),
                approvalLineId: approvalMyLineId
            }
            if(!confirm("승인하시겠습니까?")) {
                return;
            }
            Ajax.post('/api/sys/approval_documents/' + approvalDocumentId + '/accept', successAccept, fail, {data : JSON.stringify(data)})

        });
        $('#btnAcceptApproval, #btnRejectApproval, #comment').show();
    }
    if(approvalYn === 'Y' && approvalStatus === 'C') {
        $('#comment, #btnRejectApproval, #btnAcceptApproval').remove();
        $('#btnCancel').show();
    }
    if(approvalStatus === 'D') {
        $('#comment').prop('readonly', true);
        $('#btnRejectApproval').prop('disabled', true);
        $('#btnRejectApproval').show();
    }
    if(approvalStatus === 'P' || approvalStatus === 'A') {
        $('#comment').prop('readonly', true);
        $('#btnAcceptApproval').prop('disabled', true);
        $('#btnAcceptApproval').show();
    }
}

let successReject = function (data) {
    alert('반려하였습니다');
    goPage('list')
}

let successAccept = function (data) {
    alert('승인하였습니다');
    goPage('list')
}

let fail = function (xhr, status, error) {
    alert('오류가 발생하였습니다.');
    console.log(xhr + ", " + status + " : " + error)
}

$(() => {
    let params = new URLSearchParams(document.location.search);
    let approvalDocumentId = params.get("approvalDocumentId");

    Ajax.get('/api/sys/approval_documents/' + approvalDocumentId, renderInboxDetail, fail);
    $('#btnBack').on('click', () => goBack());
});