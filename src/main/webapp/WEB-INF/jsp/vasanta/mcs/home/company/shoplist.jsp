<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="format-detection" content="telephone=no" />
<meta property="og:type" content="website">
<meta property="og:title" content="한전MCS 주식회사">
<meta property="og:description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
<meta property="og:image" content="https://www.kepcomcs.co.kr/resources/landing/images/main/logo.png">
<meta property="og:url" content="http://kepcomcs.co.kr">
<title>한전MCS 주식회사</title>
<meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
<meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
<link rel="stylesheet" href="/resources/landing/css/common.css">
<link rel="stylesheet" href="/resources/landing/css/sub.css">
<link rel="stylesheet" href="/resources/landing/css/board.css">
<link rel="stylesheet" href="/resources/landing/css/shoplist_style.css">
<link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
<link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/landing/js/jquery.waypoints.min.js"></script>
<script src="/resources/landing/js/pages.js"></script>
<script src="/resources/landing/js/jquery.animateNumber.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
<script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
<script src="/resources/js/sh-common.js"></script>

<style>
.korea_map {
	width: 238px;
	height: 297px;
	display: inline-block;
	background: url("/resources/landing/images/company/korea_map.png");
	background-size: 238px 297px;
}

#branch_01 {
	width: 53px;
	height: 18px;
	margin-top: 44px;
	margin-left: 68px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -68px -44px;
}

#branch_02 {
	width: 37px;
	height: 18px;
	margin-top: -18px;
	margin-left: 122px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -122px -44px;
}

#branch_03 {
	width: 53px;
	height: 18px;
	margin-top: 5px;
	margin-left: 0px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: 0px -67px;
}

#branch_04 {
	width: 37px;
	height: 18px;
	margin-top: -12px;
	margin-left: 65px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -65px -73px;
}

#branch_05 {
	width: 45px;
	height: 18px;
	margin-top: 2px;
	margin-left: 90px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -90px -93px;
}

#branch_06 {
	width: 45px;
	height: 18px;
	margin-top: -2px;
	margin-left: 44px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -44px -109px;
}

#branch_07 {
	width: 45px;
	height: 18px;
	margin-top: -13px;
	margin-left: 132px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -132px -114px;
}

#branch_08 {
	width: 53px;
	height: 18px;
	margin-top: 1px;
	margin-left: 93px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -93px -133px;
}

#branch_09 {
	width: 53px;
	height: 18px;
	margin-top: -8px;
	margin-left: 153px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -153px -143px;
}

#branch_10 {
	width: 45px;
	height: 18px;
	margin-top: -1px;
	margin-left: 57px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -57px -160px;
}

#branch_11 {
	width: 53px;
	height: 18px;
	margin-top: -2px;
	margin-left: 185px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -185px -176px;
}

#branch_12 {
	width: 45px;
	height: 18px;
	margin-top: -11px;
	margin-left: 107px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -107px -183px;
}

#branch_13 {
	width: 53px;
	height: 18px;
	margin-top: -3px;
	margin-left: 9px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -9px -198px;
}

#branch_14 {
	width: 53px;
	height: 18px;
	margin-top: -23px;
	margin-left: 165px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -165px -204px;
}

#branch_15 {
	width: 53px;
	height: 18px;
	margin-top: -3px;
	margin-left: 63px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -63px -213px;
}

#branch_16 {
	width: 53px;
	height: 18px;
	margin-top: 43px;
	margin-left: 37px;
	position: relative;
	background: url("/resources/landing/images/company/korea_map.png");
	background-position: -37px -269px;
}

.korea_map_clicked {
	display: inline-block;
	position: relative;
	top: -212px;
	left: -245px;
}

#branch_01_clicked {
	width: 53px;
	height: 18px;
	margin-top: -41px;
	margin-left: 73px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -68px -44px;
	display: none;
}

#branch_02_clicked {
	width: 37px;
	height: 18px;
	margin-top: -41px;
	margin-left: 127px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -122px -44px;
	display: none;
}

#branch_03_clicked {
	width: 53px;
	height: 18px;
	margin-top: -18px;
	margin-left: 5px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: 0px -67px;
	display: none;
}

#branch_04_clicked {
	width: 37px;
	height: 18px;
	margin-top: -12px;
	margin-left: 70px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -65px -73px;
	display: none;
}

#branch_05_clicked {
	width: 45px;
	height: 18px;
	margin-top: 8px;
	margin-left: 95px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -90px -93px;
	display: none;
}

#branch_06_clicked {
	width: 45px;
	height: 18px;
	margin-top: 23px;
	margin-left: 49px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -44px -109px;
	display: none;
}

#branch_07_clicked {
	width: 45px;
	height: 18px;
	margin-top: 28px;
	margin-left: 137px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -132px -114px;
	display: none;
}

#branch_08_clicked {
	width: 53px;
	height: 18px;
	margin-top: 48px;
	margin-left: 98px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -93px -133px;
	display: none;
}

#branch_09_clicked {
	width: 53px;
	height: 18px;
	margin-top: 58px;
	margin-left: 158px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -153px -143px;
	display: none;
}

#branch_10_clicked {
	width: 45px;
	height: 18px;
	margin-top: 75px;
	margin-left: 62px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -57px -160px;
	display: none;
}

#branch_11_clicked {
	width: 53px;
	height: 18px;
	margin-top: 91px;
	margin-left: 190px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -185px -176px;
	display: none;
}

#branch_12_clicked {
	width: 45px;
	height: 18px;
	margin-top: 98px;
	margin-left: 112px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -107px -183px;
	display: none;
}

#branch_13_clicked {
	width: 53px;
	height: 18px;
	margin-top: 113px;
	margin-left: 14px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -9px -198px;
	display: none;
}

#branch_14_clicked {
	width: 53px;
	height: 18px;
	margin-top: 120px;
	margin-left: 168px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -164px -204px;
	display: none;
}

#branch_15_clicked {
	width: 53px;
	height: 18px;
	margin-top: 124px;
	margin-left: 68px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -63px -213px;
	display: none;
}

#branch_16_clicked {
	width: 29px;
	height: 18px;
	margin-top: 185px;
	margin-left: 42px;
	position: absolute;
	background:
		url("/resources/landing/images/company/korea_map_clicked.png");
	background-position: -37px -269px;
	display: none;
}
</style>

<script>
		var suboption = {
				"ADDRM1"	:	[],	//충남
				"ADDRM2"	:	[],	//울산
				"ADDRM3"	:	[],	//부산
				"ADDRM4"	:	[],	//강원
				"ADDRM5"	:	[],	//충북
				"ADDRM6"	:	[],	//인천
				"ADDRM7"	:	[],	//세종특별자치시
				"ADDRM8"	:	[],	//경남
				"ADDRM9"	:	[],	//경기
				"ADDRM10"	:	[],	//전남
				"ADDRM11"	:	[],	//제주
				"ADDRM12"	:	[],	//경북
				"ADDRM13"	:	[],	//광주
				"ADDRM14"	:	[],	//대구
				"ADDRM15"	:	[],	//대전
				"ADDRM16"	:	[],	//서울
				"ADDRM17"	:	[]	//전북
			};
		$(function(){
			$('.korea_map div').on('click',function(){
				var index = $(this).index();
				console.log(index);
				var target = $(".korea_map_clicked div").eq(index)
				console.log(target)
				target.css("display", "block");
				target.attr('id')
				console.log(target.attr('id'));
				$(".korea_map_clicked div").not("#"+target.attr('id')).css("display", "none");
				
				$('#addr1select').val($(this).attr('attr1'));
				mainTable.page(0).draw(false)
				getRegion2();
				//suboptionswitch($(this).attr('attr1'));
			})
			
			$(document).on('change','#addr1select',function(){
				getRegion2()
				mainTable.page(0).draw(false)
			})
			
			$(document).on('change','#addr2select',function(){
				getShopList();
				mainTable.page(0).draw(false)
			})
			getRegion1()
			getShopList();
		})

		
		function getRegion1()
		{
			var datalist = [];
			var param = {};
			
			var request = postAjax("/get/shop/region/1",param);
			if(request.result == '1')
			{
				datalist = request.data;
			}
			else
			{
				
			}
			var addr1html ="<option value=\"\">지역선택</option>";
			var addr2html ="<option value=\"\">지역선택</option>";
			
			if(datalist.length > 0)
			{
				for(var i in datalist)
				{
					
					addr1html += "<option value=\""+datalist[i].region1+"\">"+datalist[i].region1+"</option>";
				}
			}

			$('#addr1select').html(addr1html);
			$('#addr2select').html(addr2html);
		}
		
		function getRegion2()
		{
			var datalist = [];
			var param = {
					"region1" : $('#addr1select').val()
			}
			
			var request = postAjax("/get/shop/region/2",param);
			if(request.result == '1')
			{
				datalist = request.data;
			}
			else
			{
				
			}
			var addr2html ="<option value=\"\">지역선택</option>";
			
			if(datalist.length > 0)
			{
				for(var i in datalist)
				{
					
					addr2html += "<option value=\""+datalist[i].region2+"\">"+datalist[i].region2+"</option>";
				}
			}
			$('#addr2select').html(addr2html);
		}


		function getShopList()
		{

			if ( $.fn.dataTable.isDataTable( '#newBusinessList' ) ) {
			    table = $('#newBusinessList').DataTable();
			    table.destroy();
			}
			
			mainTable = $('#newBusinessList')
			.DataTable(
			{
				responsive : true,
				lengthChange: false,
				pagingType : "full_numbers",
				//bAutoWidth: true,
				ordering : false,
				searching : true,
				"language": {
			        "search": "검색",
			        "info" : "총 _TOTAL_건",
			        "emptyTable": "등록된 글이 없습니다.",
			        "infoEmpty":  "",
			        "paginate" : {
			          "first" : "처음",
			          "last" : "마지막",
			          "next" : "다음",
			          "previous" : "이전"
			        },
			    },
				bServerSide : true,
				sAjaxSource : "/get/shop/list",
				sServerMethod : "POST",
				//POST 파라미터 추가 (게시판명 추가) 
				fnServerParams : function(aoData) {
					aoData.push({
						"name" : "sSearch",
						"value" : $('#searchvalue').val()
					});
					aoData.push({
						"name" : "region1",
						"value" : $('#addr1select').val()
					});
					aoData.push({
						"name" : "region2",
						"value" : $('#addr2select').val()
					});
				},
						
						columns : [
							/* {
								"data" : "shop_no",
								"title" : "번호",
								"render" : function(data, type, row, meta) {

									return (parseInt(mainTable.page.info().recordsTotal) - (parseInt(mainTable.page.info().start) + parseInt(meta.row)));
								}
							}, */
							{
								"data" : "shop_name",
								render : function(data, type, row, meta) {

									return row.shop_name || "";
								}
							},
							{
								"data" : "addr",
								"sWidth" : '50%',
								"orderable" : false,
								"render" : function(data, type, row, meta) {

									return row.addr || "";
								}
							},
							{
								"data" : "shop_tel",
								render : function(data, type, row, meta) {
									return row.shop_tel || "";
								}
							},
							{
								"data" : "shop_keyword",
								render : function(data, type, row, meta) {
									return row.shop_keyword || "";
								}
							}
						],											
				initComplete : function() {
					
				},
				drawCallback : function(settings) {
					//CALLBACK 함수 데이터 전달받은 후에 전역인 Datalist에 담는 함수

				},
				//oLanguage: {sProcessing: "<div id='loader'></div>"},
				dom : 
						"<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-6'i><'col-sm-6'p>>",
				buttons : []
			});
		}
	</script>
</head>
<body id="mcsPage">
	<div id="header"></div>
	<!-- main -->
	<main class="company-main">
		<div class="page-tit">
			<div class="page-tit-wrap">
				<h1>사업소 안내</h1>
				<p>한전MCS의 경쟁력, 본사·지사·사업소의 탄탄한 인프라가 만들어갑니다.</p>
			</div>
			<ul class="rocation">
				<li>
					<a href="/">Home</a>
				</li>
				<li>
					<a href="/company/overview">회사소개</a>
				</li>
				<li>사업소 안내</li>
			</ul>
		</div>
		<div class="contents">
			<div class="contents">
		      <div class="bid-tab-wrap">
		        <ul class="recruit-tab">
		          <li class="selected">
		            <a href="/company/shoplist">영업 사업소 안내</a>
		          </li>
		          <li>
		            <a href="/company/powerlist">발전 사업소 안내</a>
		          </li>
		        </ul>
		      </div>
		    </div>
			<div class="organ-box find_map">
				<div class="map">
					<div class="korea_map">
						<div id="branch_01" attr1="서울특별시" style="cursor: pointer;"></div>
						<div id="branch_02" attr1="강원도" style="cursor: pointer;"></div>
						<div id="branch_03" attr1="인천광역시" style="cursor: pointer;"></div>
						<div id="branch_04" attr1="경기도" style="cursor: pointer;"></div>
						<div id="branch_05" attr1="충청북도" style="cursor: pointer;"></div>
						<div id="branch_06" attr1="충청남도" style="cursor: pointer;"></div>
						<div id="branch_07" attr1="경상북도" style="cursor: pointer;"></div>
						<div id="branch_08" attr1="대전광역시" style="cursor: pointer;"></div>
						<div id="branch_09" attr1="대구광역시" style="cursor: pointer;"></div>
						<div id="branch_10" attr1="전라북도" style="cursor: pointer;"></div>
						<div id="branch_11" attr1="울산광역시" style="cursor: pointer;"></div>
						<div id="branch_12" attr1="경상남도" style="cursor: pointer;"></div>
						<div id="branch_13" attr1="광주광역시" style="cursor: pointer;"></div>
						<div id="branch_15" attr1="전라남도" style="cursor: pointer;"></div>
						<div id="branch_14" attr1="부산광역시" style="cursor: pointer;"></div>
						<div id="branch_16" attr1="제주특별자치도" style="cursor: pointer;"></div>
					</div>
					<div class="korea_map_clicked">
						<div class="branch_clicked" id="branch_01_clicked"></div>
						<div class="branch_clicked" id="branch_02_clicked"></div>
						<div class="branch_clicked" id="branch_03_clicked"></div>
						<div class="branch_clicked" id="branch_04_clicked"></div>
						<div class="branch_clicked" id="branch_05_clicked"></div>
						<div class="branch_clicked" id="branch_06_clicked"></div>
						<div class="branch_clicked" id="branch_07_clicked"></div>
						<div class="branch_clicked" id="branch_08_clicked"></div>
						<div class="branch_clicked" id="branch_09_clicked"></div>
						<div class="branch_clicked" id="branch_10_clicked"></div>
						<div class="branch_clicked" id="branch_11_clicked"></div>
						<div class="branch_clicked" id="branch_12_clicked"></div>
						<div class="branch_clicked" id="branch_13_clicked"></div>
						<div class="branch_clicked" id="branch_15_clicked"></div>
						<div class="branch_clicked" id="branch_14_clicked"></div>
						<div class="branch_clicked" id="branch_16_clicked"></div>
					</div>
				</div>
				<div class="select_map">
					<p class="txt_map">검색 조건을 입력하거나 선택하시고 [검색]버튼을 클릭하시면 지점 리스트를 확인하실 수 있습니다.</p>
					<!-- select 지역-->
					<legend>장착점 찾기</legend>
					<div class="box_select">
						<select id="addr1select">

						</select>
						<select id="addr2select">

						</select>
					</div>
					<div class="box_input">
						<input type="text" id="searchvalue" name="" value="" placeholder="입력하세요">
					</div>
					<p class="btn_search">
						<button type="button" onclick='mainTable.page(0).draw(false)'>검색하기</button>
					</p>
				</div>
			</div>
			<div class="office" id="organAni01">
				<table id="newBusinessList" class="table display nowrap" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>지점</th>
							<th>주소</th>
							<th>전화번호</th>
							<th>키워드</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>

		</div>
	</main>
	<!-- //main -->
	<div id="footer"></div>
	<div class="btn-top">
		TOP
		<p class="top-line"></p>
	</div>

	<!-- mobile modal 조직도 이미지 -->
	<div class="modal_wrap">
		<div class="modal_conts">
			<img src="/resources/landing/images/company/organization.png" alt="한전MCS 조직도">
		</div>
		<div class="btn-image-close"></div>
	</div>

	<script>
    $("#header").load("/resources/landing/include/header.html");
    $("#footer").load("/resources/landing/include/footer.html");

    //timer
    let delayTime;
    let delayTime2;
    if( $(window).width() > 767 ) {
      delayTime = 2000
      delayTime2 = 2500
    } else {
      delayTime = 800
      delayTime2 = 1300
    }

    setTimeout(function() {
      $('.organ-num_01').animateNumber({
        number: 1
      })
    }, delayTime)
    setTimeout(function() {
      $('.organ-num_02').animateNumber({
        number: 2
      })
    }, delayTime)
    setTimeout(function() {
      $('.organ-num_03').animateNumber({
        number: 4
      })
    }, delayTime)
    setTimeout(function() {
      $('.organ-num_04').animateNumber({
        number: 10
      })
    }, delayTime)
    setTimeout(function() {
      $('.organ-num_05').animateNumber({
        number: 5
      })
    }, delayTime2)
    setTimeout(function() {
      $('.organ-num_06').animateNumber({
        number: 197
      })
    }, delayTime2)
    
    var waypoint = new Waypoint({
      element: document.getElementById('organAni01'),
      handler: function(direction) {
        $('#organAni01').addClass('visible')
      },
      offset: '75%'
    })
  </script>

</body>
</html>
