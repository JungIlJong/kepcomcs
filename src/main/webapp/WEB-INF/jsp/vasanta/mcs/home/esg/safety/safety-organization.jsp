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
  <title>안전관리 조직도 | 안전경영 | ESG경영 | 한전MCS</title>
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
        <a href="/mber/esg/safety/safety-introduction">안전경영</a>
      </li>
      <li>안전관리 조직도</li>
    </ul>      
    <div class="contents esg-conts">
      <div class="esg-tit-wrap">
        <h1>안전관리 조직도</h1>
        <p class="conts-desc_08 organ-tit-desc">한전MCS는 안전하고 건강한 일터 조성을 위해 안전보건경영방침을 충실히 실천합니다.</p>
      </div>
      <div class="organ_wrap mob-ani-none">
        <p class="organ-tit desc-row-txt1">본사 <span>| HEADQUARTERS</span></p>
        <div class="box-style organ-img">
          <div class="organ-desc">의사결정시 임직원의 안전과 보건을 최우선 가치로 합니다.</div>
          <div>
            <img src="/resources/landing/images/esg/organ1.png" alt="조직도 이미지">
          </div>
        </div> 
        <p class="organ-tit desc-row-txt1">사업소 <span>| BRANCH</span></p>
        <div class="box-style organ-img">
          <div class="organ-desc">현장의 잠재적 위험요인을 제거하여 근로환경을 지속적으로 <br class="br-pc">개선합니다.</div>
          <div>
            <img src="/resources/landing/images/esg/organ2_20210903.png" alt="조직도 이미지">
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
