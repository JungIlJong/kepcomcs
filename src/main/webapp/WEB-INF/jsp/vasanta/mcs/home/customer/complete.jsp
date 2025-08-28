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
  <meta property="og:image" content="http://www.kepcomcs.co.kr/images/main/logo.png">
  <meta property="og:url" content="http://kepcomcs.co.kr">
  <title>한전MCS 주식회사</title>
  <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/board.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div class="cursor"></div>
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>고객의 소리</h1>
        <p>한전MCS는 고객님의 소리에 귀 기울입니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>고객의 소리</li>
      </ul>
    </div>
    <div class="contents"> 
      <div class="conts-ani" data-trigger>
        <p class="conts-desc_01 txt-ac tdesc">고객님의 소중한 제안, 칭찬, 불만사항 등을 접수하는 고객의 소리 접수 창구입니다.</p>
        <div class="complete-desc">
          <p class="conts-desc_07">고객님의 소중한 의견 감사합니다. <br>등록하신 내용은 담당자에게 정상적으로 전송되었습니다. <br><em>늘 노력하는 한전MCS가 되도록 최선을 다하겠습니다.</em></p>
          <p class="conts-desc_07 mt20">감사합니다.</p>
        </div>
      </div>
    </div>
  </main>

  <div id="footer"></div>

  <div class="btn-top">
    TOP
    <p class="top-line"></p>
  </div>

  <!-- //main -->

  <script>
    
    $("#footer").load("/resources/landing/include/footer.html");

    // $(document).ready(function() {
      $('.file-btn').on('click', function() {
        $(this).parents('.file-row').find('.file').trigger('click');
        // $('.file').trigger('click');
      });

      $('.file').on('change', function() {
        var fileName = $(this)[0].files[0].name;    
        $(this).parents('.file-row').find('.file-name').val(fileName);
        // $('.file-name').val(fileName);
      });
    // })
  </script>

</body>
</html>
