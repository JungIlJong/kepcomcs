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
  <link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
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
  <main class="manage-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>공공데이터 개방·제공</h1>
        <p>한전MCS 공공데이터 개방·제공</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/open-manage/public-notice">열린경영</a>
        </li>
        <li>공공데이터 개방·제공</li>
      </ul>
    </div>
    <div class="contents short-conts">
      <div class="organ-wrap">
        <h2>공공데이터 개방·제공</h2>
      </div>
      <div class="compe-ani">
        <div class="desc-area">
          <p class="desc-row-txt1">공공데이터란?</p>
          <p class="desc-row-txt2 desc-dot">데이터베이스, 전자화된 파일 등 공공기관이 법령등에서 정하는 목적을 위하여 생성 또는 취득하여 관리하고 있는 광 또는 전자적 방식으로 처리된 자료 또는 정보를 말함</p><br/><br/><br/>
          
          <p class="desc-row-txt1">개방이란?</p>
          <p class="desc-row-txt2 desc-dot">공공기관이 이용자에게 ①공공데이터를 활용할 수 있는 형태로 제공하고, 제공받은 공공데이터를 ②영리적·비영리적으로 이용할 권한을 부여하는 것을 말함</p><br/><br/><br/>
          
          <p class="desc-row-txt1">공공데이터개방 책임관 안내</p>
          <div class="col-sm-12">
	          <table class="table display nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%">
				<thead>
					<tr>
	                  <th scope="col">구분</th>
	                  <th scope="col">부서</th>
	                  <th scope="col">직위</th>
	                  <th scope="col">성명</th>
	                  <th scope="col">연락처</th>
	                </tr>
				</thead>
				<tbody>
	               <tr class="odd">
	                 <td>공공데이터 책임관</td>
	                 <td>ICT운영부</td>
	                 <td>부장</td>
	                 <td>조영호</td>
	                 <td>061-345-9872</td>
	               </tr>
	               <tr class="even">
	                 <td>공공데이터 실무담당</td>
	                 <td>ICT운영부</td>
	                 <td>사원</td>
	                 <td>노경제</td>
	                 <td>061-345-9874</td>
	               </tr>
	             </tbody>
			  </table>
          </div>
		  
		  <div class="desc-row desc-right">
	        <div>
	          <img src="/resources/landing/images/open_data.png" alt="공공데이터">
	        </div>
	        <div class="desc-area">
	          <p class="desc-row-txt1">공공데이터 제공 목록</p>
	          <p class="desc-row-txt2 desc-dot">한전MCS에서 제공하는 공공데이터목록입니다.</p>
			  <a href="https://www.data.go.kr/tcs/dss/selectDataSetList.do?keyword=%ED%95%9C%EC%A0%84%EC%97%A0%EC%94%A8%EC%97%90%EC%8A%A4%EC%A3%BC%EC%8B%9D%ED%9A%8C%EC%82%AC&brm=&svcType=&recmSe=N&conditionType=init&extsn=&kwrdArray=" class="btn_blue" target="_blank" title="공공데이터 바로가기">목록 상세보기</a>
	        </div>
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