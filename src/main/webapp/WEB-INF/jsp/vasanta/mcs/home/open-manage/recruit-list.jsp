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
  <script type="text/javascript">
  	var iDisplayStart = 0;
  	var iTotalRecord = 0
  	var iDisplayLength = 8;

	
		$(document).ready(function () {
			getBoardSet();
		})
	
	function getBoardSet(){
		$.ajax({
			 headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
	         type: "POST",
	         url: "/get/board/list/1316",
	         dataType: "json", 
	         contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	         success: function (data) {
	         	if(parseInt(data.result))
	     		{
	        		iTotalRecord = data.recordsTotal;
	        		$('#recordCount').text(iTotalRecord);
	        		if(iTotalRecord > 0){
						iDisplayStart = iDisplayStart + data.data.length;
		         		
		         		var li_html = "";
		         		for ( i = 0; i < data.data.length; i++) {
		         			var ul_list = $("#ul_list"); //ul_list선언

							li_html = li_html + "<a href='/mber/open-manage/recruit-view?board_no=" + data.data[i].board_no +"'>";
              				li_html = li_html +  "<p class='news-part'>" + data.data[i].status + "</p>";
							li_html = li_html +  "<p class='news-tit'>" + data.data[i].board_title + "</p>";
							li_html = li_html + "<p class='news-date'>기간 : " + data.data[i].ntt_start_dt + "~" + data.data[i].ntt_end_dt + "</p>";
							li_html = li_html + "</a>";
		         			
							$("#news_list_all").append("<li>"+li_html+"</li>"); //ul_list안쪽에 li추가

		         			li_html = "";

		         		}

		         		if(iTotalRecord == iDisplayStart){
							$("#btn_more").hide();
			         	}
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
<body id="mcsPage" class="recruit-list-body">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="manage-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>채용정보</h1>
        <p>꿈과 열정을 갖고 끊임 없이 도전하는 인재를 모집합니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/open-manage/public-notice">열린경영</a>
        </li>
        <li>채용정보</li>
      </ul>
    </div>
    <div class="contents">
      <div class="recruit-intro">
        <ul class="recruit-tab">
          <li>
            <a href="/mber/open-manage/talented-person">인재상</a>
          </li>
          <li class="selected">
            <a href="/mber/open-manage/recruit-list">채용공고</a>
          </li>
        </ul>
        <div class="recruit-desc">
          <p class="conts-desc_03">한전MCS와 함께 성장할 인재, <span>당신을 기다리고 있습니다.</span></p>
          <p class="conts-desc_08">한전MCS는 끊임없는 변화와 도전으로 새로운 꿈을 만들어가는 패기에 찬 인재를 찾고 있습니다.</p>
        </div>
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

    //manage tab
    let $recruitMenu = $('.recruit-tab li');
    let $recruit = $('.recruit-tab');
    $recruitMenu.mouseenter(function() {
      $recruitMenu.removeClass('selected');
      $(this).addClass('selected');
    })    
    $recruit.mouseleave(function() {
      $recruitMenu.removeClass('selected');
      $($recruitMenu[1]).addClass('selected');
    })

  </script>

</body>
</html>