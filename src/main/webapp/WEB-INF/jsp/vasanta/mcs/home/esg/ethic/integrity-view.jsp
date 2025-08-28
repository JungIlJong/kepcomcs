<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="format-detection" content="telephone=no"/>
    <meta property="og:type" content="website">
    <meta property="og:title" content="한전MCS 주식회사">
    <meta property="og:description"
          content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
    <meta property="og:image" content="https://www.kepcomcs.co.kr/resources/landing/images/main/logo.png">
    <meta property="og:url" content="http://kepcomcs.co.kr">
    <title>청렴·윤리 소식지 | 윤리경영 | ESG경영 | 한전MCS</title>
    <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
    <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
    <link rel="stylesheet" href="/resources/landing/css/common.css">
    <link rel="stylesheet" href="/resources/landing/css/sub.css">
    <link rel="stylesheet" href="/resources/landing/css/manage.css">
    <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
    <script src="/resources/js/jquery-3.7.1.min.js"></script>
    <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
    <script src="/resources/landing/js/pages.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
    <script type="text/javascript">

        var board_type = "8";
        $(document).ready(function () {
            setMainTable();
            setNextPrev();
        })

        function setMainTable() {

            var form = {
                board_type: board_type,
                board_no:  <%=request.getParameter("board_no") %>
            };
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                url: "/get/news/view", // 요청 할 주소
                async: true,// false 일 경우 동기 요청으로 변경
                type: 'POST', // GET, PUT
                dataType: 'json',// xml, json, script, html
                data: JSON.stringify(form),
                success: function (data) {
                    request = data;
                    if (parseInt(request.result)) {
                        if (request.data) {
                            //var requestJson = JSON.parse(request);
                            if (request.result == "1") {
                                console.log(request.data);
                                $('#news-view-title').text(request.data[0].board_title);
                                $('#news-insert-dt').text(request.data[0].insert_dt);
                                console.log(request.data[0].detail_img_file_name);
                                if (request.data[0].detail_img_file_name != null && request.data[0].detail_img_file_name != "" && request.data[0].detail_img_file_name != "undefined") {
                                    $("#news-view-photo").show();
                                    var pHtml = "";
                                    var detail_img_list = request.data[0].detail_img_file_name.split(",");
                            if (detail_img_list.length > 0) {
                                        for (var i = 0; i < detail_img_list.length; i++) {
                                            pHtml += '<img src="/api/file/fileDown?file_name=' + encodeURI(detail_img_list[i]) + '">';
                                        }
                                        $('#news-view-photo').html(pHtml);
                                    }
                                } else {
                                    $("#news-view-photo").hide();
                                }

                                if (request.data[0].file_name != null && request.data[0].file_name != "" && request.data[0].file_name != "undefined") {

                                    $('#file-download-url').attr('href', '/api/file/fileDown?file_name=' + encodeURI(request.data[0].file_name));

                                    //var filename = request.data[0].file_name.split("-_-");
                                    $('#file-name').text(request.data[0].file_name);

                                } else {

                                    $('#filelist').css('display', 'none');

                                    var pHtml = "";
                                    if (request.fileList.length > 0) {

                                        for (var i = 0; i < request.fileList.length; i++) {
                                            pHtml += "<p><a href='" + "/api/file/fileDown?file_name=" + encodeURI(request.fileList[i].file_name) + "'>"
                                            pHtml += "<span>" + request.fileList[i].file_name + "</span></p>"
                                        }
                                        $('#div_filelist').html(pHtml);
                                    }


                                }

                                $('#news-view-desc').html(request.data[0].board_content.replace(/\n/g, '<br/>'));

                            }
                        }
                    }
                },// 요청 완료 시
                error: function (jqXHR) {
                    alert("비정상적인 접근 입니다. \n관리자에게 문의해 주세요.")
                },// 요청 실패.
                complete: function (jqXHR) {
                }// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
            });
        }

        function setNextPrev() {

            var form = {
                board_type: board_type,
                board_no:  <%=request.getParameter("board_no") %>
            };
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                url: "/get/news/nextprev", // 요청 할 주소
                async: true,// false 일 경우 동기 요청으로 변경
                type: 'POST', // GET, PUT
                dataType: 'json',// xml, json, script, html
                data: JSON.stringify(form),
                success: function (data) {
                    request = data;
                    if (parseInt(request.result)) {
                        if (request.data) {
                            if (request.result == "1") {
                                $("#prev_post_href").prop("disabled", true);
                                $("#next_post_href").prop("disabled", true);
                                for (i = 0; i < request.data.length; i++) {
                                    if (request.data[i].view_type == "prev") {
                                        $('#prev_post').text(request.data[i].board_title);
                                        $("#prev_post_href").attr("href", "/esg/ethic/integrity-view?board_no=" + request.data[i].board_no);
                                    } else {
                                        $('#next_post').text(request.data[i].board_title);
                                        $("#next_post_href").attr("href", "/esg/ethic/integrity-view?board_no=" + request.data[i].board_no);
                                    }
                                }
                            }
                        }
                    }
                },// 요청 완료 시
                error: function (jqXHR) {
                    alert("비정상적인 접근 입니다. \n관리자에게 문의해 주세요.")
                },// 요청 실패.
                complete: function (jqXHR) {
                }// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
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
        <li>청렴·윤리 소식지</li>
    </ul>
    <div class="contents">
        <div class="esg-tit-wrap">
            <h1>청렴·윤리 소식지</h1>
        </div>
        <div class="safetynews-wrap safetynews-view">
            <ul class="news-view-box">
                <li class="news-view-title">
                    <p id="news-view-title"></p>
                </li>
                <li class="news-view-info">
                    <div>
                        <!-- <span>View count</span>
                         <span>00</span> -->
                    </div>
                    <div>
                        <span class="news-view-stit">작성일</span>
                        <span class="news-view-date" id="news-insert-dt"></span>
                    </div>
                </li>
                <li>
                    <div class="news-view-photo" id="news-view-photo">
                        <img src="">
                    </div>
                    <div class="news-view-desc" id="news-view-desc">

                    </div>
                    <div class="addfile-row" id="div_filelist">
                        <p id="filelist">
                            <a id="file-download-url">
                                <span id="file-name">filename0000_01.pdf</span>
                            </a>
                        </p>
                    </div>
                </li>
            </ul>
            <div class="btn-row-right">
                <a href="/esg/ethic/integrity-list">
                    <button class="btn-list">목록</button>
                </a>
            </div>
            <div class="additional">
                <div>
                    <a href="#" id="prev_post_href">
                        <p>이전글</p>
                        <p id="prev_post">이전 글이 없습니다.</p>
                    </a>
                </div>
                <div>
                    <a href="#" id="next_post_href">
                        <p>다음글</p>
                        <p id="next_post">다음 글이 없습니다.</p>
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
