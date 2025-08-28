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
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="/resources/landing/js/select.dataTables.min.js"></script>
  <script src="/resources/landing/js/ckeditor5/ckeditor.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
</head>
<body id="mcsPage">
  <div class="cursor"></div>
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>안전신고</h1>
        <p>한전MCS는 고객님의 소리에 귀 기울입니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>안전신고</li>
      </ul>
    </div>
    <div class="contents" id="newBusinessWrite"> 
      <div class="conts-ani" data-trigger>
        <h2 class="board-h2">작성하기</h2>
        <form action="">
          <ul class="board-form">
            <li>
              <div class="board-form-tit">제목</div>
              <div class="board-form-conts">
                <input type="text" class="input-style" placeholder="제목을 입력해 주세요">
              </div>
            </li>
            <li>
              <div class="board-form-tit">작성일</div>
              <div class="board-form-conts">
                <input type="date" id="currentDate" class="input-style date input-date">
              </div>
            </li>
            <li class="board-form-name">
              <div class="board-form-tit">이름</div>
              <div class="board-form-conts">
                <input type="text" class="input-style" placeholder="이름을 입력해 주세요">
              </div>
            </li>
            <li>
              <div class="board-form-tit">첨부파일</div>
              <div class="board-form-conts">
                <div class="file-row-wrap">
                  <div class="file-row-form">
                    <input type="file" class="file">
                    <input type="button" class="file-btn" value="파일선택">
                  </div>
                  <div>
                    <button class="btn-file-delete">파일삭제</button>
                  </div>
                </div>
                <div>
                  <table id="addFileList">
                    <thead>
                      <tr>
                        <th>선택</th>
                        <th>첨부파일명</th>
                        <th>용량</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="select-checkbox"></td>
                        <td>paper.pdf</td>
                        <td>20KB</td>
                      </tr>
                      <tr class="file-none">
                        <td></td>
                        <td>첨부파일이 없습니다.</td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </li>
            <li>
              <div class="board-form-tit">내용</div>
              <div class="board-form-conts">
                <div id="editor"></div>
              </div>
            </li>
          </ul>
          <div class="btn-row btn-row-board">
            <input type="button" value="취소" class="btn-cancle">
            <input type="button" value="저장" class="btn-save">
          </div>
        </form>
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

    //date
    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

    //input file
    $('.file-btn').on('click', function() {
      $(this).parents('.file-row-form').find('.file').trigger('click');
    });
    $('.file').on('change', function() {
      var fileName = $(this)[0].files[0].name;    
      $(this).parents('.file-row-form').find('.file-name').val(fileName);
    });

    //datatables
    $('#addFileList').DataTable({
      lengthChange: false,
      searching: false,
      info: false,
      paging: false,
      ordering: false,
      columnDefs: [ {
        orderable: false,
        className: 'select-checkbox',
      } ],
      select: {
        style:    'os'
      },
    }); 

    //editor
    ClassicEditor
      .create( document.querySelector( '#editor' ) )
      .catch( error => {
          console.error( error );
      } );

  </script>

</body>
</html>
