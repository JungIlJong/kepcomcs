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
</head>
<body id="mcsPage">
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="manage-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>입찰정보</h1>
        <p>언론에 보도된 한전MCS의 다양한 공헌과 활동을 알려드립니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/open-manage/public-notice">열린경영</a>
        </li>
        <li>입찰공고</li>
      </ul>
    </div>
    <div class="contents contract-conts press-conts">
      <div class="bid-tab-wrap">
        <ul class="bid-tab">
          <li>
            <a href="/open-manage/bid-info">입찰안내</a>
          </li>
          <li class="selected">
            <a href="/open-manage/bid-info">입찰공고</a>
          </li>
          <li>
            <a href="/open-manage/bid-list">자료실</a>
          </li>
          <li>
            <a href="/open-manage/contract-list">수의계약현황</a>
          </li>
        </ul>   
      </div> 
      <div class="recruit-news view">
        <ul class="news-view-box">
          <li class="news-view-title">
            <p>2021년 한전MCS(주) 계약직 직원 채용공고</p>
          </li>
          <li class="news-view-info">
            <div>
              <span class="news-view-stit">작성일</span>
              <span class="news-view-date">2021.10.10</span>
            </div>
            <div>
              <span>관리자</span>
            </div>
          </li>
          <li>
            <div class="news-view-photo">
              <img src="/resources/landing/images/manage/new_sample.jpg">
            </div>
            <div class="news-view-desc">
              <p class="recruit-view-tit">2021년 한전MCS(주) 계약직 직원 채용공고</p>
              <p class="recruit-view-desc">2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 </p>
              <p class="recruit-view-desc">2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 2021년 한전MCS(주) 계약직 직원 채용공고 상세내용2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 2021년 한전MCS(주) 계약직 직원 채용공고 상세내용2021년 한전MCS(주) 계약직 직원 채용공고 상세내용 2021년 한전MCS(주) 계약직 직원 채용공고 상세내용</p>
            </div>
          </li>
        </ul>
        <div class="btn-row-right">
          <a href="/open-manage/bid-notice">
            <button class="btn-list">목록</button>
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

  <style>
    #test {
      background-color: #ccc;
    }
  </style>

  <script>

  
  $("#footer").load("/resources/landing/include/footer.html");

    //tab
    let $bidMenu = $('.bid-tab li');
    let $bid = $('.bid-tab');
    $bidMenu.mouseenter(function() {
      $bidMenu.removeClass('selected');
      $(this).addClass('selected');
    })    
    $bid.mouseleave(function() {
      $bidMenu.removeClass('selected');
      $($bidMenu[1]).addClass('selected');
    })
    
    //datatables
    $('#pressListTable').DataTable({
      responsive: true,
      lengthChange: false,
      info: false,
      "order": [],
      "language": {
        "search": "검색",
        "paginate" : {
          "first" : "처음",
          "last" : "마지막",
          "next" : "다음",
          "previous" : "이전"
        },
      }
    })
  </script>

</body>
</html>