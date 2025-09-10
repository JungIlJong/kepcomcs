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
  	var board_type = <%=request.getParameter("board_type") %> ? <%=request.getParameter("board_type") %> : 1322;
	
	$(document).ready(function () {
		getBoardSet();
	})
	
	function getBoardSet(){

		$("#tab_"+board_type).siblings().removeClass("selected");
		$("#tab_"+board_type).addClass("selected");
		
		iDisplayStart = 0;
		iTotalRecord = 0;
		$("#news_list_all").html("");

		$.ajax({
			 headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
	         type: "POST",
	         url: "/get/board/list/" + board_type,
	         dataType: "json", 
	         contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	         success: function (data) {
	         	if(parseInt(data.result))
	     		{
	        		iTotalRecord = data.recordsTotal;
	        		$('#recordCount').text(iTotalRecord);
	        		if(iTotalRecord > 0){
	        			iDisplayStart = 0;
// 	        			iDisplayStart = iDisplayStart + data.data.length;
		         		
		         		var li_html = "";

		         		for ( i = 0; i < data.data.length; i++) {
		         			var ul_list = $("#ul_list"); //ul_list선언
							li_html = li_html + "<a href='/mber/customer/press-view?board_type="+board_type+"&board_no=" + data.data[i].board_no +"'>";
              				li_html = li_html +  "<p class='title'>" + data.data[i].board_title + "</p>";
							li_html = li_html + "<img src='" + (data.data[i].thumb_url ? data.data[i].thumb_url :
                                    "/resources/landing/images/customer/card_list_thumb.jpg") + "' alt=''>";
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
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>언론속의 한전MCS</h1>
        <p>언론에 보도된 한전MCS의 다양한 공헌과 활동을 알려드립니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/customer/opinion">고객소통</a>
        </li>
        <li>언론속의 한전MCS</li>
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
        <p class="conts-desc_01 txt-ac tdesc">언론에 보도된 한전MCS의 다양한 공헌과 활동 뉴스</p>
        <div style="margin-top:50px;" class="tab">
	        <ul class="recruit-tab js-tmenu">
	          <li class="selected" id="tab_1322"><a href="/mber/customer/press-list?board_type=1322">본사</a></li>
	          <li id="tab_1323"><a href="/mber/customer/press-list?board_type=1323">지사 및 지점</a></li>
	        </ul>
	        <!--  본사 -->
	        <div class="recruit-desc tab_cont js-tcont selected" style="margin-top:40px;">
	        	<p class="news-num" style="text-align:right;">총 <span id="recordCount"></span>건</p>
                <!-- 카드리스트형 -->
                <ul class="card_list" id="news_list_all">
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="/resources/landing/images/customer/card_list_thumb.jpg" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
                  <li>
                    <a href="">
                      <p class="title"><span>텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트</span></p>
                      <img src="https://www.kepcomcs.co.kr/api/file/fileDown?file_name=232_093856044.png" alt="">
                    </a>
                  </li>
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