<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light"
      data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title><c:out value="${menuTitle}"/> - 등록</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <script type="text/javascript">
        let bbsList = [];
        let success = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function () {
                    goPage('list');
                }
            });
        }

        let fail = function (xhr) {
            if (isEmpty(xhr.responseJSON)) {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: '<spring:message code="fail.common.msg"/>',
                    showCancel: false,
                    onConfirm: function () {
                    }
                });
            } else {
                customAlert({
                    title: '<spring:message code="common.system.info"/>',
                    content: xhr.responseJSON[0],
                    showCancel: false,
                    onConfirm: function () {
                    }
                });
            }
        }

        let init = function (data) {
            if (data.fileAtchCo === 0 || isEmpty(data.fileAtchCo)) {
                $('#fileRow').hide();
            } else {
                $('#fileRow').show();
            }
            document.getElementById('bbsId').value = data.bbsId;
            document.getElementById('fileAtchCo').value = data.fileAtchCo;
            document.getElementById('fileAtchSize').value = data.fileAtchSize;
            document.getElementById('permExtsn').value = data.permExtsn;

            if (data.bbsTyCode === 'BBS_DEFAULT') {
                document.getElementById('noticeSet').style.display = document.getElementById('noticeSet').style.display === 'none' ? '' : 'none';
            }
        }

        let setSelect = function (data) {
            bbsList = data;
            data.forEach(function (element, index) {
                addSelectOption('bbsId', element.bbsNm, element.bbsId);
            })
            if (bbsList[0]['fileAtchCo'] === 0) {
                $('#fileRow').hide();
            } else {
                document.getElementById('fileAtchSize').value = bbsList[0].fileAtchSize;
                document.getElementById('fileAtchCo').value = bbsList[0].fileAtchCo;
                document.getElementById('permExtsn').value = bbsList[0].permExtsn;
            }
            $("#bbsId option:eq(0)").prop("selected", true);
            $('#bbsId').on('change', function () {
                const bbsId = $(this).val();

                let bbs = bbsList.find((element) => element.bbsId == bbsId);
                if (bbs.fileAtchCo === 0 || isEmpty(bbs.fileAtchCo)) {
                    $('#fileRow').hide();
                } else {
                    $('#fileRow').show();
                }
                document.getElementById('fileAtchSize').value = bbs.fileAtchSize;
                document.getElementById('fileAtchCo').value = bbs.fileAtchCo;
                document.getElementById('permExtsn').value = bbs.permExtsn;
                document.getElementById('files').value = '';
                if (bbs.bbsTyCode !== 'BBS_DEFAULT') {
                    document.getElementById('noticeAt').checked = false;
                    document.getElementById('noticeSet').style.display = 'none';
                } else {
                    document.getElementById('noticeSet').style.removeProperty('display');
                }
            })
        }
    </script>
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
                                    <h5 class="mb-0">게시물 등록</h5>
                                </div>
                                <div class="card-body pt-0">
                                    <input id="fileAtchSize" name="fileAtchSize" type="hidden" value=""/>
                                    <input id="fileAtchCo" name="fileAtchCo" type="hidden" value=""/>
                                    <input id="permExtsn" name="permExtsn" type="hidden" value=""/>
                                    <input id="fileAt" name="fileAt" type="hidden" value=""/>
                                    <form id="frm">
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
                                                        <label class="form-label" for="bbsId">
                                                            <spring:message code="bbs.bbsNm"/><span
                                                                class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td colspan="3" id="bbsIdDiv">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="has-validation">
                                                                <select class="form-select" name="bbsId"
                                                                        id="bbsId"></select>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="nttSj">
                                                            <spring:message code="title"/><span
                                                                class="text-danger ms-1">*</span>
                                                        </label>
                                                    </th>
                                                    <td colspan="3">
                                                        <div class="form-control-validation fv-plugins-icon-container">
                                                            <div class="flex-c gap-2">
                                                                <div class="has-validation w-100">
                                                                    <input class="form-control" type="text" name="nttSj"
                                                                           id="nttSj" placeholder="예시제목">
                                                                </div>
                                                                <div class="flex-c gap-1 text-nowrap" id="noticeSet">
                                                                    <input class="form-check-input" type="checkbox"
                                                                           name="noticeAt" id="noticeAt" value="Y"/>
                                                                    <label class="form-check-label"
                                                                           for="noticeAt">공지글</label>
                                                                </div>
                                                            </div>
                                                            <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="periodTr" style="display:none;">
                                                	<th>
                                                        <label class="form-label" for="period">
                                                            <spring:message code="ntt.period"/>
                                                        </label>
                                                    </th>
                                                	<td colspan="3">
	                                                    <div class="form-control-validation fv-plugins-icon-container">
	                                                        <div class="d-flex flex-column flex-sm-row align-items-center justify-content-start w-100"
	                                                             id="period">
	                                                            <div class="mb-0 me-4 w-sm-100">
	                                                                <div class="input-group input-group-merge">
	                                                                    <input type="text"
	                                                                           class="dt-datetime form-control flatpickr-input"
	                                                                           placeholder="<spring:message code='table.header.stDt'/>"
	                                                                           id="nttStartDt" name="nttStartDt" readonly>
	                                                                    <span class="input-group-text cursor-pointer"
	                                                                          onclick="$('#nttStartDt').focus();"><i
	                                                                            class="icon-base bx bx-calendar"></i></span>
	                                                                </div>
	                                                            </div>
	                                                            <div class="mb-0 me-sm-4 d-flex align-items-center align-self-sm-center">
	                                                                <span class="form-label"><i
	                                                                        class="icon-base bx bx-minus"></i></span>
	                                                            </div>
	                                                            <div class="mb-0 me-4 w-sm-100">
	                                                                <div class="input-group input-group-merge">
	                                                                    <input type="text"
	                                                                           class="dt-datetime form-control flatpickr-input"
	                                                                           placeholder="<spring:message code='table.header.endDt'/>"
	                                                                           id="nttEndDt" name="nttEndDt" readonly>
	                                                                    <span class="input-group-text cursor-pointer" onclick="$('#nttEndDt').focus();"><i
	                                                                            class="icon-base bx bx-calendar"></i></span>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label">콘텐츠 내용<span
                                                                class="text-danger ms-1">*</span></label>
                                                    </th>
                                                    <td colspan="3">
                                                        <%-- Quill Editor(JS, CSS 포함)를 불러옵니다 --%>
                                                        <%@ include file="/WEB-INF/jsp/vasanta/cmmn/quill-editor.jsp" %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label class="form-label" for="files"><spring:message
                                                                code="atchfile"/><span id ="fileRequired" class="text-danger ms-1" style="display:none;">*</span></label>
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
                                                </tbody>
                                            </table>
                                        </div>
                                        <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>"
                                               value="<c:out value="${anticsrf.token}"/>">
                                    </form>
                                    <div class="d-flex justify-content-between mt-5">
                                        <button type="button" class="btn btn-secondary me-2" id="btnList">
                                            <spring:message code="button.list"/></button>
                                        <button type="button" class="btn btn-primary" id="btnSave"><spring:message
                                                code="button.create"/></button>
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

<!-- script -->
<script src="/static/js/common/validator.js"></script>
<script src="/static/js/common/validation.js"></script>

<%@ include file="/WEB-INF/jsp/vasanta/cmmn/form-validation.jsp" %>

<script>
	let selectedFiles = new DataTransfer(); // 선택된 파일들을 관리하는 객체

    $(function () {
        if (location.href.includes('ntt')) {
            document.getElementById('bbsIdDiv').style.removeProperty('display');
            Ajax.get('/api/sys/bbs/all', setSelect, fail);
        } else {
            const depth = getUrlDepth();
            addSelectOption('bbsId', depth[depth.length - 2], depth[depth.length - 2]);
            $('#bbsId').prop('selectedIndex', 0).find("option:eq(0)").prop("selected", true);
            Ajax.get(dataToQueryString('/api/sys/bbs/info', {bbsId: depth[depth.length - 2]}), init, fail);
        }

        initFvNtt();
        
        const nttStartDt = document.querySelector('#nttStartDt'),
        nttEndDt = document.querySelector('#nttEndDt')
        // Date
        if (nttStartDt) {
        	nttStartDt.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d",
                monthSelectorType: "static"
            });
        }

        if (nttEndDt) {
        	nttEndDt.flatpickr({
                locale: "ko",
                dateFormat: "Y-m-d",
                monthSelectorType: "static"
            });
        	
        	$("#nttEndDt").val("")
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

        <%-- 게시판 변경 시 이벤트 --%>
        document.getElementById('bbsId').addEventListener('change', function () {
            const selectedBbsId = this.value;
            const bbs = bbsList.find(item => item.bbsId == selectedBbsId);

            if (bbs) {
                document.getElementById('fileAtchSize').value = bbs.fileAtchSize;
                document.getElementById('fileAtchCo').value = bbs.fileAtchCo;
                document.getElementById('permExtsn').value = bbs.permExtsn;
                document.getElementById('fileAt').value = bbs.fileAt;

                document.getElementById('files').value = '';
                
                if (bbs.fileAt === 'Y') {
                	$("#fileRequired").show();
                } else {
                	$("#fileRequired").hide();
                }
            }
            
            if (selectedBbsId === '1316') {
            	$("#periodTr").show();
            } else {
            	$("#periodTr").hide();
            	$("#nttStartDt, #nttEndDt").val("");
            }
        });

        $('#btnSave').on('click', function () {
            fvNttInstance.validate().then(function (status) {
                const validQuill = validateQuill(quill, VALIDATION_MESSAGES.cntnts.cntntsCnRequired);
                if (!validQuill) return;

                if (status === 'Valid') {
                    customAlert({
                        title: '<spring:message code="common.system.info"/>',
                        content: '등록하시겠습니까?',
                        showCancel: true,
                        onConfirm: function () {
                            const data = new FormData($(`#frm`)[0]);
                            data.set('nttCn', quill.getSemanticHTML());
                            data.set('thumbUrl', imgTag());
                            data.set('noticeAt', $("#noticeAt").val() == "on" ? "Y" : "N");
                            data.set('nttStartDt', $("#nttStartDt").val());
                            data.set('nttEndDt', $("#nttEndDt").val());
                            uploadAjax('/api/sys/ntt/save', success, fail, { data: data });
                        }
                    });
                }

            });
        })

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


        function imgTag() {
            const html = quill.root.innerHTML;
            const imgTags = $(html).find('img');

            if (imgTags.length === 0) {
                return undefined;
            }

            return $(imgTags[0]).attr('src');
        }
    })
	
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
