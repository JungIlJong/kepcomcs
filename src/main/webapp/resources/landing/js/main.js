//javasctipt
$(function() {	
	// tab
	if ($('.js-tmenu').length || $('.js-tcont').length) {
		$('.js-tcont').hide();
		$('.js-tcont.on').show();
		$('.js-tmenu li a').click(function () {
			let tabId = $(this).parent().attr('id');
			let selTabId = $('.js-tmenu li[id="' + tabId + '"], .js-tcont[data-tab="' + tabId + '"]');
			$(this).closest('.tab').find('.js-tmenu li, .js-tcont').not('.js-tmenu li.on').removeClass('on');
			selTabId.addClass('on').fadeIn();
			selTabId.siblings('.js-tcont').hide();
			selTabId.siblings().removeClass('on');
			return false;
		});
	}
	
  //fullpage
  new fullpage('#fullpage', {
    css3: true,
    easingcss3: 'cubic-bezier(.68,.07,.47,.99)',
    navigation: true,
    normalScrollElements: '.overlay-menu-wrap',
    responsiveWidth: 960,
    licenseKey: '139D5562-F4174C63-BF795BC9-B61D1F39',

    onLeave: function(origin, destination, direction) {
      if (destination.index == 4) {
        $('#mcsMain #fp-nav').css('display', 'none');
        $('#moveSection').css('display', 'none');
        $("header").addClass("on").addClass("last");
      } else {
        $('#mcsMain #fp-nav').css('display', 'block');
        $('#moveSection').css('display', 'block');
        $("header").removeClass("on").removeClass("last");
      }
    },

    afterLoad: function(origin, destination, direction) {
      if (destination.index == 0) {
        $('.btn-top').removeClass('visible');
        $('#moveSection').addClass('first');
		if($(window).width()>960){
			/*$('.videoslide.on').find('video')[0].play()
			$('.main_pagination_bullet').removeClass('stop');*/
		}
      } else {
        $('.btn-top').addClass('visible');
        $('#moveSection').removeClass('first');
		if($(window).width()>960){
			/*$('.videoslide.on').find('video')[0].pause();
			$('.main_pagination_bullet').addClass('stop');*/
		}
      }

      if (destination.index == 0 || destination.index == 1) {
        $('#mcsMain #fp-nav').removeClass('black');
        $('#moveSection').removeClass('black');
        $('.btn-top').addClass('white');
      } else {
        //$('#mcsMain #fp-nav').addClass('black');
        //$('#moveSection').addClass('black');
        //$('.btn-top').removeClass('white');
      }

      if(origin.index == 0 && destination.index == 1) {
        
        $('#section2 .content-wrap').addClass('animate');
        $('.icon-wrap').addClass('visible');
        $('#section3 .btn-row_04').addClass('visible');
        
        $('#section2 .content-wrap').addClass('animate');
        $('.notice').addClass('visible');
        $('#section2 .btn-row_01').addClass('visible');
        
        
      } else if (origin.index == 1 && destination.index == 2) {
//        $('#section4 .content-wrap').addClass('animate');
        $('.people-photo').addClass('visible');
//        let sectionHeight = $('#section4').height();
//        let photoAreaHeight = $('.photo-right').height();
//        let moveUpHeight = photoAreaHeight - sectionHeight + 80;
//        $('.people-photo.visible').css('top', -(moveUpHeight));


        $('#section3 .content-wrap').addClass('animate');
        
      } else if (origin.index == 2 && destination.index == 3) {
        
        $('.customer').addClass('visible');
        $('.btn-top').removeClass('white');
      } else if (origin.index == 3 && destination.index == 2) {
		$('.btn-top').addClass('white');
      } else if (origin.index == 3 && destination.index == 4) {
      }
    }
  });

  $('.up').click(function() {
    fullpage_api.moveSectionUp();
  })
  $('.down').click(function() {
    fullpage_api.moveSectionDown();
  })

  $('.btn-top').click(function(){
    fullpage_api.moveTo(1);
  });

 /* main slider */
function shuffleElements(container) {
  var elements = Array.prototype.slice.call(container.children); // Array.prototype.slice.call() 사용
  var fragment = document.createDocumentFragment(); // fragment 생성

  while (container.firstChild) {
    fragment.appendChild(container.firstChild); // fragment에 요소 추가
  }

  elements.sort(function() { return 0.5 - Math.random(); }); // 요소 무작위로 정렬

  elements.forEach(function(element) {
    fragment.appendChild(element); // fragment에 섞인 요소 추가
  });

  container.appendChild(fragment); // fragment를 container에 추가
}

function mixslide(callback) {
  var mainSlideWrapper = document.querySelector(".main_slider .swiper-wrapper");

  shuffleElements(mainSlideWrapper);

  if (typeof callback === "function") {
    callback();
  }
}

mixslide(function() {
  var mainslider = new Swiper(
    ".main_slider",
    {
      effect : 'fade',
      slidesPerView : '1',
      loop : true,
      autoplay: {
        delay: 6000,
        disableOnInteraction: false
      },
      navigation : {
        nextEl : ".btn_main_next",
        prevEl : ".btn_main_prev",
      },
      pagination : {
        el : ".main_pagination",
        clickable : true,
      },
      speed : 500,
      on: {
        afterInit : function() {
          document.querySelector(".main_slider .swiper-slide-active").classList.add("bganimation");
        },
        activeIndexChange: function () {
          setTimeout(function(){
            document.querySelectorAll(".main_slider .swiper-slide:not(.swiper-slide-active)").forEach(function(slide){
              slide.classList.remove("bganimation");
            });
          },500);
          document.querySelectorAll(".main_slider .swiper-slide").forEach(function(slide){
            slide.classList.add("bganimation");
          });
        }
      },
    }
  );   
});


  //slide
  /*
  const swiper = new Swiper('.swiper-container', {
    loop: true,
    effect: "fade",
    autoplay: {
      delay: 7000,
      disableOnInteraction: false
    },
    pagination: {
      el: '.swiper-pagination',
      clickable : true,
      renderBullet: function (index, className) {
		console.log(className)
        return '<div class="' + className + '"><span></span></div>';
      }
    },
    on: {
      activeIndexChange: function () {
        if(this.realIndex == 1) {
          $('.slide_02 .slide-ani').addClass('animate');
        } else if (this.realIndex == 2) {
          $('.slide_03 .slide-ani').addClass('animate');
        }
      }
    }
  });
  */


  //youtube player
  $('.btn-video-play').click(function() {
    $('.video-wide-wrap').addClass('visible');
    	$('.youtube-video')[0].contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
  })
  $('.btn-close').click(function() {
    $('.video-wide-wrap').removeClass('visible');
    $('.youtube-video')[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
  })
  
  

	// a javascript:void(0);
	$('a').each(function () {
		if (!$(this).attr('href')) {
			$(this).attr('href', "javascript:void(0);");
		}
	});
	
	

})

