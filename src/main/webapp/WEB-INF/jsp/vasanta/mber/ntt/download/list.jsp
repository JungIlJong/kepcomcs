<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  
	var bbsId = "${bbsId}";
	$(document).ready(function () {
		setMainTable();
	})
	
	function setMainTable() {
			mainTable = $('#pressListTable')
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
								sAjaxSource : "/get/board/list/"+bbsId,
								sServerMethod : "POST",
								//POST 파라미터 추가 (게시판명 추가) 
								fnServerParams : function(aoData) {
								},
										
									columns : [
										{
											"data" : "board_no",
											"title" : "번호",
											"sWidth" : '7%',
											"render" : function(data, type, row, meta) {
	
												return (parseInt(mainTable.page.info().recordsTotal) - (parseInt(mainTable.page.info().start) + parseInt(meta.row)));
											}
										},
										{
											"data" : "board_title",
											"sWidth" : '73%',
											"orderable" : false,
											"render" : function(data, type, row, meta) {
												let decoded = decodeHtmlEntities(row.board_title);
										    	decoded = decodeHtmlEntities(decoded);
												return "<a href='detail?id=" + row.board_no + "'>" + decoded + "</a>" || "";
											}
										},
										{
											"data" : "file_name",
											"sWidth" : '5%',
											"render" : function(data, type, row, meta) {
	
	
												var return_val = "";
												if (row.atch_file_id != "" && row.atch_file_id != "undefined" && row.atch_file_id != null){
													return_val = "<a href='/file/download?fileId=" + row.atch_file_id + "' class='down_zipfile' download></a>";
	
												} else{
													return_val = "";
												}
												
												return return_val || "";
	
	
												}
										},
										{
											"data" : "insert_dt",
											"sWidth" : '15%',
											"render" : function(data, type, row, meta) {
												
												return row.insert_dt || "";
											}
										}
									],											
								initComplete : function() {

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
								dom : "<'row group_btn'<'col-sm-6 wide_width'B><'col-sm-6 taxTypeUpdateBox text-rigth small_width'>>"
										+ "<'row'<'col-sm'l><'col-sm-4'f>>"
										+ "<'row'<'col-sm-12'tr>>"
										+ "<'row'<'col-sm-6'i><'col-sm-6'p>>",
								buttons : []
							});

			
		}
	
	function decodeHtmlEntities(str) {
		  const txt = document.createElement('textarea');
		  txt.innerHTML = str;
		  return txt.value;
		}
  </script>
  <style>
  	/* datatable style */
	table.dataTable thead th, 
	table.dataTable tbody td {
	  padding: 16px 18px;
	}
	table.dataTable.stripe tbody tr.odd, 
	table.dataTable.display tbody tr.odd {
	  background-color: var(--color-white);
	}
	table.dataTable.display tbody tr.odd>.sorting_1, 
	table.dataTable.order-column.stripe tbody tr.odd>.sorting_1 {
	  background-color: var(--color-white);
	}
	table.dataTable.display tbody tr.even>.sorting_1, 
	table.dataTable.order-column.stripe tbody tr.even>.sorting_1 {
	  background-color: var(--color-white);
	}
	table.dataTable.display tbody tr.manager {
	  background-color: #FAFBFF;
	}
	table.dataTable tbody tr.even {
	  background-color: transparent;
	}
	table.dataTable.display thead tr th {
	  font-size: var(--font-small);
	}
	table.dataTable.display tbody tr td {
	  color: var(--color-grey);
	  font-size: var(--font-smaller);
	  text-align: center;
	}
	table.dataTable.row-border tbody th, 
	table.dataTable.row-border tbody td, 
	table.dataTable.display tbody th, 
	table.dataTable.display tbody td {
	  border-top: 1px solid var(--color-light-grey);
	}
	table.dataTable.display thead tr:hover th,
	table.dataTable.display tbody tr:hover td  {
	  background-color: #FAFBFF;
	}
	.desc-row-txt1 {
	  margin-bottom: 20px;
	}
	.btn_blue {
		display: block;
		width: 100%;
	    max-width: 177px;
	    height: 55px;
	    line-height: 55px;
	    background: #002581;
	    font-size: 16px;
	    color: #fff;
	    text-align: center;
	}
  </style>
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1><c:out value="${menuTitle}"/></h1>
        <p><c:out value="${menuSj}"/></p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
            <a href="/customer/opinion">고객소통</a>
        </li>
        <li><c:out value="${menuTitle}"/></li>
      </ul>
    </div>
    
	<div class="contents press-conts">
		<div class="social-list">
			<div class="tbl-wrap">
				<table class="table display nowrap list-table esg-list integrity-list" id="pressListTable" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th id="atchFile">첨부</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>             
					</tbody>
				</table>
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