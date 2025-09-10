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
  <link rel="stylesheet" href="/resources/landing/css/board.css">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/sub.css">
  <link rel="stylesheet" href="/resources/landing/css/manage.css">
  <link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
  <script type="text/javascript">
  	var iDisplayStart = 0;
  	var iTotalRecord = 0;
  	var iDisplayLength = 8;
  	var setBoardType = "${bbsId}";

  	$(document).ready(function () {
		getBoardSet(setBoardType);
		
		$("#menuTitle").text("${menuTitle}");
		$("#menuSj").text("${menuSj}");
	})
	
	function getBoardSet(boardType){

		$("#tab_"+boardType).siblings().removeClass("selected");
		$("#tab_"+boardType).addClass("selected");
		
		iDisplayStart = 0;
		iTotalRecord = 0;
		$("#news_list_all").html("");
		setBoardType = boardType;
		
		$.ajax({
			 headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
	         type: "POST",
	         url: "/get/board/list/"+setBoardType,
	         dataType: "json", 
	         contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	         success: function (data) {
	         	if(parseInt(data.result))
	     		{
	        		iTotalRecord = data.recordsTotal;
	        		$('#recordCount').text(iTotalRecord);
	        		if(iTotalRecord > 0){
	        			iDisplayStart = 0;
						iDisplayStart = iDisplayStart + data.data.length;
		         		
		         		var li_html = "";

		         		for ( i = 0; i < data.data.length; i++) {
		         			var ul_list = $("#ul_list"); //ul_list선언
		         			let decoded = decodeHtmlEntities(data.data[i].board_title);
					    	decoded = decodeHtmlEntities(decoded);
					    	
		         			var rawContent = decodeHtmlEntities(data.data[i].board_content); 
		         			var content = rawContent.replace(/<[^>]+>/g, ''); 
							li_html = li_html + "<a href='detail?id=" + data.data[i].board_no +"'>";
              				li_html = li_html +  "<p class='news-tit'>" + decoded + "</p>";
							li_html = li_html +  "<p class='news-desc'>" + content + "</p>";
							li_html = li_html + "<p class='news-date' style='margin-top:15px;'>" + data.data[i].insert_dt + "</p>";
							li_html = li_html + "</a>";
		         			
							$("#news_list_all").append("<li>"+li_html+"</li>"); //ul_list안쪽에 li추가

		         			li_html = "";
		         		}

		         		if(iTotalRecord == iDisplayStart){
							$("#btn_more").hide();
			         	}else{
			         		$("#btn_more").show();
			         	}
	        		}else if(iTotalRecord == 0){
						$("#btn_more").hide();
			        }
	     		}
	         	else
	             {
					alert("관리자에게 문의바랍니다.1");
					
	             }
	         },
	         error: function (e) {
	         	alert("관리자에게 문의바랍니다.2");
	         	console.log(e);
	         }
	    });
					
	}
	
	function decodeHtmlEntities(str) {
	  var txt = document.createElement("textarea");
	  txt.innerHTML = str;
	  return txt.value;
	}
  </script>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1 id="menuTitle"></h1>
        <p id="menuSj"></p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>홍보영상</li>
      </ul>
    </div>
    <div class="contents"> 
    <!-- 230720 원본소스 주석처리 후 탭 추가 -->
      <!-- <div class="conts-ani" data-trigger>
        <p class="conts-desc_01 txt-ac tdesc">언론에 보도된 한전MCS의 다양한 공헌과 활동 뉴스</p>
        <p class="news-num" style="text-align:right;">총 <span id="recordCount"></span>건</p>
        <ul class="news-list"  id="news_list_all">
        </ul>
        <div class="btn-row" id="btn_more">
          <a href="javascript:getBoardList()">
          	 <button class="btn-more">더보기</button>
          </a>
        </div>
      </div> -->
      <div class="conts-ani" data-trigger>
        <p class="conts-desc_01 txt-ac tdesc"><c:out value="${menuSj}"/></p>
        <div style="margin-top:50px;" class="tab">
	        <!--  본사 -->
	        <div class="recruit-desc tab_cont js-tcont selected" style="margin-top:40px;">
	        	<p class="news-num" style="text-align:right;">총 <span id="recordCount"></span>건</p>
		        <ul class="news-list"  id="news_list_all">
		        </ul>
		        <div class="btn-row" id="btn_more">
		          <a href="javascript:getBoardList();">
		          	 <button class="btn-more">더보기</button>
		          </a>
		        </div>
	        </div>
      </div>
	  <!-- //230720 원본소스 주석처리 후 탭 추가 -->
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