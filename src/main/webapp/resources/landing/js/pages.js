//javascript
$(function() {
	
$(window).on('load', function(){ // 페이지가 로드되었을 때 실행
    var pageUrl = window.location.href; // 현재 창의 URL을 가져옵니다.
    if (pageUrl.indexOf('esg') > -1 || pageUrl.indexOf('conscience') > -1 || pageUrl.indexOf('/open-manage/punish_list') > -1 || pageUrl.indexOf('/open-manage/punish_view') > -1) {
        // URL에 'esg' 또는 'conscience' 또는 '/open-manage/punish_list'가 포함되어 있으면 아래 코드 실행
        $("header").addClass("white");
    }
});

  //esg intro
  
  $(window).resize(function() {
    console.log('resize')
    setIntroHeight();
  })
  
  //esg fixed image
  $(window).scroll(function() {
    let pageScrollTop = $(this).scrollTop();
    let introFixedImg = $('.intro-tit-wrap');
    let introMainHeight = $('.esg-main').height();
    let viewportHeight = $( window ).height();
    let num = (introMainHeight - viewportHeight)
    if( $(window).width() > 960 ) {
      if (pageScrollTop >= 0) {
        introFixedImg.addClass('fixed')
      } 
      if (pageScrollTop > (num + 202)) {
        introFixedImg.removeClass('fixed')
        introFixedImg.addClass('bott')
      }
    }    
  })    
  
  if(window.location.hash != "")
  {
	if(window.location.hash.indexOf("#S") > -1 && window.location.hash.indexOf("E#") > -1 )
	{
		console.log("검색")
		var hashstr = decodeURIComponent(window.location.hash.substring(window.location.hash.indexOf("#S")+2,window.location.hash.indexOf("E#")))
		var regexAllCase = new RegExp(hashstr, "gi")
    	//$("body").html( $("body").html().replace(regexAllCase, "<span class='search-text'>"+hashstr+"</span>") );
    	//$(":contains('"+hashstr+"')").replace(regexAllCase, "<span class='search-text'>"+hashstr+"</span>");
    	var searchTag = $("main :contains('"+hashstr+"')");
    	var loopLength =searchTag.length;
    	for(var i = 0; i < loopLength; i++)
    	{
    		if($(searchTag[i]).text().indxeOf(hashstr) > 0)
    		{
				$(searchTag[i]).html($(searchTag[i]).html().replace(regexAllCase, "<span class='search-text'>"+hashstr+"</span>") )
			}
		}
        setTimeout(function(){
        	pageInit()
			search_text_scroll()
		},1500)
	}
  }
  pageInit()
})

function pageInit(){
	 //year tab
  let $tabMenu = $('.year-tab li');
  let $tabConts = $('.history-wrap .history-conts');
  $tabMenu.click(function() {
    let activeTab = $(this).index();
    $tabMenu.removeClass('selected');
    $(this).addClass('selected');  
    $tabConts.removeClass('visible');
    $($tabConts[activeTab]).addClass('visible');
    $($tabConts[activeTab]).find('.inner-box').addClass('visible');
    $('.tab-bg').css({
      left: (activeTab * 25) + '%'
    })
    $('.tab-line').css({
      top: (activeTab * 25) + '%'
    })
  });  

  //mobile image modal
  $('.organ-box img').click(function() {
    if( $(window).width() < 768 ) {
      $('.modal_wrap').css('display', 'block');
    } else {
      return;
    }
  })
  $('.btn-image-close').click(function() {
    $('.modal_wrap').css('display', 'none');
  })

  //top button
  $(window).scroll(function() {
    let pageScrollTop = $(this).scrollTop();
    if(pageScrollTop > 300) {
      $('.btn-top').addClass('visible');
    } else {
      $('.btn-top').removeClass('visible');
    }       
  })
  $('.btn-top').click(function() {
    $('html, body').animate({scrollTop : 0}, 700);
  })   

  //map
  let officeMapEl = $('.office-map>li');
  $('.area-list>li').click(function() {
    let activeArea = $(this).index();
    $('.area-list>li').removeClass('on');
    $(this).addClass('on');
    officeMapEl.removeClass('visible');
    $(officeMapEl[activeArea]).addClass('visible');
  }) 
  setIntroHeight();
}

function setIntroHeight() {
    if( $(window).width() > 960 ) {
      let viewportHeight = $( window ).height();
      $('.intro-tit-wrap').css({
        height: (viewportHeight - 80) + 'px'
      })
    }
  }

function search_text_scroll(){
	setTimeout(function(){
		if($($('.search-text')[0]).parents('.history-conts').length > 0)
		{
			if($('.year-tab').length > 0)
			{
				console.log("연혁")
				 $('.year-tab li').eq($($('.search-text')[0]).parents('.history-conts').index()-1).trigger('click')
			}
		}
		$('html').animate({scrollTop : $($('.search-text')[0]).offset().top-400}, 400);
		
	},1500)
}

function hashSearch(){
	var rtxt = "";
	if(window.location.hash != "")
 	{
		if(window.location.hash.indexOf("#S") > -1 && window.location.hash.indexOf("E#") > -1 )
		{
			console.log("검색")
			rtxt = decodeURIComponent(window.location.hash.substring(window.location.hash.indexOf("#S")+2,window.location.hash.indexOf("E#")))
		}
  	}
	//   form.sSearch = hashSearch();
	/*   
		var hashStr = hashSearch();
		if(hashStr != "")
		{
			mainTable.search(hashStr).draw(false)
		}
	*/
	return rtxt;
}