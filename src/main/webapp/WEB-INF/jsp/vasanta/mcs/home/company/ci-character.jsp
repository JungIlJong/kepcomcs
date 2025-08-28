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
  <style>
  	#zoom {
  		transition: all 0.2s linear;
  	}
  	#zoom:hover {
  		transform: scale(1.4);
  	}
  </style>
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
          <a href="/company/overview">회사소개</a>
        </li>
        <li>CI</li>
      </ul>
    </div>
    <div class="contents">
    
      <div class="bid-tab-wrap">
        <ul class="recruit-tab">
          <li>
            <a href="/mber/company/ci">로고</a>
          </li>
          <li class="selected">
            <a href="/mber/company/ci-character">청렴캐릭터</a>
          </li>
        </ul>
      </div>
    
    <div class="contents">
      <div>
        <table background="/resources/landing/images/company/intro.png" background-size="cover" background-repeat="no-repeat">
        	<tr>
        		<td>
        			<img src="/resources/landing/images/company/intro.png" alt="character intro">
				</td>
        	</tr>
        </table>
      </div>
      
      <div class="color-ani">
        <ul class="ci-li" style="margin-top:100px">
          <li>
            <p class="conts-desc_05">기본동작</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/02.jpg" alt="기본동작1">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=02.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=02.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
          <li>
            <p class="conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/03.jpg" alt="기본동작2">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=03.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=03.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
          <li>
            <p class="conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/04.jpg" alt="기본동작3">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=04.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=04.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
        </ul>
        
        <ul class="ci-li" style="margin-top:100px">
          <li>
            <p class="conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/05.jpg" alt="기본동작4">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=05.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=05.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
          <li>
            <p class="conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/06.jpg" alt="기본동작5">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=06.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=06.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
          <li>
            <p class="conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/07.jpg" alt="기본동작6">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=07.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=07.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
        </ul>
        
        <ul class="ci-li">
          <li>
            <p class="color-tit conts-desc_05">청렴 응용동작</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/08.jpg" alt="청렴동작1">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=08.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=08.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
          <li>
            <p class="color-tit conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/09.jpg" alt="청렴동작2">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=09.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=09.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
          <li>
            <p class="color-tit conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/10.jpg" alt="청렴동작3">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=10.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=10.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
        </ul>
        
		<ul class="ci-li">
          <li>
            <p class="color-tit conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/11.jpg" alt="청렴동작4">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=11.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=11.zip')">JPG 다운로드</button>
              </div>
            </div>
          </li>
          <li>
            <p class="color-tit conts-desc_05">&nbsp;</p>
            <div class="ci-box" id="zoom">
              <div class="ci-top logo-mark">
                <img src="/resources/landing/images/company/12.jpg" alt="청렴동작5">
              </div>
              <div class="download-btn">
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=12.ai')">AI 다운로드</button>
                <button class="btn-down" onclick="Download('/api/file/fileDown?file_name=12.zip')">JPG 다운로드</button>
              </div>
            </div>            
          </li>
        </ul>
        
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
