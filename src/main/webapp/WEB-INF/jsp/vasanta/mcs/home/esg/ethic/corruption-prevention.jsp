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
  <title>부패방지방침 | 윤리경영 | ESG경영 | 한전MCS</title>
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
    <ul class="location esg-loca" style="top:120px;">
      <li>
        <a href="/">Home</a>
      </li>
      <li>
        <a href="/mber/esg/safety/safety-introduction">ESG 경영</a>
      </li>
      <li>
        <a href="/mber/esg/ethic/ethic-introduction">윤리경영</a>
      </li>
      <li>부패방지방침</li>
    </ul>     
    <div class="contents esg-conts">     
      <div class="esg-tit-wrap">
        <h1>부패방지방침</h1>

        <div style="text-align:center;">
          <img src="/resources/landing/images/esg/cpa.jpg" alt="부패방지방침" style="width:90%">
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