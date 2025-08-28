<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/js/sh-common.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-D8LW20DGXL"></script>
<script>
	/* 운영 */
	/* if (document.location.protocol == 'http:') {
	    document.location.href = document.location.href.replace('http:', 'https:');
	} */
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-D8LW20DGXL');
</script>
<!-- header -->
<header class="header">
    <div class="gnb_bg"></div>
    <div class="hd-inner">
        <div class="logo"><a href="/"><img src="/resources/landing/images/main/mcs_new_logo_230706.png" alt="한전MCS(주)"></a></div>
        <nav id="gnb">
            <ul class="nav-depth_01">
			    <c:forEach var="depth1" items="${menuList}">
			        <c:if test="${depth1.gnbAt eq 'Y'}">
			            <li>
			                <a href="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}">
							    <c:out value="${depth1.menuNm}"/>
							</a>
			                <div class="depth-wrap">
			                    <c:forEach var="depth2" items="${depth1.childList}">
			                        <c:choose>
			                            <c:when test="${not empty depth2.childList}">
			                                <ul class="menu-depth_02">
			                                    <li>
			                                        <span class="menu-d3-head">${depth2.menuNm}</span>
			                                        <ul class="menu-depth_03">
			                                            <c:forEach var="depth3" items="${depth2.childList}">
			                                                <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? (not empty depth3.childList ? depth3.childList[0].url : '#') : depth3.url}" />
			                                                <li>
			                                                    <a href="${depth3Url}"
			                                                       <c:if test="${depth3.menuTy eq 'LINK'}">target="_blank"</c:if>>
			                                                        <span><c:out value="${depth3.menuNm}"/></span>
			                                                    </a>
			                                                </li>
			                                            </c:forEach>
			                                        </ul>
			                                    </li>
			                                </ul>
			                            </c:when>
			                            <c:otherwise>
			                                <c:set var="depth2Url"
			                                       value="${depth2.menuTy eq 'DIR' ? (not empty depth2.childList ? depth2.childList[0].url : '#') : depth2.url}" />
			                                <ul class="nav-depth_02">
			                                    <li>
			                                        <a href="${depth2Url}"
			                                           <c:if test="${depth2.menuTy eq 'LINK'}">target="_blank"</c:if>>
			                                            <span><c:out value="${depth2.menuNm}"/></span>
			                                        </a>
			                                    </li>
			                                </ul>
			                            </c:otherwise>
			                        </c:choose>
			                    </c:forEach>
			                </div>
			            </li>
			        </c:if>
			    </c:forEach>
			</ul>
            <div class="indicator"></div>
        </nav>
        <div class="combine_search_box">
            <label for="combine_search" style="display:none;">사이트 전체 검색</label>
            <input id="combine_search" type="text" class="combine_search" name="combine_search" />
            <button id="combine_search_btn" class="combine_search_btn" type="button">
                <img class="combine_search_img" src="/resources/landing/images/main/ico_search.png" alt="사업소 찾기" style="">
            </button>
        </div>
        <div class="btn-menu">
            <span></span>
            <span></span>
        </div>
    </div>
    <div class="overlay-menu-wrap">
        <div class="overlay-menu" id="overlay-menu_id">
		    <ul class="menu-depth_01" id="menu-depth_01_id"> 
			    <c:forEach var="depth1" items="${menuList}" varStatus="st1">
			        <li <c:if test="${st1.index == 0}">class="visible"</c:if>>
			            <span data-menu="${st1.index + 1}">${depth1.menuNm}</span>
			            <c:choose>
			                <c:when test="${not empty depth1.childList and fn:length(depth1.childList[0].childList) > 0}">
			                    <div class="menu-fixed has-depth03">
			                        <c:forEach var="depth2" items="${depth1.childList}">
			                            <ul class="menu-depth_02">
			                                <li>
			                                    <span class="menu-d3-head"><c:out value="${depth2.menuNm}"/></span>
			                                    <ul class="menu-depth_03">
			                                        <c:forEach var="depth3" items="${depth2.childList}">
			                                            <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? (not empty depth3.childList ? depth3.childList[0].url : '#') : depth3.url}" />
			                                            <li>
			                                                <a href="${depth3Url}"
			                                                   <c:if test="${depth3.menuTy eq 'LINK'}">target="_blank"</c:if>>
			                                                    <span><c:out value="${depth3.menuNm}"/></span>
			                                                </a>
			                                            </li>
			                                        </c:forEach>
			                                    </ul>
			                                </li>
			                            </ul>
			                        </c:forEach>
			                    </div>
			                </c:when>
			                <c:otherwise>
			                    <ul class="menu-depth_02 menu-fixed">
			                        <c:forEach var="depth2" items="${depth1.childList}">
			                            <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? (not empty depth2.childList ? depth2.childList[0].url : '#') : depth2.url}" />
			                            <li>
			                                <a href="${depth2Url}"
			                                   <c:if test="${depth2.menuTy eq 'LINK'}">target="_blank"</c:if>>
			                                    <span><c:out value="${depth2.menuNm}"/></span>
			                                </a>
			                            </li>
			                        </c:forEach>
			                    </ul>
			                </c:otherwise>
			            </c:choose>
			        </li>
			    </c:forEach>
			</ul>
		</div>
        <div class="overlay-menu-ft">
            <div class="phone-info">
                <p>대표전화</p>
                <p>061·345·9991</p>
            </div>
            <p class="menu-copy">Copyright © 한전MCS. All Rights Reserved.</p>
        </div>
    </div>
</header>
<!-- //header -->
<script>

    // header
    $(document).ready(function () {

    	var wintop = $(window).scrollTop();
		if(wintop > 30){
			$(".header").addClass("scroll")
		}else{
			$(".header").removeClass("scroll")
		}
    	$(window).scroll(function(){
    		var wintop = $(window).scrollTop();
    		if(wintop > 30){
    			$(".header").addClass("scroll")
    		}else{
    			$(".header").removeClass("scroll")
    		}
    	})

    	// header에 addClass white 소스는 pages.js로 옮겨감 
    	
        var hGnb = [];
        var hHeader = $('.header').innerHeight();
        /* $('.depth-wrap').each(function () {
            hGnb.push($(this).innerHeight());
        });
        hGnb = Math.max.apply(null, hGnb); */
        
        hGnb = 600;
        $('.gnb_bg').css({'top': $('.header').innerHeight(), 'height': hGnb});
        $('.depth-wrap').css('height', hGnb);
        
        $('.nav-depth_01 > li, .gnb_bg').on({
            'mouseenter focusin': function () {
            	if($("header").hasClass("overlay")){
            	}else{
            		$(this).addClass('on');
                    $('.header').addClass('open');
                    $("header").addClass("on");
                    $('.gnb_bg').stop().slideDown(350);
                    $('#gnb').stop().animate({height: hHeader + hGnb}, 350);
            	}
            },
            'mouseleave focusout': function () {
            	if($("header").hasClass("overlay")){
            	}else{
            		$(this).removeClass('on');
                    $('.header').removeClass('open');
                    $("header").removeClass("on");
                    $('.gnb_bg').stop().slideUp(350);
                    $('#gnb').stop().animate({height: hHeader}, 350);
            	} 
            }
        });
        $('.nav-depth_01 > li').on({
            'mouseenter focusin': function () {
                $('.indicator').stop().animate({left: $(this).position().left + 'px'}, 10);
            }
        });
    });


    $(function () {
        // gnb
        $overlayFirstMenu = $('.menu-depth_01>li>span');

        $('.btn-menu').click(function () {
            $('header').toggleClass('overlay');
        })

        $overlayFirstMenu.click(function () {
            let menuNumber = $(this).attr('data-menu');

            if ($(window).width() <= 960) {
                $('.menu-depth_01 li').removeClass('visible');
                $('.menu-depth_01 li:nth-child(' + menuNumber + ')').addClass('visible')
            } else {
                return;
            }
        })

        // search
        $('.btn-search').click(function () {
            $('.search').toggleClass('visible');
        })

        // menu
        $('.menu-d3-head').click(function () {
            if ($(window).width() > 960) {
                if (!$(this).hasClass('open')) {
                    $('.menu-d3-head').removeClass('open');
                    $(this).addClass('open');
                } else {
                    $(this).removeClass('open');
                }
                $('.menu-depth_03').slideUp(250);
                if (!$(this).next().is(':visible')) {
                    $(this).next().slideDown(250);
                }
            } else {
                return;
            }
        })
        $('#combine_search_btn').click(function () {
            combind_search();
        })
        $('#combine_search').on("keyup", function (e) {
            if (e.keyCode == 13) {
                combind_search()
            }
        })
        
        
    })

    function combind_search() {
        var text = $('#combine_search').val().trim().replace(/#/gi, "");

        if (text == "") {
            alert("검색어를 입력해주세요.");
            return false;
        }
        if (text.length < 2) {
            alert("두글자이상 입력해주세요.");
            return false;
        }
        window.open("/pop/search/all/list/" + text, "_blank")
    }
    function openAlertMsg() {
        var msg = "";
        msg += "현재 홈페이지 개편 작업이 진행 중입니다.\n\n"
        msg += "디자인 및 기능 개선으로 편의성 향상과 보안 등 기능성을 강화하고\n"
        msg += "최적화된 모바일 버전으로도 이용 가능하도록 홈페이지 리뉴얼 중입니다.\n\n"

        msg += "새롭게 단장한 모습으로 찾아 뵙겠습니다.\n"
        msg += "감사합니다.\n\n"
        msg += "문의전화 : 061-345-9991"
        alert(msg)
    }
</script>
