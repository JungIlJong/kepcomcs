<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
  <meta name="format-detection" content="telephone=no"/> 
  <meta property="og:type" content="website">
  <meta property="og:title" content="한전MCS 주식회사">
  <meta property="og:description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta property="og:image" content="https://www.kepcomcs.co.kr/resources/landing/images/main/logo.png">
  <meta property="og:url" content="http://kepcomcs.co.kr">
  <title>비위양심신고센터 | 한전MCS</title>
  <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/sub.css">
  <link rel="stylesheet" href="/resources/landing/css/manage.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/landing/js/ie11CustomProperties.min.js"></script>
<!--   <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script> -->
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="esg-main esg-layout">
    <ul class="location esg-loca">
      <li>
        <a href="/">Home</a>
      </li>
      <li>비위양심신고센터</li>
    </ul>     
    <div class="contents esg-conts report-conts conscience">     
      <div class="esg-tit-wrap report-tit-wrap">
        <h1>비위양심신고센터</h1>
        <p class="conts-desc_08 txt-ac">
        비위양심신고센터를 찾아주셔서 감사합니다.<br>
		한전MCS는 비위행위의 자발적 신고를 통하여 구제 및 반성의 기회를 제공함으로써<br>
		조직 내 부패행위 근절을 목표로 하고 있습니다.</p>
		<img src="/resources/landing/images/bg_conscience.jpg">
      </div>
      <div class="report-list-wrap">
        <div class="btn-row btn-row-report">
          <a href="./report-agree">
            <button class="btn-report-act btn-black-s">신고하기</button>
          </a>
        </div>
      </div>        
      <div class="caution-wrap">
        <div class="caution">
          <p class="conts-desc_05">알아두세요!</p>
          <p class="conts-desc_02 caution-desc">신고인의 비밀은 철저히 보호해 드립니다. 신고내용이 부패·공익신고에 해당될 경우, 부패방지권익위법 또는 공익신고자 보호법에 따라 신고자는 보호됨을 안내드립니다.</p>
          <p class="caution-phone">061·345·9904 | 061·345·9907</p>
          <p class="caution-desc_02">신고사항은 조사 후 그 처리결과를 통보해 드립니다. 신고하실 때는 실명신고를 원칙으로 합니다. 접수관련 기타 문의사항이 있으시면 전화주시기 바랍니다.</p>
        </div>
      </div>
    </div> 
  </main>
  <!-- //main -->
  <div id="footer"></div>
  <div class="btn-top">
    TOP
    <p class="top-line"></p>
  </div>

  <script>
    $("#footer").load("/resources/landing/include/footer.html");
  </script>

</body>
</html>
