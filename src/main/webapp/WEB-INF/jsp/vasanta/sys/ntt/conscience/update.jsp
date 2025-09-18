<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title>게시물관리</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <link rel="stylesheet" href="/static/css/file-preview.css" />
</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->
        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-menu.jsp" %>
        <!-- / Menu -->

        <!-- Layout page -->
        <div class="layout-page">
            <!-- Navbar -->
            <%@ include file="/WEB-INF/jsp/vasanta/sys/include/sneat-nav.jsp" %>
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="order-0 order-md-1">
                            <div class="card mb-6">
                                <div class="card-header">
                                    <h5 class="mb-0"><c:out value="${menuTitle}"/></h5>
                                </div>
                                <div class="card-body pt-0">
                                    <input id="fileAtchSize" name="fileAtchSize" type="hidden" value=""/>
                                    <input id="fileAtchCo" name="fileAtchCo" type="hidden" value=""/>
                                    <input id="permExtsn" name="permExtsn" type="hidden" value=""/>
                                    <input id="fileAt" name="fileAt" type="hidden" value=""/>
                                    <input id="bbsId" name="bbsId" type="hidden" value=""/>
                                    <form id="frm">
                                        <input id="nttId" name="nttId" type="hidden" value=""/>
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
                                        <div class="table-responsive text-nowrap">
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col style="width:10%;">
                                                    <col style="width:40%;">
                                                    <col style="width:10%;">
                                                    <col style="width:40%;">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="bbsNm">
                                                            <spring:message code="bbs.bbsNm"/>
                                                        </label>
                                                    </th>
                                                    <td colspan="3" id="bbsIdDiv">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <input class="form-control" type="text" name="bbsNm"
                                                                           id="bbsNm">
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="sosok">
                                                            소속(지점, 지사)
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="flex-c gap-2">
                                                                <div class="has-validation w-100">
                                                                    <input class="form-control" type="text" name="sosok"
                                                                           id="sosok" placeholder="소속(지점, 지사)">
                                                                </div>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="wrterNm">
                                                            글쓴이
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="flex-c gap-2">
                                                                <div class="has-validation w-100">
                                                                    <input class="form-control" type="text" name="wrterNm"
                                                                           id="wrterNm" placeholder="글쓴이">
                                                                </div>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="frstRegisterId">
                                                            사번
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="flex-c gap-2">
                                                                <div class="has-validation w-100">
                                                                    <input class="form-control" type="text" name="frstRegisterId"
                                                                           id="frstRegisterId" placeholder="사번">
                                                                </div>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="authorHp">
                                                            연락처
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="flex-c gap-2">
                                                                <div class="has-validation w-100">
                                                                    <input class="form-control" type="text" name="authorHp"
                                                                           id="authorHp" placeholder="연락처">
                                                                </div>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label">콘텐츠 내용</label>
                                                    </th>
                                                    <td colspan="3">
                                                        <%-- Quill Editor(JS, CSS 포함)를 불러옵니다 --%>
                                                        <%@ include file="/WEB-INF/jsp/vasanta/cmmn/quill-editor.jsp" %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="files"><spring:message
                                                                code="atchfile"/></label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation" id="fileBox">
                                                                <input class="form-control" type="file" id="files"
                                                                       name="files" placeholder="파일을 선택하세요"
                                                                       title="파일을 선택하세요" multiple>
                                                            </div>
                                                            <div id="fileList">
                                                                <%-- 첨부파일 목록이 여기에 동적으로 표시됩니다 --%>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
								                    <th><label class="form-label" for="answerContent">메모</label></th>
								                    <td colspan="3">
								                        <textarea id="nttReply" name="nttReply" 
								                                  class="form-control" rows="5"
								                                  placeholder="메모를 입력하세요"></textarea>
								                    </td>
								                </tr>
								                <tr>
								                    <th><label class="form-label">처리상태</label></th>
								                    <td colspan="3">
								                        <div class="d-flex gap-4">
								                            <div class="form-check">
								                                <input class="form-check-input" type="radio" 
								                                       name="nttStatus" id="wait" value="0" checked>
								                                <label class="form-check-label" for="statusWait">대기중</label>
								                            </div>
								                            <div class="form-check">
								                                <input class="form-check-input" type="radio" 
								                                       name="nttStatus" id="ing" value="1">
								                                <label class="form-check-label" for="statusIng">처리중</label>
								                            </div>
								                            <div class="form-check">
								                                <input class="form-check-input" type="radio" 
								                                       name="nttStatus" id="done" value="2">
								                                <label class="form-check-label" for="statusDone">완료</label>
								                            </div>
								                        </div>
								                    </td>
								                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary" id="btnList"><spring:message
                                                code="button.list"/></button>
                                        <div>
                                            <button type="button" class="btn btn-dark me-2" id="btnDelete"><spring:message
                                                    code="button.delete"/></button>
                                            <button type="button" class="btn btn-primary" id="btnUpdate"><spring:message
                                                    code="button.modify"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/static/js/common/validator.js"></script>
<script src="/static/js/common/validation.js"></script>
<script src="/static/pages/sys/js/ntt/update.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
    let bbsListData = [];
    let selectedFiles = new DataTransfer(); // 선택된 파일들을 관리하는 객체
    
    $(function () {
        initFvNtt();
        
        $("input:not([type=radio]), textarea:not(#nttReply)").prop("readonly", true);
    	quill.enable(false);
    	$('.ql-toolbar button').prop('disabled', true);
    	
        const nttStartDt = document.querySelector('#nttStartDt'),
        nttEndDt = document.querySelector('#nttEndDt')
        // Date
        if (nttStartDt) {
        	nttStartDt.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d",
                monthSelectorType: "static",
            });
        }

        if (nttEndDt) {
        	nttEndDt.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d",
                monthSelectorType: "static",
            });
        }
        
        // 파일 삭제 버튼 이벤트 위임 (전역 설정)
        $(document).on('click', '.file-delete-btn', function() {
            const tempId = $(this).data('id');
            const fileName = $(this).closest('.file-item').find('.file-name-display').text();

            if (tempId && tempId.toString().startsWith('temp_')) {
                // 새로 선택한 파일 제거
                $('[data-temp-id="' + tempId + '"]').remove();
                
                // DataTransfer에서 해당 파일 제거
                const dt = new DataTransfer();
                Array.from(selectedFiles.files).forEach(f => {
                    const isTarget = (f.name === fileName)
                    if (!isTarget) dt.items.add(f);
                  });

                  selectedFiles = dt;
                $('#files')[0].files = dt.files;
            } else {
                // 기존 파일 삭제 처리
                fileDeleteButton(this);
            }
        });

        function handleBbsFileInfo(bbsId) {
            let bbs = bbsListData.find((element) => element.bbsId == bbsId);
            $('#fileAtchSize').val(bbs.fileAtchSize);
            $('#fileAtchCo').val(bbs.fileAtchCo);
            $('#permExtsn').val(bbs.permExtsn);
        }

        // 게시판 리스트 초기화 이벤트
        let setBbsList = function (data) {
            bbsListData = data;
//             data.forEach(function (element, index) {
//                 addSelectOption('bbsId', element.bbsNm, element.bbsId);
//             })
//             $("#bbsId option:eq(0)").prop("selected", true);
//             $('#bbsId').on('change', function () {
//                 handleBbsFileInfo($(this).val())
//             })
        }

        // 게시글 상세정보 가져오기
        let setDetail = function (data) { console.log(data);
            handleBbsFileInfo(data.bbsId);
        	$('#bbsId').val(data.bbsId);

            if (data.nttStatus == '0') $('#wait').prop('checked', true);
            else if (data.nttStatus == '1') $('#ing').prop('checked', true);
            else if (data.nttStatus == '2') $('#done').prop('checked', true);
            
            // 공지글 설정
            if (data.noticeAt === 'Y') {
                $('#noticeAt').prop('checked', true);
            } else {
                $('#noticeAt').prop('checked', false);
            }

            $('#bbsNm').val(data.bbsNm);
            $('#nttId').val(data.nttId);
            $('#sosok').val(data.sosok);
            $('#wrterNm').val(data.wrterNm);
            $('#frstRegisterId').val(data.frstRegisterId);
            $('#authorHp').val(data.authorHp);
            $('#nttStartDt').val(data.nttStartDt);
            $('#nttEndDt').val(data.nttEndDt);
            $('#nttReply').val(data.nttReply);

            // 콘텐츠 내용 설정
            if (data.nttCn) {

                // Quill이 초기화될 때까지 대기
                const setQuillContent = function() {
                    if (quill && quill.root) {
                        // HTML 엔티티 디코딩 - jQuery를 사용한 방법
                        const decodedContent = $('<div/>').html(data.nttCn).text();

                        // Quill의 clipboard 모듈을 사용하여 HTML 설정
                        quill.clipboard.dangerouslyPasteHTML(0, decodedContent);
                    } else {
                        console.log('Quill not ready, waiting...');
                        setTimeout(setQuillContent, 100);
                    }
                };

                setQuillContent();
            }

            if (data.files.length > 0) {
                let node = `<div class="d-flex flex-wrap gap-3 mt-3 mb-4" id="fileElem">`;
                for (let i = 0; i < data.files.length; i++) {
                    const fileExt = data.files[i].fileExtsn.toLowerCase();
                    const isImage = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(fileExt);
                    const fileName = data.files[i].orignlFileNm + '.' + data.files[i].fileExtsn;

                    node += `<div class="d-flex flex-column align-items-center file-item">`;
                    node += `<div class="file-preview" id="` + data.files[i].atchFileId + `">`;

                    if (isImage) {
                        node += `<img src="/file/download?fileId=` + data.files[i].atchFileId + `" alt="` + fileName + `" class="file-download-link">`;
                    } else {
                        node += `<div class="file-download-link d-flex flex-column align-items-center justify-content-center h-100 bg-light">
                            <i class="bx bx-file fs-1 text-muted mb-2"></i>
                            <span class="small text-muted text-uppercase">` + fileExt + `</span>
                        </div>`;
                    }

                    node += `<button type="button"
                            data-id="` + data.files[i].atchFileId + `"
                            class="btn btn-xs btn-secondary file-delete-btn">
                        <i class="icon-base bx bx-x"></i>
                    </button>
                    </div>
                    <div class="file-name-display text-center mt-2" title="` + fileName + `">` + fileName + `</div>
                    </div>`;
                }
                node += `</div>`;
                document.getElementById('fileList').insertAdjacentHTML('beforeend', node);

                // 파일 다운로드 기능 - 공통 처리
                $('.file-download-link').on('click', function() {
                    const fileId = $(this).closest('.file-preview').attr('id');
                    window.open('/file/download?fileId=' + fileId);
                });

                // 기존 파일 삭제 버튼은 이벤트 위임으로 처리됨
            }

            let atchFiles = document.querySelectorAll('input[name="atchFile"]');
            for (let j = 0; j < atchFiles.length; j++) {
                atchFiles[j].addEventListener('click', function () {
                    let fileId = this.getAttribute('data-id');
                    window.open('/file/download?fileId=' + fileId);
                });
            }
        }


        
        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '통신에 실패하였습니다.',
                showCancel: false,
                onConfirm: function () {
                    console.log(xhr)
                }
            });
        }

        <%-- 목록버튼 클릭 시 이벤트 --%>
        document.getElementById('btnList').addEventListener('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '목록 페이지로 이동하면 현재까지 작성한 내용이 사라집니다.<br/>이동하시겠습니까?',
                showCancel: true,
                onConfirm: function () {
                    goPage('list');
                }
            });
        });

        <%-- 삭제 버튼 클릭 시 이벤트 --%>
        document.getElementById('btnDelete').addEventListener('click', function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="confirm.common.delete"/>',
                showCancel: true,
                onConfirm: function () {
                    const nttId = document.getElementById('nttId').value;
                    const data = {
                        nttId: nttId
                    }
                    Ajax.post('/api/sys/ntt/delete', deleteSuccess, fail, {data: JSON.stringify(data)});
                }
            });
        });
        
        <%-- 기간 변경 시 이벤트 --%>
		$("#nttStartDt, #nttEndDt").on("change", function() {
		    var nttStartDt = $("#nttStartDt").val();
		    var nttEndDt = $("#nttEndDt").val();
		
		    if (nttStartDt && nttEndDt) {
		        // 문자열 → Date 객체 변환
		        var start = new Date(nttStartDt);
		        var end = new Date(nttEndDt);
		
		        if (end < start) {
		            alert("종료일은 시작일보다 빠를 수 없습니다.");
		            $("#nttEndDt").val(""); 
		            $("#nttEndDt").focus(); 
		        }
		    }
		});

        $('#btnUpdate').on('click', function () {
            fvNttInstance.validate().then(function (status) {
                const validQuill = validateQuill(quill, VALIDATION_MESSAGES.cntnts.cntntsCnRequired);
                if (!validQuill) return;

                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '<spring:message code="confirm.common.update"/>',
                        showCancel: true,
                        onConfirm: function () {
                            const data = new FormData($('#frm')[0]);
                            data.set('nttCn', quill.getSemanticHTML());
                            if (!isEmpty(imgTag())) {
                                data.append('thumbUrl', imgTag());
                            }
                            uploadAjax('/api/sys/ntt/update', updateSuccess, fail, {data: data})
                        }
                    });
                }
            });
        })

        const depth = getUrlDepth();
        if (!isEmpty(depth.find((element) => element === 'ntt'))) {
            $('#bbsRow').show();
            const option = {
                async: false,
                beforeSend: Ajax.get('/api/sys/bbs/all', setBbsList, fail, {async: false})
            }
            // Quill 초기화 후 데이터 로드
            setTimeout(function() {
                Ajax.get(setUrl('/api/sys/ntt/detail'), setDetail, fail, option);
            }, 500);
        } else {
            let bbsId = depth[depth.length - 2];
//             addSelectOption('bbsId', bbsId, bbsId)
//             $('#bbsId').prop('selectedIndex', 0).find("option:eq(0)").prop("selected", true);
            Ajax.get(dataToQueryString('/api/sys/bbs/info', {bbsId: bbsId}), init, fail);
        }
    })

    const updateSuccess = () => {
        customAlert({
            title: '<spring:message code="common.system.info"/>',
            content: '<spring:message code="success.common.update" />',
            showCancel: false,
            onConfirm: function () {
                goPage('list');
            }
        });
    }

    const deleteSuccess = () => {
        customAlert({
            title: '<spring:message code="common.system.info"/>',
            content: '<spring:message code="success.common.delete" />',
            showCancel: false,
            onConfirm: function () {
                goPage('list');
            }
        });
    }

    const fail = () => {
        customAlert({
            title: '<spring:message code="common.system.info"/>',
            content: '<spring:message code="fail.common.msg" />',
            showCancel: false,
            onConfirm: function () {
            }
        });
    }

    function fileDeleteButton(e) {
        let fileId = $(e).data('id');
        let file = `<input type="hidden" name="removeFileList" value="` + fileId + `" >`
        document.getElementById('frm').insertAdjacentHTML('beforeend', file);
        // 파일 프리뷰와 파일명을 포함한 전체 컨테이너 삭제
        $('#' + fileId).closest('.file-item').remove();
    }

    // 파일 크기를 사람이 읽기 쉬운 형태로 변환하는 함수
    function formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    }

    function imgTag() {
        const html = quill.root.innerHTML;
        const imgTags = $(html).find('img');

        if (imgTags.length === 0) {
            return undefined;
        }

        return $(imgTags[0]).attr('src');
    }

    // 파일 선택 시 프리뷰 표시
    $('#files').on('change', function() {
        const newFiles = this.files;
        if (newFiles.length === 0) return;

        // 기존 fileElem이 없으면 생성
        if ($('#fileElem').length === 0) {
            $('#fileList').append('<div class="d-flex flex-wrap gap-3 mt-3 mb-4" id="fileElem"></div>');
        }

        // 새로 선택된 파일들을 기존 파일 목록에 추가
        for (let i = 0; i < newFiles.length; i++) {
            selectedFiles.items.add(newFiles[i]);
        }
        
        // 파일 입력에 전체 파일 목록 설정
        this.files = selectedFiles.files;

        // 새로 추가된 파일들만 프리뷰 생성
        for (let i = 0; i < newFiles.length; i++) {
            const file = newFiles[i];
            const fileName = file.name;
            
            // 중복 파일 체크
            if ($('.file-name-display').filter(function() { return $(this).text() === fileName; }).length > 0) {
                continue;
            }
            
            const fileExt = fileName.split('.').pop().toLowerCase();
            const isImage = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(fileExt);
            const tempId = 'temp_' + Date.now() + '_' + i;

            let previewHtml = '<div class="d-flex flex-column align-items-center file-item" data-temp-id="' + tempId + '">';
            previewHtml += '<div class="file-preview" id="' + tempId + '">';

            if (isImage) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    $('#' + tempId).html(
                        '<img src="' + e.target.result + '" alt="' + fileName + '">' +
                        '<button type="button" data-id="' + tempId + '" class="btn btn-xs btn-secondary file-delete-btn">' +
                        '<i class="icon-base bx bx-x"></i></button>'
                    );
                };
                reader.readAsDataURL(file);
            } else {
                previewHtml += '<div class="d-flex flex-column align-items-center justify-content-center h-100 bg-light">';
                previewHtml += '<i class="bx bx-file fs-1 text-muted mb-2"></i>';
                previewHtml += '<span class="small text-muted text-uppercase">' + fileExt + '</span>';
                previewHtml += '</div>';
                previewHtml += '<button type="button" data-id="' + tempId + '" class="btn btn-xs btn-secondary file-delete-btn">';
                previewHtml += '<i class="icon-base bx bx-x"></i></button>';
            }

            previewHtml += '</div>';
            previewHtml += '<div class="file-name-display text-center mt-2" title="' + fileName + '">' + fileName + '</div>';
            previewHtml += '</div>';

            $('#fileElem').append(previewHtml);
        }
    });
</script>
</body>
</html>
