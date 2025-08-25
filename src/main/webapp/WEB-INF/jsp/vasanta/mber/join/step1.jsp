<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-theme="light">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
    <title>회원가입</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/vasanta/mber/include/head.jsp" %>
<div class="wrapper sub container">
    <%@ include file="/WEB-INF/jsp/vasanta/mber/include/nav.jsp" %>
    <div class="contentWrap">
        <%@ include file="/WEB-INF/jsp/vasanta/mber/include/conTit.jsp" %>
        <div class="contentBox">
            <div class="joinBox">
                <ul class="stepperBox">
                    <li class="stepperItem on">
                        <p class="stepperTit">약관동의</p>
                    </li>
                    <li class="stepperItem">
                        <p class="stepperTit">정보입력</p>
                    </li>
                    <li class="stepperItem">
                        <p class="stepperTit">가입완료</p>
                    </li>
                </ul>
                <div class="allCheck">
                    <fieldset>
                        <input type="checkbox" name="chkAll" id="chkAll">
                        <label for="chkAll">약관 전체동의</label>
                    </fieldset>
                </div>
                <hr>
                <form id="frm" action="step2" method="post">
                    <input type="hidden" name="<c:out value="${anticsrf.parameterName}"/>" value="<c:out value="${anticsrf.token}"/>">
                    <input type="hidden" id="chk" name="chk" value="N">
                    <div class="accordionBox">
                        <div class="accordion">
                            <div class="accordionItem">
                                <button type="button" class="accordionHeader">
                                    <div class="accordionTitle">
                                        <fieldset>
                                            <input type="checkbox" name="chkTerms" id="chk01">
                                            <label for="chk01">(필수) 서비스 이용약관 동의</label>
                                        </fieldset>
                                    </div>
                                    <div class="accordionIcon">
                                        <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">
                                    </div>
                                </button>
                                <div class="accordionContent" style="">
                                    ① 이 약관은 서비스를 통하여 온라인으로 공시하고 회원의 동의와 서비스의 승낙으로 효력이 발생됩니다.
                                    ② 서비스는 사정상 중요한 사유가 발생할 경우 사전 고지 없이 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 정당한 절차에 따라 서비스를 통하여 공지함으로써 효력을 발휘합니다.
                                    ③ 회원은 변경된 약관에 동의하지 않을 경우 회원 가입에 제약이 따르거나, 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 10일 이내에 해지 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.
                                </div>
                            </div>
                            <div class="accordionItem">
                                <button type="button" class="accordionHeader">
                                    <div class="accordionTitle">
                                        <fieldset>
                                            <input type="checkbox" name="chkTerms" id="chk02">
                                            <label for="chk02">(필수) 개인정보 처리방침 동의</label>
                                        </fieldset>
                                    </div>
                                    <div class="accordionIcon">
                                        <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">
                                    </div>
                                </button>
                                <div class="accordionContent" style="">
                                    네이버 커넥트는 교육 콘텐츠 제공, 특정 맞춤 교육 서비스 제공, 유료 서비스 제공에 따른 결제 및 요금정산 등 일반적인 교육 서비스 제공을 위해 개인정보를 활용합니다.
                                    또한, 회원제 서비스 제공, 회원 식별, 본인확인, 법정대리인 동의 획득, 이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정 이용 행위 제재, 가입의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인 등과 같은 회원관리를 목적으로도 개인정보를 이용합니다.
                                </div>
                            </div>
                            <%--                            <div class="accordionItem">
                                                            <button type="button" class="accordionHeader">
                                                                <div class="accordionTitle">
                                                                    <fieldset>
                                                                        <input type="checkbox" name="chkTerms" id="chk03">
                                                                        <label for="chk03">(필수) 이메일 무단 수집 거부</label>
                                                                    </fieldset>
                                                                </div>
                                                                <div class="accordionIcon">
                                                                    <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">
                                                                </div>
                                                            </button>
                                                            <div class="accordionContent" style="">
                                                                동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세 남산 위에 저 소나무 철갑을
                                                            </div>
                                                        </div>--%>
                        </div>
                    </div>
                </form>

                <div class="buttonArea bdArea">
                    <a href="javascript:void(0);" id="btnCancel" class="btn line bdBtn">취소</a>
                    <a href="javascript:void(0);" id="btnNext" class="btn bdBtn">다음</a>
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
<script type="text/javascript">
    $(function () {
        let chkAll = document.getElementById('chkAll');
        chkAll.addEventListener('click', function () {
            let isChecked = chkAll.checked;
            let chkTerms = document.querySelectorAll('input[name="chkTerms"]');
            if (isChecked) {
                chkTerms.forEach(function (checkBox) {
                    checkBox.checked = true;
                });
            } else {
                chkTerms.forEach(function (checkBox) {
                    checkBox.checked = false;
                });
            }
        });

        let btnNext = document.getElementById('btnNext');
        btnNext.addEventListener('click', function () {
            let checkedTerms = document.querySelectorAll('input[name="chkTerms"]:checked').length;
            if (checkedTerms < 2) {
                alert('약관에 모두 동의해주세요.');
                return;
            }

            document.getElementById('chk').value = 'Y';

            let frm = document.getElementById('frm');
            frm.submit();
        });
    });
</script>
</body>

</html>
