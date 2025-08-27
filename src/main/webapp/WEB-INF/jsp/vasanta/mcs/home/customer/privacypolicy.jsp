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
  <link rel="stylesheet" href="/resources/landing/css/sub.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
  <script>
    $(document).ready(function() {
    $('.cnt_list li a').on('click', function(e) {
        e.preventDefault(); // 기본 동작을 막음 (페이지 이동 방지)

        var targetId = $(this).attr('href'); // 클릭한 링크의 href 속성 값 가져오기
        var targetSection = $(targetId); // 해당 ID를 가진 섹션 찾기

        if (targetSection.length) {
            // 섹션이 존재하면 스크롤 애니메이션 수행
            $('html, body').animate({
                scrollTop: targetSection.offset().top - 150
            }, 800);
        }
    });
});

 </script>
</head>
<body id="mcsPage">
  <div class="cursor"></div>
  <div id="header"></div>
  <!-- main -->
  <main class="customer-main">
    <div class="page-tit">
      <div class="page-tit-wrap">
        <h1>개인정보 처리방침</h1>
        <p>한전MCS는 고객님 정보를 소중히 여깁니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">개인정보 처리방침</a>
        </li>
      </ul>
    </div>
   <div class="contents"> 
      <div class="conts-ani" data-trigger>
		  <div class="panel_box panel_white pds pv-box">
			  <h1>한전MCS 개인정보처리방침</h1>
			  <p>한전MCS는 정보주체의 자유와 권리 보호를 위해 ｢개인정보 보호법｣ 및 관계 법령이 정한 바를 준수하여, 적법하게 개인정보를 처리하고 안전하게 관리하고 있습니다.이에 ｢개인정보 보호법｣ 제30조에 따라 정보주체에게 개인정보 처리에 관한 절차 및 기준을 안내하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.</p>
		  </div>
      			<div class="panel_box panel_white pds">
					<h1 style="padding: 10px;text-align: center;font-size:1.6rem;">주요 개인정보 처리 표시(라벨링)</h1>
					<img src="/resources/landing/images/customer/privacy/privacy_icon_desc.png" style="width:100%;">
					<p class="mt20" style="text-align: center;line-height: 150%;">
						※ 자세한 내용은 아래의 개인정보처리방침을 확인하시기 바랍니다.
					</p>
				</div>
			<div class="panel_box panel_white pds">
						<h1 style="padding: 10px;text-align: center;font-size:1.6rem;">목차</h1>
						<p class="mt20">「개인정보 처리방침」 은 다음과 같은 내용으로 구성되어 있습니다.</p>
							<ul class="cnt_list">
								<li style="margin-left: -26px;">
									<a href="#list_num01" title="제1조(개인정보의 처리목적, 수집 항목, 보유기간 및 개인정보파일 등록현황)">
										제1조(개인정보의 처리목적, 수집 항목, 보유기간 및 개인정보파일 등록현황)
									</a>
								</li>
								<li>
									<a href="#list_num07" title="제7조(개인정보 자동 수집장치의 설치·운영 및 거부에 관한 사항)">	
										제7조(개인정보 자동 수집장치의 설치·운영 및 거부에 관한 사항)
									</a>
								</li>
								<li>
									<a href="#list_num02" title="제2조(개인정보의 제3자 제공)">
										제2조(개인정보의 제3자 제공)
									</a>								
								</li>
								<li>
									<a href="#list_num08" title="제8조(개인정보보호 책임자)">
										제8조(개인정보보호 책임자)
									</a>
								</li>
								<li>
									<a href="#list_num03" title="제3조(개인정보 처리업무의 위탁)">
										제3조(개인정보 처리업무의 위탁)
									</a>
								</li>
								<li>								
									<a href="#list_num09" title="제9조(개인정보 열람청구)">
										제9조(개인정보 열람청구)
									</a>
								</li>
								<li>
									<a href="#list_num04" title="제4조(정보주체와 법정대리인의 권리·의무 및 행사방법)">
										제4조(정보주체와 법정대리인의 권리·의무 및 행사방법)
									</a>
								</li>
								<li>								
									<a href="#list_num10" title="제10조(권익침해 구제방법)">
										제10조(권익침해 구제방법)
									</a>								
								</li>
								<li>
									<a href="#list_num05" title="제5조(개인정보의 파기)">
										제5조(개인정보의 파기)
									</a>
								</li>
								<li>
									<a href="#list_num11" title="제11조(개인정보의 추가적인 이용·제공의 기준)">
										제11조(개인정보의 추가적인 이용·제공의 기준)
									</a>
								</li>
								<li>
									<a href="#list_num06" title="제6조(개인정보의 안전성 확보조치)">
										제6조(개인정보의 안전성 확보조치)
									</a>
								</li>
								<li>
									<a href="#list_num12" title="제12조(개인정보 처리방침 변경)">
										제12조(개인정보 처리방침 변경)
									</a>
								</li>
							</ul>
						</div>
          <p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num01"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_object.png" alt="개인정보의 처리 목적"></span><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_period.png" alt="보유기간 (설정)"></span><span style="color:#000;">제1조(개인정보의 처리목적, 수집 항목, 보유기간 및 개인정보파일 등록현황)</span></p><br>
<div class="pv-cont">
<p class="conts-desc_07" style="text-align:left;">① 한전MCS는 고객문의/민원응대, 신사업 의견 청취 및 처리, 공익신고/민원처리 등의 목적으로 필요에 의한 최소한의 개인정보를 처리하고 있습니다.<br>
	② 한전MCS는 다음과 같이 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는「개인정보 보호법」제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br> ③ 한전MCS는 법령과 정보주체의 동의에 의해서만 개인정보를 수집·이용·보유합니다.</p><br><br>
<table style="border-collapse:collapse;border-spacing:0;width:100%;color:#8A8F91" class="tg">
	<thead>
		<tr>
			<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">구분</th>
			<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">개인정보파일명</th>
			<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">운영근거</th>
			<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">처리목적</th>
			<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">개인정보의 항목</th>
			<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">보유기간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">1</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">고객의 소리</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">정보주체의 동의</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">고객문의<br>민원응대</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:middle;word-break:normal">필수 : 이름, 연락처, E-Mail<br>선택 : 주소</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">3년</td>
		</tr>
		<tr>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">2</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">신사업 및 협력사업<br>문의ㆍ제안</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">정보주체의 동의</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">신사업 의견청취<br>및 처리</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:middle;word-break:normal">필수 : 이름, 연락처<br>선택 : E-Mail, 주소</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">1년</td>
		</tr>
		<tr>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">3</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">청렴, 부패 신고</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">정보주체의 동의</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">고객문의<br>민원응대</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:middle;word-break:normal">필수 : 이름, 연락처<br>선택 : E-Mail, 주소</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">5년</td>
		</tr>
		<tr>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">4</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">신문고</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">정보주체의 동의</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">공익신고<br>민원처리</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:middle;word-break:normal">필수 : 이름, 연락처, E-Mail<br>선택 : 주소</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">5년</td>
		</tr>
		<tr>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">5</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">사회공헌문의ㆍ제안</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">정보주체의 동의</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">고객문의<br>민원응대</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:middle;word-break:normal">필수 : 이름, 연락처<br>선택 : E-Mail, 주소</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">1년</td>
		</tr>
		<tr>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">6</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">비위양심신고센터</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">정보주체의 동의</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">비위행위<br>자진신고 및 처리</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:left;vertical-align:middle;word-break:normal">필수 : 이름, 연락처, E-Mail</td>
			<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">5년</td>
		</tr>
	</tbody>
</table>
<p class="conts-desc_07" style="text-align:left;"><br>
	④ 상세한 개인정보파일 등록사항은 “개인정보 포털”에서 확인할 수 있습니다.
	<br> ※ 열람방법 : 개인정보 포털<a href="https://www.privacy.go.kr/front/main/main.do" title="개인정보 포털" target="_blank" style="color: #8A8F91;">(www.privacy.go.kr)</a> → 개인서비스 → 정보주체 권리행사 → 개인정보열람등요구 → 개인정보파일 검색 → 기관명(<a href="https://www.privacy.go.kr/front/wcp/dcl/per/personalInfoFileSrhList.do?searchInsttCode=Z000014&searchInsttNm=한전엠씨에스(주)" title="새창이동" target="_blank" style="font-weight: 600">“한전엠씨에스”</a>) 입력 후 검색
<br><br><p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num02"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_third.png" alt="개인정보의 제3자 제공에 관한 사항"></span><span style="color:#000;">제2조(개인정보의 제3자 제공)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
	 ① 한전MCS는 정보주체의 개인정보를 제1조(개인정보의 처리목적, 수집 항목, 보유기간 및 개인정보파일 등록현황)에서 명시한 범위 내에서만 처리하며, 다만 다음의 경우와 같이 정보주체의 동의, 법률의 특별한 규정 등「개인정보 보호법」제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
	</p>
	<p class="conts-desc_07 pv-list">
	  1. 정보주체로부터 별도의 동의를 받은 경우<br>
	  2. 다른 법률에 특별한 규정이 있는 경우<br>
	  3. 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우<br>
	  4. 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 개인정보의 심의·의결을 거친 경우<br>
	  5. 조약, 그 밖의 국제협정의 이행을 위하여 외국정부 또는 국제기구에 제공하기 위하여 필요한 경우<br>
	  6. 법죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우<br>
	  7. 법원의 재판업무 수행을 위하여 필요한 경우<br>
	  8. 형(形) 및 감호, 보호처분의 집행을 위하여 필요한 경우<br>
	</p>
	</div>
</div>
		  <br><br><p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num03"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_consign.png" alt="개인정보 처리업무의 위탁"></span><span style="color:#000;">제3조(개인정보 처리업무의 위탁)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
		① 한전MCS는 개인정보를 처리하는 정보시스템의 위탁계약 체결 시「개인정보 보호법」제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>
		② 한전MCS는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
	</p>
	<br>
	<br>
	<table style="border-collapse:collapse;border-spacing:0;width:100%;color:#8A8F91" class="tg">
		<thead>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">구분</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">위탁받는 자</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">위탁하는 업무의 내용</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">재위탁</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">담당부서</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">1</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">더존비즈온</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">운영업무 위탁용역</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">ICT운영부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">2</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">한전KDN(주)</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">영업업무 위탁용역</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">ICT운영부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">3</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">㈜진웅텔레콤</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">업무시스템 운영</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">ICT운영부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">4</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">손해보험</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">단체상해보험 가입 및 보장</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">노무복지부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">5</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">㈜휴넷</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">근로자 이러닝 교육</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">인사관리부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">6</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">㈜마음의숲</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">근로자 지원 프로그램(EAP)</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">안전보건재난부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">7</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">한국표준협회</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">공공기관 고객만족도 조사</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">한국리서치</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">영업운영부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">8</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">㈜케이시크</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">안전보건 골든벨 이벤트 경품 발송</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">안전보건재난부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">9</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">SK m&service</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">설문조사 참여자 대상 모바일 상품권 지급</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">경영평가부</td>
			</tr>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">10</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">㈜윈큐브마케팅</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">설문조사 참여자 대상 모바일 상품권 지급</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">-</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal">영업계획부,영업운영부</td>
			</tr>
		</tbody>
	</table>
	<p class="conts-desc_07" style="text-align:left;"><br>
		 ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보처리방침을 통하여 공개하도록 하겠습니다.
</div>
	<br>
	<br><p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num04">
		  <span style="margin-right:0.2rem;">
			  <img src="/resources/landing/images/customer/privacy/img_court.png" alt="정보주체와 법정대리인의 권리·의무 및 행사방법">
		  </span>
		  <span style="color:#000;">제4조(정보주체와 법정대리인의 권리·의무 및 행사방법)</span>
	  </p><br>
<div class="pv-cont">
<p class="conts-desc_07" style="text-align:left;">
	① 정보주체는 한전MCS에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>
	※ 만 14세 미만 아동에 관한 개인정보의 열람등 요구는 법정대리인이 직접 해야 하며, 만 14세 이상의 미성년자인 정보주체는 정보주체의 개인정보에 관하여 미성년자 본인이 권리를 행사하거나 법정대리인을 통하여 권리를 행사할 수도 있습니다.<br>
  ② 제1항에 따른 권리 행사는 한전MCS에 대해「개인정보 보호법」시행령 제41조 제1항에 따라 서면, 전자우편, 인터넷 등을 통하여 하실 수 있으며, 우리 회사는 이에 대해 지체없이 조치하겠습니다.<br>
  ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우「개인정보 처리 방법에 관한 고시(제2020-7호)」별지 제11호 서식에 따른 위임장을 제출하여야 합니다.<br>
  ④ 개인정보 열람 및 처리정지 요구는「개인정보 보호법」제35조제4항, 제37조제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.<br>
  ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>
  ⑥ 한전MCS는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한자가 본인이거나 정당한 대리인인지를 확인합니다.<br>
</div>
<br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num05"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img-pv5.png" alt="개인정보의 파기"></span><span style="color:#000;">제5조(개인정보의 파기)</span></p><br>
	<p class="conts-desc_07" style="text-align:left;">
		① 한전MCS는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
		② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는 해당 개인정보를 보관장소를 달리하여 보존합니다.<br>
		③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
	</p>
	<p class="conts-desc_07 pv-list">
	  1. 파기절차<br>
	  한전MCS는 파기 사유가 발생한 개인정보를 선정하고, 우리 회사의 개인정보보호 책임자의 승인을 받아 개인정보를 파기합니다.<br>
	  2. 파기방법<br>
	  한전MCS는 전자적 파일 형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록·저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
	</p>
</div>
<br><br>

<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num06"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_safe.png" alt="개인정보의 안전성 확보조치"></span><span style="color:#000;">제6조(개인정보의 안전성 확보조치)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
	① 한전MCS는 개인정보의 안전성 확보를 위해「개인정보 보호법」제29조, 동법 시행령 제30조에 따라 다음과 같은 조치를 취하고 있습니다.<br>
	</p>
	<p class="conts-desc_07 pv-list">
	1. 내부관리계획의 수립 및 시행 :「개인정보의 안전성 확보조치 기준」에 의하여 내부관리계획을 수립·시행하고 있습니다.<br>
	2. 취급 직원의 최소화 및 교육 : 개인정보를 취급하는 직원을 지정하고 최소화하여 개인정보를 관리하고 있으며, 정기적인 담당자 교육 및 접근권한 관리 등 관리적 대책을 시행하고 있습니다.<br>
	3. 개인정보처리시스템 접근 제한 : 개인정보 취급자에 한하여 개인정보처리시스템에 대한 접근권한을 부여하고 있으며, 접근권한의 부여, 변경, 말소 등 지속적인 관리를 통해 접근통제를 강화하고 있습니다. 또한, 서버보안, 웹방화벽 등 기술적인 보안대책을 수립하여 비인가자의 접근을 차단하고 있습니다.<br>
	4. 접근로그 생성 : 개인정보를 검색, 조회할 경우 해당 요청자의 접근기록이 생성되어 보관됩니다. 이를 통해 개인정보를 누가 언제 조회하였는지에 대한 내용이 남게 되어 개인정보의 유출 등에 대한 자료로 사용할 수 있습니다.<br>
	5. 접속기록의 보관 및 위변조 방지 : 개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관·관리하며, 접속기록이 위변조 및 도난, 분실되지 않도록 안전하게 관리합니다.<br>
	6. 개인정보의 암호화 : 이용자의 개인정보는 암호화 되어 저장 및 관리되고 있으며, 본인만이 알 수 있는 중요한 데이터는 파일 및 전송데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용합니다.<br>
	7. 해킹 등에 대한 기술적 대책 : 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하여 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적·물리적으로 감시 및 차단합니다. 또한 네트워크 트래픽의 통제는 물론 불법적으로 정보를 변경하는 등의 시도를 탐지합니다.<br>
	8. 비인가자에 대한 출입 통제 : 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립·운영합니다.<br>
	</p>
</div>
<br><br>


<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num07"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_cookie.png" alt="개인정보 자동 수집장치의 설치·운영 및 거부에 관한 사항"></span><span style="color:#000;">제7조(개인정보 자동 수집장치의 설치·운영 및 거부에 관한 사항)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
		① 한전MCS는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 쿠키(cookie)를 사용합니다.<br>
		② 쿠키는 웹사이트 서버가 이용자의 브라우저에 전송하는 소량의 정보로서 이용자 컴퓨터의 하드디스크에 저장되기도 합니다.<br>
	</p>
	<p class="conts-desc_07 pv-list">
	  1. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹사이트들에 대한 방문 및 이용형태, 보안접속 여부 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>
	  2. 쿠키 설치·운영 및 거부 : 브라우저 옵션 설정을 통해 쿠키 차단 등의 설정을 할 수 있습니다.<br />
		<span style="margin-left: 10px;display: block">
		가. Internet Explorer : 웹브라우저 우측 상단의 도구메뉴 > 인터넷 옵션 > 개인정보 > 설정 > 고급<br />
		나. 엣지(Edge) : 웹브라우저 우측 상단의 설정 메뉴 > 쿠키 및 사이트 권한 > 쿠키 및 사이트 데이터 관리 및 삭제<br />
		다. 크롬(Chrome) : 웹브라우저 우측 상단의 설정 메뉴 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제<br>
		</span>
	  3. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br>
	</p>
</div>
<br><br>


<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num08"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_cpo.png" alt="개인정보보호 책임자"></span><span style="color:#000;">제8조(개인정보보호 책임자)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
	① 한전MCS는 아래와 같이 개인정보보호 책임자를 지정하여 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보처리와 관련한 정보주체의 불만처리 및 피해구제 등의 업무를 처리하고 있습니다.<br>
	</p>
	<br><br>
	<table style="border-collapse:collapse;border-spacing:0;width:100%;color:#8A8F91" class="tg">
		<thead>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all" rowspan="2">구&nbsp;&nbsp;분</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all" rowspan="2">개인정보 보호책임자</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all" colspan="2">개인정보보호 담당부서</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:10%;">부&nbsp;&nbsp;서</th>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">사업안전본부</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">정보보안부</td>
			</tr>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:10%;">성&nbsp;&nbsp;명</th>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">조 남 기</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">이 제 승</td>
			</tr>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:10%;">직&nbsp;&nbsp;책</th>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">사업안전본부장</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">사 원</td>
			</tr>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:10%;">전&nbsp;&nbsp;화</th>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">061-345-9800</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">061-345-9846</td>
			</tr>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:10%;">이메일</th>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">nkcho77@kepcomcs.co.kr</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:break-all;width:30%;">jeess@kepcomcs.co.kr</td>
			</tr>
		</tbody>
	</table>
	<br>
	<br>
	<p class="conts-desc_07" style="text-align:left;">
		② 정보주체는 한전MCS의 서비스(또는 사업)를 이용하면서 발생한 모든 개인정보보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보보호 책임자 및 담당부서로 문의하실 수 있습니다. 한전MCS는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.<br>
	  <br></p>
</div>


<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num09"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_browse.png" alt="개인정보 열람청구"></span><span style="color:#000;">제9조(개인정보 열람청구)</span></p><br>
<div class="pv-cont">
<p class="conts-desc_07" style="text-align:left;">
	① 정보주체는「개인정보 보호법」제35조에 따른 개인정보의 열람청구를 아래의 부서에 할 수 있습니다. 한전MCS는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.
	<br><br></p>
	<table style="border-collapse:collapse;border-spacing:0;width:100%;color:#8A8F91" class="tg">
		<thead>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">부&nbsp;&nbsp;서</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">담당자</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">연락처</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">이메일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">정보보안부</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">이제승</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">061-345-9846</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">jeess@kepcomcs.co.kr</td>
			</tr>
		</tbody>
	</table>
	<p class="conts-desc_07" style="text-align:left;"><br>
		② 정보주체는 제1항의 개인정보 열람청구 접수·처리부서 이외에 개인정보 포털<a href="https://www.privacy.go.kr/front/main/main.do" title="개인정보 포털" target="_blank" style="color: #8A8F91;">(www.privacy.go.kr)</a> 을 통해서도 개인정보 열람청구를 하실 수 있습니다.<br>
		※ 개인정보 포털 → 개인서비스 → 개인정보 열람등요구 → 열람등요구(본인인증 필요) ☞ <a href="https://www.privacy.go.kr/front/wcp/dcl/per/persnalInfoAgree.do" title="열람등요구" target="_blank" style="color: #8A8F91;">바로가기</a>
</div>
<br>
<br>


<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num10"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_help.png" alt="권익침해 구제방법"></span><span style="color:#000;">제10조(권익침해 구제방법)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
		① 한전MCS는 정보주체의 개인정보 침해로 인한 상담 및 피해구제를 위해 노력하고 있으며, 신고나 상담이 필요한 경우 개인정보보호 담당부서로 연락해 주시기 바랍니다.<br>
	 </p><br>
	 <table style="border-collapse:collapse;border-spacing:0;width:100%;color:#8A8F91" class="tg">
		<thead>
			<tr>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">부&nbsp;&nbsp;서</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">담당자</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">연락처</th>
				<th style="background-color:#efefef;border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;font-weight:bold;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">이메일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">정보보안부</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">이제승</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">061-345-9846</td>
				<td style="border-color:black;border-style:solid;border-width:1px;font-size:1.15rem;overflow:hidden;padding:10px 5px;text-align:center;vertical-align:middle;word-break:normal;width: 25%;">jeess@kepcomcs.co.kr</td>
			</tr>
		</tbody>
	</table>
	<p class="conts-desc_07" style="text-align:left;"><br>
		② 아래의 기관은 한전MCS와 별개의 기관으로서, 한전MCS의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.<br>
	</p>
	<p class="conts-desc_07 pv-list">
		1. 개인정보 침해신고센터(한국인터넷진흥원 운영)<br>
		<span style="margin-left: 10px;display: block;">
		 - 소관업무 : 개인정보 침해사실 신고, 상담 신청<br>
		 - 홈페이지 : <a href="https://privacy.kisa.or.kr/main.do" title="개인정보침해 신고센터" target="_blank" style="color: #8A8F91;">privacy.kisa.or.kr</a><br>
		 - 전     화 : (국번없이) 118<br>
		</span>
		2. 개인정보 분쟁조정위원회(개인정보보호위원회 운영)<br>
		<span style="margin-left: 10px;display: block;">
		 - 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정<br>
		 - 홈페이지 : <a href="https://www.kopico.go.kr/main/main.do" title="개인정보분쟁조정위원회" target="_blank" style="color: #8A8F91;">www.kopico.go.kr</a><br>
		 - 전    화 : 1833-6972<br>
		</span>
		3. 대검찰청 : <a href="https://www.spo.go.kr/site/spo/main.do" title="검찰" target="_blank" style="color: #8A8F91;">www.spo.go.kr</a> (국번없이) 1301<br>
		4. 경 찰 청 : <a href="https://ecrm.police.go.kr/minwon/main" title="사이버점죄 신고시스템(ECRM)" target="_blank" style="color: #8A8F91;">ecrm.police.go.kr</a> (국번없이) 182<br>
	</p><br />
	<p class="conts-desc_07" style="text-align:left;">
	   ③「개인정보 보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.<br>
		 ※ 중앙행정심판위원회 : <a href="https://www.simpan.go.kr/nsph/index.do" title="온라인행정심판" target="_blank" style="color: #8A8F91;">www.simpan.go.kr</a> (국번없이) 110
	</p>
</div>
<br><br>


<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num11"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_add.png" alt="개인정보의 추가적인 이용·제공의 기준"></span><span style="color:#000;">제11조(개인정보의 추가적인 이용·제공의 기준)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
		①「개인정보 보호법」제15조제3항, 제17조제4항 및 동법 시행령 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다.<br>
		② 한전MCS는 정보주체의 동의 없이 추가적으로 이용·제공을 하기 위해서 다음과 같은 사항을 고려하였습니다.<br>
	</p>
	<p class="conts-desc_07 pv-list">
		 1. 개인정보를 추가적으로 이용·제공하려는 목적이 당초 수집 목적과 관련성이 있는지 여부<br>
		 2. 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 추가적인 이용·제공에 대한 예측 가능성이 있는지 여부<br>
		 3. 정보주체의 이익을 부당하게 침해하는지 여부<br>
		 4. 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부<br>
	</p>
</div>
<br><br>


<p class="conts-desc_07" style="text-align:left;display: flex; align-items: center;  height: 60px; padding-top: 2rem;" id="list_num12"><span style="margin-right:0.2rem;"><img src="/resources/landing/images/customer/privacy/img_change.png" alt="개인정보 처리방침의 변경에 관한 사항"></span><span style="color:#000;">제12조(개인정보 처리방침의 변경)</span></p><br>
<div class="pv-cont">
	<p class="conts-desc_07" style="text-align:left;">
	① 이 개인정보 처리방침은 2024. 12. 09.부터 적용됩니다. <br>
	② 이전의 개인정보 처리방침은 아래에서 확인할 수 있습니다.<br>
	&nbsp;&nbsp;&nbsp;&nbsp;- <a href="/customer/privacypolicy_241208" title="새 창 이동" target="_blank">2023. 11. 13 ∼ 2024. 12. 08 적용</a><a href="/resources/landing/file/privacypolicy_241209.pdf" target="_blank" title="2024. 12. 09. 개인정보처리방침 pdf파일 새 창 열기" class="btn-link">바로가기</a><br>
	&nbsp;&nbsp;&nbsp;&nbsp;- <a href="/customer/privacypolicy_231114" title="새 창 이동" target="_blank" style="font-size: 18px;">2022. 12. 28 ∼ 2023. 11. 13 적용</a><br>
	&nbsp;&nbsp;&nbsp;&nbsp;- <a href="/customer/privacypolicy_221228" title="새 창 이동" target="_blank" style="font-size: 18px;">2021. 09. 14 ∼ 2022. 12. 27 적용</a><br>
	</p>
</div>
      </div>
    </div>
  </main>

  <div id="footer"></div>

  <div class="btn-top">
    TOP
    <p class="top-line"></p>
  </div>

  <!-- //main -->

  <script>
    $("#header").load("/resources/landing/include/header.html");
    $("#footer").load("/resources/landing/include/footer.html");

    // $(document).ready(function() {
      $('.file-btn').on('click', function() {
        $(this).parents('.file-row').find('.file').trigger('click');
        // $('.file').trigger('click');
      });

      $('.file').on('change', function() {
        var fileName = $(this)[0].files[0].name;    
        $(this).parents('.file-row').find('.file-name').val(fileName);
        // $('.file-name').val(fileName);
      });
    // })
  </script>

</body>
</html>