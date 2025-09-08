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
  <meta property="og:image" content="http://www.kepcomcs.co.kr/images/main/logo.png">
  <meta property="og:url" content="http://kepcomcs.co.kr">
  <title>한전MCS 주식회사</title>
  <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/board.css">
  <link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/select.dataTables.min.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <link rel="stylesheet" href="/resources/landing/css/manage.css">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="/resources/landing/js/select.dataTables.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
	<script type="text/javascript">
	
		var board_type = "${bbsId}";
		var board_no = <%=request.getParameter("id") %>;
		$(document).ready(function () {
			setMainTable();
			setNextPrev();
		})
		
		function setMainTable() {
			var form = {
	                board_type: <%=request.getParameter("board_type") %>,
	                board_no:  <%=request.getParameter("board_no") %>
	            };
			
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
			    	let decoded = decodeHtmlEntities(data.nttSj);
			    	decoded = decodeHtmlEntities(decoded);

			    	$('#news-view-title').text(decoded);
					$('#news-insert-dt').text(data.frstRegistDt);

					$('#news-view-desc').html(decodeHtml(data.nttCn).replace(/\n/g, '<br/>'));
					$('#menuNm').text(data.bbsNm);
					if (data.files.length > 0) {
					    let node = '';
					    for (let i = 0; i < data.files.length; i++) {
					    	console.log(data.files[i].orignlFileNm);
					        node += '<p><a href="/file/download?fileId=' + data.files[i].atchFileId + '">';
					        node += '<span>' + data.files[i].orignlFileNm + '</span></a></p>'
					    }
					    $('#div_filelist').html(node);
					
					    // 기존 파일 삭제 버튼은 이벤트 위임으로 처리됨
					}
				},// 요청 완료 시
			    error:function(jqXHR) {alert("비정상적인 접근 입니다. \n관리자에게 문의해 주세요.")},// 요청 실패.
			    complete:function(jqXHR) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
			});
		}
		function decodeHtmlEntities(str) {
		  const txt = document.createElement('textarea');
		  txt.innerHTML = str;
		  return txt.value;
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
				url:"/api/mber/bbs/"+board_type+"/side?nttId="+board_no,
			    async:true,// false 일 경우 동기 요청으로 변경
			    type:'GET', // GET, PUT
			    dataType:'json',// xml, json, script, html
			    success:function(data) {
					$("#prev_post_href").prop("disabled", true);
					$("#next_post_href").prop("disabled", true);
					for (i=0; i < data.length; i++){
						if(data[i].viewType == "prev"){
							$('#prev_post').text(data[i].nttSj);
							$("#prev_post_href").attr("href",  "detail?id=" + data[i].nttId);
						}else{
							$('#next_post').text(data[i].nttSj);
							$("#next_post_href").attr("href", "detail?id=" + data[i].nttId);
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
  <div class="cursor"></div>
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1 id="menuNm"></h1>
        <p>전력과 관련된 뉴스를 전달합니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>전력 에너지 뉴스</li>
      </ul>
    </div>
    <div class="contents" id="newBusinessWrite"> 
      <div class="conts-ani" data-trigger>
        <ul class="news-view-box">
          <li class="news-view-title">
            <p id="news-view-title"></p>
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
            <div class="news-view-photo">
            </div>
            <div class="news-view-desc" id="news-view-desc">
            </div>
            <div class="addfile-row" id="div_filelist">
            </div>
          </li>
        </ul>
        <div class="btn-row btn-row-right">
          <a href="list">
            <button class="btn-list">목록</button>
          </a>
        </div>
        <div class="additional">
          <div>
            <a href="#"  id="prev_post_href">
              <p>이전글</p>
              <p id="prev_post">이전 글이 없습니다.</p>
            </a>
          </div>
          <div>
            <a href="#" id="next_post_href">
              <p>다음글</p>
              <p  id="next_post">다음 글이 없습니다.</p>
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
    //include
    
    $("#footer").load("/resources/landing/include/footer.html");

  </script>

</body>
</html>
