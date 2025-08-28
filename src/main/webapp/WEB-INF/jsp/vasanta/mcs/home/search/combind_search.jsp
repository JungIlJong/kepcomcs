<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="format-detection" content="telephone=no" />
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
<link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
<link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
<link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/landing/js/jquery.waypoints.min.js"></script>
<script src="/resources/landing/js/pages.js"></script>
<script src="/resources/landing/js/datatables.min.js"></script>
<script src="/resources/landing/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
<%
String search = (request.getAttribute("search") != null ? String.valueOf(request.getAttribute("search")) : "");
if (search.equals("")) {
%>
<script type="text/javascript">
					alert("검색어가 업습니다.")
				</script>
<%
}
%>
<script type="text/javascript">
  	var iDisplayStart = 0;
  	var iTotalRecord = 0
  	var iDisplayLength = 8;

	
	$(document).ready(function () {
		getBoardList();
		
		$('#page_search_button').click(function() {
	    	  page_search();
	    })
	    $('#page_search_input').on("keyup",function(e){
	    	if(e.keyCode == 13)
			{
	    		page_search()
			}
	    })
	})
	
	function page_search(){
    	var text = $('#page_search_input').val().trim().replace(/#/gi,"");
    	
    	if(text == "")
    	{
    		alert("검색어를 입력해주세요.");
    		return false;
    	}
    	if(text.length < 2)
    	{
    		alert("두글자이상 입력해주세요.");
    		return false;
    	}
    	window.location.href = "/pop/search/all/list/"+text;
    } 
	
	function getBoardList(){
		$.ajax(
				{
					method: "post",
					url: "/get/search/all/list/<%=search%>",
					data : {},
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					async : false,
					success : function(res) {
						console.log(res);
						$('#search_result_msg').html("‘<font style='color: #16ff00;'>"+res.search+"</font>’에 대한 통합검색결과로 총 <font style='color: #ff0000;'>"+res.data.length+"</font>건이 검색되었습니다.")
						$('#page_search_input').val(res.search);
						$('#news_list_all').data().datas = res.data;
						
						iTotalRecord = res.data.length;
						
						makePage();
						
					},
					error : function(e) {
						rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
						console.log(e)
					}
				}
			);
	}
	
	function makePage(){
		if(iTotalRecord > 0)
		{
			if (iDisplayStart <= iTotalRecord){
				var loopCnt = 0;
				for (i = iDisplayStart; i < $('#news_list_all').data().datas.length; i++) {
					if(loopCnt < iDisplayLength )
					{
						var item = $('#news_list_all').data().datas[i]
						var li_html = "";
						var ul_list = $("#ul_list"); //ul_list선언
						console.log(item);
						li_html = li_html + "<a href='"+item.path+"'>";
						li_html = li_html + "<p class='news-tit search-title' style=''>"+ item.title + "</p>";
						li_html = li_html + "<p class='news-desc search-value' style=''>"+ item.value+ "</p>";
						li_html = li_html + "</a>";
						
	
		
						$("#news_list_all").append("<li class='search-list' style=''>" + li_html + "</li>"); //ul_list안쪽에 li추가
						loopCnt++; 
					}
					else 
					{
						break;
					}  
				}
				
				iDisplayStart += loopCnt;
				
				if (iTotalRecord == iDisplayStart) {
					$("#btn_more").hide();
				}
	
			}
		}
		else
		{
			$("#btn_more").hide();
			var nodataHtml = "<div class='nodata_msg_box' style=''>"
				nodataHtml +="	<h2>입력하신 검색어와 일치하는 정보를 찾지 못했습니다.</h2>";
				nodataHtml +="	<p>&#8251; 입력하신 검색어의 철자가 정확한지 확인해 보세요.</p>";
				nodataHtml +="	<p>&#8251; 검색어의 단어 수를 줄이거나, 보다 일반적인 단어로 검색해 보세요.</p>";
				nodataHtml +="	<p>&#8251; 두 단어 이상의 검색어인 경우, 정확하게 띄어쓰기를 하셨는지 확인해 보세요.</p>";
				
				nodataHtml +="</div>";
			$("#news-list-nodata-section").html(nodataHtml)
		}
	}
</script>
<style>
#search_result_msg{
    font-size: 24px;
}
.page-search-section {
	margin-top: 16px;
	margin-bottom: 16px;
}

.page-search-box {
	width: 100%;
	height: 50px;
	vertical-align: top;
	max-width: 500px;
	text-align: center;
	position: relative;
	margin: auto;
	padding: 0 20px;
}

.page-search-box input {
	width: 100%;
	height: 100%;
	vertical-align: top;
}

.page-search-box button {
	width: 50px;
	height: 50px;
	vertical-align: top;
	position: absolute;
	right: 20px;
	padding: 0;
}

.page-search-box button img {
	width: 100%;
	height: 100%;
}
.news-tit.search-title{
	height: 40px;
}
.news-desc.search-value{
	height: 100%;
	display: block;
	text-overflow:ellipsis;
	white-space: normal;
}
.news-list li.search-list{
	width: 100%; 
	height: 100%; 
	margin: auto; 
	max-width: 800px;
}
.news-list-section{
    margin-top: 32px;
}

.news-list-section .news-list{
    max-width: 800px;
    margin: auto;
}
#news-list-nodata-section{
    text-align: center;
}
.nodata_msg_box{
    display: inline-block;
    align-content: center;
    padding: 52px;
    border: 1px solid #e0e0e0;
}

.nodata_msg_box h2{
	margin: 0;
    padding: 0;
    padding-bottom: 52px;
    border-bottom: 1px solid #d4d4d4;
}
.nodata_msg_box p{
	text-align: left;
    margin-top: 20px;
    font-size: 14px;
}

.manage-main .page-tit:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    width: 100%;
    height: 340px;
    background: url(/resources/landing/images/combine_search_bg.png) no-repeat center 0;
    background-size: cover;
    z-index: -1;
    -webkit-animation: moveUp 0.5s 0.3s forwards ease-out;
    -ms-animation: moveUp 0.5s 0.3s forwards ease-out;
    animation: moveUp 0.5s 0.3s forwards ease-out;
}

</style>
</head>
<body id="mcsPage">
	<div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
	<!-- main -->
	<main class="manage-main">
		<div class="page-tit">
		
			<div class="page-tit-wrap">
				<h1>통합검색</h1>
				<p id="search_result_msg"></p>
			</div>
		</div>
		<div class="contents">
			<div class="conts-ani" data-trigger>
				<div class="page-search-section">
					<div class="page-search-box">
						<input id="page_search_input" type="text" class="">
						<button id="page_search_button" class="" type="button">
							<img class="" src="/resources/landing/images/main/ico_search.png" alt="사업소 찾기" style="">
						</button>
					</div>
				</div>
				<!-- <p class="news-num" style="text-align: right; padding: 0 20px;">
					총
					<span id="recordCount"></span>
					건
				</p> -->
				<div class='news-list-section'>
					<ul class="news-list" id="news_list_all">
					</ul>
				</div>
				<div id='news-list-nodata-section'>
				</div>
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