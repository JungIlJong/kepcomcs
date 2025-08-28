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
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="company-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>CI</h1>
        <p>With People, New KEPCO MCS</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/company/overview">회사소개</a>
        </li>
        <li>CI</li>
      </ul>
    </div>
    <div class="contents">
    
      <div class="bid-tab-wrap">
        <ul class="recruit-tab">
          <li class="selected">
            <a href="/mber/company/ci">로고</a>
          </li>
          <li>
            <a href="/mber/company/ci-character">청렴캐릭터</a>
          </li>
        </ul>
      </div>
      
      <div class="color-ani">
        
        <ul class="ci-li" style="padding-top: 80px">
          <li>
            <p class="conts-desc_05">SYMBOL MARK</p>
            <div class="ci-box">
              <p class="conts-desc_06">STANDARD</p>
              <div class="ci-top logo-mark border-bott">
                <img src="/resources/landing/images/company/logo_standard.png" alt="MCS 기본 로고">
              </div>
              <p class="conts-desc_06 mt30">NEGATIVE</p>
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/logo_negative.png" alt="MCS 검은색 로고">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=01_symbol_AI.zip')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=01_symbol_JPG.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
          <li>
            <p class="conts-desc_05">LOGO TYPE</p>
            <div class="ci-box">
              <p class="conts-desc_06">KOREAN</p>
              <div class="ci-top logo-type border-bott">
                <img src="/resources/landing/images/company/logo_korean.png" alt="MCS 한글 로고">
              </div>
              <p class="conts-desc_06 mt30">ENGLISH</p>
              <div class="ci-top logo-type">
                <img src="/resources/landing/images/company/logo_english.png" alt="MCS 영문 로고">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=02_LOGO_AI.zip')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=02_LOGO_JPG.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
          <li>
            <p class="conts-desc_05">SIGNATURE</p>
            <div class="ci-box">
              <p class="conts-desc_06">STANDARD</p>
              <div class="ci-top logo-signature border-bott">
                <img src="/resources/landing/images/company/logo_signature1.png" alt="MCS signature standard 로고">
              </div>
              <p class="conts-desc_06 mt30">HORIZONTAL</p>
              <div class="ci-top logo-signature">
                <img src="/resources/landing/images/company/logo_signature2.png" alt="MCS signature horizontal 로고">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=03_signature_AI.zip')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=03_signature_JPG.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
        </ul>
      </div>
      <div class="color-ani-all">
        <p class="color-tit conts-desc_05">COLOR</p>
        <div class="color-box">
          <ul class="color-list">
            <li>
              <div class="download-btn">
                <button class="btn-down"  onclick="Download('/api/file/fileDown?file_name=KepcoMCS_LOGO_AI.zip')">AI 로고전체 다운로드</button>
                <button class="btn-down"  onclick="Download('/api/file/fileDown?file_name=KepcoMCS_LOGO_JPG.zip')">JPG 로고전체 다운로드</button>
              </div>
            </li>
            <li>
              <div class="color_01">
                <p class="color-st">Process Color</p>
                <p class="color-nm">C70 M0 Y20 K0</p>
                <p class="color-st mt24">RGB Color</p>
                <p class="color-nm">R22 G190 B207</p>
              </div>
            </li>
            <li>
              <div class="color_02">
                <p class="color-st">Process Color</p>
                <p class="color-nm">C100 M100 Y0 K0</p>
                <p class="color-st mt24">RGB Color</p>
                <p class="color-nm">R46 G49 B146</p>
              </div>
            </li>
          </ul>
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
<iframe id="my_iframe" style="display:none;"></iframe>
  <script>
    
    $("#footer").load("/resources/landing/include/footer.html");

    function Download(url) {
        document.getElementById('my_iframe').src = url;
    };
  
  </script>

</body>
</html>
