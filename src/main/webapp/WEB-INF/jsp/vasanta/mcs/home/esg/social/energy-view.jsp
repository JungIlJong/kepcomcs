<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="format-detection" content="telephone=no"/>
    <meta property="og:type" content="website">
    <meta property="og:title" content="한전MCS 주식회사">
    <meta property="og:description"
          content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
    <meta property="og:image" content="https://www.kepcomcs.co.kr/resources/landing/images/main/logo.png">
    <meta property="og:url" content="http://kepcomcs.co.kr">
    <title>사회공헌활동소식 | 사회적가치 | ESG경영 | 한전MCS</title>
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
    <script src="/resources/landing/js/jquery.animateNumber.min.js"></script>
    <script src="/resources/landing/js/datatables.min.js"></script>
    <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
    <script type="text/javascript">

	    var board_type = "32";
	    var board_no = <%=request.getParameter("board_no") %>;
	    $(document).ready(function () {
			setMainTable();
			setNextPrev();
		})
		
		function setMainTable() {
			$.ajax({
				headers: { 
				        'Accept': 'application/json',
				        'Content-Type': 'application/json' 
				},
				url:"/get/board/view?nttId="+board_no,
			    async:true,// false 일 경우 동기 요청으로 변경
			    type:'GET', // GET, PUT
			    dataType:'json',// xml, json, script, html
			    success:function(data) {
					$('#news-view-title').text(data.nttSj);
					$('#news-insert-dt').text(data.frstRegistDt);
	
					$('#news-view-desc').html(decodeHtml(data.nttCn).replace(/\n/g, '<br/>'));
	
					if (data.files.length > 0) {
					    let node = '';
					    for (let i = 0; i < data.files.length; i++) {
					        node += '<p><a href="/file/download?fileId=' + data.files[i].atchFileId + '">';
					        node += '<span>' + data.files[i].orignlFileNm + '</span></a></p>'
					    }
					    $('#div_filelist').html(node);
					}
				},// 요청 완료 시
			    error:function(jqXHR) {alert("비정상적인 접근 입니다. \n관리자에게 문의해 주세요.")},// 요청 실패.
			    complete:function(jqXHR) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
			});
		}
	
		function decodeHtml(html) {
			  return $('<textarea/>').html(html).text();
		}
		
		function setNextPrev() {
			$.ajax({
				headers: { 
				        'Accept': 'application/json',
				        'Content-Type': 'application/json' 
				},
				url:"/get/board/"+board_type+"/side?nttId="+board_no,
			    async:true,// false 일 경우 동기 요청으로 변경
			    type:'GET', // GET, PUT
			    dataType:'json',// xml, json, script, html
			    success:function(data) {
					$("#prev_post_href").prop("disabled", true);
					$("#next_post_href").prop("disabled", true);
					for (i=0; i < data.length; i++){
						if(data[i].viewType == "prev"){
							$('#prev_post').text(data[i].nttSj);
							$("#prev_post_href").attr("href",  "energy-view?id=" + data[i].nttId);
						}else{
							$('#next_post').text(data[i].nttSj);
							$("#next_post_href").attr("href", "energy-view?id=" + data[i].nttId);
						}
					}
				},// 요청 완료 시
			    error:function(jqXHR) {alert("비정상적인 접근 입니다. \n관리자에게 문의해 주세요.")},// 요청 실패.
			    complete:function(jqXHR) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
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
            <a href="/mber/esg/social/social-activity">사회적가치</a>
        </li>
        <li>사회공헌활동소식</li>
    </ul>
    <div class="contents esg-conts social-view-conts">
        <div class="esg-tit-wrap social-list-tit">
            <h1>사회공헌활동소식</h1>
        </div>
        <ul class="bid-tab social-tab">
            <li>
                <a href="/mber/esg/social/ssis-list">한국사회보장정보원</a>
            </li>
            <li class="selected">
                <a href="/mber/esg/social/energy-list">한국에너지공단</a>
            </li>
            <li>
                <a href="/mber/esg/social/safety-list">고객만족도활동</a>
            </li>
            <li>
                <a href="/mber/esg/social/weak-list">취약계층발굴</a>
            </li>
        </ul>
        <div class="safetynews-wrap">
            <ul class="news-view-box">
                <li class="news-view-title">
                    <p id="news-view-title">2021 한전MCS(주) 춘추근무복 제작 구매 공고</p>
                </li>
                <li class="news-view-info">
                    <div>
                        <!-- <span>View count</span>
                         <span>00</span> -->
                    </div>
                    <div>
                        <span class="news-view-stit">작성일</span>
                        <span class="news-view-date" id="news-insert-dt">2021.10.10</span>
                    </div>
                </li>
                <li>
                    <div class="news-view-desc" id="news-view-desc">

                    </div>
                    <div class="addfile-row" id="div_filelist"></div>
                </li>
            </ul>
            <div class="btn-row-right">
                <a href="/mber/esg/social/energy-list">
                    <button class="btn-list">목록</button>
                </a>
            </div>
            <div class="additional">
                <div>
                    <a href="#" id="prev_post_href">
                        <p>이전글</p>
                        <p id="prev_post">이전 글이 없습니다.</p>
                    </a>
                </div>
                <div>
                    <a href="#" id="next_post_href">
                        <p>다음글</p>
                        <p id="next_post">다음 글이 없습니다.</p>
                    </a>
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
    //tab
    let $bidMenu = $('.bid-tab li');
    let $bid = $('.bid-tab');
    $bidMenu.mouseenter(function () {
        $bidMenu.removeClass('selected');
        $(this).addClass('selected');
    })
    $bid.mouseleave(function () {
        $bidMenu.removeClass('selected');
        $($bidMenu[1]).addClass('selected');
    })
</script>

</body>
</html>
