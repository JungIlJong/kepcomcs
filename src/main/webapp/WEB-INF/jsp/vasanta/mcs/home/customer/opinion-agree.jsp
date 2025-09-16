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
  <link rel="stylesheet" href="/resources/landing/css/manage.css">
  <link rel="stylesheet" href="/resources/landing/css/sub.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/gsap.min.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
  <script src="https://www.google.com/recaptcha/api.js?render=6Le8_iQcAAAAACCuc_W--e48akBOB61Uzu839PkO"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  

  <script type="text/javascript">
  $(function() {
		$.removeCookie('kepcomcsagreement');
	});
	
  function submit()
	{
		if (!$('input:checkbox[id="checkAgree"]').is(":checked")){
			alert("동의를 하지 않으시는 경우, 다음 페이지로 이동이 불가능합니다. ")
		}else{
			$.cookie('kepcomcsagreement', '<%=session.getId()%>');
			location.href = "./opinion-certification";
		}
	}
  </script>
</head>
<body id="mcsPage">
  <div class="cursor"></div>
  <div id="header"><jsp:include page="/WEB-INF/jsp/vasanta/mber/include/sneat-menu.jsp"/></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>고객의 소리</h1>
        <p>한전MCS는 고객님의 소리에 귀 기울입니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/mber/customer/opinion">고객소통</a>
        </li>
        <li>고객의 소리</li>
      </ul>
    </div>
    <div class="contents"> 
      <div class="conts-ani" data-trigger>
        <p class="conts-desc_01 txt-ac tdesc">고객님의 소중한 제안, 칭찬, 불만사항 등을 접수하는 고객의 소리 접수 창구입니다.</p>
            <div class="contents esg-conts report-conts">     
      <div class="esg-tit-wrap agree-tit-wrap">
        <ul class="report-step">
          <li>
            <p>개인정보 동의</p>
          </li>
          <li class="step-blur">
            <p>휴대폰 본인 인증</p>
          </li>
          <li class="step-blur">
            <p>글작성</p>
          </li>
        </ul>
      </div>
      <div class="report-agree-wrap mob-ani-none">
        <h3>개인정보 수집 이용에 관한 동의</h3>
        <div class="agree-box">
          <p>[수집·이용 항목]</p>
          <p>(필수항목) 성명, 휴대전화번호, 이메일</p>
          <p>[수집·이용 목적]</p>
          <p>문의사항 확인 및 회신 등 문의업무의 처리를 위한 원활한 의사소통 경로확보</p>
          <p>[이용·보유기간]</p>
          <p>동의를 받은 개인정보를 해당 문의사항에 대한 처리결과 회신일로부터 3년간 보유 및 이용하며, 동의를 철회하는 경우 개인정보는 지체 없이 파기됩니다.</p>
          <p>[동의·거부 권리 및 불이익]</p>
          <p>고객님께서는 상기 동의를 거부할 수 있습니다. 선택정보의 경우 입력하지 않아도 서비스 이용이 가능하나 필수항목 미동의시 문의사항 확인 및 회신 등 일부에 제한이 있습니다. 나이스평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.</p>                 
        </div>
        <div class="agree-desc">
          <p>고객님께서는 상기 동의를 거부할 수 있습니다. 다만 이에 동의하지 않을 경우에는 관련 서비스에 제한이 있을 수 있음을 알려드립니다. 위 내용에 동의하십니까?</p>
          <div class="check-row">
            <input type="checkbox" id="checkAgree" name="">
            <label for="checkAgree">동의합니다.</label>
          </div>
        </div>
        <div class="btn-row btn-row-agree">
          <a href="">
            <button class="btn-prev">이전</button>
          </a>
          <a href="javascript:submit();">
            <button class="btn-next">다음</button>
          </a>
        </div>
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
    //include
    
    $("#footer").load("/resources/landing/include/footer.html");
</script>

</body>
</html>
