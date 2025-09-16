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
  <title>에너지 전문 P-PaaS | 사업소개 | 한전MCS 주식회사</title>
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
  width: 15%;
  margin-left:50px;
  font-family: var(--font-noto);
  font-size: 0.9rem;
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
  font-size: 1rem;
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
  	margin-left:0px;
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
}
@media all and (max-width: 960px) {
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
}
.contents h3 {
  margin-bottom: 80px;
  padding-bottom: 10px;
  border-bottom: 1px solid var(--color-light-grey);
  font-family: var(--font-noto);
  font-size: 2rem;
  font-weight: var(--font-bold);
}
@media all and (max-width: 720px) {
 .contents h3 {
 	font-size: 1.5rem;
 }
}
@media all and (max-width: 500px) {
 .contents h3 {
 	font-size: 1rem;
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
        <h1>에너지 전문 P-PaaS</h1>
        <p>한전MCS의 새로운 봉사, People Platform as a Service</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/business/competitive">사업소개</a>
        </li>
        <li>에너지 전문 P-PaaS</li>
      </ul>
    </div>
    
    
    <div class="contents compe-conts">
      <div class="organ-wrap">
        <h3>한전MCS P-PaaS 서비스 소개</h3>
        <h3 style="margin-block-end:0.5em; line-height:1.5;border-bottom:0px;padding-bottom:40px;"><p style="text-align:left;">귀사의 에너지사업 <span style="color:#002581;font-weight:bold;">현장 근처</span>에 상주하는 <span style="font-size:70%; color:#002581;font-weight:bold;">(접근비용↓)</span></p>
        													 <p style="text-align:center;">3,600여명의 <span style="color:#002581;font-weight:bold;">다기능 에너지 전문 인력</span>이 <span style="font-size:70%; color:#002581;font-weight:bold;">(전문성↑)</span> </p> 
        								                     <p style="text-align:right;"><span style="color:#002581;font-weight:bold;">M/h 단위</span>로 업무를 지원합니다. <span style="font-size:70%; color:#002581;font-weight:bold;">(인건비↓)</span></p></h3>
        <ul class="bid-order">
          <li>
            <div class="bid-step_01">
              <p class="bid-desc_02" style="width:100%;text-align:center;">✉ 이메일 : newbiz@kepcomcs.co.kr &emsp; ☏ 전화 : 061-345-9898</p>    
            </div>
          </li>
        </ul>
        
	      <div class="compe-ani contents compe-conts" style="margin-bottom:80px;margin-top:60px;">
	         <table class="expert-tbl" style="width:100%">
	           <thead class="bid-desc_02">
	                <tr>
	                  <th style="width:20%">전기기술 7년이상자</th>
	                  <th style="width:20%">전기<br class="br-mob">기사</th>
	                  <th style="width:20%">전기공사<br class="br-mob">기사</th>
	                  <th style="width:20%">전기<br class="br-mob">기능사</th>
	                  <th style="width:20%">배전기능자격(가공·활선 등)</th>
	                </tr>
	              </thead>
	              <tbody class="bid-desc_02">
	                <tr>
	                  <td>3,065</td>
	                  <td>92</td>
	                  <td>69</td>
	                  <td>950</td>
	                  <td>86</td>
	                </tr>
	              </tbody>
	            </table>
	      </div>
      </div>
      
      <div class="organ-wrap">
        <h3>한전MCS 소개</h3>
      </div>
      
      <div class="target">
        <ul class="bid-order">
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무</p>   
              	<div class="bid-desc_03">
				<p style="line-height:1.2;">한전MCS는 한전 위탁 업무인 검침, 송달, 단전 등을 주된 사업으로 하며 현재 에너지 관련 신사업으로 業의 전환을 하고 있습니다.</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">환경변화</p>   
              	<div class="bid-desc_03">
				<p style="line-height:1.2;">원격검침, 요금 전자 청구 등의 사업환경 변화에 따라 새로운 임무를 찾아 에너지 전문 서비스기관으로 도약하고자 합니다.</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">혁신방향</p>   
              	<div class="bid-desc_03">
				<p style="line-height:1.2;">한전 및 에너지 산업계의 업무효율화를 위해 고객서비스를 분담하고 부가업무를 지원하며 동반 상생하여 국민 편익이 <br>최대가 되도록 하겠습니다.</p>
				</div> 
            </div>
          </li>
        </ul>
      </div>
      
      <div class="contents compe-conts">
      <p style="padding:0 1rem 1.5rem 0; text-align:right; font-size:1rem;">2024-08-15 기준</p>
      <div class="organ-wrap" style="text-align:center;">
        <div class="status" style="text-align:center;display: flex;justify-content: center;">
          <ul>
            <li>
              <span class="organ-num organ-num_05">0</span>
              <span class="organ-type">지사</span>
              <span class="organ-etc">개</span>
            </li>
            <li>
              <span class="organ-num organ-num_06">000</span>
              <span class="organ-type">사업소</span>
              <span class="organ-etc">개</span>
            </li>            
          </ul>
          <ul>
            <li>
              <span class="organ-num worker-num">0000</span>
              <span class="organ-type">명</span>
            </li>
          </ul>
        </div>
      </div>
      <div class="compe-ani">
        <p class="conts-desc_03 infra-desc organ-type">전국 196개 사업소에서 현지 사정과 서비스&기술 능력을 겸비한
        								<br>3,964명의 전력매니저가 에너지 현장에서 국민과 소통하며 일하고 있습니다.</p>
        <!-- <ul class="infra-list">
          <li>
            <div class="infra-map">
              <img src="https://www.kepcomcs.co.kr/resources/landing/images/business/map_list2.png" alt="북부지사 지도 이미지">
              <div class="infra-txt">
                <p>북부지역본부</p>
                <p class="infra-num">34<span>지<br>점</span></p>
              </div>
            </div>
            <p class="infra-people">667<span>명</span></p>
          </li>
          <li>
            <div class="infra-map">
              <img src="https://www.kepcomcs.co.kr/resources/landing/images/business/map_list1.png" alt="경인지사 지도 이미지">
              <div class="infra-txt">
                <p>경인지역본부</p>
                <p class="infra-num">33<span>지<br>점</span></p>
              </div>
            </div>
            <p class="infra-people">945<span>명</span></p>
          </li>
          <li>
            <div class="infra-map">
              <img src="https://www.kepcomcs.co.kr/resources/landing/images/business/map_list3.png" alt="중부지사 지도 이미지">
              <div class="infra-txt">
                <p>중부지역본부</p>
                <p class="infra-num">43<span>지<br>점</span></p>
              </div>
            </div>
            <p class="infra-people">796<span>명</span></p>
          </li>
          <li>
            <div class="infra-map">
              <img src="https://www.kepcomcs.co.kr/resources/landing/images/business/map_list4.png" alt="남부지사 지도 이미지">
              <div class="infra-txt">
                <p>남부지역본부</p>
                <p class="infra-num">45<span>지<br>점</span></p>
              </div>
            </div>
            <p class="infra-people">672<span>명</span></p>
          </li>
          <li>
            <div class="infra-map">
              <img src="https://www.kepcomcs.co.kr/resources/landing/images/business/map_list5.png" alt="남동지사 지도 이미지">
              <div class="infra-txt">
                <p>남동지역본부</p>
                <p class="infra-num">41<span>지<br>점</span></p>
              </div>
            </div>
            <p class="infra-people">818<span>명</span></p>
          </li>
        </ul> -->
      </div>
            
      <div class="compe-ani contents compe-conts organ-wrap">
        <h3>P-PaaS 소개</h3>
	      <div class="desc-row desc-left ppaas_ani2">
	        <div class="desc-area">
	          <p class="desc-row-txt1">People Platform as a Service</p>
	          <p class="desc-row-txt2">인적자원(People)이 PaaS(Platform as a Service) 서비스를 하여 에너지 기업의 인적 자원 부족 애로를 해결합니다.</p> <br>
	          <img src="/resources/landing/images/business/paasMCS_20220721.jpg">
	        </div>
	        <div>
	          <img src="/resources/landing/images/business/ppaas.png" alt="인프라 이미지">
	        </div>
      </div>
      
      <div class="desc-row desc-right ppaas_ani2" style="padding-bottom:60px;">
        <div>
	  		<div class="report-list2-row">
		          <ul class="report-list2">
		            <li>
		              <p style="background:#a5afb4;">에너지 산업계의 애로사항</p>
		              <div style="border:solid 1px #a5afb4;">
		               <p style="line-height:2.5;">사업지역, 규모의 한계로 현장 상주인력 유지곤란</p>
		               <p style="line-height:2.5;">설계가 대비 높은 시장단가로 수주기피 현상 발생</p>
		               <p style="line-height:2.5;">원격 IoT설비 장애 및 현장조치를 위한 인력 필요</p>
		              </div>
		            </li>
		          </ul>
		    </div>
        </div>
        <div  class="desc-area">
	  		<div class="report-list2-row">
		          <ul class="report-list2">
		            <li>
		              <p style="background:#002581;">P-PaaS 솔루션</p>
		              <div  style="border:solid 1px #002581;">
		               <!--
		               <p>전국에 분포된 에너지 전문인력 제공을 통한 <span style="color:#002581;font-weight:600;font-size: 1.1rem;">인건비 감축</span></p>
		               <p>단기계약을 통한 적기 인력 제공 및  <span style="color:#002581;font-weight:600;font-size: 1.1rem;">상시고용 부담 경감</span></p>
		               -->
		               <p style="line-height:2.5;">현장 근처의 다기능 에너지 전문 인력이</p>
		               <p style="line-height:2.5;">시간단위 업무 지원을 통해</p>
		               <p style="line-height:2.5;">에너지 산업계 사업 효율화·활성화 지원</p>
		              </div>
		            </li>
		          </ul>
		    </div>
        </div>
        <div  class="desc-area">
	  		<div class="report-list2-row">
		          <ul class="report-list2">
		            <li>
		              <p>하이브리드형 고객서비스 제공</p>
		              <div>
		               <p style="line-height:2.5;">전기 현장서비스를 이어온 정통성·전문성과</p>
		               <p style="line-height:2.5;">ON-LINE 정보기술, OFF-LINE 현장자원을</p>
		               <p style="line-height:2.5;">겸비한 서비스로 국민의 Needs를 해결합니다.</p>
		              </div>
		            </li>
		          </ul>
		    </div>
        </div>
      </div>
      
      <div class="target">
       <p class="desc-row-txt1" style="margin-top:60px;margin-bottom:30px;">주요분야</p>
        <ul class="bid-order">
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02" style="line-height:1.2;">국가 및 전력산업<br>안전망 구축</p>
              	<div class="bid-desc_03">
				<p style="line-height:1.2;">안전관리사업(안전감시단 등), 국가 안전신문고, 지자체 안전 보안관 등 안전인력 적기 지원</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02" style="line-height:1.2;">신재생 에너지<br>효율화 사업</p>   
              	<div class="bid-desc_03">
				<p style="line-height:1.2;">재생에너지 현장을 주기적으로 방문하는 전문인력을 통한 신재생 에너지 설비조사, 데이터관리, 유지보수 지원</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02" style="line-height:1.2;">NTM 서비스<br>(Near The Meter)</p>   
              	<div class="bid-desc_03">
				<p style="line-height:1.2;">MCS 고유역량을 활용하여 AMI 설비 유지보수, EV충전기 유지보수 등 계량기 부근의 B(ehind)TM + F(ront)TM <br>신사업 추진</p>
				</div> 
            </div>
          </li>
        </ul>
      </div>
      
      <div class="compe-ani contents compe-conts organ-wrap">
        <h3>신성장사업 추진 실적</h3>
        <ul class="bid-order">
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">안&nbsp;&nbsp;전</p>   
              	<div class="bid-desc_03">
				<p>배전공사 현장 안전감시단
					<br/><br/>: 배전공사 작업자의 안전을 위한 감시업무(←한전 배전계획처, 396억)</p><br/>
	  		     <p>배전공사 휴전안내
					<br/><br/>: 안전한 배전공사를 위해 고객에게 휴전 안내(←한전, 15.6억)</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">신재생</p>   
              	<div class="bid-desc_03">
				<p>신재생 발전설비 DB일원화 정비
					<br/><br/>: 한전↔전력거래소간 Data 매칭 업무(←전력연구원, 0.5억)</p><br/>
				<p>태양광 인버터 설정치 주파수 변경
					<br/><br/>: 인버터 저주파수 설정치 확인 및 조정(←한전 재생e대책실, 12.9억)</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">NTM</p>   
              	<div class="bid-desc_03">
				<p>TOU(계시별요금제) 현장설정
					<br/><br/>: 대체공휴일 변경에 따른 설정 변경(←한전, 0.4억)</p><br/>
				<p>저압계기 오차시험
					<br/><br/>: 고객접점 계량기 민원 해결(←한전 스마트미터링처, 0.2억)</p><br/>
				<p>AMI모뎀 부설
					<br/><br/>: 계기설비 접근성을 활용한 모뎀 부설(←한전)</p><br/>
				<p>원격 전류제한
					<br/><br/>: 단전 후 최소 전류공급 역무(←한전, 3.6억)</p><br/>
				<p>전기차 충전기 유지보수 시범사업
					<br/><br/>: EV충전기 외관점검, 사활검사 등(←휴맥스EV)</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">연구개발</p>   
              	<div class="bid-desc_03">
				<p>자가검침 시스템
					<br/><br/>: 고객이 직접 검침값을 입력하는 시스템(1,049건)</p><br/>
				<p>근거리 무선검침
					<br/><br/>: 검침값 무선 수신 S/W·모듈 개발</p>
				</div> 
            </div>
          </li>
        </ul>
      </div>
      
      <div class="compe-ani contents compe-conts organ-wrap">
        <h3>중점 추진 신사업</h3>
        <ul class="bid-order">
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">한&nbsp;&nbsp;전</p>   
              	<div class="bid-desc_03">
					<p>전력량계 해지업무</p>
					<p>AMI모뎀 유지보수</p>
					<p>배전선로 순시 점검 지원</p>
					<p>전기 신·증설 현장조사</p>
					<p>전력 개폐기 투·개방 업무지원</p>
					<p>인입선 및 계기공사 시공내역 점검(전수조사 또는 발췌검사)</p>
					<p>집단 신규 발생 시 동·호수 착오점검</p>
					<p>계기위치 부적정 확인 및 봉인 조사</p>
					<p>전력설비 건설 주민 수용성 제고</p>
					<p>PDA상 전력량계 위치 이탈 및 전주번호찰 조사 관련 업무</p>
					<p>계량기 미화 커버 교체(단독, 농사용 함)</p>
					<p>실효계기 오결선 현장조사</p>
					<p>무계기 신규(정액등 등) 부하조사</p>
					<p>계기교환 없는 증설 중간검침 및 설비조사</p>
					<p>일부해지 신규시 부하용량 조사</p>
					<p>계량기조사 및 관리업무(재개발 지역 계기철거 환수)</p>
					<p>노후 인입선 점검 및 계기 함봉인 조사 업무</p>
					<p>태양광 인입선 변대주 조사</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02">신재생</p>   
              	<div class="bid-desc_03">
					<p>신재생 자원 DB 현장조사</p>
					<p>태양광 설비 인버터 점검 및 기술정보 셋팅</p>
					<p>Vpp 자원 및 신재생 설비 유지보수 지원</p>
					<p>신재생 발전설비 계량기 설치 및 관리</p>
					<p>신재생 설비 검사 및 인증 현장지원</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02" style="line-height:1.2;">EV충전<br>인프라</p>   
              	<div class="bid-desc_03">
					<p>전기차 충전기 유지보수</p>
					<p>신규고객 유치 및 홍보</p>
					<p>V2X 충전 및 전력 신기술 현장 실증 지원</p>
					<p>충전소 고객 요금 청구 및 수납 대행</p>
				</div> 
            </div>
          </li>
          <li>
            <div class="bid-step_01">      
              <p class="bid-desc_02" style="line-height:1.2;">NTM<br>서비스</p>   
              	<div class="bid-desc_03">
					<p>에너지 소비 효율화 홍보 및 관리(EERS 등)</p>
					<p>계량기 유지보수, 통신 모뎀 설치·관리</p>
					<p>전력·에너지 연구개발 현장 지원</p>
					<p>대면 여론조사, 에너지 자원 및 통계조사</p>
				</div> 
            </div>
          </li>
        </ul>
      </div>
      
      <div class="compe-ani contents compe-conts organ-wrap">
        <h3>신성장 사업을 위한 역량 축적</h3>
        <div class="certifi-wrap">
          <p class="desc-row-txt1">전문인력 양성</p>
          <div class="certifi-li-wrap">
          	<table style="width:100%;table-layout:fixed;background-color:white;box-shadow: 10px 10px 20px rgba(0,0,0,0.1);text-align:center;">
          		<tr>
          			<td><img src="/resources/landing/images/business/seminar.jpg" alt="수요조찬세미나" style="vertical-align:middle;width:80%;padding:10px 0 10px 0"><p style="padding-bottom:10px;">수요조찬 세미나</p></td>
          			<td><img src="/resources/landing/images/business/lecture.jpg" alt="전기기술자 교육" style="vertical-align:middle;width:80%;padding:10px 0 10px 0"><p style="padding-bottom:10px;">전기기술자 교육</p></td>
          			<td><img src="/resources/landing/images/business/lecture2.jpg" alt="내선계기 특화 교육" style="vertical-align:middle;width:80%;padding:10px 0 10px 0"><p style="padding-bottom:10px;">내선계기 특화 교육</p></td>
          			<td><img src="/resources/landing/images/business/specialist.jpg" alt="안전감시원 전문가 과정" style="vertical-align:middle;width:80%;padding:10px 0 10px 0"><p style="padding-bottom:10px;">안전감시원 전문가 과정</p></td>
          		</tr>
          	</table>
          </div>
          <div class="certifi-wrap">
          <p class="desc-row-txt1" style="padding-top:80px;">업무협약 체결</p>
          <div class="certifi-li-wrap">
          	<table style="width:100%;table-layout:fixed;background-color:white;box-shadow: 10px 10px 20px rgba(0,0,0,0.1);text-align:center;">
          		<tr>
          			<td><img src="/resources/landing/images/business/logisys.jpg" alt="로지시스" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          			<td><img src="/resources/landing/images/business/starkoff.png" alt="스타코프" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          			<td><img src="/resources/landing/images/business/encored.png" alt="인코어드" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          			<td><img src="/resources/landing/images/business/humax.png" alt="휴맥스" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          		</tr>
          		<tr>
          			<td><img src="/resources/landing/images/business/solar.PNG" alt="켑코솔라" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          			<td><img src="/resources/landing/images/business/haezoom.PNG" alt="해줌" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          			<td><img src="/resources/landing/images/business/root.PNG" alt="루트에너지" style="box-shadow:none;vertical-align:middle;width:80%;padding:10px 0 10px 0"></td>
          			<td><img src="/resources/landing/images/business/gs.PNG" alt="GS커넥트" style="box-shadow:none;vertical-align:middle;width:60%;padding:10px 0 10px 0"></td>
          		</tr>
          	</table>
          </div>
          <p class="desc-row-txt1" style="padding-top:80px;">신사업 면허 자격</p>
          <div class="certifi-li-wrap">
            <ul class="certifi-list">
              <li>
                <img src="/resources/landing/images/business/certi1.png" alt="전기공사업 등록증">
                <p>전기공사업</p>
              </li>
              <li>
                <img src="/resources/landing/images/business/certi2.png" alt="정보통신사업 등록증">
                <p>정보통신공사업</p>
              </li>
              <li>
                <img src="/resources/landing/images/business/certi3.png" alt="전기신사업 등록증">
                <p>전기신사업</p>
              </li>
              <li>
                <img src="/resources/landing/images/business/certi4.png" alt="안전보건경영시스템 인증서">
                <p>안전보건경영시스템</p>
              </li>
            </ul>
          </div>
          <p class="desc-row-txt1" style="padding-top:80px;">신사업 및 협력사업 제안</p>
          <div class="certifi-li-wrap">
          <table style="text-align:center; margin:0 auto; vertical-align:middle;">
          	<tr>
          	 <td><img src="/resources/landing/images/business/qr.png" alt="협력사업 QR" style="width:150px;"></td>
          	 <td style="vertical-align:middle; padding:10px; line-height:180%">인력지원이 필요한 에너지 사업에 다기능 에너지 전문인력을 지원하겠습니다.
          	 												 <br>✉ 이메일 : newbiz@kepcomcs.co.kr &emsp; ☏ 전화 : 061-345-9898<td/>
          	<tr/>
          </table>
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

    //timer
    let delayTime;
    let delayTime2;
    if( $(window).width() > 767 ) {
      delayTime = 2000
      delayTime2 = 2500
    } else {
      delayTime = 800
      delayTime2 = 1300
    }

    setTimeout(function() {
      $('.organ-num_05').animateNumber({
        number: 15
      })
    }, delayTime)
    setTimeout(function() {
      $('.organ-num_06').animateNumber({
        number: 196
      })
    }, delayTime)
    setTimeout(function() {
      $('.worker-num').animateNumber({
        number: 3855
      })
    }, delayTime2)

  </script>

</body>
</html>