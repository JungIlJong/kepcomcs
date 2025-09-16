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
  <title>신문고 | 윤리경영 | ESG경영 | 한전MCS</title>
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
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="esg-main esg-layout">
    <ul class="location esg-loca">
      <li>
        <a href="/">Home</a>
      </li>
      <li>
        <a href="/mber/esg/safety/safety-introduction">ESG 경영</a>
      </li>
      <li>
        <a href="/mber/esg/ethic/ethic-introduction">윤리경영</a>
      </li>
      <li>신문고</li>
    </ul>     
    <div class="contents esg-conts report-conts">     
      <div class="esg-tit-wrap report-tit-wrap">
        <h1>신문고</h1>
        <p class="conts-desc_08 txt-ac">신문고를 찾아주셔서 감사합니다.<br>한전MCS는 깨끗한 경영을 위해 비리 및 부정에 관련된 의견을 수렴하고 있습니다. <br><span>신문고는 아래 내용의 민원만 처리하고 있습니다.</span><span> 민원서비스 등은 <a href="https://www.epeople.go.kr/">국민신문고</a>를 이용해주세요.</span></p>
      </div>
      <div class="report-list-wrap">
        <h3>신문고 처리내용</h3>
        <div class="report-list-row">
          <ul class="report-list">
            <li>
              <p>부패·비위행위</p>
              <div>
                근무태도, 공직기강<br>무단결근, 지각·조퇴<br>근무이탈<br>…
              </div>
            </li>
            <li>
              <p>직장내 괴롭힘</p>
              <div>
                언어폭력 폭언,<br>폭행 태움,<br>따돌림 강요,<br>유언비어<br>…
              </div>
            </li>
            <li>
              <p>성폭력</p>
              <div>
                성폭행<br>성추행<br>성희롱<br>…
              </div>
            </li>
            <li>
              <p>부정청탁 및 금품수수</p>
              <div>
                인사청탁<br>민원청탁<br>금품요구<br>…
              </div>
            </li>
            <li>
              <p>예산낭비 및 공금부정사용</p>
              <div>
                공금사적사용<br>선결재<br>관할구역외 사용<br>…
              </div>
            </li>
            <li>
              <p>기타</p>
              <div>
                기타 비리 및 부정
              </div>
            </li>
          </ul>
        </div>
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
