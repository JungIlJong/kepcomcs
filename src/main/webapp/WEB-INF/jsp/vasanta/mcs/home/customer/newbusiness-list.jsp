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
</head>
<body id="mcsPage">
  <div class="cursor"></div>
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>신사업 문의</h1>
        <p>한전MCS는 고객님의 소리에 귀 기울입니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>신사업 문의</li>
      </ul>
    </div>
    <div class="contents"> 
      <div class="conts-ani tab-list" data-trigger>
        <div>
          <a href="/customer/newbusiness-form.html">
            <button class="btn-write">작성하기</button>    
          </a>    
        </div>
        <!-- 신사업문의 list table -->
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
            <tr class="manager">
              <td>공지</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">신사업 문의 방법</p>
                </a>
              </td>
              <td>관리자</td>
              <td>2021.10.10</td>
              <td>-</td>
            </tr>
            <tr>
              <td>10</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요, 어떻게 해야 하나요? 사회공헌을 한전MCS와 신사업을 하고 싶은데요, 어떻게 해야 하나요?</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
            <tr>
              <td>9</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요, 어떻게 해야 하나요? 사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>8</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
            <tr>
              <td>7</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
            <tr>
              <td>6</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
            <tr>
              <td>5</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>4</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>

            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요, 어떻게 해야 하나요? 사회공헌을 한전MCS와 신사업을 하고 싶은데요, 어떻게 해야 하나요?</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요, 어떻게 해야 하나요?</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="answered">답변완료</span>
              </td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="/customer/newbusiness-view">
                  <p class="tbl-title">사회공헌을 한전MCS와 신사업을 하고 싶은데요</p>
                </a>
              </td>
              <td>홍**</td>
              <td>2021.10.10</td>
              <td>
                <span class="waiting">대기중</span>
              </td>
            </tr>
          </tbody>
        </table>
        <!-- //신사업문의 list table -->
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
    $('#newBusinessList').DataTable({
      responsive: true,
      lengthChange: false,
      "order": [],
      "language": {
        "search": "검색",
        "info" : "총 _TOTAL_건",
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
