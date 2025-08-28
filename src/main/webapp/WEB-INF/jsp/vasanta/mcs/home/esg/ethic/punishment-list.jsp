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
  <title>제재현황 | 윤리경영 | ESG경영 | 한전MCS</title>
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
<script type="text/javascript">

	var board_type = "9";
	$(function() {
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

												return "<a href='/esg/ethic/integrity-view?board_no=" + row.board_no + "'>" + row.board_title + "</a>" || "";
											}
										},
										{
											"data" : "file_name",
											"sWidth" : '5%',
											"render" : function(data, type, row, meta) {
												
												return "<a href='/api/file/fileDown?file_name=" + encodeURI(row.file_name)  + "' class='down_zipfile' download></a>" || "";
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
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="esg-main esg-layout">
    <ul class="location esg-loca">
      <li>
        <a href="/">Home</a>
      </li>
      <li>
        <a href="/esg/safety/safety-introduction.html">ESG 경영</a>
      </li>
      <li>
        <a href="/esg/safety/safety-introduction.html">윤리경영</a>
      </li>
      <li>제재현황</li>
    </ul>  
    <div class="contents press-conts">
      <div class="esg-tit-wrap">
        <h1>제재현황</h1>
      </div>
      <div class="safetynews-wrap">
        <div class="tbl-wrap">
          <table class="table display nowrap list-table esg-list integrity-list" id="pressListTable" cellspacing="0" width="100%">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>첨부</th>
                <th>등록일</th>
              </tr>
            </thead>
            <tbody> 
              <tr>
                <td>10</td>
                <td>
                  <a href="/esg/ethic/punishment-view.html"> 
                    <p class="tbl-title">
                      2021년 6월말 현재 수의계약현황 2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황
                    </p>
                  </a>
                </td>
                <td>
                  <a href="" class="down_pdf" download></a>
                </td>
                <td>2021.10.10</td>
              </tr> 
              <tr>
                <td>10</td>
                <td>
                  <a href="/esg/ethic/punishment-view.html"> 
                    <p class="tbl-title">
                      2021년 6월말 현재 수의계약현황 2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황
                    </p>
                  </a>
                </td>
                <td>
                  <a href="" class="down_pdf" download></a>
                </td>
                <td>2021.10.10</td>
              </tr> 
              <tr>
                <td>10</td>
                <td>
                  <a href="/esg/ethic/punishment-view.html"> 
                    <p class="tbl-title">
                      2021년 6월말 현재 수의계약현황 2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황
                    </p>
                  </a>
                </td>
                <td>
                  <a href="" class="down_pdf" download></a>
                </td>
                <td>2021.10.10</td>
              </tr> 
              <tr>
                <td>10</td>
                <td>
                  <a href="/esg/ethic/punishment-view.html"> 
                    <p class="tbl-title">
                      2021년 6월말 현재 수의계약현황 2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황
                    </p>
                  </a>
                </td>
                <td>
                  <a href="" class="down_pdf" download></a>
                </td>
                <td>2021.10.10</td>
              </tr> 
              <tr>
                <td>10</td>
                <td>
                  <a href="/esg/ethic/punishment-view.html"> 
                    <p class="tbl-title">
                      2021년 6월말 현재 수의계약현황 2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황
                    </p>
                  </a>
                </td>
                <td>
                  <a href="" class="down_pdf" download></a>
                </td>
                <td>2021.10.10</td>
              </tr> 
              <tr>
                <td>10</td>
                <td>
                  <a href="/esg/ethic/punishment-view.html"> 
                    <p class="tbl-title">
                      2021년 6월말 현재 수의계약현황 2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황2021년 6월말 현재 수의계약현황
                    </p>
                  </a>
                </td>
                <td>
                  <a href="" class="down_pdf" download></a>
                </td>
                <td>2021.10.10</td>
              </tr>
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
