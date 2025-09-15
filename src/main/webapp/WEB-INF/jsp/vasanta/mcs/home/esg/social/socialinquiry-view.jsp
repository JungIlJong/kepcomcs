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
  <title>사회공헌문의 | 사회적가치 | ESG경영 | 한전MCS</title>
  <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/board.css">
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
  <script src="/resources/landing/js/ckeditor5/ckeditor.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
	<script type="text/javascript">
	
		var board_type = 1325;
		var board_no = <%=request.getParameter("board_no") %>;
		$(function() {
			setMainTable();
		})
		
		function setMainTable() {
			
			$.ajax({
				headers: { 
				        'Accept': 'application/json',
				        'Content-Type': 'application/json' 
				},
				url:"/get/board/view?nttId="+board_no, // 요청 할 주소
			    async:true,// false 일 경우 동기 요청으로 변경
			    type:'GET', // GET, PUT
			    dataType:'json',// xml, json, script, html
			    success:function(data) {
					$('#board-view-title').text(data.nttSj);
					if(data.nttStatus == 0){
						$('#board-status').text("접수완료");
					}else if(data.nttStatus == 1){
						$('#board-status').text("처리중");
						$('#board_btn_save').hide();
					}

					$('#board-form-date').text(data.frstRegistDt);
					$('#board-author-name').text(data.wrterNm);
					$('#board-content').html(data.nttCn.replace(/\n/g, '<br/>'));
					if(data.nttReply == "" || data.nttReply == null){
						var p = $('#reply-content').text("문의해 주셔서 감사드립니다.\n담당자가 내용을 확인하였으며, 처리 중에 있습니다.\n곧 답변해 드리도록 하겠습니다.\n감사합니다.");
						p.html(p.html().replace(/\n/g, '<br/>'));
					}else{
						var p = $('#reply-content').text(data.nttReply);
						p.html(p.html().replace(/\n/g, '<br/>'));
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
      <li>사회공헌문의</li>
    </ul>   
    <div class="contents esg-conts soci-inqu">
      <div class="esg-tit-wrap">
        <h1>사회공헌문의</h1>
      </div>
      <div class="conts-ani">
        <h3>글보기</h3>
        <div class="soci-inqu-view">
	        <ul class="board-form board-view">
	          <li>
	            <div class="board-form-tit">제목</div>
	            <div class="board-form-conts">
	              <div class="view-title">
	                <font  id="board-view-title">비정상적인 접근입니다. 정상적인 방법으로 문의 내용을 확인해 주세요.</font>
	                <span class="waiting"  id="board-status"></span>
	              </div>
	            </div>
	          </li>
	          <li>
	            <div class="board-form-tit" id="board-insert-dt">작성일</div>
	            <div class="board-form-conts">
	              <p id="board-form-date">비정상적인 접근입니다. 정상적인 방법으로 문의 내용을 확인해 주세요.</p>
	            </div>
	          </li>
	          <li class="board-form-name">
	            <div class="board-form-tit">이름</div>
	            <div class="board-form-conts">
	              <p id="board-author-name">비정상적인 접근입니다. 정상적인 방법으로 문의 내용을 확인해 주세요.</p>
	            </div>
	          </li>
	          <li class="question-desc">
	            <div class="board-form-tit">문의내용</div>
	            <div class="board-form-conts">
	              <div class="customer-desc-box" id="board-content">
	                비정상적인 접근입니다. 정상적인 방법으로 문의 내용을 확인해 주세요.
	              </div>
	            </div>
	          </li>
	          <li class="answer-desc">
	            <div class="board-form-tit">답변내용</div>
	            <div class="board-form-conts">
	              <div class="customer-desc-box" id="reply-content">
	                비정상적인 접근입니다. 정상적인 방법으로 문의 내용을 확인해 주세요.
	              </div>
	            </div>
	          </li>
	        </ul>
	        <div class="btn-row btn-row-right">
	          <a href="/mber/esg/social/socialinquiry-form?board_no=<%=request.getAttribute("board_no") %>">
	            <button class="btn-save" style="background-color:#002581;" id="board_btn_save">수정</button>
	          </a>
	          <a href="/mber/esg/social/socialinquiry-list">
	            <button class="btn-list">목록</button>
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
  </script>

</body>
</html>

