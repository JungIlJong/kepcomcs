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
  <title>배전 및 NTM(Near The Meter) | 사업소개 | 한전MCS</title>
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
  <style>
/* bid info */
.bid-tab {
  display: flex;
  position: relative;
  top: 30px;
  opacity: 0;
  margin-bottom: 80px;
  border-bottom: 2px solid var(--color-light-grey);
  -webkit-animation: fadeInUp 0.4s 0.8s forwards ease-out;
  -ms-animation: fadeInUp 0.4s 0.8s forwards ease-out;
  animation: fadeInUp 0.4s 0.8s forwards ease-out;
}
.bid-tab li {
  width: 33.3333%;
}
.bid-tab li a {
  display: inline-block;
  width: 100%;
  height: 48px;
  font-size: var(--font-regular);
  font-weight: var(--font-semibold);
  text-align: center;
  line-height: 48px;
  cursor: pointer;
  -webkit-transition: all 0.1s;
  -ms-transition: all 0.1s;
  transition: all 0.1s;
}
.bid-tab li.selected a {
  background: var(--color-blue);
  color: var(--color-white);
}
.bid-order-wrap {
  position: relative;
  top: 30px;
  opacity: 0;
  -webkit-animation: fadeInUp 0.4s 1.2s forwards ease-out;
  -ms-animation: fadeInUp 0.4s 1.2s forwards ease-out;
  animation: fadeInUp 0.4s 1.2s forwards ease-out;
}
.contents h2.bid-h2 {
  margin-bottom: 20px;
  border-bottom: none;
  font-size: 1.375rem;
}
.bid-order>li {
  position: relative;
  margin-bottom: 10px;
}
.bid-order>li:after {
  content: '';
  display: inline-block;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: 3px solid #33509A;
  visibility: hidden;
  opacity: 0;
  box-sizing: border-box;
  transition: all 0.2s;
}
.bid-order>li:hover:after {
  visibility: visible;
  opacity: 1;
}
.bid-step_01 {
  display: flex;
  align-items: center;
  position: relative;
  padding: 28px;
  background: var(--color-white);
  border: 1px solid var(--color-light-grey);
}
.bid-num {
  width: 5%;
}
.bid-num span {
  display: inline-block;
  width: 40px;
  height: 40px;
  background: var(--color-light-grey);
  border-radius: 50%;
  font-family: var(--font-en);
  text-align: center;
  line-height: 40px;
  -webkit-transition: all 0.1s;
  -ms-transition: all 0.1s;
  transition: all 0.1s;
}
.bid-order>li.open .bid-num span {
  background: #33509A;
  color: var(--color-white);
}
.bid-desc_01 {
  width: 15%;
  font-family: var(--font-noto);
  font-size: var(--font-regular);
  font-weight: var(--font-bold);
}
.bid-order>li.open .bid-desc_01 { 
  color: #33509A;
}
.bid-desc_02 {
  width: 28%;
  font-family: var(--font-noto);
  font-size: 1rem;
  font-weight: var(--font-bold);
}
.bid-desc_02_1 {
  width: 100%;
  font-family: var(--font-noto);
  font-size: 1rem;
  font-weight: var(--font-bold);
}
.bid-desc_02 span {
  font-weight: 400;
}
.bid-desc_03 {
  color: var(--color-grey);
  font-size: var(--font-small);
}
.bid-desc_03>p {
  position: relative;
  margin-bottom: 10px;
  padding-left: 10px;
}
.bid-desc_03>p:last-child {
  margin-bottom: 0;
}
.bid-desc_03>p:before {
  content: '';
  display: inline-block;
  position: absolute;
  top: 4px;
  left: 0;
  width: 4px;
  height: 4px;
  background-color: var(--color-black);
  border-radius: 50%;
}
.slidedown-box {
  display: none;
}
.bid-step_02 {
  display: flex;
  padding: 32px 28px 8px 21.5%;
  border-bottom: 1px solid var(--color-light-grey);
  border-left: 1px solid var(--color-light-grey);
  border-right: 1px solid var(--color-light-grey);
}
.bid-step_02>p {
  width: 26%;
}
.paper-list {
  display: flex;
  flex-wrap: wrap;
  position: relative;
  top: -8px;
  width: 74%;
}
.paper-list li {
  margin-right: 10px;
  margin-bottom: 10px;
  padding: 10px 16px;
  background-color: var(--color-white);
  border: 1px solid var(--color-light-grey);
  color: var(--color-grey);
  font-size: var(--font-smaller);
}
.step02 {
  position: absolute;
  top: 29px;
  right: 29px;
  width: 34px;
  height: 34px;
  border: 1px solid var(--color-light-grey);
  cursor: pointer;
  z-index: 10;
}
.step02:after {
  content: '';
  display: inline-block;
  position: absolute;
  top: 8px;
  left: 11px;
  width: 10px;
  height: 10px;
  margin-right: 10px;
  border-top: 1px solid #8A8F91;
  border-left: 1px solid #8A8F91;
  -webkit-transform: rotate(225deg);
  -ms-transform: rotate(225deg);
  transform: rotate(225deg);
  -webkit-transition: all 0.2s;
  -ms-transition: all 0.2s;
  transition: all 0.2s;
}
.bid-order>li.open .step02:after {
  top: 14px;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

.public {
  display: flex;
  justify-content: space-between;
  position: relative;
  top: 30px;
  opacity: 0;
  -webkit-animation: fadeInUp 0.4s 1.2s forwards ease-out;
  -ms-animation: fadeInUp 0.4s 1.2s forwards ease-out;
  animation: fadeInUp 0.4s 1.2s forwards ease-out;
}
.public>div {
  width: 31.6384%;
}
.public>div>p {
  font-family: var(--font-noto);
  font-size: var(--font-regular);
  font-weight: var(--font-bold);
}
.public-list {
  margin-top: 10px;
  padding: 34px 32px 20px;
  background-color: var(--color-white);
  border: 1px solid #d3d3d3;
  height: 36rem;
}
.public-list>li {
  margin-bottom: 28px;
}
.public-list>li:last-child {
  margin-bottom: 0;
}
.public-list li a {
  position: relative;
  display: inline-block;
  padding-left: 10px;
  padding-right: 30px;
  color: var(--color-grey);
  line-height: 1.5;
  letter-spacing: -0.4px;
}
.public-list li a:before {
  content: '';
  display: inline-block;
  position: absolute;
  top: 8px;
  left: 0;
  width: 4px;
  height: 4px;
  background-color: var(--color-black);
  border-radius: 50%;
}
.public-list li a:after {
  content: '';
  display: inline-block;
  position: absolute;
  top: -3px;
  right: 0;
  width: 23px;
  height: 25px;
  background: url(/resources/landing/images/manage/ico_pdf.png) no-repeat left top;
  background-size: cover;
  -webkit-transition: all 0.1s;
  -ms-transition: all 0.1s;
  transition: all 0.1s;
}
.public-list li.no-pdf a:after {
  display: none;
}
.public-list li a:hover:after {
  background: url(/resources/landing/images/manage/ico_pdf_over.png) no-repeat left top;
  background-size: cover;
}
.public-list li a:hover>span {
  border-bottom: 1px solid var(--color-black);
}
.public-list li a.no_link:hover>span {
  border-bottom: none;
  cursor: initial;
}
.public-list li a.sub-data {
  display: inline-block;
  margin-top: 12px;
  font-size: var(--font-small);
}
.public-list li a.sub-data:before,
.public-list li a.sub-data:after {
  display: none;
}
.public-list li a.sub-data.has-pdf:after {
  display: block;
}

@media all and (max-width: 1024px) {
  /* bid info */
  .contents {
    margin-top: 60px;
  }
  .bid-step_01 {
    padding: 18px;
  }
  .bid-desc_01 {
    font-size: 1rem;
  }
  /* bid list */
  .bid-tab {
    margin-bottom: 48px;
  }
}
@media all and (max-width: 960px) {
  /* public notice */
  .public-list {
    padding: 34px 16px 20px;
  }
  /* bid info */
  .bid-step_01 {
    flex-wrap: wrap;
  }
  .bid-num {
    width: 10%;
  }
  .bid-desc_01 {
    width: 20%;
  }
  .bid-desc_02 {
    width: 50%;
  }
  .bid-desc_02_1 {
    width: 100%;
  }
  .bid-desc_03 {
    width: 100%;
    margin-top: 20px;
    padding-left: 30%;
  }
  .bid-step_02 {
    padding: 32px 28px 8px 28px;
  }
  .bid-step_02>p {
    width: 29%;
  }
  .paper-list {
    width: 71%;
  }
  .paper-list li {
    line-height: 1.5;
  }
  
  .public-list {
    padding: 34px 16px 20px;
  }
}
@media all and (max-width: 767px) {
  .mob-ani-none {
    top: 0 !important;
    opacity: 1 !important;
    -webkit-animation: none !important;
    -ms-animation: none !important;
    animation: none !important; 
  }
  /* bid info */
  .contents {
    margin-top: 30px;
  }
  .bid-conts {
    padding: 0 20px;
  }
  .bid-tab {
    top: 0;
    opacity: 1;
    margin-bottom: 48px;
    -webkit-animation: none;
    -ms-animation: none;
    animation: none;
  }
  .bid-order-wrap {
    top: 0;
    opacity: 1;
    padding: 0 20px;
    -webkit-animation: none;
    -ms-animation: none;
    animation: none;
  }
  .hs02 .bid-step_01 {
    padding-bottom: 78px;
  }
  .step02 {
    top: auto;
    bottom: 26px;
    left: 0;
    right: 0;
    margin: 0 auto;
  }
  .bid-num,
  .bid-desc_01,
  .bid-desc_02,
  .bid-desc_02_1,
  .bid-desc_03 {
    width: 100%;
    text-align: center;
  }
  .bid-num span {
    margin-bottom: 16px;
    background: #33509A;
    color: var(--color-white);
  }
  .bid-desc_01 {
    margin-bottom: 12px;
    color: #33509A;
    font-size: 1.375rem;
  }
  .bid-desc_03 {
    padding-left: 0;
    line-height: 1.5;
  }
  .bid-desc_03>p {
    padding-left: 0;
  }
  .bid-desc_03>p:before {
    display: none;
  }
  .bid-step_02 {
    flex-wrap: wrap;
  }
  .bid-step_02>p,
  .paper-list {
    width: 100%;
    text-align: center;
  }
  .paper-list {
    justify-content: center;
    top: 0;
    margin-top: 16px;
  }
  
  .public {
    flex-wrap: wrap;
    top: 0;
    opacity: 1;
    padding: 0 20px;
    -webkit-animation: none;
    -ms-animation: none;
    animation: none;
  }
  .public>div {
    width: 100%;
  }
  .public-list {
    padding: 30px 20px 20px;
  }
  .public-list li a {
    font-size: var(--font-regular);
  }
  .public-list li a:after {
    top: -1px;
  }
  .public>div>p {
    margin-top: 48px;
  }
  .public>div>p.first {
    margin-top: 0;
  }
}
  </style>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="business-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>배전 및 NTM</h1>
        <p>한전과 에너지 산업계의 배전업무 효율성 극대화를 위하여 현장에서 고객과 만나겠습니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/business/competitive">사업소개</a>
        </li>
        <li>배전 및 NTM</li>
      </ul>
    </div>
    <div class="contents short-conts">
      <div class="organ-wrap">
        <h2>배전 및 NTM</h2>
      </div>
      <div class="compe-ani">
        <div class="desc-row desc-left">
          <div class="desc-area">
            <p class="desc-row-txt1">NTM(Near The Meter)</p>
            <p class="desc-row-txt2 desc-dot">FTM(Front The Meter)와 BTM(Behind The Meter)를 포괄하는 단어로 전력량계 부근에서 구현되는 한전MCS의 고유사업 및 에너지 신사업을 뜻합니다.</p><br/><br/><br/>
            
            <p class="desc-row-txt1">한전 배전 사업</p>
            <p class="desc-row-txt2 desc-dot">저압계기 오차시험, 배전공사 현장 안전감시단, 배전선로 휴전안내, 계량기 유지보수 지원</p>
            <p class="desc-row-txt2 desc-dot">AMI 모뎀 유지보수, 이사고객 방문정산, 전략분야 사회적 갈등해소를 위한 기여, 전력설비 주민 수용성 제고사업, 연구개발 현장지원 등</p>
          </div>
          <div>
            <img src="/resources/landing/images/business/short.png" alt="점검">
          </div>
        </div>
        
        <h4>배전계기 오차시험</h4>
        <ul class="plan-step">
          <li>
            <img src="/resources/landing/images/business/bg_step1.png">
            <div class="step-desc">
              <p>STEP1</p>
              <p>현장확인</p>
              <p>민원응대<br>봉인 이상유무<br>조작 확인</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg_step2.png">
            <div class="step-desc">
              <p>STEP2</p>
              <p>계기오차시험</p>
              <p>오차계측기부착,<br>전력량계 고장여부 판단</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg_step3.png">
            <div class="step-desc">
              <p>STEP3</p>
              <p>비교계기부설</p>
              <p>비교계기 부설을 통한<br>사용량 비교</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg_step4.png">
            <div class="step-desc">
              <p>STEP4</p>
              <p>종료 후 조치</p>
              <p>정상화 조치 안내 및<br>관련부서 통보</p>
            </div>
          </li>
        </ul>
        <!--<p class="short-desc" style="text-align:center;"><span class="color-blue">* 배전선로 휴전안내</span> (배전선로 작업에 따른 휴전시 안내 체계 및 고객 안내문 송달)</p>-->
        
        <h4>배전공사 현장 안전감시단</h4>
        <ul class="plan-step">
          <li>
            <img src="/resources/landing/images/business/bg2_step1.png">
            <div class="step-desc">
              <p>STEP1</p>
              <p>감시원 지정</p>
              <p>일일 공사현황 확인<br>안전감시원 배치</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg2_step2.png">
            <div class="step-desc">
              <p>STEP2</p>
              <p>안전감시 시행</p>
              <p>공사현장 입회<br>공사사진 촬영<br>안전점검 체크리스트</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg2_step3.png">
            <div class="step-desc">
              <p>STEP3</p>
              <p>안전감시 종료</p>
              <p>체크리스트 결과전송<br>결과 보고서 작성</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg2_step4.png">
            <div class="step-desc">
              <p>STEP4</p>
              <p>결과보고</p>
              <p>안전조치 안내 및<br>결과 관련부서 통보</p>
            </div>
          </li>
        </ul>
        
        <h4>배전선로 휴전안내</h4>
        <ul class="plan-step">
          <li>
            <img src="/resources/landing/images/business/bg_step1.png">
            <div class="step-desc">
              <p>STEP1</p>
              <p>한 전</p>
              <p>휴전안내 요청</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg_step2.png">
            <div class="step-desc">
              <p>STEP2</p>
              <p>MCS</p>
              <p>휴전안내 시행</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg_step3.png">
            <div class="step-desc">
              <p>STEP3</p>
              <p>민원응대</p>
              <p>현장, 유선 안내</p>
            </div>
          </li>
          <li>
            <img src="/resources/landing/images/business/bg_step4.png">
            <div class="step-desc">
              <p>STEP4</p>
              <p>MCS</p>
              <p>결과입력</p>
            </div>
          </li>
        </ul>
         
      </div>
      <div class="desc-seco">
        <h3 class="desc-row-txt1">에너지 신산업</h3>
        <p class="desc-row-txt2 desc-dot">에너지 효율화 설비 조사, EV 충전소 고객 유치, 에너지분야 사회적 갈등해소</p>
        <p class="desc-row-txt2 desc-dot">분산형 에너지 자원 운용능력 향상을 위한 자원 조사·DB 활용·현장업무, 에너지 신산업 기술 중개, 에너지 신산업 유지보수 현장지원 등</p>
        <!--
        
        <p class="desc-row-txt2 desc-dot">계약전력 500Kw 이상 에너지 사용자를 대상으로 노후화 설비기기 조사<br>- 조사품목 : 조명기기, 공기압축기, 냉동기(터보), 보일러(히트펌프), 자가용태양광</p>
        <p class="desc-row-txt2 desc-dot">에너지 효율화 설비 조사, EV 충전소 고객 유치, 에너지분야 사회적 갈등해소, 분산형 에너지 자원 운용능력 향상을 위한 자원 조사 〮 DB 활용 〮 현장업무, 에너지 신산업 기술 중개, 에너지 신산업 유지보수 현장지원 등</p>
      </div>
      <div class="target">
      
        <h4>사업대상</h4>
        <p>전기효율화사업으로 고객 노후 설비를 현대화하고 에너지사용을 절감하거나 효율화 할 수 있습니다.</p>
        <ul class="target-li">
          <li>
            <div>전기분야</div>
            <div>
              <ul class="inner-li">
                <li>
                  <p>
                    <img src="/resources/landing/images/business/target1.png" alt="LED 조명">
                  </p>
                  <p>LED 등 조명설비</p>
                </li>
                <li>
                  <p>
                    <img src="/resources/landing/images/business/target2.png" alt="공기압축기 에어드라이어">
                  </p>
                  <p>공기압축기 에어드라이어</p>
                </li>
                <li>
                  <p>
                    <img src="/resources/landing/images/business/target3.png" alt="인버터">
                  </p>
                  <p>인버터</p>
                </li>
              </ul>
            </div>
          </li>
        </ul>
        -->
        <h4>'21년 시범사업 및 사업소 자율신사업 실적</h4>
	      <div class="public">
	        <div>
	          <ul class="public-list">
	            <li class="no-pdf">
	              <p>
	                  <span>초과사용 부과금 안내</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>영업일반 현장조사</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>이사정산 검침</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>임시해지고객 현장조사</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>임시해지고객 사진정리</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>집단호수확인</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>정전민감고객 안내문 및 스티커 부착</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>0kW 심야전력 확인검침</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>농사용 위약사용 전단지 배부</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>농사용 위약사용 스티커 부착</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>10월 전기요금할인제도 누락고객 발굴</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>산업용 고객 현장확인</span>
	              </p>
	            </li>
	          </ul>
	        </div>
	        <div>
	          <ul class="public-list">
	            <li class="no-pdf">
	              <p>
	                  <span>계약자불명 실명화 활동</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>전력량계 계약확인(주택⇌농사용)</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>강소연구개발특구 안내문 전달</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>계기번호 중복 현장확인</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>경험고객 해피콜</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>송전60일 현장확인</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>고압LTE모뎀장애현장검침</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>신규 집단고객 호실확인</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>변압기공동이용 고객 검침</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>수금독려 활동</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>고압 중간검침굴</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>원격검침 실패에 따른 검침방법 변경(PDA)</span>
	              </p>
	            </li>
	          </ul>
	        </div>
	        <div>
	          <ul class="public-list">
	            <li class="no-pdf">
	              <p>
	                  <span>자가원격검침 (중계기) 확인검침 시행</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>휴지고객 확인검침</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>휴전안내</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>계기함 재봉인 시공</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>450시간피크초과안내</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>삼상해지시공서 안내</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>2021년 특별확인검침</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>고압아파트 변압기 설문조사</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>고압청구서 송달</span>
	              </p>
	            </li>
	            <li class="no-pdf">
	              <p>
	                  <span>고압아파트 청구서송달</span>
	              </p>
	            </li>
	          </ul>
	        </div>
	      </div>
	    <!--
        <div class="demand-box">
          <h5>수요</h5>
          <p>에너지소비 효율화와 공급 및 수요  Sector Coupling* 활성화 사업</p>
          <p><span class="color-blue">BTM에너지 효율화, RE100 활성화, EERS, 계시별 요금제, 가정용 스마트전력 플랫폼 구축, 국민 DR,</span> 전기차 및 충전소, 전기 대중교통 서비스, 전기선박 충전소, 
            도시 및 건물 통합 에너지관리시스템, 고객 맞춤형 수요 서비스, 수소산업 인프라, 탄소중립 연관산업, 에너지빅데이터 산업</p>
        </div>
        -->
      </div>
      <div class="desc-row desc-right">
        <div>
          <img src="/resources/landing/images/business/charge.png" alt="충전소">
        </div>
        <div class="desc-area">
          <p class="desc-row-txt1">EV 충전소 시설 유치 마케팅 및 점검·유지보수</p>
          <p class="desc-row-txt2 desc-dot">EV 충전 수요시장 확대로 충전기 설치신청 대행</p>
          <p class="desc-row-txt2 desc-dot">상시이용 전기차를 보유한 계약 대상 신청 접수, 현장실사, 계약서류 작성 업무시행</p>
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