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
        <h1>사업실명제</h1>
        <p>한전MCS는 국민에게 도움이 되고 여론의 관심이 높은 사업을 공개하고 있습니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/open-manage/public-notice">열린경영</a>
        </li>
        <li>사업실명제</li>
      </ul>
    </div>
    <div class="contents">
      <div class="bid-tab-wrap">
        <ul class="recruit-tab">
          <li class="selected">
            <a href="/mber/open-manage/business-realname">실명제 개요</a>
          </li>
          <li>
            <a href="/mber/open-manage/realname-list">실명제 목록</a>
          </li>
        </ul>
      </div>
      <div class="bid-order-wrap">
        <div class="desc-sec">
          <p class="desc-row-txt1" style="padding-top: 60px;">실명제 개요</p>
          <p class="desc-row-txt3">사업실명제는 사업의 책임성과 투명성 확보를 위해 주요사업을 공개하는 제도입니다.</p>
          <p class="desc-row-txt1" style="padding-top: 60px;margin-bottom:40px;">사업실명제 대상사업 선정기준</p>
          <p class="desc-row-txt1" style="margin-bottom:20px;margin-left:20px;">㉮ 주요 국정 현안에 관한 사항</p>
          <p class="desc-row-txt2" style="margin-left:45px;margin-bottom: 40px;">혁신성장, 일자리창출, 사회적가치 실현, 안전관리, 청렴윤리 등</p>
          <p class="desc-row-txt1" style="margin-bottom:20px;margin-left:20px;">㉯ 재무적 영향이 큰 대규모 사업</p>
          <p class="desc-row-txt2" style="margin-left:45px;margin-bottom: 40px;">사업비가 연간 5천만원 이상인 사업으로 재무적 영향이 큰 사업</p>
          <p class="desc-row-txt1" style="margin-bottom:20px;margin-left:20px;">㉰ 국민생활과 밀접한 주요 서비스 제공사업</p>
          <p class="desc-row-txt2" style="margin-left:45px;">기관의 임무와 역할을 대표하는 서비스 사업(정관에 정한 사업)</p>
          <p class="desc-row-txt2" style="margin-left:45px;margin-bottom: 40px;">국민생활과 밀접한 관련이 있다고 판단되는 사업</p>
          <p class="desc-row-txt1" style="margin-bottom:20px;margin-left:20px;">㉱ 그 밖에 중점관리가 필요한 사업</p>
          <p class="desc-row-txt2" style="margin-left:45px;">주요 규정 및 기준의 제·개정 등 기타 필요하다고 인정하는 사업</p>
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
    let $bidMenu = $('.bid-tab li');
    let $bid = $('.bid-tab');
    $bidMenu.mouseenter(function() {
      $bidMenu.removeClass('selected');
      $(this).addClass('selected');
    })    
    $bid.mouseleave(function() {
      $bidMenu.removeClass('selected');
      $($bidMenu[0]).addClass('selected');
    })

    //step2 accordion
    $('.step02').click(function() {
      if(!$(this).parents('li').hasClass('open')) {
        $('.bid-order>li').removeClass('open');
        $(this).parents('li').addClass('open');
      } else {
        $(this).parents('li').removeClass('open');
      }
      $('.slidedown-box').slideUp(250);
      if(!$(this).parents('li').find('.slidedown-box').is(':visible')) {
        $(this).parents('li').find('.slidedown-box').slideDown(250);
      }      
    })    

  </script>

</body>
</html>