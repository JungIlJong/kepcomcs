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
  <link rel="stylesheet" href="/resources/landing/css/board.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/jquery.animateNumber.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
<div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
<!-- main -->
<main class="company-main">
  <div class="page-tit">
    <div class="page-tit-wrap">
      <h1>조직현황</h1>
      <p>한전MCS의 경쟁력, 본사·지사·사업소의 탄탄한 인프라가 만들어갑니다.</p>
    </div>
    <ul class="rocation">
      <li>
        <a href="/">Home</a>
      </li>
      <li>
        <a href="/mber/company/overview">회사소개</a>
      </li>
      <li>조직현황</li>
    </ul>
  </div>
  <div class="contents">
    <div class="organ-wrap">
      <h2>조직도
        <p style="padding:0.6rem 1rem 0rem 0; text-align:right; font-size:1rem; float:right; font-weight:normal;">2025-02-25 기준</p>
      </h2>
      <div class="status center">
        <ul>
          <li>
            <span class="organ-num organ-num_01">0</span>
            <span class="organ-type">본부</span>
          </li>
          <li>
            <span class="organ-num organ-num_02">0</span>
            <span class="organ-type">단</span>
          </li>
          <li>
            <span class="organ-num organ-num_03">0</span>
            <span class="organ-type">처</span>
          </li>
          <li>
            <span class="organ-num organ-num_04">0</span>
            <span class="organ-type">실</span>
          </li>
          <li>
            <span class="organ-num organ-num_05">00</span>
            <span class="organ-type">부</span>
          </li>
        </ul>
        <!-- <ul>
          <li>
            <span class="organ-num organ-num_05">0</span>
            <span class="organ-type">지사</span>
            <span class="organ-etc">개</span>
          </li>
          <li>
            <span class="organ-num organ-num_06">000</span>
            <span class="organ-type">지점</span>
            <span class="organ-etc">개</span>
          </li>
        </ul>
      </div> -->

      </div>
      <div class="organ-box">
        <img src="/resources/landing/images/company/organization_v4.png" alt="한전MCS 조직도">
      </div>
      <h2 style="margin: 60px 0 40px 0;">사업소현황</h2>
      <table id="newBusinessList" class="table display nowrap dataTable no-footer dtr-inline organ-box-table" cellspacing="0">
        <colgroup>
          <col style="width:25%;">
          <col style="width:25%;">
          <col style="width:25%;">
          <col style="width:25%;">
        </colgroup>
        <thead>
        <tr>
          <th>지사</th>
          <th>지점</th>
          <th>지사</th>
          <th>지점</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
          <td>서울지사</td>
          <td style="text-align:center !important;">7지점</td>
          <td>전북지사</td>
          <td>14지점</td>
        </tr>
        <tr class="even">
          <td>남서울지사</td>
          <td style="text-align:center !important;">7지점</td>
          <td>광주전남지사</td>
          <td>25지점</td>
        </tr>
        <tr class="odd">
          <td>인천지사</td>
          <td style="text-align:center !important;">9지점</td>
          <td>대구지사</td>
          <td>16지점</td>
        </tr>
        <tr class="even">
          <td>경기북부지사</td>
          <td style="text-align:center !important;">10지점</td>
          <td>경북지사</td>
          <td>12지점</td>
        </tr>
        <tr class="odd">
          <td>경기지사</td>
          <td style="text-align:center !important;">17지점</td>
          <td>부산울산지사</td>
          <td>13지점</td>
        </tr>
        <tr class="even">
          <td>강원지사</td>
          <td style="text-align:center !important;">17지점</td>
          <td>경남지사</td>
          <td>18지점</td>
        </tr>
        <tr class="odd">
          <td>충북지사</td>
          <td style="text-align:center !important;">11지점</td>
          <td>제주지사</td>
          <td>2지점</td>
        </tr>
        <tr class="even">
          <td>대전세종충남지사</td>
          <td style="text-align:center !important;">18지점</td>
          <td>발전사업소</td>
          <td>65개소</td>
        </tr>
        </tbody>
      </table>

      <div class="office" id="organAni01">
        <h2>대표번호</h2>
        <div class="col-sm-12">
          <table id="newBusinessList" class="table display nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" aria-describedby="newBusinessList_info">
            <thead>
            <tr>
              <th>부서</th>
              <th>전화번호</th>
              <th>부서</th>
              <th>전화번호</th>
            </tr>
            </thead>
            <tbody>
            <tr class="odd">
              <td class="dtr-control">종합감사부</td>
              <td style="text-align: center;">061-345-9905</td>
              <td>안전보건재난부</td>
              <td>061-345-9834</td>
            </tr>
              <tr class="even">
                <td class="dtr-control">기술감사부</td>
                <td style="text-align: center;">061-345-9893</td>
                <td>영업계획부</td>
                <td>061-345-9825</td>
              </tr>
              <tr class="odd">
                <td class="dtr-control">경영기획부</td>
                <td style="text-align: center;">061-345-9917</td>
                <td>영업운영부</td>
                <td>061-345-9818</td>
              </tr>
              <tr class="even">
                <td class="dtr-control">경영평가부</td>
                <td style="text-align: center;">061-345-9927</td>
                <td>ICT운영부</td>
                <td>061-345-9874</td>
              </tr>
              <tr class="odd">
                <td class="dtr-control">재무회계부</td>
                <td style="text-align: center;">061-345-9935</td>
                <td>신성장사업부</td>
                <td>061-345-9865</td>
              </tr>
              <tr class="even">
                <td class="dtr-control">인사관리부</td>
                <td style="text-align: center;">061-345-9946</td>
                <td>발전계획부</td>
                <td>061-370-9718</td>
              </tr>
              <tr class="odd">
                <td class="dtr-control">사회공헌부</td>
                <td style="text-align: center;">061-345-9956</td>
                <td>발전운영부</td>
                <td>061-370-9728</td>
              </tr>
              <tr class="even">
                <td class="dtr-control">정보보안부</td>
                <td style="text-align: center;">061-345-9846</td>
                <td>발전기술부</td>
                <td>061-345-9756</td>
              </tr>
              <tr class="odd">
                <td class="dtr-control">노무복지부</td>
                <td style="text-align: center;">061-345-9966</td>
                <td>발전품질부</td>
                <td>061-345-9779</td>
              </tr>
              <tr class="even">
                <td class="dtr-control">급여부</td>
                <td style="text-align: center;">061-345-9977</td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!--
      <div class="office" id="organAni01">
        <h2>대표번호</h2>
        <div class="col-sm-12">
          <table id="newBusinessList" class="table display nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" aria-describedby="newBusinessList_info">
            <thead>
            <tr>
              <th>부서</th>
              <th>전화번호</th>
              <th>부서</th>
              <th>전화번호</th>
            </tr>
            </thead>
            <tbody>
            <tr class="odd">
              <td class="dtr-control">경영평가부</td>
              <td style="text-align: center;">061-345-9925</td>
              <td>경영기획부</td>
              <td>061-345-9915</td>
            </tr>
            <tr class="even">
              <td class="dtr-control">영업계획부</td>
              <td style="text-align: center;">061-345-9825</td>
              <td>영업운영부</td>
              <td>061-345-9816</td>
            </tr>
            <tr class="odd">
              <td class="dtr-control">안전보건부</td>
              <td style="text-align: center;">061-345-9834</td>
              <td>사이버재난안전부</td>
              <td>061-345-9845</td>
            </tr>
            <tr class="even">
              <td class="dtr-control">신성장사업부</td>
              <td style="text-align: center;">061-345-9865</td>
              <td>인사관리부</td>
              <td>061-345-9945</td>
            </tr>
            <tr class="odd">
              <td class="dtr-control">ICT융복합부</td>
              <td style="text-align: center;"">061-345-9875</td>
              <td>총무부</td>
              <td>061-345-9958</td>
            </tr>
            <tr class="even">
              <td class="dtr-control">노무복지부</td>
              <td style="text-align: center;">061-345-9964</td>
              <td>급여부</td>
              <td>061-345-9975</td>
            </tr>
            <tr class="odd">
              <td class="dtr-control">재무회계부</td>
              <td style="text-align: center;">061-345-9935</td>
              <td>감사부</td>
              <td>061-345-9906</td>
            </tr>
            </tbody>
          </table>
        </div>

        <h2 style="margin-top: 60px;">시스템 담당자</h2>
        <div class="col-sm-12">
          <table id="newBusinessList" class="table display nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" aria-describedby="newBusinessList_info">
            <thead>
            <tr>
              <th>이름</th>
              <th>담당업무</th>
              <th>부서</th>
              <th>전화번호</th>
            </tr>
            </thead>
            <tbody>
            <tr class="odd">
              <td class="dtr-control">정겨울</td>
              <td>정보시스템, 정보화설비 총괄</td>
              <td>ICT융복합부</td>
              <td>061-345-9873</td>
            </tr>
            <tr class="odd">
              <td class="dtr-control">노경제</td>
              <td>설비도입, 모바일, 대내 요청대응</td>
              <td>ICT융복합부</td>
              <td>061-345-9874</td>
            </tr>
            <tr class="even">
              <td class="dtr-control">이화종</td>
              <td>내부시스템, 웹페이지, 대외 요청대응</td>
              <td>ICT융복합부</td>
              <td>061-345-9875</td>
            </tr>
            <tr class="odd">
              <td class="dtr-control">전은주</td>
              <td>통신, 인프라, 서무업무</td>
              <td>ICT융복합부</td>
              <td>061-345-9876</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
      -->
    </div>
</main>
<!-- //main -->
<div id="footer"></div>
<div class="btn-top">
  TOP
  <p class="top-line"></p>
</div>

<!-- mobile modal 조직도 이미지 -->
<div class="modal_wrap">
  <div class="modal_conts">
    <img src="/resources/landing/images/company/organization.png" alt="한전MCS 조직도">
  </div>
  <div class="btn-image-close"></div>
</div>

<script>
  
  $("#footer").load("/resources/landing/include/footer.html");

  //timer
  let delayTime;
  let delayTime2;
  if( $(window).width() > 767 ) {
    delayTime = 2000
    delayTime2 = 2500
  } else {
    delayTime = 800
    delayTime2 = 1300
  }

  setTimeout(function() {
    $('.organ-num_01').animateNumber({
      number: 1
    })
  }, delayTime)
  setTimeout(function() {
    $('.organ-num_02').animateNumber({
      number: 1
    })
  }, delayTime)
  setTimeout(function() {
    $('.organ-num_03').animateNumber({
      number: 6
    })
  }, delayTime)
  setTimeout(function() {
    $('.organ-num_04').animateNumber({
      number: 8
    })
  }, delayTime)
  setTimeout(function() {
    $('.organ-num_05').animateNumber({
      number: 19
    })
  }, delayTime2)
  setTimeout(function() {
    $('.organ-num_06').animateNumber({
      number: 196
    })
  }, delayTime2)

  var waypoint = new Waypoint({
    element: document.getElementById('organAni01'),
    handler: function(direction) {
      $('#organAni01').addClass('visible')
    },
    offset: '75%'
  })
</script>

</body>
</html>
