<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title>게시물관리</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <script type="text/javascript">
        function searchDetail() {
            Ajax.get(setUrl('/api/sys/ntt/detail'), searchDetailSuccess, fail);
        }

        function searchDetailSuccess(data) {
            document.getElementById('nttId').value = data.nttId;
            document.getElementById('parntscttId').value = data.nttId;
            document.getElementById('bbsId').value = data.bbsId;
            document.getElementById('sj').value =  data.nttSj;
            document.getElementById('cn').value = data.nttCn;
            document.getElementById('writer').insertAdjacentHTML('afterbegin', data.wrterNm);

            node = ``
            for(let i = 0; i < data.files.length; i++) {
                node += `<div id="${'${data.files[i].atchFileId}'}" class="row" name="">
                                    <div class="col tit"><spring:message code="atchfile"/></div>
                                    <div class="col txt">
                                        <input style="cursor:pointer" type="text" name="atchFile" data-id="<c:out value='${"${data.files[i].atchFileId}"}' />" data-size="" value="<c:out value='${"${data.files[i].orignlFileNm}"}' />.<c:out value='${"${data.files[i].fileExtsn}"}' />"  readonly>
                                        <button onClick="clickDeleteFileButton(this);" type="button" name="fileDeleteButton" data-id="<c:out value='${"${data.files[i].atchFileId}"}' />" class="btn dark"><spring:message code="button.delete" /></button>
                                    </div>
                                </div>`
            }
            let fileList = document.getElementById('fileList');
            fileList.insertAdjacentHTML('beforeend', node);

            let atchFiles = document.getElementsByName('atchFile');

            for (let i = 0; i < atchFiles.length; i++) {
                atchFiles[i].addEventListener('click', function(event) {
                    window.open('/file/download?fileId=' + this.getAttribute('data-id'))
                });
            }

            editorInit();
        }

        let clickDeleteFileButton = function(e) {
            let fileId = document.createElement('input')
            fileId.type = 'hidden';
            fileId.value = e.dataset.id;
            fileId.name = 'removeFileList';
            let file = `<input type="hidden" name="removeFileList" value="<c:out value='${"${e.dataset.id}"}' />" >`
            document.getElementById('usrFrm').appendChild(fileId);
            document.getElementById(e.dataset.id).remove();
        }

        function search(pageIndex, nttId) {
            let data = bindingData(document.getElementById('frmSearch'));
            data["pageIndex"] = pageIndex;
            data["nttId"] = nttId;
            Ajax.get(dataToQueryString('/api/sys/answer/list', data), success, fail);
        }

        let success = function (data) {

            let paginationInfo = data.paginationInfo;
            document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;
            renderPagination(paginationInfo, document.getElementById('pagination'));

            let tableBody = document.getElementById('table-body');

            removeAllChild(tableBody);
            data.data.forEach(function (element, index) {
                if (index >= paginationInfo.pageSize) return false;
                let node = `<tr>
                                <td class="tblBodyItem num">${'${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo - 1) * paginationInfo.pageSize) - index}'}</td>
                                <td class="tblBodyItem tit">${'${element.answerCn}'}</td>
                                <td class="tblBodyItem num">${'${element.wrterNm}'}</td>
                                <td class="tblBodyItem num">${'${element.frstRegistDt}'}</td>
                                <td class="tblBodyItem fix200">
                                    <div class="buttonArea center">`
                if(element.useAt === 'Y') {
                    node += `<a name="updateAnswerButton" href="#!" data-id="${'${element.answerId}'}" data-stts="${'${element.useAt}'}" class="btn sml line"><img src="/sys/assets/icon/content/smlbtn_view_on.svg" alt="">노출</a>`
                }   else {
                    node += `<a name="updateAnswerButton" href="#!" data-id="${'${element.answerId}'}" class="btn sml line"><img src="/sys/assets/icon/content/smlbtn_view_off.svg" alt="">미노출</a>`
                }
                node += `<a name="deleteAnswerButton" href="#!" data-id="${'${element.answerId}'}" class="btn sml dark"><img src="/sys/assets/icon/content/smlbtn_delete.svg" alt="">삭제</a>
                                    </div>
                                </td>
                          </tr>`;
                tableBody.insertAdjacentHTML('beforeend', node);
            });
            $('a[name="updateAnswerButton"]').on('click', function() {
                let message = '해당 댓글을 노출하시겠습니까?';
                if($(this).data('stts') === 'Y')
                    message = '해당 댓글을 차단하시겠습니까?';
                if(!confirm(message)) {
                    return;
                }
                let data = {answerId: $(this).data('id')}
                Ajax.post('/api/sys/answer/update', function() {location.reload()}, fail, {data: JSON.stringify(data)})
            })

            $('a[name="deleteAnswerButton"]').on('click', function() {
                let message = '해당 댓글을 삭제하시겠습니까?';
                if(!confirm(message)) {
                    return;
                }
                Ajax.post('/api/sys/answer/delete?answerId=' + $(this).data('id'), function() {location.reload()}, fail)
            })
        }

        let apiSuccessDelete = function () {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.delete"/>',
                showCancel: false,
                onConfirm: function() {
                    goPage('list');
                }
            });
        }

        let apiSuccessSave = () => {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="success.common.save"/>',
                showCancel: false,
                onConfirm: function() {
                    goPage('list');
                }
            });
        }

        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false,
                onConfirm: function() {
                    console.log(xhr + ", " + status + " : " + error);
                }
            });
        }
    </script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/vasanta/sys/include/header.jsp" %>
<div class="wrapper">

    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/nav.jsp" %>

    <!-- 콘텐츠 영역 start -->
    <div class="contentWrap">
        <%@ include file="/WEB-INF/jsp/vasanta/sys/include/conTit.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col m12">
                    <div class="container">
                        <input id="fileAtchSize" name="fileAtchSize" type="hidden" value="0" />
                        <input id="fileAtchCo" name="fileAtchCo" type="hidden" value="0" />
                        <input id="permExtsn" name="permExtsn" type="hidden" value="" />
                        <div class="adminTable">
                            <form id="usrFrm" onsubmit="return false;">
                                <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">
                                <div class="row">
                                    <div class="col tit"><spring:message code="ntt"/> <spring:message code="number"/></div>
                                    <div class="col txt">
                                        <input id="nttId" name="nttId" value="" readonly>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col tit"><spring:message code="writer"/></div>
                                    <div class="col txt" id="writer">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col tit"><spring:message code="title"/></div>
                                    <div class="col txt">
                                        <input id="sj" name="nttSj" type="text">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col tit"><spring:message code="cn"/></div>
                                    <div class="col txt">
                                        <textarea id="cn" name="nttCn"></textarea>
                                    </div>
                                </div>
                                <div id="fileList">

                                </div>
                            </form>
                        </div>
                        <div class="buttonArea">
                            <div class="buttonSec">
                                <button id="btnDelete" type="button" class="btn line"><spring:message code="button.delete"/></button>
                                <button id="btnUpdate" type="button" class="btn"><spring:message code="button.modify"/></button>
                            </div>
                        </div>
                        <form id="frm">
                            <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">
                            <input type="hidden" name="nttId" id="replyId" value="">
                            <input type="hidden" name="bbsId" id="bbsId" value="">
                            <input type="hidden" name="parntscttId" id="parntscttId" value="">
                            <div class="adminTable">
                                <div class="row">
                                    <div class="col tit required"><spring:message code="title"/></div>
                                    <div class="col txt">
                                        <input type="text" name="nttSj" id="nttSj" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col tit required"><spring:message code="cn"/></div>
                                    <div class="col txt">
                                        <textarea name="nttCn" id="editor" cols="30" rows="10"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col tit"><spring:message code="atchfile" /></div>
                                    <div class="col txt">
                                        <div class="fileBox">
                                            <input type="file" id="files" name="files" class="fileItem" multiple>
                                            <label for="files"><spring:message code="button.select"/></label>
                                        </div>
                                    </div>
                                </div>
                                <c:forEach var="item" items="${data.replyFiles}">
                                    <div class="row" name="<c:out value='${item.atchFileId}' />">
                                        <div class="col tit"><spring:message code="atchfile"/></div>
                                        <div class="col txt">
                                            <input type="text" readonly id="<c:out value='${item.atchFileId}' />"
                                                   name="removeAtchFile" data-size="<c:out value='${item.fileSize}' />" class="" value="<c:out value='${item.orignlFileNm}.${item.fileExtsn}' />" >
                                            <button type="button" name="fileDeleteButton" data-id="<c:out value='${item.atchFileId}' />" class="btn dark"><spring:message code="button.delete"/></button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="buttonArea">
                                <button type="button" id="btnList" class="btn dark"><spring:message code="button.list"/></button>
                                <div class="buttonSec">
                                    <button type="button" id="btnSave" class="btn"><spring:message code="button.create"/></button>
                                </div>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col m12 conTop">
                                <div class="conTit">
                                    <h3 class=""><spring:message code="answer.manage" /></h3>
                                </div>
                            </div>
                        </div>
                        <div class="table-top">
                            <div class="boardCount">
                                <spring:message code="table.total.start" /> <span id="totCnt"></span><spring:message code="table.total.end" />
                            </div>
                        </div>
                        <div class="table-area">
                            <table class="tbl board">
                                <thead class="tblHeader">
                                <tr>
                                    <th class="tblHeaderItem num"><spring:message code="table.header.number" /></th>
                                    <th class="tblHeaderItem tit"><spring:message code="cn" /></th>
                                    <th class="tblHeaderItem item01"><spring:message code="writer" /></th>
                                    <th class="tblHeaderItem date"><spring:message code="regDt" /></th>
                                    <th class="tblHeaderItem fix200"><spring:message code="manage" /></th>
                                </tr>
                                </thead>
                                <tbody id="table-body">
                                </tbody>
                            </table>
                            <div class="pagination-area">
                                <ul id="pagination" class="pagination">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 콘텐츠 영역 end -->

    <!-- Contents end -->
</div>

<!-- script -->
<script src="/sys/js/Component_1_0_231220.js"></script>
<script src="/sys/js/lib/slick.min.js"></script>
<script src="/sys/js/lib/flatpickr.js"></script>
<script src="/sys/js/lib/l10n_ko.js"></script>
<script src="/sys/js/lib/jquery.selectric.min.js"></script>

<script src="/sys/js/common.js"></script>
<script src="/sys/js/content.js"></script>
<script src="/js/ckeditor/ckeditor.js"></script>
<script src="/js/common/editor.js"></script>
<script>
    $(function () {
        searchDetail();

        let removeFileList = [];
        $('#nttId').val(getUrlParameter('nttId'));
        search(1, $('#nttId').val());

        let pagination = document.getElementById('pagination');
        pagination.addEventListener('click', function (event) {
            pageEventDelegation(event);
        });

        let btnList = document.getElementById('btnList');
        btnList.addEventListener('click', function () {
            goBack();
        });

        $('#btnSave').on('click', function () {
            $('#frm').validate({
                rules: {
                },
                messages: {
                },
                errorPlacement: function (error, element) {
                    return false;
                },
                submitHandler: function (form) {
                    const nttCn = getEditorData();
                    if(isEmpty(nttCn)) {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '내용은 필수 입력값입니다.',
                            showCancel: false,
                            onConfirm: function() {
                            }
                        });
                        return;
                    }
                    if(!confirm('<spring:message code="confirm.common.save"/>')) {
                        return;
                    }
                    const data = new FormData(form);
                    data.set('nttCn', nttCn);
                    data.append('thumbUrl', imgTag());
                    uploadAjax('/api/sys/ntt/save', function () {
                        customAlert({
                            title: '<spring:message code="common.system.info"/>',
                            content: '<spring:message code="success.common.save"/>',
                            showCancel: false,
                            onConfirm: function() {
                                goPage('list');
                            }
                        });
                    }, fail, {data: data})
                }
            })
            $('#frm').submit();
        });

        $('#btnDelete').on('click', function() {
            if(!confirm('<spring:message code="confirm.common.delete"/>')) {
                return;
            }
            Ajax.post('/api/sys/ntt/delete?nttId=' + document.getElementById('nttId').value, apiSuccessDelete, fail);
        })

        $('#btnUpdate').on('click', function() {
            $('#usrFrm').validate({
                rules: {
                    nttSj: {
                        required: true,
                        maxlength: 2000
                    },
                    nttCn: {
                        required: true
                    }
                },
                messages: {
                    nttSj: {
                        required: '<spring:message code="ntt.nttSj.notblank" />',
                        maxlength: '<spring:message code="ntt.nttSj.max" />'
                    },
                    nttCn: {
                        required: '<spring:message code="ntt.nttCn.notblank" />'
                    }
                },
                errorPlacement: function (error, element) {
                    return false;
                },
                submitHandler: function (form) {
                    if(!confirm('<spring:message code="confirm.common.update"/>')) {
                        return;
                    }
                    const data = new FormData(form);
                    data.set('bbsId', document.getElementById('bbsId').value);
                    Ajax.upload('/api/sys/ntt/update', apiSuccessSave, fail, {data: data});
                }
            })
            $('#usrFrm').submit();
        })
    })
</script>
</body>
</html>
