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
  <script src="/resources/landing/js/jquery.animateNumber.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="business-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>Sector Coupling 사업</h1>
        <p>새로운 에너지 시장의 개척자로 에너지 산업계의 동반 성장에 기여합니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/business/competitive">Sector Coupling 사업</a>
        </li>
        <li>사업혁신방향</li>
      </ul>
    </div>
    <div class="contents compe-conts">
      <div class="organ-wrap">
        <h2>Sector Coupling</h2>
      </div>
      <div class="compe-ani2">
        <div class="desc-row desc-left sector-left">
          <div class="desc-area">
            <p class="desc-row-txt1">인적·기술적 플랫폼</p>
            <p class="desc-row-txt3">고객과 에너지 유관기관을 <br>연결하는 인적·기술적 플랫폼</p>
            <p class="desc-row-txt2">한전MCS는 고객을 중심으로 정부의 정책, 한국전력공사의 공익성과 기업성, 에너지산업계의 전문성 그리고 4차산업형 융복합 기술을 연결하는 <span>인적·기술적 플랫폼</span> 역할로 고객행복 전력서비스와 <span>에너지 산업의 새로운 개척자</span> 역할을 하겠습니다.</p>            
          </div>
          <div>
            <img src="/resources/landing/images/business/sector1_20211018.png" alt="섹터커플링 이미지">
          </div>
        </div>
        <div class="desc-row desc-right sector-right">
          <div>
            <img src="/resources/landing/images/business/sector2.png" alt="새로운 에너지 시장의 개척자">
          </div>
          <div class="desc-area">
            <p class="desc-row-txt1">새로운 에너지 시장의 개척자</p>
            <p class="desc-row-txt2">에너지 산업 성장을 위한 서포트 역할과 새로운 에너지 시장의 개척 자로 에너지 산업계의 동반 성장에 기여하겠습니다.</p>
            <p class="desc-row-txt5">섹터 커플링(Sector Coupling)</p>
            <p class="desc-row-txt6">인프라와 전력, 열, 수소 등 저장 가능한 에너지를 통해 발전, 난방 및 수송부 문을 연결하는 서비스, 재생에너지의 간헐성, 변동성을 해결하는 하나의 방 안</p>
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
  </script>

</body>
</html>