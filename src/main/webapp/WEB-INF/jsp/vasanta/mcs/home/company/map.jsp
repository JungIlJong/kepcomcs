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
<style>
	#contactBody {
	  position: relative;
	  height: auto;
	  min-height: calc(100% - 370px);
	  padding-bottom: 169px;
	}
	.spin_contact .contents {
	  padding-bottom: 80px;
	}
	.spin_contact .page_title {
	  background: url(../images/about/bg_contact.jpg) no-repeat center center;
	  background-size: cover;
	}
	.title_ani {
	  position: relative;
	  top: 30px;
	  opacity: 0;
	  -webkit-animation: fadeInUp 0.4s forwards 0.4s;
	  -ms-animation: fadeInUp 0.4s forwards 0.4s;
	  animation: fadeInUp 0.4s forwards 0.4s;
	}
	.tab_menu_contact {
	  display: flex;
	  justify-content: center;
	  margin-top: 40px;
	}
	.tab_menu_contact li {
	  width: 188px;
	  height: 56px;
	  background: rgba(255,255,255,0.2);
	  border-top: 1px solid #fff;
	  border-bottom: 1px solid #fff;
	  border-right: 1px solid #fff;
	  font-size: 1.125rem;
	  font-weight: 500;
	  text-align: center;
	  line-height: 56px;
	  cursor: pointer;
	  -webkit-transition: all 0.2s;
	  -ms-transition: all 0.2s;
	  transition: all 0.2s;
	}
	.tab_menu_contact li:first-child {
	  border-left: 1px solid #fff;
	}
	.tab_menu_contact li.selected {
	  background: rgba(255,255,255,1);
	  color: #000;
	}
	.tab_conts_contact {
	  position: relative;
	  min-height: 450px;
	}
	.tab_contact1,
	.tab_contact2,
	.tab_contact3,
	.tab_contact4 {
	  position: absolute;
	  top: 0;
	  left: 0;
	  right: 0;
	}
	.tab_contact2,
	.tab_contact3,
	.tab_contact4 {
	  visibility: hidden;
	  opacity: 0;
	}
	.tab_contact1 .map_area {
	  position: relative;
	  top: 30px;
	  opacity: 0;
	  -webkit-animation: fadeInUp 0.4s forwards 0.8s;
	  -ms-animation: fadeInUp 0.4s forwards 0.8s;
	  animation: fadeInUp 0.4s forwards 0.8s;
	}
	.tab_contact2 .map_area,
	.tab_contact3 .map_area,
	.tab_contact4 .map_area {
	  position: relative;
	  top: 30px;
	  opacity: 0;
	}
	.tab_contact2 .map_area.visible,
	.tab_contact3 .map_area.visible,
	.tab_contact4 .map_area.visible {
	  position: relative;
	  top: 0;
	  opacity: 1;
	  transition: all 0.5s 0.2s;
	}
	.contact_inner {
	  width: 100%;
	  max-width: 1304px;
	  margin: 0 auto;
	  padding: 0 20px;
	}
	.map_area {
	  display: flex;
	  justify-content: space-between;
	}
	.map_area>div:nth-child(1) {
	  width: 48%;
	}
	.map_tit {
	  font-size: 2.25rem;
	}
	.info {
	  display: flex;
	  margin-top: 45px;
	}
	.info_tit {
	  width: 13%;
	  font-size: 1.25rem;
	  margin-top: 0.2rem;
	}
	.info>div>p:nth-child(1) {
	  line-height: 1.5;
	  word-break: keep-all;
	}
	.add_en {
	  margin-top: 10px;
	  font-family: 'Roboto';
	  font-size: 0.875rem;
	  line-height: 1.5;
	}
	.add_tra {
	  margin-top: 23px;
	  font-size: 0.875rem;
	}
	.add_tra span {
	  display: inline-block;
	  width: 20px;
	  height: 20px;
	  background: #828846;
	  border-radius: 50%;
	  color: #fff;
	  text-align: center;
	  line-height: 20px;
	}
	.phone {
	  position: relative;
	  top: 3px;
	  font-family: 'Roboto';
	}
	.phone>span:nth-child(1) {
	  position: relative;
	  margin-right: 10px;
	  padding-right: 10px;
	}
	.phone>span:nth-child(1):after {
	  content: '';
	  position: absolute;
	  top: 4px;
	  right: -3px;
	  width: 1px;
	  height: 12px;
	  background: #B6B8C3;
	}
	.map_area>div:nth-child(2) {
	  width: 49.36%
	}
	.map_box {
	  width: 100%;
	  height: 440px;
	}
	.map {
	  width: 100%;
	  height: 440px;
	  border: 1px solid #E3E3E3;
	}
	.map_label {
	  position: relative;
	  top: -60px;
	  padding: 5px 10px;
	  background: #fff;
	  border: 1px solid #ccc;
	  border-radius: 2px;
	}
@media all and (max-width: 767px) {
 /* contact */
  #contactBody {
    padding-bottom: 220px;
  }
  .title_box {
    position: relative;
    padding-left: 24px;
    padding-right: 24px;
  }
  .tab_menu_contact {
    flex-wrap: wrap;
    margin-top: 34px;
  }
  .tab_menu_contact li {
    width: 50%;
    border: none;
    border-top: 1px solid #fff;
    border-right: 1px solid #fff;
  }
  .tab_menu_contact li:nth-child(3) {
    border-left: 1px solid #fff;
    border-bottom: 1px solid #fff;
  }
  .tab_menu_contact li:nth-child(4) {
    border-bottom: 1px solid #fff;
  }
  .spin_contact .case_nm {
    margin-top: 20px;
    padding: 0 24px;
    font-size: 1.125rem;
    line-height: 1.5;
  }
  .spin_contact .page_title h1 {
    margin-top: 0;
  }
  .info_tit {
    width: 20%;
    padding-top: 3px;
  }
  .info>div {
    width: 80%;
  }
  .spin_contact .contents {
    min-height: 700px;
    padding-top: 36px;
    padding-bottom: 62px;
  }
  .map_box {
    height: 300px;
  }
  .map {
    width: 100%;
    height: 326px;
    margin: 0 auto;
  }
  .map_area {
    flex-wrap: wrap;
  }
  .map_area>div:nth-child(1) {
    width: 100%;
    order: 2;
  }
  .map_area>div:nth-child(2) {
    width: 100%;
    order: 1;
  }  
  .map_tit_m {
    margin-bottom: 20px;
    font-size: 1.5rem;
    font-weight: 500;
    text-align: center;
  }
  .map_tit {
    display: none;
  }
  .edu_sec1 {
    flex-wrap: wrap;
    align-items: unset;
    padding: 0 24px;
  }
  .edu_sec1>div:nth-child(1) {
    width: 100%;
    margin: 0 auto;
    text-align: left;
  }  
  .edu_sec1>div:nth-child(2) {
    width: 100%;
    margin: 70px auto 0;
  } 
  #EduMain .h2_area h2 {
    font-size: 3rem;
  }
  #EduBody .h2_area {
    left: 0;
  }
  #EduBody .desc_area>p:nth-child(1) {
    font-size:  1.5rem;
  }
  .edu_item_wrap {
    height: 126px;
    overflow-y: hidden;
    overflow-x: auto;
  }
  .edu_item {
    display: inline-flex;
    flex-wrap: nowrap;
  }
  .edu_item li {
    width: 102px;
    height: 102px;
    margin-right: 10px;
  }
  .edu_item li>div {
    top: 0;
    opacity: 1;
    width: 102px;
    height: 102px;
    background-size: 90px 147px !important;
    background-position: center -54px !important;
    animation: none !important;
    transform: none !important;
  }
  .edu_item li:nth-child(8) {
    display: none;
  }
  #EduBody .scroll_down {
    right: 0;
    left: 0;
    bottom: 100px;
    width: 22px;
    margin: 0 auto;
  }
  #EduMain .icon_scroll {
    display: block;
    top: 0;
    left: 0;
    right: 0;
    border: 2px solid #fff;
  }
  #EduBody .scroll_txt {
    display: none;
  }
  #EduBody .icon_scroll:after {
    background: #fff;
  }
  #EduBody .scroll_down:after {
    display: block;
    left: 8px;
    bottom: -28px;
    border-color: #fff;
  }
  #whyEdu .solution_list h3,
  #onlineEdu .solution_list h3,
  #training .solution_list h3,
  #qualification .solution_list h3 {
    top: -40px;
    left: 0;
    right: 0;
    font-weight: 600;
  }
  .edu_txt2 {
    width: 100%;
  }
  #EduBody .solution_sec3 {
    background: #F4F6FA;
  }
  #EduBody .contact_bg {
    height: 300px;
    background: url(../images/education/bg_edu2_m.jpg) no-repeat center center;
    background-size: cover;
  }
  #EduBody .edu_txt1 {
    font-size: 1rem;
    font-weight: 500;
  }
  #EduBody .contact_inner {
    padding: 0 24px;
  }
  .solution_desc>p:nth-child(1) span {
    font-weight: 500;
  }
  .title_ani {
    top: 0;
    opacity: 1;
    -webkit-animation: none;
    -moz-animation: none;
    -o-animation: none;
    -ms-animation: none;
    animation: none;
  }
  .map_area {
    top: 0 !important;
    opacity: 1 !important;
    -webkit-animation: none !important;
    -moz-animation: none !important;
    -o-animation: none !important;
    -ms-animation: none !important;
    animation: none !important;
  }
}
</style>
<body id="mcsPage">
  <div id="header"></div>
  <!-- main -->
  <main class="company-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>찾아오시는 길</h1>
        <p>한전MCS로 오시는 길을 안내해 드립니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/company/map">찾아오시는 길</a>
        </li>
      </ul>
    </div>
    <div class="ceo-contents"> 
       <div class="map_area">
         <div class="kr_font">
           <p class="map_tit">한전MCS 본사</p>
           <div class="info">
           	 <p class="info_tit">약도</p>
           	 <div>
           	 	<img src="/resources/landing/images/company/roughmap.png" alt="약도">
           	 </div>
		   </div>
           <div class="info">
             <p class="info_tit">주소</p>
             <div>
               <p>전라남도 나주시 상야1길 7 예가람타워 5층 506호</p>
               <p class="add_en">5F-506, 7, Sangya 1-gil, Naju-si, Jeollanam-do, Republic of Korea</p>
               <p class="add_tra"><span>나</span> 나주역(나주교통 700번) ▶ 혁신도시 ▶ 한전KPS<br>
               <span>광</span> 광주 송정역(1160번), (좌석02) ▶ 혁신도시 ▶ 한전KPS<br>
               <span>광</span> 광주 광천터미널 (좌석02) ▶ 혁신도시 ▶ 한전KPS</p>
             </div>
           </div>
           <div class="info">
             <p class="info_tit">전화</p>
             <div>
               <p class="phone">
                 <span>061-345-9991</span>
               </p>
             </div>
           </div>
         </div>
         <div>
           <!-- 지도 -->
           <div class="map_box">
             <div id="map" class="map" ></div>
           </div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb46beaf73542ae4cd42cb22f640aafb"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.022734574990416, 126.78603045139957), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.022734574990416, 126.78603045139957); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
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
