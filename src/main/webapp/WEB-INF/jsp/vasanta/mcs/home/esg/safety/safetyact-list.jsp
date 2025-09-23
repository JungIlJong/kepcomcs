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
  <title>국민을 위한 안전활동 | 안전경영 | ESG경영 | 한전MCS</title>
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
  <script type="text/javascript">
  	var iDisplayStart = 0;
  	var iTotalRecord = 0
  	var iDisplayLength = 8;

	
	$(document).ready(function () {
		getBoardSet();
	})
	
	function getBoardSet(){
		var form = {
		        board_type : 7
		};
		form.sSearch = hashSearch();
		$.ajax({
			 headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
	         type: "POST",
	         url: "/get/board/list/7",
	         dataType: "json", 
	         contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	         success: function (data) {
	         	if(data)
	     		{
	        		iTotalRecord = data.recordsTotal;
	        		$('#recordCount').text(iTotalRecord);
	        		if(iTotalRecord > 0){
	        			iDisplayStart = 0;
						iDisplayStart = iDisplayStart + data.data.length;
		         		
		         		var li_html = "";

		         		for ( i = 0; i < data.data.length; i++) {
		         			var ul_list = $("#ul_list"); //ul_list선언

							li_html = li_html + "<a href='/mber/esg/safety/safetyact/bbs/7/detail?id=" + data.data[i].board_no +"'>";
              				li_html = li_html +  "<p class='news-part'>MCS 안전활동</p>";
							li_html = li_html +  "<p class='news-tit'>" + data.data[i].board_title + "</p>";
							li_html = li_html + "<p class='news-date'>" + data.data[i].insert_dt + "</p>";
							li_html = li_html + "</a>";
		         			
							$("#news_list_all").append("<li>"+li_html+"</li>"); //ul_list안쪽에 li추가

		         			li_html = "";

		         		}

		         		if(iTotalRecord == iDisplayStart){
							$("#btn_more").hide();
			         	}
	        		}else{
	        			$("#btn_more").hide();
		        	}
	     		}
	         	else
	             {
					alert("관리자에게 문의바랍니다.");
					
	             }
	         },
	         error: function (e) {
	         	alert("관리자에게 문의바랍니다.");
	         	console.log(e);
	         }
	    });
					
	}
  </script>
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
      <li>국민을 위한 안전활동</li>
    </ul>  
    <div class="contents">
      <div class="esg-tit-wrap">
        <h1>국민을 위한 안전활동</h1>
        <p class="conts-desc_08 on-mob txt-ac">국민 행복에 기여하는 에너지 분야 토탈솔루션 전문 기업, 한전MCS</p>
        <p class="conts-desc_08 act-desc">한전MCS는 국민과 소통하는 서비스 기업으로서 <br class="br-pc">복지사각지대와 저소득층의 사회 안전망 역할로 회사의 사회적 책임을 다하여 <br class="br-tablet"><span class="color-blue">전력을 넘어 국민 행복에 기여하는 에너지 분야 토탈솔루션 전문 기업으로 성장하겠습니다.</span></p>
      </div>      
      <div class="recruit-news">
       <ul class="news-list recruit-news" id="news_list_all">
        </ul>     
        <div class="btn-row" id="btn_more">
        	<a href="javascript:getBoardList()">
          		<button class="btn-more">더보기</button>
          	</a>
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
