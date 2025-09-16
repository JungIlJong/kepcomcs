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
  <title>한전MCS 주식회사</title>
  <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/sub.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="company-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>가치체계</h1>
        <p>With People, New KEPCO MCS</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/company/overview">회사소개</a>
        </li>
        <li>가치체계</li>
      </ul>
    </div>
    <div class="contents">
      <div class="mission-section">
        <h2>가치체계</h2>
        <div class="mission mission_01">
          <div>
            <h3>미션 <span class="bar">|</span> <span>Mission</span></h3>
            <p class="conts-desc_03">전력서비스, 그 이상의 가치로 <br>고객의 삶을 풍요롭게</p>
          </div>
          <div>
            <img src="/resources/landing/images/company/mission1.jpg">
          </div>
        </div>
      </div>
      <div class="mission-wrap mission-wrap_01" id="missionAni01">
        <div class="mission mission_02 mission-ani">
          <div>
            <img src="/resources/landing/images/company/mission2.jpg">
          </div>
          <div>
            <h3>비전 <span class="bar">|</span> <span>Vision</span></h3>
            <p class="conts-desc_03 font-mont">Connecting People & Energy<br>For a Better Life.</p>
          </div>
        </div>
      </div>
      <div class="mission-wrap mission-wrap_02" id="missionAni02">
        <div class="mission mission_03 mission-ani">
          <div>
            <h3>핵심가치 <span class="bar">|</span> <span>Core Value</span></h3>
            <ul class="core-li">
              <li>
                <img src="/resources/landing/images/company/ico_value1.jpg">
                <p>사회책임</p>
              </li>
              <li>
                <img src="/resources/landing/images/company/ico_value2.jpg">
                <p>고객존중</p>
              </li>
              <li>
                <img src="/resources/landing/images/company/ico_value3.jpg">
                <p>도전정신</p>
              </li>
              <li>
                <img src="/resources/landing/images/company/ico_value4.jpg">
                <p>소통화합</p>
              </li>
            </ul>
          </div>
          <div>
            <img src="/resources/landing/images/company/mission3.jpg">
          </div>          
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

    var waypoint = new Waypoint({
      element: document.getElementById('missionAni01'),
      handler: function(direction) {
        $('#missionAni01').addClass('visible')
      },
      offset: '75%'
    })

    var waypoint2 = new Waypoint({
      element: document.getElementById('missionAni02'),
      handler: function(direction) {
        $('#missionAni02').addClass('visible')
      },
      offset: '75%'
    })

    var waypoint3 = new Waypoint({
      element: document.getElementById('missionAni03'),
      handler: function(direction) {
        $('#missionAni03').addClass('visible')
      },
      offset: '75%'
    })

  </script>

</body>
</html>
