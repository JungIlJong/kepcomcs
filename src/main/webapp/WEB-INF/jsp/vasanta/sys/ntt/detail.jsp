<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" data-skin="bordered" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title>게시물관리</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <script type="text/javascript">

        function searchDetail() { alert('sdfsdf');
            Ajax.get(setUrl('/api/sys/ntt/detail'), searchDetailSuccess, fail);
        }

        function searchDetailSuccess(data) {
            document.getElementById('nttId').insertAdjacentHTML('afterbegin', data.nttId);
            document.getElementById('nttSj').insertAdjacentHTML('afterbegin', data.nttSj);
            document.getElementById('nttCn').insertAdjacentHTML('afterbegin', data.nttCn);
            document.getElementById('frstRegistDt').insertAdjacentHTML('afterbegin', data.frstRegistDt);
            document.getElementById('wrterNm').insertAdjacentHTML('afterbegin', data.wrterNm);
            node = ``
            for(let i = 0; i < data.files.length; i++) {
                node += `<div class="row" name="">
                                    <div class="col tit"><spring:message code="atchfile"/></div>
                                    <div class="col txt">
                                        <input style="cursor: pointer;" type="text" name="atchFile" data-id="<c:out value='${"${data.files[i].atchFileId}"}' />" data-size="" value="<c:out value='${"${data.files[i].orignlFileNm}"}' />.<c:out value='${"${data.files[i].fileExtsn}"}' />"  readonly>
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
        }

        let fail = function (xhr, status, error) {
            customAlert({
                title: '<spring:message code="common.system.info"/>',
                content: '<spring:message code="fail.common.msg"/>',
                showCancel: false,
                onConfirm: function() {
                    console.log(xhr + ", " + status + " : " + error)
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
                            <input id="nttId" name="nttId" type="hidden" value=""/>
                            <input id="bbsId" name="bbsId" type="hidden" value="" />
                            <div class="adminTable">
                                <div class="row">
                                    <div class="col tit"><spring:message code="title"/></div>
                                    <div class="col txt" id="nttSj"></div>
                                </div>
                                <div class="row">
                                    <div class="col tit"><spring:message code="writer"/></div>
                                    <div class="col txt" id="wrterNm"></div>
                                    <div class="col tit"><spring:message code="regDt"/></div>
                                    <div class="col txt" id="frstRegistDt"></div>
                                </div>
                                <div class="row">
                                    <div class="col tit"><spring:message code="cn"/></div>
                                    <div class="col txt" id="nttCn"></div>
                                </div>
                                <div id="fileList">

                                </div>
                            </div>
                            <div class="buttonArea">
                                <button type="button" id="btnList" class="btn dark"><spring:message code="button.list"/></button>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 콘텐츠 영역 end -->

    <!-- Contents end -->
</div>
<script src="/sys/js/Component_1_0_231220.js"></script>
<script src="/sys/js/lib/slick.min.js"></script>
<script src="/sys/js/lib/flatpickr.js"></script>
<script src="/sys/js/lib/l10n_ko.js"></script>
<script src="/sys/js/lib/jquery.selectric.min.js"></script>

<script src="/sys/js/common.js"></script>
<script src="/sys/js/content.js"></script>
<script>
    $(function () {
        searchDetail();
        let btnList = document.getElementById('btnList');
        btnList.addEventListener('click', function () {
            goBack();
        });
    })
</script>
</body>
</html>
