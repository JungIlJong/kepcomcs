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
        <h1>입찰정보</h1>
        <p>한전MCS 입찰에 관련된 정보와 자료, 현황을 안내합니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/open-manage/public-notice">열린경영</a>
        </li>
        <li>입찰정보</li>
      </ul>
    </div>
    <div class="contents">
      <div class="bid-tab-wrap">
        <ul class="bid-tab">
          <li class="selected">
            <a href="/mber/open-manage/bid-info">입찰안내</a>
          </li>
          <li>
            <a href="https://www.g2b.go.kr/" target="_blank">입찰공고</a>
          </li>
          <li>
            <a href="/mber/open-manage/bid-list">자료실</a>
          </li>
          <li>
            <a href="/mber/open-manage/contract-list">수의계약현황</a>
          </li>
        </ul>
      </div>
      <div class="bid-order-wrap">
        <h2 class="bid-h2">입찰안내</h2>
        <ul class="bid-order">
          <li>
            <div class="bid-step_01">
              <p class="bid-num">
                <span>1</span>
              </p>    
              <p class="bid-desc_01">발주</p>        
              <p class="bid-desc_02">계약부서 <span>주관</span></p>   
              <div class="bid-desc_03">설계서, 시방서, 규격서 등 작성 및 계약요청</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">
              <p class="bid-num">
                <span>2</span>
              </p>    
              <p class="bid-desc_01">입찰공고</p>        
              <p class="bid-desc_02">발주부서 <span>주관</span></p>   
              <div class="bid-desc_03">
                <p>입찰방법 등 결정</p>
                <p>입찰개요, 입찰참가자격 등 공고</p>
              </div> 
            </div>
          </li>
          <li class="hs02">
            <div class="bid-step_01">
              <p class="bid-num">
                <span>3</span>
              </p>    
              <p class="bid-desc_01">입찰참가</p>        
              <p class="bid-desc_02">입찰참가 희망업체 <span>주관</span></p>   
              <div class="bid-desc_03">입찰공고문, 시방서 · 규격서, 일반조건, 입찰유의서 등 열람 후 숙지</div> 
              <div class="step02"></div>
            </div>
            <div class="slidedown-box">
              <div class="bid-step_02">
                <p>제출서류 및 발행기관</p>
                <ul class="paper-list">
                  <li>입찰참가신청서(필요시, 공사서식)</li>
                  <li>기타 입찰 공고시 요구하는 서류</li>
                </ul>
              </div>
            </div>
          </li>
          <li>
            <div class="bid-step_01">
              <p class="bid-num">
                <span>4</span>
              </p>    
              <p class="bid-desc_01">계약 및 낙찰</p>        
              <p class="bid-desc_02">계약부서 <span>주관</span></p>   
              <div class="bid-desc_03">적격심사(심사대상에 한함), 제안서 기술평가 등 입찰공고에 따른 평가 후 낙찰자 결정</div> 
            </div>
          </li>
          <li class="hs02">
            <div class="bid-step_01">
              <p class="bid-num">
                <span>5</span>
              </p>    
              <p class="bid-desc_01">계약체결</p>        
              <p class="bid-desc_02">계약부서 <span>주관</span></p>   
              <div class="bid-desc_03">계약서(내역서 등) 작성</div> 
              <div class="step02"></div>
            </div>
            <div class="slidedown-box">
              <div class="bid-step_02">
                <p>제출서류 및 발행기관</p>
                <ul class="paper-list">
                  <li>사업자등록증 및 법인등기부등본(법인인 경우)</li>
                  <li>계약이행보증증권 또는 현금 - 계약금액의 10~15% 이상 (발행기관 : 보증증권사 등)</li>
                  <li>인지세(발행기관 : 기재부 전자수입인지 구매)</li>
                  <li>청렴계약 및 정부권장사항 이행서약서(공사서식)</li>
                  <li>중소기업 기술거래 표준비밀유지계약서(NDA) 외</li>
                </ul>
              </div>
            </div>
          </li>
          <li class="hs02">
            <div class="bid-step_01">
              <p class="bid-num">
                <span>6</span>
              </p>    
              <p class="bid-desc_01">계약이행</p>        
              <p class="bid-desc_02">계약업체·발주부서 <span>주관</span></p>   
              <div class="bid-desc_03">공사시공 · 서비스제공 · 물품제조 등</div> 
              <div class="step02"></div>
            </div>
            <div class="slidedown-box">
              <div class="bid-step_02">
                <p>제출서류 및 발행기관</p>
                <ul class="paper-list">
                  <li>착공계</li>
                  <li>현장대리인계</li>
                  <li>경력증명서 및 자격증 사본</li>
                  <li>시행공정표</li>
                  <li>자재, 장비, 인력조달 및 투입계획</li>
                  <li>공사수행조직</li>
                  <li>기타 필요한 서류 등</li>
                </ul>
              </div>
            </div>
          </li>
          <li>
            <div class="bid-step_01">
              <p class="bid-num">
                <span>7</span>
              </p>    
              <p class="bid-desc_01">선금신청</p>        
              <p class="bid-desc_02">계약업체 <span>주관</span></p>   
              <div class="bid-desc_03">선금신청</div> 
            </div>
          </li>
          <li class="hs02">
            <div class="bid-step_01">
              <p class="bid-num">
                <span>8</span>
              </p>    
              <p class="bid-desc_01">준공(납품)</p>        
              <p class="bid-desc_02">계약업체·발주부서 <span>주관</span></p>   
              <div class="bid-desc_03">기성 · 준공(납품) 검사서 제출, 기성 · 준공(납품) 검사 실시</div> 
              <div class="step02"></div>
            </div>
            <div class="slidedown-box">
              <div class="bid-step_02">
                <p>제출서류 및 발행기관</p>
                <ul class="paper-list">
                  <li>공사 · 용역 준공(기성)검사 신청 - 준공계 및 준공(기성)검사 요청서</li>
                  <li>현장대물품 납품 검사 신청 - 납품완료계 및 내역서리인계</li>
                </ul>
              </div>
            </div>
          </li>
          <li class="hs02">
            <div class="bid-step_01">
              <p class="bid-num">
                <span>9</span>
              </p>    
              <p class="bid-desc_01">대금청구 및 지급</p>        
              <p class="bid-desc_02">계약업체·발주부서 <span>주관</span></p>   
              <div class="bid-desc_03">계약업체·발주부서 주관</div> 
              <div class="step02"></div>
            </div>
            <div class="slidedown-box">
              <div class="bid-step_02">
                <p>제출서류 및 발행기관</p>
                <ul class="paper-list">
                  <li>준공(기성) 대금 청구서</li>
                  <li>세금계산서</li>
                  <li>4대보험완납증명서</li>
                  <li>계약조건에 따라 필요시 기타서류(하자보증증권, 손해배상보험증권 등)</li>
                </ul>
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