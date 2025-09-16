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
        <h1>경영방침</h1>
        <p>With People, New KEPCO MCS</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/company/overview">회사소개</a>
        </li>
        <li>경영방침</li>
      </ul>
    </div>
    <div class="contents">
      <div class="mission-section">
        <h2>경영방침</h2>        
        <div class="mission-wrap mission-wrap_04" id="policyAni01">
          <div class="mission mission_02 mission-ani">
            <div>
              <img src="/resources/landing/images/company/mission4.jpg">
            </div>            
            <div>
              <p class="conts-desc_10">KEPCOMCS, 변화와 혁신으로 <br class="br-mob">ESG경영 선도</p>
              <p class="principle-tit">구현방안</p>
              <ul class="principle-li">
              <li>
                  <div>
                    <img src="/resources/landing/images/company/ico_principle3.jpg">
                  </div>
                  <div>
                    <p class="txt-ico">ESG 선도 경영</p>
                    <p class="conts-desc_04">ESG경영 전략체계 구축으로 경쟁력 제고와 지속가능한 발전 지향</p>
                  </div>
                </li>
                <li>
                  <div>
                    <img src="/resources/landing/images/company/ico_principle1.jpg">
                  </div>
                  <div>
                    <p class="txt-ico">공공책임 경영</p>
                    <p class="conts-desc_04">공익성과 수익성의 균형 추구를 통한 지속가능한 경영 실현</p>
                  </div>
                </li>
                <li>
                  <div>
                    <img src="/resources/landing/images/company/ico_principle4.jpg">
                  </div>
                  <div>
                    <p class="txt-ico">혁신성장 경영</p>
                    <p class="conts-desc_04">창조적인 혁신으로 경쟁우위를 확보하여 지속가능한 성장 추구</p>
                  </div>
                </li>
                <li>
                  <div>
                    <img src="/resources/landing/images/company/ico_principle2.jpg">
                  </div>
                  <div>
                    <p class="txt-ico">안전리더 경영</p>
                    <p class="conts-desc_04">리더가 안전을 최우선 가치로 두는 안전한 일터 구현</p>
                  </div>
                </li>
                <li>
                  <div>
                    <img src="/resources/landing/images/company/ico_principle5.jpg">
                  </div>
                  <div>
                    <p class="txt-ico">현장중심 경영</p>
                    <p class="conts-desc_04">가치체계를 공유하는 소통의 활성화로 경영 현안 해결</p>
                  </div>
                </li>
              </ul>
            </div>        
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
      element: document.getElementById('policyAni01'),
      handler: function(direction) {
        $('#policyAni01').addClass('visible')
      },
      offset: '75%'
    })
  </script>

</body>
</html>
