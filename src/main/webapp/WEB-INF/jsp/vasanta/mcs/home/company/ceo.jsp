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
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="company-main">
    <div class="page-tit" ><!-- style="background-image : URL(/resources/landing/images/company/shutter.jpg); background-size : 100%;" -->
      <div class="page-tit-wrap">
        <h1>CEO 인사말</h1>
        <p></p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/company/overview">회사소개</a>
        </li>
        <li>CEO 인사말</li>
      </ul>
    </div>
    <div class="contents">
      <div  data-trigger>
        <img src="/resources/landing/images/company/img.PNG" alt="CEO인사말" style="width: 100%">
        
        <div class="ceo-desc">
          <p style="font-size:18px">한전MCS 방문을 환영합니다.</p>
          <p style="font-size: 18px">한전MCS는 전국적 네트워크를 기반으로 고객, 한전, 정부 그리고 전력산업계를 연결하는 <b style="color:steelblue;">'인적·기술적 에너지 플랫폼 기관'</b>으로서
             전력산업 패러다임 대전환기를 맞이하여 전력량계 검침·청구서 송달·전기요금 체납관리, 안전감시, 신재생에너지, 전기차 충전기
             유지보수 활동 등을 통해 지속가능한 성장을 도모하고 있습니다.</p>
          <p style="font-size: 18px">정부 정책에 따른 국정과제를 성실히 수행하여 혁신적인 대내외 환경변화에 가장 빠르게 적응하고, 신재생 발전, 고객 Needs에 맞는 
              에너지 효율화, 4차 산업 융복합형 기술을 연결하는 인적 기술적 서포트를 통해, 전력 현장에 적합한 새로운 서비스를 실천하여 에너지
              전문기업으로 선도하겠습니다.</p>
          <p style="font-size: 18px">한전MCS는 환경·사회·지배구조의 요소를 고려한 <b style="color:steelblue;">'ESG 선도 경영'</b>, 공공성과 수익성의 균형을 모색하는 <b style="color:steelblue;">'공공책임 경영'</b>, 새로운 도전과
              변화를 추구하는 <b style="color:steelblue;">'혁신성장 경영'</b>, 안전한 작업 환경을 유지 및 지원하는 <b style="color:steelblue;">'안전리더 경영'</b>, 현장의 소통과 참여를 활성화하는 <b style="color:steelblue;">'현장중심 경영'</b>
              실천을 통해 기업의 사회적 책임 완수로 <b style="color:steelblue;">전력을 넘어 국민의 삶을 증진시키는 안전한 에너지 서비스 제공과 국민 행복에 책임을 다하는 공공기관</b>이 되겠습니다.</p>
          <p style="font-size: 18px"><b style="color:steelblue;">새로운 도약의 길</b>을 여는 한전MCS에 고객 여러분의 많은 관심과 성원 부탁드립니다. 감사합니다.</p>
          
        </div>
        <div class="ceo-sign" style="float:right">
          <div>
            <p>한전MCS(주) 대표이사/사장
            <img src="/resources/landing/images/company/sign.PNG" alt="정성진 CEO 사인" style="transform:translateY(9px)"></p>
          </div>
          <div>
            
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
