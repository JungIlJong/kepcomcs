// answerDetail.js
$(document).ready(function() {
    const reportId = getUrlParameter('id');
    if (!reportId) {
        alert('잘못된 접근입니다.');
        window.history.back();
        return;
    }

    (async function() {
        try {
            const data = await Ajax.async.get(`/api/sys/reports/answer/${reportId}`);
            $('#reportId').text(data.reportId);
            $('#reasonCode').text(data.reasonCode);
            $('#detailMessage').text(data.detailMessage);
            $('#reporterName').text(data.reporterName);
            $('#createdAt').text(data.createdAt);
            $('#answerContent').text(data.answerContent);
            $('#postTitle').text(data.postTitle);
        } catch (err) {
            alert('상세 정보를 불러오지 못했습니다.');
            window.history.back();
        }
    })();

    $('#btnDelete').on('click', deleteReport);
    $('#btnInit').on('click', resetReportEvent);
});

const deleteReport = () => {
    const reportId = getUrlParameter('id');
    customAlert({
        title: '해당 신고를 삭제하시겠습니까?',
        onConfirm: () => {
            Ajax.post(`/api/sys/reports/delete/${reportId}`, () => {
                customAlert({title: '삭제되었습니다.', onConfirm: () => goPage('list'), showCancel: false});
            });
        }
    })
}

const resetReportEvent = () => {
    const targetId = getUrlParameter('targetId');
    const targetType = getUrlParameter('type')
    customAlert({
        title: '신고를 초기화하시겠습니까?',
        content: '이 댓글에 대한 모든 신고가 삭제됩니다.',
        showCancel: true,
        onConfirm: () => {
            Ajax.post('/api/sys/reports/reset', () => {
                customAlert({title: '초기화되었습니다.', onConfirm: () => goPage('list'), showCancel: false});
            }, null, {data: JSON.stringify({targetId, targetType})});
        }
    });
}
