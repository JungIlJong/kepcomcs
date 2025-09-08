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
  <link rel="stylesheet" href="/resources/landing/css/manage.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="manage-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>채용정보</h1>
        <p>꿈과 열정을 갖고 끊임 없이 도전하는 인재를 모집합니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/open-manage/public-notice">열린경영</a>
        </li>
        <li>채용정보</li>
      </ul>
    </div>
    <div class="contents">
      <div class="recruit-intro">
        <ul class="recruit-tab">
          <li class="selected">
            <a href="/mber/open-manage/talented-person">인재상</a>
          </li>
          <li>
            <a href="/mber/open-manage/recruit-list">채용공고</a>
          </li>
        </ul>
        <div class="recruit-desc">
          <p class="conts-desc_03"><span>꿈과 열정</span>, <br class="br-mob">그리고 끊임없는 <span>발전</span></p>
          <p class="conts-desc_08">한전MCS는 함께 꿈을 펼쳐 나아갈 인재를 모집합니다.<br class="br-pc">꿈과 열정을 갖고 고객을 최우선으로 생각하며, 끊임없이 발전하는 사람!<br class="br-pc">한전MCS가 생각하는 인재입니다.</p>
        </div>
      </div>
      <ul class="recruit-card" id="cardAni">
        <li>
          <div class="card-box">
            <div class="card-inner">
              <div class="front">
                <div>
                  <p class="card-desc_01">SERVICE</p>
                  <p class="card-desc_02">노력하는 서비스인</pass=>
                </div>
              </div>
              <div class="back">
                <div>
                  <img src="/resources/landing/images/manage/ico_service.png" alt="노력하는 서비스인">
                  <p class="card-desc_01">SERVICE</p>
                  <p class="card-desc_02">노력하는 서비스인</ps=>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="card-box">
            <div class="card-inner">
              <div class="front">
                <div>
                  <p class="card-desc_01">EXPERT</p>
                  <p class="card-desc_02">학습하는 전문인</p>
                </div>
              </div>
              <div class="back">
                <div>
                  <img src="/resources/landing/images/manage/ico_expert.png" alt="학습하는 전문인">
                  <p class="card-desc_01">EXPERT</p>
                  <p class="card-desc_02">학습하는 전문인</p>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="card-box">
            <div class="card-inner">
              <div class="front">
                <div>
                  <p class="card-desc_01">BEHAVIOR</p>
                  <p class="card-desc_02">행동하는 성취인</p>
                </div>
              </div>
              <div class="back">
                <div>
                  <img src="/resources/landing/images/manage/ico_behavior.png" alt="행동하는 성취인">
                  <p class="card-desc_01">BEHAVIOR</p>
                  <p class="card-desc_02">행동하는 성취인</p>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="card-box">
            <div class="card-inner">
              <div class="front">
                <div>
                  <p class="card-desc_01">COMMUNICATION</p>
                  <p class="card-desc_02">소통하는 신뢰인</p>
                </div>
              </div>
              <div class="back">
                <div>
                  <img src="/resources/landing/images/manage/ico_communication.png" alt="소통하는 신뢰인">
                  <p class="card-desc_01">COMMUNICATION</p>
                  <p class="card-desc_02">소통하는 신뢰인</p>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
      <div class="mission-wrap mission-wrap_02" id="personAni01">
        <div class="mission mission_03 mission-ani">
          <div>
            <h3>SERVICE <span class="bar">|</span> <span>노력하는 서비스인</span></h3>
            <p class="conts-desc_03 service-desc">모든 사람을 생각하고, 최고의 서비스를 제공하며 고객감동을 실천하는 인재</p>
          </div>
          <div>
            <img src="/resources/landing/images/manage/talent1.jpg">
          </div>          
        </div>
      </div>
      <div class="mission-wrap mission-wrap_01" id="personAni02">
        <div class="mission mission_02 mission-ani">
          <div>
            <img src="/resources/landing/images/manage/talent2.jpg">
          </div>
          <div>
            <h3>EXPERT <span class="bar">|</span> <span>학습하는 전문인</span></h3>
            <p class="conts-desc_03 service-desc">꾸준히 실력을 키워 자기분야에서 최고의 전문가로 성장하는 인재</p>
          </div>
        </div>
      </div>
      <div class="mission-wrap mission-wrap_02" id="personAni03">
        <div class="mission mission_03 mission-ani">
          <div>
            <h3>BEHAVIOR <span class="bar">|</span> <span>행동하는 성취인</span></h3>
            <p class="conts-desc_03 service-desc">뚜렷한 실력을 키워 자기분야에서 최고의 전문가로 성장하는 인재</p>
          </div>
          <div>
            <img src="/resources/landing/images/manage/talent3.jpg">
          </div>          
        </div>
      </div>
      <div class="mission-wrap mission-wrap_01" id="personAni04">
        <div class="mission mission_02 mission-ani">
          <div>
            <img src="/resources/landing/images/manage/talent4.jpg">
          </div>
          <div>
            <h3 class="line-he">COMMUNICATION <span class="bar">|</span> <br class="on-tablet"><span>소통하는 신뢰인</span></h3>
            <p class="conts-desc_03 service-desc">정직과 성실을 바탕으로 팀웍과 화합을 위해 노력하고 인간미와 예의범절을 갖춘 인재</p>
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

    //tab
    let $recruitMenu = $('.recruit-tab li');
    let $recruit = $('.recruit-tab');
    $recruitMenu.mouseenter(function() {
      $recruitMenu.removeClass('selected');
      $(this).addClass('selected');
    })    
    $recruit.mouseleave(function() {
      $recruitMenu.removeClass('selected');
      $($recruitMenu[0]).addClass('selected');
    })

    var waypoint = new Waypoint({
      element: document.getElementById('personAni01'),
      handler: function(direction) {
        $('#personAni01').addClass('visible')
      },
      offset: '75%'
    })

    var waypoint2 = new Waypoint({
      element: document.getElementById('personAni02'),
      handler: function(direction) {
        $('#personAni02').addClass('visible')
      },
      offset: '75%'
    })

    var waypoint3 = new Waypoint({
      element: document.getElementById('personAni03'),
      handler: function(direction) {
        $('#personAni03').addClass('visible')
      },
      offset: '75%'
    })

    var waypoint4 = new Waypoint({
      element: document.getElementById('personAni04'),
      handler: function(direction) {
        $('#personAni04').addClass('visible')
      },
      offset: '75%'
    })

    var waypoint5 = new Waypoint({
      element: document.getElementById('cardAni'),
      handler: function(direction) {
        $('#cardAni').addClass('visible')
      },
      offset: '85%'
    })

  </script>

</body>
</html>