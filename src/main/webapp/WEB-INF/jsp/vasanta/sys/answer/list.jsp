<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <title>댓글관리</title>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>

  <script type="text/javascript">
    function search(pageIndex) {
      let data = bindingData(document.getElementById('frmSearch'));
      data["pageIndex"] = pageIndex;
      Ajax.get(dataToQueryString('/api/sys/answer/list', data), success, fail);
    }

    let success = function (data) {
      console.log(data);
      let paginationInfo = data.paginationInfo;
      document.getElementById('totCnt').textContent = paginationInfo.totalRecordCount;
      renderPagination(paginationInfo, document.getElementById('pagination'));

      let tableBody = document.getElementById('table-body');

      removeAllChild(tableBody);
      data.data.forEach(function (element, index) {
        if (index >= paginationInfo.pageSize) return false;
        let node = `<tr>
                      <td class="tblBodyItem item01">
                        <a href="#!">0000</a>
                      </td>
                      <td class="tblBodyItem item01">
                        <a href="#!">공지사항</a>
                      </td>
                      <td class="tblBodyItem tit left">
                        <a href="#!" class="cmtList">
                          <p>[공지] 게시글 제목</p>
                          <p>댓글내용이 보이는 자리입니다.</p>
                        </a>
                      </td>
                      <td class="tblBodyItem item01">
                        <a href="#!">홍길동</a>
                      </td>
                      <td class="tblBodyItem date">
                        <a href="#!">2023-00-00 00:00:00</a>
                      </td>
                      <td class="tblBodyItem fix200">
                        <div class="buttonArea center">
                          <a href="#!" class="btn sml line"><img src="./assets/icon/content/smlbtn_view_on.svg"
                              alt="">노출</a>
                          <a href="#!" class="btn sml dark"><img src="./assets/icon/content/smlbtn_delete.svg"
                              alt="">삭제</a>
                        </div>
                      </td>
                    </tr>`;
        tableBody.insertAdjacentHTML('beforeend', node);


      });
    }

    let fail = function (xhr, status, error) {
      customAlert({
        title: '<spring:message code="common.system.info"/>',
        content: '<spring:message code="fail.common.msg"/>',
        showCancel: false,
        onConfirm: function() {
          console.log(xhr + ", " + status + " : " + error)
        }
      });
    }

  </script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/vasanta/sys/include/header.jsp" %>
<div class="wrapper">

  <%@ include file="/WEB-INF/jsp/vasanta/sys/include/nav.jsp" %>

  <!-- 콘텐츠 영역 start -->
  <div class="contentWrap">
    <div class="container">
      <div class="row">
        <div class="col m12 conTop">
          <div class="conTit">
            <h3 class="">게시물관리</h3>
            <div class="breadCrumbBox">
              <ul class="breadCrumb arrow">
                <li class="breadCumbItem">
                  <a href="#!">HOME</a>
                </li>
                <li class="breadCumbItem">
                  <a href="#!">운영관리</a>
                </li>
                <li class="breadCumbItem">
                  <a href="#!">게시물관리</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col sm12">
          <div class="container">
            <form id="frmSearch">
              <div class="srchFltrWrap">
                <div class="srchFltrItem">
                  <p class="tit">등록일자</p>
                  <div class="DatePickerWrap">
                    <div class="DatePicker">
                      <input type="text" class="datePickerInput flatpickr-input active" placeholder="시작일자 선택"
                             data-input="" readonly="readonly">
                      <button class="inputButton" type="button" data-toggle="">
                        <img src="/sys/assets/icon/Basic_Icon/Datepicker_calendar.svg" alt="">
                      </button>
                    </div>
                    <div class="DatePicker">
                      <input type="text" class="datePickerInput flatpickr-input active" placeholder="종료일자 선택"
                             data-input="" readonly="readonly">
                      <button class="inputButton" type="button" data-toggle="">
                        <img src="/sys/assets/icon/Basic_Icon/Datepicker_calendar.svg" alt="">
                      </button>
                    </div>
                  </div>
                  <p class="tit">게시판</p>
                  <div class="selectWrap">
                    <select class="selectBox" id="bbsId" name="bbsId">
                      <option value="" selected>전체</option>
                      <c:forEach var="item" items="${bbss}">
                        <option value="<c:out value='${item.bbsId}' />"><c:out value="${item.bbsNm}"/></option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="srchFltrItem">
                  <div class="subsearch">
                    <div class="selectWrap">
                      <select class="selectBox" id="searchCondition" name="searchCondition">
                        <option value="nttSj" selected>게시물 제목</option>
                      </select>
                    </div>
                    <div class="rightItem">
                      <input type="search" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요1">
                      <button id="btnSearch" type="button" class="btn searchBtn">검색</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
            <div class="table-top">
              <div class="boardCount">
                총 <span id="totCnt"></span>건
              </div>
              <div class="buttonArea">
                <a href="save" class="btn">등록</a>
              </div>
            </div>
            <div class="table-area">
              <table class="tbl board">
                <thead class="tblHeader">
                <tr>
                  <th class="tblHeaderItem num">번호</th>
                  <th class="tblHeaderItem item01">게시글명</th>
                  <th class="tblHeaderItem tit">내용</th>
                  <th class="tblHeaderItem item01">작성자</th>
                  <th class="tblHeaderItem date">등록일시</th>
                  <th class="tblHeaderItem fix200">관리</th>
                </tr>
                </thead>
                <tbody id="table-body">
                </tbody>
              </table>
              <div class="buttonArea right">
                <a href="save" class="btn">등록</a>
              </div>
              <div class="pagination-area">
                <ul id="pagination" class="pagination">
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 콘텐츠 영역 end -->

  <!-- Contents end -->
</div>

<!-- script -->
<script src="/sys/js/Component_1_0_231220.js"></script>
<script src="/sys/js/lib/slick.min.js"></script>
<script src="/sys/js/lib/flatpickr.js"></script>
<script src="/sys/js/lib/l10n_ko.js"></script>
<script src="/sys/js/lib/jquery.selectric.min.js"></script>

<script src="/sys/js/common.js"></script>
<script src="/sys/js/content.js"></script>
<script type="text/javascript">
  $(function () {
    search(1);

    let btnSearch = document.getElementById('btnSearch');
    btnSearch.addEventListener('click', function () {
      search(1);
    });

    let pagination = document.getElementById('pagination');
    pagination.addEventListener('click', function (event) {
      pageEventDelegation(event);
    });
  });
</script>
</body>
</html>
