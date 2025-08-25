<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered"
      data-template="horizontal-menu-template" data-assets-path="/vendor/sneat/">

<head>
  <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
  <script src="/static/js/common/getToken.js"></script>
    <title>소셜 최초 회원가입</title>
    <script type="text/javascript">
        <%-- 아이디 중복체크 시 Callback 함수 --%>
        let successDuplicate = function (data) {
            if (data === 0) {
                document.getElementById('chkDup').value = 'Y';
                alert('사용가능한 아이디입니다.');
            } else {
                document.getElementById('chkDup').value = 'N';
                alert('이미사용중인 아이디입니다.');
            }
        }

        <%-- Ajax 요청실패 시 Callback 함수 --%>
        let fail = function (xhr, status, error) {
            alert('<spring:message code="fail.common.msg"/>');
            console.log(xhr + ", " + status + " : " + error)
        }
    </script>
</head>
<body>

<div class="wrapper sub container">
  <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp" %>
    <div class="contentWrap">
      <%@ include file="/WEB-INF/jsp/vasanta/mber/include/sub-title.jsp" %>
        <div class="contentBox">
            <div class="joinBox">
                <ul class="stepperBox">
                    <li class="stepperItem">
                        <p class="stepperTit">약관동의</p>
                    </li>
                    <li class="stepperItem on">
                        <p class="stepperTit">추가정보입력</p>
                    </li>
                    <li class="stepperItem">
                        <p class="stepperTit">가입완료</p>
                    </li>
                </ul>

                <form id="frm" action="" method="post">
                    <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">
                    <input type="hidden" id="mberId" name="mberId" placeholder="" autocomplete='one-time-code' maxlength="12">
                    <input type="hidden" id="email" name="email" value="<c:out value="${email}"/>">
                    <input type="hidden" id="provider" name="provider" value="<c:out value="${provider}"/>">
                    <input type="hidden" id="providerId" name="providerId" value="<c:out value="${providerId}"/>">
                    <input type="hidden" id="mobile" name="mobile" value="<c:out value="${mobile}"/>">
                    <input type="hidden" id="snsname" name="snsname" value="<c:out value="${snsname}"/>">
                    <div class="narrowWidth joinInfoBox">
<%--                        <p class="requredTxt"><span class="required">*</span>필수입력</p>--%>
                        <ul>

                            <li>
                                <span class="leftItem"><spring:message code="title.name"/><span class="required">*</span></span>
                                <div class="rightItem">
                                    <div class="inputField">
                                        <input type="text" id="mberNm" name="mberNm" placeholder="" autocomplete='one-time-code' maxlength="20" value="<c:out value="${fn:replace(snsname, ' ', '')}"/>">
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="leftItem"><spring:message code="title.email"/><span class="required">*</span></span>
                                <div class="rightItem">
                                    <div class="inputField">
                                        <input type="text" name="emailAdres" id="emailAdres" autocomplete='one-time-code' value="<c:out value="${email}"/>">
                                    </div>
                                </div>
                            </li>
                            <li>
                                <span class="leftItem"><spring:message code="title.cellphone.number"/><span class="required">*</span></span>
                                <div class="rightItem">
                                    <div class="flexBox">
                                        <div class="inputBox">
                                            <input type="hidden" name="mbtlnum" id="mbtlnum">
                                            <div class="inputField">
                                                <input type="text" name="firstMbtlnum" id="firstMbtlnum" maxlength="3" value="<c:out value="${fn:split(mobile, '-')[0]}"/>">
                                            </div>
                                            <span>-</span>
                                            <div class="inputField">
                                                <input type="text" name="middleMbtlnum" id="middleMbtlnum" maxlength="4" value="<c:out value="${fn:split(mobile, '-')[1]}"/>">
                                            </div>
                                            <span>-</span>
                                            <div class="inputField">
                                                <input type="text" name="endMbtlnum" id="endMbtlnum" maxlength="4" value="<c:out value="${fn:split(mobile, '-')[2]}"/>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
                <div class="buttonArea bdArea">
                    <a href="javascript:void(0);" id="btnCancel" class="btn line bdBtn"><spring:message code="button.cancel"/></a>
                    <a href="javascript:void(0);" id="btnSave" class="btn bdBtn"><spring:message code="button.create"/></a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/sneat-footer.jsp" %>
<script src="/mber/js/Component_1_0_231220.js"></script>
<script src="/mber/js/lib/slick.min.js"></script>
<script src="/mber/js/lib/flatpickr.js"></script>
<script src="/mber/js/lib/l10n_ko.js"></script>
<script src="/mber/js/lib/jstree.js"></script>
<script src="/mber/js/lib/jquery.selectric.min.js"></script>
<script src="/mber/js/common.js"></script>
<script src="/mber/js/content.js"></script>
<script src="/js/common/validator.js"></script>
<script type="text/javascript">
    $(function () {

        <%-- form validate --%>
        $('#frm').validate({
            rules: {
                mberNm: {
                    required: true,
                    minlength: 2,
                    maxlength: 20,
                    validMberNm: true,
                },
                emailAdres: {
                    required: true,
                    email: true
                },
                mbtlnum: {
                    required: true,
                    validMbtlnum: true
                },
            },
            messages: {
                mberNm: {
                    required: '<spring:message code="mber.mberNm.required"/>',
                    minlength: '<spring:message code="mber.mberNm.minlength"/>',
                    maxlength: '<spring:message code="mber.mberNm.maxlength"/>',
                    validMberNm: '<spring:message code="mber.mberNm.valid"/>',
                },
                emailAdres: {
                    required: '<spring:message code="mber.emailAdres.required"/>',
                    email: '<spring:message code="mber.emailAdres.email"/>',
                },
                mbtlnum: {
                    required: '<spring:message code="mber.mbtlnum.required"/>',
                    validMbtlnum: '<spring:message code="mber.mbtlnum.validMbtlnum"/>',
                },
            },
            submitHandler: function (form) {
                if (confirm('<spring:message code="confirm.common.join"/>')){
                    form.submit();
                }
            }
        });
        let success = function (data) {
            alert('회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.');
            location.href="/mber/snslogin/login";
        }
        <%-- 저장버튼 클릭 시 이벤트 --%>
        document.getElementById('btnSave').addEventListener('click', function () {
            let firstMbtlnum = document.getElementById('firstMbtlnum').value;
            let middleMbtlnum = document.getElementById('middleMbtlnum').value;
            let endMbtlnum = document.getElementById('endMbtlnum').value;
            document.getElementById('mbtlnum').value = firstMbtlnum + middleMbtlnum + endMbtlnum;
            $('#frm').attr('action','/api/snslogin/snslogin/snsJoin.vst');
            $('#frm').submit();
            const form = document.getElementById('frm').FormObject();
            $("#form").serializeArray();
            let options = {
                dataType: 'text',
                data : JSON.stringify(form)
            }
            var sendData = {
                'authorKey': 'edit',
                'authorNumber': $.trim($("#authorNumber").val())
            }
            Ajax.post('/api/snslogin/snsJoin', success, fail, $("#form").serializeArray());
        });

        $('#btnCancel').on('click', function() {
            goBack();
        })
    });
</script>
</body>
</html>
