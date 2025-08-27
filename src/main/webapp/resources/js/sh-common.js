var ax_product_setings=["","sunting"]

var sales_target = ["시공점","대리점"];
var build_type = ["일반시공","대리점 시공"];
var statusArr = ["작업정보 입력 대기","시공 등록 대기","시공승인 대기","시공승인","시공승인반려","시공승인정산"]
var statusActionArr = [
						 {"text" : "작업정보 등록","class" : "" }
						,{"text" : "시공 등록","class" : ""}
						,{"text" : "승인","class" : "btn btn-primary waves-effect waves-light btn-approval btn_tb_blue","action": "approval","actionStatus" : "Y","krc_status" : "3"}
						,{"text" : "정산","class" : "btn btn-success waves-effect waves-light btn-approval btn_tb_orange","action": "settle","actionStatus" : "Y","krc_status" : "5"}
						,{"text" : "","class" : "btn btn-warning waves-effect waves-light btn-approval btn_tb_purple","action": ""}
						,{"text" : "정산취소","class" : "btn btn-danger waves-effect waves-light btn-approval btn_tb_green","action": "settle","actionStatus" : "N","krc_status" : "3"}
					]
var statusActionArr2 = [
						 {"text" : "삭제","class" : "" ,"action": ""}
						,{"text" : "작업정보 삭제","class" : "","action": ""}
						,{"text" : "반려","class" : "btn btn-warning waves-effect waves-light btn-approval btn_tb_purple","action": "reject","actionStatus" : "N","krc_status" : "4"}
						,{"text" : "승인 취소","class" : "btn btn-inverse waves-effect waves-light btn-approval btn_tb_purple2","action": "approval","actionStatus" : "N","krc_status" : "2"}
						,{"text" : "재승인","class" : "btn btn-info waves-effect waves-light btn-approval","action": "approval","actionStatus" : "Y","krc_status" : "3"}
						,{"text" : "","class" : "btn btn-danger waves-effect waves-light btn-approval btn_tb_green","action": "","krc_status" : ""}
					]						
var MemberTaxType = ["없는사업자","일반과세자","간이과세자","법인사업자","면세사업자","과특사업자","비영리법인"];
var MemberCorpState = ["없는사업자","계속사업자","휴업자","폐업자"];
var issuedirectionType = ["","정발행","역발행"];
var PurposeType = ["","영수","청구"]; 
var TaxType = ["","과세","영세","면세"];
var TaxCalcType = ["","절상","절사","반올림"];
var TaxInvoiceType = ["","세금계산서","계산서","","위수탁세금계산서","위수탁계산서","","수입세금계산서","수입계산서","수기계산서"];
var ModifyCode = ["","기재사항의 착오/정정","공급가액의 변동","재화의 환입","계약의 해제","내국신용장 사후개설","단순 착오에 의한 이중발급"];

var WarrantyType = ["","유리코팅막"];

var TradeType = {"N":"승인거래", "D":"취소거래"}
var cashbill_type = ["매출","매입"]
var TradeUsage = {"1" :"소득공제", "2":"지출증빙"}

var STOCKITEM_H_TYPE = ["출고","입고","발주","차감","샘플","불량","검수","출고발주","기타"];
var STOCKITEM_TYPE = ["","매입","재고이관","비품"];
var STOCKITEM_CLASS = ["N","Y"];

var AS_TYPE = ["선택안함","무상 A/S","Motion A/S","TBtech A/S"]

var psoStatus =["장바구니","주문접수","입금확인","출고완료"];
// DataTables Default
var datatable_eng = {
    "decimal" : "",
    "emptyTable" : "No data available in table",
    "info" : "Showing _START_ to _END_ of _TOTAL_ entries",
    "infoEmpty" : "Showing 0 to 0 of 0 entries",
    "infoFiltered" : "(filtered from _MAX_ total entries)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "Show _MENU_ entries",
    "loadingRecords" : "<div id='loader'>Loading...</div>",
    "processing" : "<div id='loader'>Processing...</div>",
    "search" : "Search : ",
    "zeroRecords" : "No matching records found",
    "paginate" : {
        "first" : "First",
        "last" : "Last",
        "next" : "Next",
        "previous" : "Previous"
    },
    "aria" : {
        "sortAscending" : " :  activate to sort column ascending",
        "sortDescending" : " :  activate to sort column descending"
    }
}

// Korean
var datatable_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_개)",
    "infoEmpty" : "0",
    "infoFiltered" : "(전체 _MAX_ 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : tableLoader(),
    "processing" : tableLoader(),
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
        "first" : "첫 페이지",
        "last" : "마지막 페이지",
        "next" : "다음",
        "previous" : "이전"
    },
    "aria" : {
        "sortAscending" : " :  오름차순 정렬",
        "sortDescending" : " :  내림차순 정렬"
    }
}


// 숫자 타입에서 쓸 수 있도록 format() 함수 추가

var datapickerlang = {
    months: "1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),
    monthsShort: "1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),
    weekdays: "일요일_월요일_화요일_수요일_목요일_금요일_토요일".split("_"),
    weekdaysShort: "일_월_화_수_목_금_토".split("_"),
    longDateFormat: {
        L: "YYYY.MM.DD",
        LL: "YYYY년 MMMM D일",
        LLL: "YYYY년 MMMM D일 A h시 mm분",
        LLLL: "YYYY년 MMMM D일 dddd A h시 mm분"
    },
    meridiem: {
        AM: '오전',
        am: '오전',
        PM: '오후',
        pm: '오후'
    },
    relativeTime: {
        future: "%s 후",
        past: "%s 전",
        s: "몇초",
        ss: "%d초",
        m: "일분",
        mm: "%d분",
        h: "한시간",
        hh: "%d시간",
        d: "하루",
        dd: "%d일",
        M: "한달",
        MM: "%d달",
        y: "일년",
        yy: "%d년"
    },
    ordinal: function(number) {
        return '일';
    }
};
$('head').append('<link rel="stylesheet" type="text/css" href="/resources/css/sh-common.css">');
Number.prototype.k_currency_format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};

function phoneFomatter(num,type){

    var formatNum = '';
    
    
    num = num.replace(/[^.0-9]/g,'');
    if(num.length==11){

        if(type==0){

            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');

        }else{

            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

        }

    }else if(num.length==8){

        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');

    }else{

        if(num.indexOf('02')==0){
			if(num.length==9){
				if(type==0){
	
	                formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-****-$3');
	
	            }else{
	
	                formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
	
	            }
			}
			else
			{
	            if(type==0){
	
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
	
	            }else{
	
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	
	            }
			}

        }else{

            if(type==0){

                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');

            }else{

                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');

            }

        }

    }

    return formatNum;
}

function businessNumberFomatter(num,type){

    var formatNum = '';
    
    var orgNum = num;
    num = num.replace(/[^.0-9]/g,'');
    if(num.length==10){

        if(type==0){

            formatNum = num.replace(/(\d{3})(\d{2})(\d{5})/, '$1-****-$3');

        }else{

            formatNum = num.replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');

        }

    }
    else
    {
    	formatNum = orgNum;
    }

    return formatNum;
}

function numberCommas(el,x) {
	var temp ="";
	var float = "";
	x = x+"";
	if(x.indexOf('.') != '-1')
	{
		if(x.split('.')[1])
		{
			float = x.split('.')[1];
			float = "."+float;
			x = x.split('.')[0];
		}
		
	}
	if(x[0] == "-")
	{
		temp = "-";
	}
	x = x.replace(/[^.0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g,'');          // ,값 공백처리
	x = (x.length > 1 && x[0] == 0 ? x.substr(1,x.length) : x)
	x = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가
	x = x+float
	$(el).val((x == '' ? '0' : temp+x)); // 정규식을 이용해서 3자리 마다 , 추가 
}
function numberUpdown(el,x,e)
{
	var temp ="";
	x = (x||0)+"";
	if(x[0] == "-")
	{
		temp = "-";
	}
	x = x.replace(/[^.0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g,'');          // ,값 공백처리
	
	
	if(e.keyCode == 38)
	{
		//up
		x++;
		
	}
	else if(e.keyCode == 40)
	{
		//down
		x--;
	}
	x = x+"";
	x = (x.length > 1 && x[0] == 0 ? x.substr(1,x.length) : x)
	x = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가
	x = x;
	
	$(el).val((x == '' ? '0' : temp+x)); // 정규식을 이용해서 3자리 마다 , 추가
}
function addNumberCommas(x) {
	//console.log("addNumberCommas")
	var temp =""; 
	var float = "";
	x = x+"";
	if(x.indexOf('.') != '-1')
	{
		if(x.split('.')[1])
		{
			float = x.split('.')[1];
			float = "."+float;
			x = x.split('.')[0];
		}
		
	}
	
	if(x[0] == "-")
	{
		temp = "-";
	}
	x = x.replace(/[^.0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g,'');          // ,값 공백처리
	x = (x.length > 1 && x[0] == 0 ? x.substr(1,x.length) : x)
	x = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 
	x = x+float
	return (x == '' ? '0' : temp+x);
}

function deleteCommas(x)
{
	var temp ="";
	x = x+"";
	if(x[0] == "-")
	{
		temp = "-";
	}
	x = x.replace(/[^.0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g,'');          // ,값 공백처리
	
	return (x == '' ? '0' : temp+x);
}
function jsonKeyChangeLowercase(data)
{
	var temp = {};
	for(key in data) {
		var lowerKey = key.toLowerCase();
		var value = data[key];
		if(Array.isArray(data[key]))
		{
			if(value)
			{
				var temp2 = [];
				for(var i = 0; i < value.length; i++)
				{
					var tempJson = {};
					for(key2 in value[i]) {
						var lowerKey2 = key2.toLowerCase();
						var value2 = value[i][key2];
						tempJson[lowerKey2] = value2;
					}
					temp2.push(tempJson);
				}
				value=temp2;
			}
			
		}
		temp[lowerKey] = value;
	}
	console.log(temp);
	return temp;
}

if (!FileReader.prototype.readAsBinaryString) {
    FileReader.prototype.readAsBinaryString = function (fileData) {
       var binary = "";
       var pt = this;
       var reader = new FileReader();      
       reader.onload = function (e) {
           var bytes = new Uint8Array(reader.result);
           var length = bytes.byteLength;
           for (var i = 0; i < length; i++) {
               binary += String.fromCharCode(bytes[i]);
           }
        //pt.result  - readonly so assign binary
        pt.content = binary;
        $(pt).trigger('onload');
    }
    reader.readAsArrayBuffer(fileData);
    }
}
 
// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.k_currency_format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};

function notify(message, type) 
{
	$.growl({
	    message: message
	}, {
	    type: type,
	    allow_dismiss: true,
	    label: 'Cancel',
	    className: 'btn-xs btn-inverse',
	    placement: {
	        from: 'top',
	        align: 'center'
	    },
	    icon_type: 'class',
	    delay: 1500,
	    z_index: 999999,
	    animate: {
	        enter: 'animated flipInX',
	        exit: 'animated flipOutX'
	    },
	    offset: {
	        x: 30,
	        y: 120
	    }
	});
};
function ModalEffects() {
	var overlay = document.querySelector( '.md-overlay' );

	[].slice.call( document.querySelectorAll( '.md-trigger' ) ).forEach( function( el, i ) {

		var modal = document.querySelector( '#' + el.getAttribute( 'data-modal' ) ),
			close = modal.querySelector( '.md-close' );

		function removeModal( hasPerspective ) {
			classie.remove( modal, 'md-show' );

			if( hasPerspective ) {
				classie.remove( document.documentElement, 'md-perspective' );
			}
		}

		function removeModalHandler() {
			removeModal( classie.has( el, 'md-setperspective' ) ); 
		}

		el.addEventListener( 'click', function( ev ) {
			classie.add( modal, 'md-show' );
			//overlay.removeEventListener( 'click', removeModalHandler );
			//overlay.addEventListener( 'click', removeModalHandler );

			if( classie.has( el, 'md-setperspective' ) ) {
				setTimeout( function() {
					classie.add( document.documentElement, 'md-perspective' );
				}, 25 );
			}
		});

		close.addEventListener( 'click', function( ev ) {
			ev.stopPropagation();
			removeModalHandler();
		});

	} );

}
$(document).on( 'page.dt','#new-cons', function () {
	var table = $('#new-cons').DataTable();
	 var info = table.page.info();
	console.log('Showing page: '+info.page+' of '+info.pages );
	setTimeout(function(){
		ModalEffects();
	},350);
})

$(document).on( 'search.dt','#new-cons', function () {
	setTimeout(function(){
		ModalEffects();
	},100);
});

function notNullCheck(str)
{
	var rValue = true;
	if(str == null || str == undefined || str == "undefined" || str == "")
	{
		rValue = false;
	}
	return rValue
}

function NullChange(str)
{
	var rValue ="";
	if(str != null && str != undefined && str != "undefined" && str != "")
	{
		rValue = str;
	}
	return rValue
}

function postAjax(url,param)
{
	var rvalue = null;
	console.log(param)
	$.ajax(
			{
				method: "post",
				url : url,
				data : JSON.stringify(param),
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				async : false,
				success : function(data) {
					//console.log(data);
					rvalue = data
					},
				error : function(e) {
					rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
					console.log(e)
				}
			}
		);
	
	return rvalue;
}

function postAjaxAsync(url,param,callback)
{
	shloader('show');
	var rvalue = null;
	console.log(param)
	$.ajax(
			{
				method: "post",
				url : url,
				data : JSON.stringify(param),
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				async : true,
				success : function(data) {
					rvalue = data;
					
					callback(rvalue);
					shloader('hide');
					
					},
				error : function(e) {
					rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
					callback(rvalue);
					console.log(e);
					shloader('hide');
					
				}
			}
		);
	
	return rvalue;
}

function getAjax(url,param)
{
	var rvalue = ""
	$.ajax(
			{
				method : "get",
				url : url,
				data : param,
				contentType: "application/json; charset=utf-8",
				async : false,
				success : function(data) {
					//console.log(data);
					rvalue = data
					},
				error : function(e) {
					rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
					console.log(e)
				}
			}
		);
	
	return rvalue;
}


function getContentPage(url, param) {
	var rHtml ="";
	console.log(url);
	$.ajax(
			{
				type : "get",
				url : url,
				param : param,
				async : false,
				success : function(data) {
					rHtml = data;
					},
				error : function(e) {
					//rvalue = { "result" : 0, "msg" : "관리자에게 문의바랍니다.", "data" : e.reponseText };
					alert("세션이 만료되었습니다.\n다시 로그인해 주세요.");
					$(location).attr("href", "/mcsAdmin/")

					rHtml = e.reponseText
				}
			}
		);
	return rHtml;
}





function loaderboxCtrl()
{
	var el;
	
	this.init = function()
	{
		this.el = $('#loaderbox');
	}
	
	this.hide = function()
	{
		this.el.removeClass('show');
	}
	this.show = function()
	{
		this.el.addClass('show')
	}
}
//DATATABLE 검색시, 엔터키를 받기 위한 JS 
/*
jQuery.fn.dataTableExt.oApi.fnFilterOnReturn = function (oSettings) {
	var _that = this;

	this.each(function (i) {
		$.fn.dataTableExt.iApiIndex = i;
		var $this = this;
		var anControl = $('input', _that.fnSettings().aanFeatures.f);
		anControl
			.unbind('keyup search input')
			.bind('keypress', function (e) {
				if (e.which == 13) {
					$.fn.dataTableExt.iApiIndex = i;
					_that.fnFilter(anControl.val());
				}
			});
		return this;
	});
	return this;
};
*/
$(document).on('click','a',function(){
	var target = this;
	$(target).addClass('clickDisabled');
	setTimeout(function(){
		$(target).removeClass('clickDisabled');
	}, 1000);
})
function setCheckboxHeaderBody(id)
{
	$('#'+id+' input[name=header-position]').on('click',function(){
		if($('#'+id+' input[name=header-position]').is(":checked"))
		{
			$('#'+id+' input[name=body-position]').prop("checked", true);
		}
		else
		{
			$('#'+id+' input[name=body-position]').prop("checked", false);
		}	
		
	})
	$('#'+id+' input[name=body-position]').on('click',function(){
		var checkbox = $('#check_region input[name=body-position]');
		var checked = $('#check_region input[name=body-position]:checked');
		if($('#'+id+' input[name=body-position]').is(":checked"))
		{
			if(checkbox.length == checked.length)
			{
				$('#'+id+' input[name=header-position]').prop("checked", true);
			}
			else
			{
				$('#'+id+' input[name=header-position]').prop("checked", false);
			}
		}
		else
		{
			$('#'+id+' input[name=header-position]').prop("checked", false);
		}
	})	
}

function customAlert(title,msg,callback,cancel)
{
	var rhtml = '';
	rhtml += '<div id="customModal" class="modal" id="default-Modal" tabindex="-1" role="dialog" style="display:block;">';
	rhtml += '    <div class="modal-dialog" role="document">';
	rhtml += '<div class="modal-content">';
	rhtml += '<div class="modal-header">';
	rhtml += '<h4 class="modal-title">'+title+'</h4>';
	rhtml += '<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="customModalClose()">';
	rhtml += '<span aria-hidden="true">&times;</span>';
	rhtml += '</button>';
	rhtml += '</div>';
	rhtml += '<div class="modal-body" style="height: 250px; overflow: scroll;">';
	var msgSplit = msg.split('\n')
	for (var i = 0; i < msgSplit.length; i++)
	{
		rhtml += msgSplit[i]+"<br>";
	}
	rhtml += '</div>';
	rhtml += '<div id="customModal" class="modal-footer">';
	if(cancel)
	{
		rhtml += '<button type="button" class="btn btn-default waves-effect " data-dismiss="modal" onclick="customModalClose()">취소</button>';
	}
	rhtml += '<button type="button" class="btn btn-primary waves-effect waves-light " onclick='+callback+'>확인</button>';
	rhtml += '</div>';
	rhtml += '</div>';
	rhtml += '</div>';
	rhtml += '</div>';
	
	$("body").append(rhtml);
}
function customModalClose()
{
	$('#customModal').remove();
}
function postPromiseAjax(url, param) {
	
	console.log(param)
	if($('#shloaderbox').hasClass('loader-hide'))
	{
		shloader("show");
	}
	
	return new Promise(function(resolve, reject){
		$.ajax({
			method : "post",
			url : url,
			data : JSON.stringify(param),
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			async : true,
			success : function(data) {
				// console.log(data);
				var rvalue = data
				setTimeout(function(){
					shloader("hide")
				},500)
				resolve(rvalue);
			},
			error : function(e) {
				var rvalue = {
					"result" : 0,
					"msg" : "관리자에게 문의바랍니다.",
					"data" : e.reponseText
				};
				resolve(rvalue);
				console.log(e)
				setTimeout(function(){
					shloader("hide")
				},500)
			}
		});
	});

}
function tableLoader()
{
	var loaderHtml ="<div id='loader' class='loaderbox'>";
	loaderHtml += "	<div class='preloader3 loader-block' style='margin: auto;width: 100%;position: absolute;top: 39%;'>";
	loaderHtml += "        <div class='circ1'></div>";
	loaderHtml += "       <div class='circ2'></div>";
	loaderHtml += "       <div class='circ3'></div>";
	loaderHtml += "       <div class='circ4'></div>";
	loaderHtml += "   </div>";
	loaderHtml += "   </div>";
	return loaderHtml;
}
function shloader(state)
{
	
	if($('#shloaderbox').length == 0)
	{
		var loaderHtml ="";
		loaderHtml += "<div id='shloaderbox' class='loaderbox loader-hide'>";
		loaderHtml += "	<div class='preloader3 loader-block' style='margin: auto;width: 100%;position: absolute;top: 39%;'>";
		loaderHtml += "        <div class='circ1'></div>";
		loaderHtml += "       <div class='circ2'></div>";
		loaderHtml += "       <div class='circ3'></div>";
		loaderHtml += "       <div class='circ4'></div>";
		loaderHtml += "   </div>";
		loaderHtml += "</div>";
		$('body').eq(0).append(loaderHtml);
	}
	if(state == "show")
	{
		$('#shloaderbox').removeClass('loader-hide');
	}
	else if(state == "hide")
	{
		$('#shloaderbox').addClass('loader-hide');
	}
	else
	{
		
	}
}

function lpad(str, padLen, padStr) {
    if(!str)
    {
    	str = 0;
    }
	if (padStr.length > padLen) {
        //console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}


