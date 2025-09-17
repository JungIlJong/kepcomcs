<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
	<meta name="format-detection" content="telephone=no"
	/resources/landing />
	<meta property="og:type" content="website">
	<meta property="og:title" content="한전MCS 주식회사">
	<meta property="og:description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
	<meta property="og:image" content="http://www.kepcomcs.co.kr/images/main/logo.png">
	<meta property="og:url" content="http://kepcomcs.co.kr">
	<title>한전MCS 주식회사</title>
	<meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
	<meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
	<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js"></script>

	<link rel="stylesheet" href="/resources/landing/css/fullpage.min.css">
	<link rel="stylesheet" href="/resources/landing/css/swiper.min.css">
	<!--  <link rel="stylesheet" href="/resources/landing/css/swiper-bundle.min.css">-->
	<link rel="stylesheet" href="/resources/landing/css/common.css">
	<link rel="stylesheet" href="/resources/landing/css/main.css">
	<link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
	<script src="/resources/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/landing/js/fullpage.min.js"></script>
	<script src="/resources/landing/js/swiper-5.4.5.min.js"></script>
	<!-- <script src="/resources/landing/js/swiper-bundle.min.js"></script> -->
	<script src="/resources/landing/js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>

	<!-- <script type="text/javascript">
	/** 구버전 main slider ***/
	//랜덤으로 섞는 함수 shuffleElements
	function shuffleElements(container1, container2) {
		  var elements1 = Array.from(container1.children());
		  var elements2 = Array.from(container2.children());
		  var currentIndex = elements1.length;

		  while (currentIndex !== 0) {
			var randomIndex = Math.floor(Math.random() * currentIndex);
			currentIndex--;
			var temp1 = elements1[currentIndex];
			elements1[currentIndex] = elements1[randomIndex];
			elements1[randomIndex] = temp1;

			var temp2 = elements2[currentIndex];
			elements2[currentIndex] = elements2[randomIndex];
			elements2[randomIndex] = temp2;
		  }
		  container1.empty();
		  container2.empty();
		  for (var i = 0; i < elements1.length; i++) {
			container1.append(elements1[i]);
			container2.append(elements2[i]);
		  }
		}
		function mixslide(callback) {
		  var mainSlideWrapper = $(".main_slide_wrap");
		  var paginationBullets = $(".main_pagination");

		  shuffleElements(mainSlideWrapper, paginationBullets);

		  if (typeof callback === "function") {
			callback();
		  }
		}

		$(function() {
			$(".videoslide").hide();
			  mixslide(function() {
				var firstSlide = $(".videoslide:first-child");
				var v_first = firstSlide.find(".banner_video")[0];

				//pagination default
				$(".main_pagination_bullet").each(function(){
					var pageindex = $(this).index()+1;
					$(this).find("b").html("0"+pageindex+". ");
				})
				firstSlide.addClass("on")
				$(".main_pagination_bullet:nth-of-type(1)").addClass('active'); //첫번째 bullet에 active 추가

				//slide, video default
				firstSlide.fadeIn(500);
				firstSlide.find(".slide-ani").addClass("animate");
				$(".banner_video").each(function() {
				  var video = this;
				  video.pause();
				  video.currentTime = 0;
				});
				v_first.play();

				// video 끝났을때
				$(".banner_video").each(function(){
					$(this).bind("ended", function() {
						if($(this).closest(".videoslide").index() == 3){
							var v_next = 1; // 다음 슬라이드의 index
						}else{
							var v_next = $(this).closest(".videoslide").index() + 2; // 다음 슬라이드의 index
						}
						var v_next_video = $(".videoslide:nth-of-type(" + v_next + ")").find(".banner_video")[0];
						v_next_video.play();
						//초기화
						$(".slide-ani").removeClass("animate");
						$('.main_pagination_bullet').removeClass('active')
						$('.videoslide').removeClass('on');
						$(".videoslide:nth-of-type(" + v_next + ")").siblings().fadeOut(1000);
						//next slide show , play

						$(".videoslide:nth-of-type(" + v_next + ")").addClass('on');
						$(".videoslide:nth-of-type(" + v_next + ")").fadeIn(500);
						$(".main_pagination_bullet:nth-of-type(" + v_next + ")").addClass('active');
						$(".videoslide:nth-of-type(" + v_next + ") .slide-ani").addClass("animate");
					})
				})


				// pagination 컨트롤
				$(".main_pagination_bullet").each(function(){
					$(this).click(function(){
						var this_index = $(this).index()+1;
						var this_video = $(".videoslide:nth-of-type(" + this_index + ")").find(".banner_video")[0];
						//초기화
						$('.videoslide').removeClass("on");
						$(".slide-ani").removeClass("animate");
						$('.videoslide').fadeOut("500");
						$(".main_pagination_bullet").removeClass("active")
						setTimeout(function(){
							$(".banner_video").each(function() {
								if (this !== this_video) {
									this.pause();
									this.currentTime = 0;
								}
							});
						},500)
						//play
						this_video.play();
						$(".videoslide:nth-of-type(" + this_index + ")").addClass('on');
						$(".videoslide:nth-of-type(" + this_index + ")").fadeIn(500);
						$(this).addClass('active');
						$(".videoslide:nth-of-type(" + this_index + ") .slide-ani").addClass("animate");
					})
				})
		  });

			  //btn-pause, play
			  $('.btn-pause').click(function() {
				$('.btn-pause').css('display', 'none');
				$('.btn-play').css('display', 'block');
				$('.videoslide.on').find('video')[0].pause();
				$('.main_pagination_bullet').addClass('stop');

			  })
			  $('.btn-play').click(function() {
				$('.btn-play').css('display', 'none');
				$('.btn-pause').css('display', 'block');
				$('.videoslide.on').find('video')[0].play();
				$('.main_pagination_bullet').removeClass('stop');
			  })
		});
	</script> -->


	<script type="text/javascript">
        var iDisplayStart = 0;
        var iTotalRecord = 0
        var iDisplayLength = 8;

        $(document).ready(function () {
            getBoardList();

            $(".js-tmenu li#tab1_02 a").click(function () {
                var photoSwiper = new Swiper(".people-photo .pps_swiper", {
                    slidesPerView: 3,
                    spaceBetween: 26,
                    speed: 1000,
                    loop: true,
                    autoplay: {
                        delay: 2000,
                        disableOnInteraction: false
                    },
                    navigation: {
                        nextEl: ".ppsNext",
                        prevEl: ".ppsPrev",
                    },
                    breakpoints: {
                        1024: {
                            slidesPerView: 'auto',
                            loop: false,
                            autoplay: false
                        },
                        1280: {
                            slidesPerView: 3
                        },
                    },
                });
            })
        })

        function getBoardList() {

            if (iDisplayStart <= iTotalRecord) {

                var form = {
                    board_type: "2",
                    iDisplayStart: iDisplayStart,
                    iDisplayLength: "3"
                };

                $
                    .ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        type: "POST",
                        url: "/get/board/cardlist/2",
                        dataType: "json",
                        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                        data: JSON.stringify(form),
                        success: function (data) {

                            if (parseInt(data.result)) {
                                iDisplayStart = iDisplayStart
                                    + data.data.length;

                                var li_html = "";

                                for (i = 0; i < 3; i++) {
                                    var ul_list = $("#ul_list"); //ul_list선언

                                    li_html = li_html
                                        + "<div class='notice-li-wrap'>";
                                    li_html = li_html
                                        + "<div class='notice-li'>";
                                    li_html = li_html
                                        + "<div class='notice-photo' style='background:url(/api/file/fileDown?file_name="
                                        + encodeURI(data.data[i].detail_img_file_name)
                                        + ") no-repeat center center;background-size:cover'></div>";
                                    li_html = li_html
                                        + "<div class='notice-desc'>";
                                    li_html = li_html
                                        + "<a href='/customer/press-view?board_type=2&board_no="
                                        + data.data[i].board_no + "'>";
                                    li_html = li_html
                                        + "<p class='more'><span>.</span></p></a>";
                                    li_html = li_html
                                        + "<p class='desc_04'>NEWS</p>";
                                    li_html = li_html
                                        + "<a href='/customer/press-view?board_type=2&board_no="
                                        + data.data[i].board_no + "'>";
                                    li_html = li_html + "<p class='desc_05'>"
                                        + data.data[i].board_title + "</p>";
                                    li_html = li_html + "<p class='date'>"
                                        + data.data[i].insert_dt + "</p>";
                                    li_html = li_html
                                        + "</a></div></div></div>";

                                    $("#news_list_all").append(
                                        "<li>" + li_html + "</li>"); //ul_list안쪽에 li추가

                                    li_html = "";

                                }

                                /* if(iTotalRecord == iDisplayStart){
								$("#btn_more").hide();
								} */

                            } else {
                                // 						alert("관리자에게 문의바랍니다.");

                            }
                        },
                        error: function (e) {
                            // 		         	alert("관리자에게 문의바랍니다.");
                            console.log(e);
                        }
                    });

            }

        }

        function getBrowserInfo() {
            var rvalue = {
                "width": $(window).innerWidth(),
                "height": $(window).innerHeight()
            }
            return rvalue;
        }

        function popClose(id, callback) {
            $('#' + id).css({
                "display": "none"
            });
            //$('#tbhouse_pop_box').removeClass("popupBGcolor");
            console.log("TEST");
            if (callback) {
                if (typeof callback === "function") {

                    callback(id);
                }
            } else {
                console.log("noCallback")
            }
        }

        function popAllClose() {
            $("div[id^=bannerContent3]").each(function () {
                popClose($(this).attr("id"), bannerContent3Callback);
            })
        }

        function bannerContent3Callback(id) {
            //alert($('#bannerContent3').attr("board_no"))

            if ($("#" + id + ' .etc_msg_box').css('display') != "none") {
                //	    		if($('#etc_msg_box').css('display') != "none")
                //alert("chk"+id+"  checked"+$("#"+id+' .etc_msg_agree').prop('checked'));
                if ($("#" + id + ' .etc_msg_agree').prop('checked')) {
                    bannerContent3Agree(id);
                    wbCookieSave("bannerContent3" + $("#" + id).attr("board_no"),
                        $("#" + id).attr("board_no"), 1)
                }
            }
        }

        function bannerContent3Agree(id) {
            var param = {
                mode: "setPopupAgree",
                board_no: $("#" + id).attr("board_no")
            }

            var form = document.createElement("form");
            var input = new Array();
            form.acceptCharset = "utf-8"

            for (var key in param) {
                console.log(key, param[key]);
                if (param[key] != null) {
                    input = document.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.setAttribute('name', key);
                    input.setAttribute("value", param[key]);

                    form.appendChild(input);
                }
            }
            $.ajax({
                cache: false,
                url: "sunting_popup_ajax.jsp", // 요기에
                type: 'POST',
                data: $(form).serialize(),
                success: function (data) {
                    var jsonObj = JSON.parse(data);
                    console.log(jsonObj)
                }, // success
                error: function (xhr, status) {
                    alert(xhr + " : " + status);
                }
            }); // $.ajax */
        }

        function bannerContent3Callback2() {
            //window.location.href = "notice.jsp?num="+$('#bannerContent3').attr("board_no")+"&id=gongi1"
        }

        function wbCookieSave(name, value, expiredays) {
            var today = new Date();
            today.setDate(today.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + ";path=/;expires="
                + today.toGMTString() + ";";
        }

        function wbCookieCheck(name) {
            var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
            if (value) {
                return true;
            } else {
                return false;
            }

        }
	</script>
	<style>
        .bannerContent {
            position: absolute;
            box-shadow: 0px 0px 3px 0px #7e7e7e;
            border: 1px solid #686868;
            z-index: 99;
            display: none;
        }

        #thbannerimg {

        }

        .bannerHeader {

        }

        .wonderContent1 {
            font-size: 14px;
            text-align: left;
            line-height: 24px;
        }
	</style>
</head>
<body id="mcsMain">
<div id="header"></div>
<!--  새로운 팝업존 -->
<%--<div id="main_popup">--%>
<%--	<div class="content">--%>
<%--		<strong class="title">주요알림</strong>--%>
<%--		<div class="sliderwrap">--%>
<%--			<div class="popupslider">--%>
<%--				<div class="swiper-wrapper" id="mainPopupSwiper"></div>--%>
<%--				<div class="popup-button-next">다음</div>--%>
<%--				<div class="popup-button-prev">이전</div>--%>
<%--				<div class="popup-pagination"></div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="bottom">--%>
<%--				<span class="info">팝업건수 : 총 <b id="popupCnt">0</b>건--%>
<%--				</span>--%>
<%--			<button class="btn_pop_close">닫기</button>--%>
<%--			<button class="btn_pop_allday">오늘 하루 열지 않기</button>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>
<%--<div class="main_popup_bg"></div>--%>
<script>
    function mainPopupOpen() {
        var form = {
            board_type: "17",
            iDisplayStart: "",
            iDisplayLength: "",
            sSearch: ""
        };

        var popupSwiperHtml = '';

        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            type: "POST",
            url: "/get/board/cardlist/17",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: JSON.stringify(form),
            async: false,
            success: function (data) {
                if (parseInt(data.result) == "1") {
                    for (i = 0; i < data.data.length; i++) {
                        var item = data.data[i];
                        console.log(item.detail_img_file_name);
                        popupSwiperHtml += '<div class="swiper-slide">';

                        if (item.link_url != null && item.link_url != '') {
                            popupSwiperHtml += '<a href="' + item.link_url + '" target="_blank"><img src="/api/file/fileDown?file_name=' + encodeURI(item.detail_img_file_name) + '"'
                                + ' alt = "' + item.board_title + '" '
                                + '></a></div>';
                        } else {
                            popupSwiperHtml += '<img src="/api/file/fileDown?file_name=' + encodeURI(item.detail_img_file_name) + '"'
                                + ' alt = "' + item.board_title + '" '
                                + '></div>';
                        }
                    }
                    $("#mainPopupSwiper").html(popupSwiperHtml)
                    $("#popupCnt").text(data.data.length);
                }
            },
            error: function () {
                console.log("메인팝업 에러");
            }
        })
    }

    function getCookie(name) {
        var nameOfCookie = name + "=";
        var x = 0;
        while (x <= document.cookie.length) {
            var y = (x + nameOfCookie.length);

            if (document.cookie.substring(x, y) == nameOfCookie) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                    endOfCookie = document.cookie.length;
                return unescape(document.cookie.substring(y, endOfCookie));
            }

            x = document.cookie.indexOf(" ", x) + 1;

            if (x == 0)
                break;
        }

        return "";
    }

    function setCookie00(name, value, expiredays) {
        var todayDate = new Date();
        todayDate = new Date(
            parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);

        if (todayDate > new Date()) {
            expiredays = expiredays - 1;
        }

        todayDate.setDate(todayDate.getDate() + expiredays);

        document.cookie = name + "=" + escape(value) + "; path=/; expires="
            + todayDate.toGMTString() + ";";
    }

    $(function () {
        // var kepcomcs_main_popup = getCookie('kepcomcs_main_popup');
        //
        // if (kepcomcs_main_popup !== 'done') {
        mainPopupOpen();
        // $("#main_popup").addClass("on");
        // } else {
        //     $("#main_popup, .main_popup_bg").remove();
        // }

        var popSwiper = new Swiper(".popupslider", {
            slidesPerView: 'auto',
            loop: true,
            autoplay: {
                delay: 2000, // 슬라이드 지연 속도 (기본 3000(ms))
                disableOnInteraction: false
                // 직접 스와이프 후 자동재생 비활성화 여부 (기본 true)
            },
            navigation: {
                nextEl: ".popup-button-next",
                prevEl: ".popup-button-prev",
            },
            pagination: {
                el: ".popup-pagination",
                clickable: true,
            },
            breakpoints: {
                1024: {
                    autoplay: false,
                    loop: false,
                }
            },
            observer: true,
            observeParents: true
        });

        // $(".btn_pop_close").click(function () {
        //     $("#main_popup").hide();
        //     $(".main_popup_bg").hide();
        // })
        //
        // $(".btn_pop_allday").click(function () {
        //     $("#main_popup").hide();
        //     $(".main_popup_bg").hide();
        //     setCookie00('kepcomcs_main_popup', "done", 1);
        // })

        var vw = $(window).width();
        if (vw > 1024) {
            $('.popupslider').on('mouseenter', function (e) {
                popSwiper.autoplay.stop();
            })
            $('.popupslider').on('mouseleave', function (e) {
                popSwiper.autoplay.start();
            })
        } else {
        }
    })
</script>
<!--  //새로운 팝업존 -->
<!-- main -->
<div id="fullpage">
	<!-- section1 -->
	<div class="section" id="section1">
		<div class="main_slider_wrap">
			<div class="swiper_control">
				<button class="btn_main_prev">이전</button>
				<button class="btn_main_next">다음</button>
			</div>

			<div class="swiper-container main_slider">
				<div class="swiper-wrapper">
					<div class="swiper-slide slide1">
						<div>
							<b>Total Energy Solution <br class="br-pc">Provider</b>
							<p>전력서비스로 실현할 수 있는 풍요로운 삶의 약속을 지키기 위해 <br class="br-pc">한전MCS는 오늘도 국민 여러분을 향해 나아갑니다.</p>
							<p>한전 및 전력그룹사 핵심 역량이 더욱 발휘될 수 있도록 협력 동반자 역할과
								<br class="br-pc">에너지 사업계와 국민을 위한 에너지 전문 Multi-Service를 펼쳐나갑니다.</p>
						</div>
					</div>
					<div class="swiper-slide slide2">
						<div>
							<b>Connect Energy to People</b>
							<p>남해의 끝 외딴 섬 마을에서 DMZ평화 마을까지 <br class="br-pc">대한민국 국민의 에너지 행복을 위해 누비는 사람들</p>
							<p>전국 196개 지점 3,898명의 직원이 늘 국민 곁에서 <br class="br-pc">최강의 인프라로 현장형 서비스를 펼치고 있습니다.</p>
						</div>
					</div>
					<div class="swiper-slide slide4">
						<div>
							<div class="slide_head">
								<div class="img_area">
									<img src="/resources/landing/images/main/img_main_ppas_pc.png" class="pc_img" alt="PPAS(People Platform as a Service) 전국 네트워크 다기능 에너지 전문인력 서비스">
									<img src="/resources/landing/images/main/img_main_ppas_mo.png" class="mo_img" alt="PPAS(People Platform as a Service) 전국 네트워크 다기능 에너지 전문인력 서비스">
								</div>
								<!-- <h3>ENERGY <br class="br-mob"> <span style="color: #16BECF">P</span>PaaS*</h3>
								<p>한전MCS의 에너지 전문 인력 플랫폼 비즈니스 <br> * <span style="color: #16BECF">P</span>PaaS : <span style="color: #16BECF">People</span> Platform as a Service</p> -->
								<div>
									<span style="border: 3px solid #1e1e1e; width:10px; height:10px; border-radius:13px; display:inline-block;"></span> : 현재 진행 사업<br>
									<span style="border: 3px solid #56e1f0; width:10px; height:10px; border-radius:13px; display:inline-block;"></span> : 진행 완료 사업
								</div>
							</div>
							<div class="slide_cont">
								<ul class="energy">
									<li>
										<div class="icon-wrap">
											<div>
												<div class="energy-circle"></div>
											</div>
											<div class="energy-icon">
												<object type="image/svg+xml" data="/resources/landing/images/main/icon_ani4.svg" class="object_svg"></object>
											</div>
											<div class="energy-desc">
												<span>저압계기 오차시험</span>
											</div>
										</div>
									</li>
									<li>
										<div class="icon-wrap">
											<div>
												<div class="energy-circle"></div>
											</div>
											<div class="energy-icon">
												<object type="image/svg+xml" data="/resources/landing/images/main/icon_ani3.svg" class="object_svg"></object>
											</div>
											<div class="energy-desc">
													<span> 태양광 인버터 <br> 주파수 설정
													</span>
											</div>
										</div>
									</li>
									<li>
										<div class="icon-wrap">
											<div>
												<div class="energy-circle"></div>
											</div>
											<div class="energy-icon">
												<object type="image/svg+xml" data="/resources/landing/images/main/icon_ani5.svg" class="object_svg"></object>
											</div>
											<div class="energy-desc">
												<span>AMI모뎀 부설</span>
											</div>
										</div>
									</li>
									<li>
										<div class="icon-wrap">
											<div>
												<div class="energy-circle"></div>
											</div>
											<div class="energy-icon">
												<object type="image/svg+xml" data="/resources/landing/images/main/icon_ani1.svg" class="object_svg"></object>
											</div>
											<div class="energy-desc">
													<span> 소규모 전력 <br> 중개사업
													</span>
											</div>
										</div>
									</li>
									<li>
										<div class="icon-wrap">
											<div>
												<div class="energy-circle"></div>
											</div>
											<div class="energy-icon">
												<object type="image/svg+xml" data="/resources/landing/images/main/icon_ani2.svg" class="object_svg"></object>
											</div>
											<div class="energy-desc">
													<span> EV충전기 유지보수 <br> 및 고객유치
													</span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="btn-row_04">
								<a href="/mber/business/PPaaS">
									<button class="btn-black">
										ENERGY PPaaS <span>더보기</span>
									</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="main_pagination"></div>
		</div>
	</div>
	<div class="section" id="section2">
		<div class="content-wrap tab">
			<div class="section-head">
				<ul class="tab_menu js-tmenu">
					<li id="tab1_01" class="on"><a href="">KEPCOMCS NEWS</a></li>
					<li id="tab1_02"><a href="">WITH PEOPLE</a></li>
				</ul>
			</div>
			<div class="tab_cont js-tcont on" data-tab="tab1_01">
				<p class="desc_01">한전MCS의 주목할 만한 소식을 전합니다.</p>
				<div class="notice-wrap">
					<ul class="notice" id="news_list_all">
					</ul>
				</div>
				<div class="btn-row_01 visible">
					<a href="/mber/customer/press-list">
						<button class="btn-black">
							한전MCS소식 <span>더보기</span>
						</button>
					</a>
				</div>
			</div>
			<div class="tab_cont js-tcont people" data-tab="tab1_02">
				<p class="desc_01">
					국민과 소통하는 서비스 기업으로서, 복지사각 지대와 저소득층의 사회 안전망 역할로
					<b style="font-weight: var(- -font-bold);">회사의 사회적 책임을 다하겠습니다.</b>
				</p>
				<div class="people-photo">
					<div class="pps_swiper">
						<ul class="swiper-wrapper">
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleL_1.jpg" alt="이천지점 나눔 봉사단">
									</figure>
									<p class="photo-desc">이천지점 나눔 봉사단</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleL_2.jpg" alt="안양지점 사랑나눔 봉사단">
									</figure>
									<p class="photo-desc">안양지점 사랑나눔 봉사단</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleL_3.jpg" alt="남인천지점 반딧불 봉사단">
									</figure>
									<p class="photo-desc">남인천지점 반딧불 봉사단</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleL_4.jpg" alt="한전MCS 보성역 환경미화">
									</figure>
									<p class="photo-desc">한전MCS 보성역 환경미화</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleR_1.jpg" alt="남인천지점 반딧불 봉사단">
									</figure>
									<p class="photo-desc">남인천지점 반딧불 봉사단</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleR_2.png" alt="한전MCS">
									</figure>
									<p class="photo-desc">한전 MCS</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleR_3.jpg" alt="남인천지점 반딧불 봉사단">
									</figure>
									<p class="photo-desc">남인천지점 반딧불 봉사단</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleR_4.jpg" alt="안양지점 사랑나눔 봉사단">
									</figure>
									<p class="photo-desc">안양지점 사랑나눔 봉사단</p>
								</div>
							</li>
							<li class="swiper-slide">
								<div class="photo-box">
									<figure class="photo-img">
										<img src="/resources/landing/images/main/peopleR_5.jpg" alt="한전MCS 보성역 환경미화">
									</figure>
									<p class="photo-desc">한전MCS 보성역 환경미화</p>
								</div>
							</li>
						</ul>
					</div>
					<button class="ppsPrev"></button>
					<button class="ppsNext"></button>
				</div>
				<div class="btn-row_01">
					<a href="javascript:openAlertMsg()">
						<button class="btn-black">
							사회공헌활동 <span>더보기</span>
						</button>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //section2 -->
	<!-- section4 -->
	<div class="section" id="section5">
		<div class="content-wrap animate">
			<div class="section-head">
				<h3>주요알림</h3>
			</div>
			<div class="service_area">
				<div class="sliderwrap">
					<div class="popupslider">
						<div class="swiper-wrapper" id="mainPopupSwiper"></div>
						<div class="popup-button-next">다음</div>
						<div class="popup-button-prev">이전</div>
						<div class="popup-pagination"></div>
					</div>
				</div>

				<div class="popup-pagination"></div>
			</div>
		</div>
	</div>
	<!-- section3 -->
	<div class="section" id="section3">
		<div class="content-wrap">
			<div class="section-head">
				<h3>KEPCOMCS SERVICE</h3>
				<p class="desc_01">한전MCS의 고객소통 및 주요 서비스안내 입니다.</p>
			</div>
			<div class="service_area">
				<div class="svc_box">
					<p class="tit">고객소통</p>
					<ul>
						<li><a href="/mber/customer/opinion-agree">고객의 소리</a></li>
						<li><a href="/mber/customer/cooperation-list">신사업 및 협력사업 문의·제안</a></li>
						<li><a href="/mber/customer/integrity-agree">청렴·부패 신고</a></li>
						<li><a href="/mber/customer/news-list">전력에너지 뉴스</a></li>
					</ul>
				</div>
				<div class="svc_box">
					<p class="tit">ESG 경영</p>
					<ul>
						<li><a href="/mber/esg/safety/safety-introduction">안전경영</a></li>
						<li><a href="/mber/esg/ethic/ethic-introduction">윤리경영</a></li>
						<li><a href="/mber/esg/hmr/hm-introduction">인권경영</a></li>
						<li><a href="/mber/esg/carbon-neutral/neutral-introduction">탄소중립</a></li>
						<li><a href="/mber/esg/social/social-activity">사회적가치</a></li>
					</ul>
				</div>
				<div class="svc_boxs">
					<div class="svc_box">
						<p class="tit">열린경영</p>
						<ul>
							<li><a href="/mber/open-manage/bid-info">입찰정보</a></li>
							<li><a href="/mber/open-manage/talented-person">채용정보</a></li>
						</ul>
					</div>
					<div class="svc_box tel">
						<span>대표전화</span> <strong><a href="tel:0613459991">061·345·9991</a></strong>
					</div>
				</div>
			</div>
		</div>

		<div class="video-wide-wrap">
			<div class="video-wide">
				<p class="btn-close"></p>
				<div class="video-info2">
					<iframe class="youtube-video" src="https://www.youtube.com/embed/mVdtZVh_Er8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- //section3 -->

	<%--		<div class="main_slider_wrap">--%>
	<%--		<div id="main_popup">--%>
	<%--			<div class="content">--%>
	<%--				<strong class="title">주요알림</strong>--%>
	<%--				<div class="sliderwrap">--%>
	<%--					<div class="popupslider">--%>
	<%--						<div class="swiper-wrapper" id="mainPopupSwiper"></div>--%>


	<%--					</div>--%>
	<%--				</div>--%>
	<%--			</div>--%>
	<%--		</div>--%>
	<%--		</div>--%>
	<%--	</div>--%>
	<!-- //section4 -->
	<!-- footer -->
	<div class="section fp-auto-height" id="section7">
		<div class="svc_link">
			<div class="wrap">
				<a href="https://ncp.clean.go.kr/cmn/secCtfcKMC.do?menuCode=acs&mapAcs=Y&insttCd=B554543" target="_blank">
					<img src="/resources/landing/images/main/banner01.png" alt="한전MCS 청렴포털_부패공익신고">
				</a> <a href="conscience/report" target="_blank">
				<img src="/resources/landing/images/main/banner05.png" alt=“비위양심신고센터.">
			</a> <a href="https://www.clean.go.kr/index.es?sid=a1" target="_blank">
				<img src="/resources/landing/images/main/banner02.png" alt="국민권익위원회_부패공익신고">
			</a> <a href="https://www.open.go.kr" target="_blank">
				<img src="/resources/landing/images/main/banner03.png" alt=“정보공개포탈로이동합니다.">
			</a> <a href="https://www.safetyreport.go.kr/" target="_blank">
				<img src="/resources/landing/images/main/banner04.png" alt=“안전신문고">
			</a>
			</div>
		</div>
		<div class="content-wrap" style="border-top: 1px solid var(--color-light-grey); max-width: 100%;">
			<div id="footer" style="width: 100%; max-width: 1320px; margin: 0 auto;"></div>
		</div>
	</div>
	<!-- //footer -->
</div>
<div id="moveSection">
	<span class="up"></span> <span class="down"></span>
</div>
<div class="btn-top">
	TOP
	<p class="top-line"></p>
</div>
<!-- //main -->

<script>
    $("#header").load("/resources/landing/include/header.html");
    $("#footer").load("/resources/landing/include/footer.html");
</script>

</body>
</html>