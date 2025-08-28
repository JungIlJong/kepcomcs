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
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
	<script type="text/javascript">
	
		var board_type = "22";
		$(function() {
			//$('#notice_type').val(board_type)
			console.log(board_type)
			setMainTable();
		})
		
		function setMainTable() {
			mainTable = $('#newBusinessList')
					.DataTable(
							{
								responsive : true,
								lengthChange: false,
								pagingType : "full_numbers",
								//bAutoWidth: true,
								ordering : false,
								searching : true,
								"language": {
							        "search": "검색",
							        "info" : "총 _TOTAL_건",
							        "emptyTable": "등록된 글이 없습니다.",
							        "infoEmpty":  "",
							        "paginate" : {
							          "first" : "처음",
							          "last" : "마지막",
							          "next" : "다음",
							          "previous" : "이전"
							        },
							    },
								bServerSide : true,
								sAjaxSource : "/get/board/list/"+board_type,
								sServerMethod : "POST",
								//POST 파라미터 추가 (게시판명 추가) 
								fnServerParams : function(aoData) {
									/* aoData.push({
										"name" : "sSearch",
										"value" : $('#TbtechSearchBox').val()
									}); */
								},
										
										columns : [
											{
												"data" : "board_no",
												"title" : "번호",
												"render" : function(data, type, row, meta) {
	
													return (parseInt(mainTable.page.info().recordsTotal) - (parseInt(mainTable.page.info().start) + parseInt(meta.row)));
												}
											},
											{
												"data" : "board_title",
												"sWidth" : '50%',
												"orderable" : false,
												"render" : function(data, type, row, meta) {
	
													return "<a href='/customer/integrity-pwd?board_no=" + row.board_no + "'>" + row.board_title + "</a>" || "";
												}
											},
											{
												"data" : "insert_id",
												render : function(data, type, row, meta) {
	
													return row.insert_id || "";
												}
											},
											{
												"data" : "insert_dt",
												"render" : function(data, type, row, meta) {
													
													return row.insert_dt || "";
												}
											},
											{
												"data" : "board_status",
												"render" : function(data, type, row, meta) {

													var return_val = "";
													if (row.board_status == 0)
														return_val = "접수완료";
													else if (row.board_status == 1)
														return_val = "<font style='display: inline-block;border: 1px solid #53585a;padding:5px 10px 3px;border-radius: 11px;color: #53585a;font-size: var(--font-micro);'>처리중</font>";
													else if (row.board_status == 2)
														return_val = "<font style='display: inline-block;border: 1px solid #00A0B2;padding:5px 10px 3px;border-radius: 11px;color: #00A0B2;font-size: var(--font-micro);'>답변완료</font>";
													
													return return_val || "";
												}
											}

										],											
								initComplete : function() {
									//$('.dataTable').dataTable().fnFilterOnReturn();
									//TbtechSearchForm();
									//setDateRange();

									$('#pageMainTable tbody').on(
											'dblclick',
											'tr,input',
											function() {
												if (this.tagName != "TR") {
													return false;
												}
												rowData = mainTable
														.row('.selected').data();
											});
									$('#pageMainTable tbody').on(
											'click',
											'tr,input',
											function() {
												if (this.tagName != "TR") {
													return false;
												}

												if ($(this).hasClass('selected')) {
													//$(this).removeClass('selected');
													//$(this).removeClass('edit');
													//selectedData = null;
												} else {
													mainTable.$('tr').removeClass(
															'selected');
													mainTable.$('tr').removeClass(
															'edit');
													$(this).addClass('selected');
													$(this).addClass('edit');

												}
											});
									var hashStr = hashSearch();
									if(hashStr != "")
									{
										mainTable.search(hashStr).draw(false)
									}
								},
								drawCallback : function(settings) {
									//CALLBACK 함수 데이터 전달받은 후에 전역인 Datalist에 담는 함수

								},
								//oLanguage: {sProcessing: "<div id='loader'></div>"},
								dom : "<'row group_btn'<'col-sm-6 wide_width'B><'col-sm-6 taxTypeUpdateBox text-rigth small_width'>>"
										+ "<'row'<'col-sm'l><'col-sm-4'f>>"
										+ "<'row'<'col-sm-12'tr>>"
										+ "<'row'<'col-sm-6'i><'col-sm-6'p>>",
								buttons : []
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
        <h1>청렴·부패 신고</h1>
        <p>투명하고 공정한 회사 문화 형성에 앞장서겠습니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>청렴·부패 신고</li>
      </ul>
    </div>
    <div class="contents"> 
      <div class="conts-ani tab-list" data-trigger>
        <div>
          <a href="/customer/integrity-agree">
            <button class="btn-write">작성하기</button>    
          </a>    
        </div>
        <!-- 협력사업제안 list table -->
        <table id="newBusinessList" class="table display nowrap" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>등록일</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
        <!-- //협력사업제안 list table -->
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

    //datatables
    /* $('#newBusinessList').DataTable({
      responsive: true,
      lengthChange: false,
      "order": [],
      
    }) */
  </script>

</body>
</html>
