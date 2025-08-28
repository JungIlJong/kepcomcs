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
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/gsap.min.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  <script src="https://www.google.com/recaptcha/api.js?render=6Le8_iQcAAAAACCuc_W--e48akBOB61Uzu839PkO"></script>

  <script type="text/javascript">
  $(function() {
		if($.cookie('kepcomcssResponseNumber') != "<%=session.getAttribute("sResponseNumber")%>" ){

			alert("비정상적인 접근입니다.\휴대폰 인증 후에 접속해 주셔야 합니다.")
			location.href="./opinion-certification";
			
		}else{
			$('#author_name').text($.cookie('authorName'));
			$('#author_hp').text($.cookie('authorHp'));
		}

		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일

		$("#today_val").text(new Date().toISOString().substring(0, 10));
	})

	function saveNotice(){

		grecaptcha.ready(function() {

		    grecaptcha.execute('6Le8_iQcAAAAACCuc_W--e48akBOB61Uzu839PkO', {action: 'submit'}).then(function(token) {
		          
	      		if($('#customer_name').val() == ""){ 
	    			alert("고객님의 이름을 입력해 주세요."); return;
	    		}else if($('#customer_email').val() == ""){
	    			alert("고객님의 이메일 주소를 입력해 주세요."); return;
	    		}else if($('#customer_hp').val() == ""){
	    		 	alert("고객님의 연락처를 입력해 주세요."); return;
	    		}else if($('#opinion_title').val() ==""){
	    		 	alert("글 제목을 입력해 주세요."); return;
	    		}else if($('#opinion_content').val() ==""){
	    		 	alert("글 내용을 입력해 주세요."); return;
	    		}

				if($("#file_list")[0].files[0] != null && $("#file_list")[0].files[0] != "" && $("#file_list")[0].files[0] !== "undefined"){

		      		if($("#file_list")[0].files[0].size > 10485760){
		      		 	alert("첨부 파일 용량이 10MB를 초과하였습니다.\n파일을 다시 선택해 주세요."); return;
			      	}

		      		if( $("#file_list")[0].files[0] != "" ){
		                var ext = $("#file_list")[0].files[0].name.split('.').pop().toLowerCase();
		        	    if($.inArray(ext, ['gif','png','jpg','zip','rar','ar', 'pdf']) == -1) {
			        	       alert('등록 할수 없는 확장자명입니다.\n*.gif,*.png,*.jpg,*.pdf,*.zip,*.rar,*.ar형식만 등록이 가능합니다.');
		        	       return;
		       	  		}
		            }
				}

	    		if( $('input[name=policyAgreementYN]').val() == "N"){
	    		 	alert("개인정보활용 여부에 동의하지 않으셨습니다.\n다시 한번 확인해 주세요."); return;
			    }

    			var formData = new FormData();

    			formData.append("customer_name", $('#customer_name').val());
    			formData.append("customer_email", $('#customer_email').val()); 
    			formData.append("customer_hp", $('#customer_hp').val()); 
    			formData.append("customer_cp_name", $('#customer_name').val());
    			formData.append("inquery_area", $('#inquery_area').val()); 

    			if($(":input:radio[name=addressYN]:checked").val() == "Y"){
        			formData.append("customer_address1", $('#customer_address1').val()); 
        			formData.append("customer_address2", $('#customer_address2').val());
        			formData.append("customer_address3", $('#customer_address3').val());
       			}else{
        			formData.append("customer_address1", ""); 
        			formData.append("customer_address2", "");
        			formData.append("customer_address3", "");
           		}

    			formData.append("opinion_title", $('#opinion_title').val()); 
    			formData.append("opinion_content", $('#opinion_content').val()); 
    			formData.append("feedback_yn", $(":input:radio[name=replyYN]:checked").val());
    			formData.append("inquery_area",  $(":input:radio[name=policyAgreementYN]:checked").val()); 

    			formData.append("file_list", $("#file_list")[0].files[0])
    			formData.append("privacy_aggrement_yn","Y");
    			
    			
    			formData.append("google_token", token);
		
    			$.ajax({
    	            type: "POST",
    	            enctype: 'multipart/form-data',
    	            url: "/set/Opinion",
    	            data: formData,
    	            processData: false,
    	            contentType: false,
    	            cache: false,
    	            timeout: 600000,
    	            success: function (data) {
    	            	if(parseInt(data.result))
    	        		{
    		        		replaceUrl = "/customer/complete";
    	            		location.replace(replaceUrl);
    	        		}
    	            	else
    	                {
    						alert("관리자에게 문의바랍니다.");
    	                }
    	            },
    	            error: function (e) {
    	            	alert("관리자에게 문의바랍니다.");
    	            	console.log(e);
    	            }
    	        });
			});
		});
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
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>고객의 소리</li>
      </ul>
    </div>
    <div class="contents"> 
      <div class="conts-ani" data-trigger>
        <p class="conts-desc_01 txt-ac tdesc">고객님의 소중한 제안, 칭찬, 불만사항 등을 접수하는 고객의 소리 접수 창구입니다.</p>
        <form action="" enctype="multipart/form-data">
          <table class="board-input">
            <tbody>
              <tr class="essencial">
                <th>
                  <span>이름</span>
                </th>
                <td>
                  <input type="text" class="input-style" placeholder="성함을 입력해 주세요" id="customer_name">
                </td>
              </tr>
              <tr class="essencial">
                <th>
                  <span>이메일</span>
                </th>
                <td>
                  <input type="text" class="input-style" placeholder="이메일을 입력해 주세요" id="customer_email">
                </td>
              </tr>
              <tr class="essencial">
                <th>
                  <span>연락처</span>
                </th>
                <td>
                  <input type="text" class="input-style" placeholder="연락처를 입력해 주세요" id="customer_hp">
                </td>
              </tr>
              <tr>
                <th>
                  <span>고객업체명</span>
                </th>
                <td>
                  <input type="text" class="input-style" placeholder="업체명을 입력해 주세요" id="customer_cp_name">
                </td>
              </tr>
              <tr>
                <th>
                  <span>문의지역</span>
                </th>
                <td>
                  <div class="select-row">
                    <select name="inquery_area" id="inquery_area" class="select_style" placeholder="업체명을 입력해 주세요">
                      <option value="" selected="selected">지역을 선택해 주세요</option>              
                      <option value="서울지역">서울지역</option>              
                      <option value="남서울지역">남서울지역</option>              
                      <option value="인천지역">인천지역</option>              
                      <option value="경기북부지역">경기북부지역</option>              
                      <option value="경기지역">경기지역</option>              
                      <option value="강원지역">강원지역</option>              
                      <option value="충북지역">충북지역</option>              
                      <option value="대전세종충남지역">대전세종충남지역</option>              
                      <option value="전북지역">전북지역</option>              
                      <option value="광주전남지역">광주전남지역</option>              
                      <option value="대구지역">대구지역</option>              
                      <option value="경북지역">경북지역</option>              
                      <option value="부산울산지역">부산울산지역</option>              
                      <option value="경남지역">경남지역</option>              
                      <option value="제주지역">제주지역</option>              
                    </select>
                  </div>                
                </td>
              </tr>
              <tr class="essencial address-tr">
                <th>
                  <span>주소등록</span>
                </th>
                <td>
                  <div class="radio-row">
                    <input type="radio" id="addressYes" name="addressYN" checked value="Y">
                    <label for="addressYes">주소등록</label>
                    <input type="radio" id="addressNo" name="addressYN"  value="N">
                    <label for="addressNo">주소등록 안함</label>
                  </div>
                </td>
              </tr>
              <tr>
                <th>
                  <span>주소</span>
                </th>
                <td>
                  <div class="postal-row">
                    <input type="text" id="address_postcode" class="postal-input" placeholder="우편번호">
                    <input type="button" onclick="sample6_execDaumPostcode()" class="btn-postal" value="우편번호 찾기">
                  </div>
                  <input type="text" id="customer_address1" class="input-style" placeholder="주소"><br>
                  <input type="text" id="customer_address2" class="input-style mt10" placeholder="상세주소">
                  <input type="text" id="customer_address3" class="input-style mt10" placeholder="참고항목">
                </td>
              </tr>
              <tr class="essencial">
                <th>
                  <span>제목</span>
                </th>
                <td>
                  <input type="text" class="input-style" placeholder="제목을 입력해 주세요" id="opinion_title">
                </td>
              </tr>
              <tr class="essencial">
                <th>
                  <span>내용</span>
                </th>
                <td>
                  <textarea class="textarea-style" placeholder="내용을 작성해 주세요" id="opinion_content"></textarea>
                </td>
              </tr>
              <tr class="essencial answer-tr">
                <th>
                  <span>검토/개선결과 회신 여부</span>
                </th>
                <td>
                  <div class="radio-row">
                    <input type="radio" id="replyYes" name="replyYN" checked value="Y">
                    <label for="replyYes" class="first"><span class="on-mob">검토/개선결과 </span>회신받기</label>
                    <br class="br-mob">
                    <input type="radio" id="replyNo" name="replyYN"  value="N">
                    <label for="replyNo"><span class="on-mob">검토/개선결과 </span>회신 받지 않기</label>
                  </div>
                </td>
              </tr>
              <tr>
                <th>
                  <span>첨부파일</span>
                </th>
                <td>
                  <div class="file-row">
                    <input type="file" class="file" id="file_list">
                    <input type="text" class="file-name" placeholder="파일업로드" readonly="readonly">
                    <input type="button" class="file-btn" value="첨부파일">
                  </div>
                  <div class="file-desc">
                    <p class="conts-desc_06">첨부파일은 최대 10MB까지 가능합니다.</p>
                    <p class="conts-desc_06">첨부파일은 JPG/GIF 이미지파일과 압축파일(zip, rar, ar)로 첨부해 주시기 바랍니다.</p>
                  </div>
                </td>
              </tr>
              <tr class="essencial">
                <th>
                  <span>개인정보동의</span>
                </th>
                <td>
                  <p class="on-mob tit-mob">개인정보동의</p>
                  <div class="customer-desc-box">
고객의 소리 접수와 관련하여 귀사가 아래와 같이 개인정보를 처리하는데 동의합니다.<br/>
<br/>
1. 개인정보 수집항목<br/>
필수항목 : 성명, 휴대전화번호, 이메일<br/>
<br/>
2. 개인정보 수집 및 이용목적<br/>
고객 문의 안내 및 서비스 제공<br/>
<br/>
3. 개인정보 보유 및 이용기간<br/>
수집동의일로부터 1년<br/>
<br/>
4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익<br/>
동의를 거부 할 수 있으나 미동의시 고객의 소리 서비스 이용에 제한을 받으실수 있습니다.<br/>
                  </div>
                  <div class="agree-check">
                    <p>‘개인정보 처리방침’ 공지 및 ‘개인정보 처리방침’에 동의하십니까?</p>
                    <div>
                      <div class="radio-row">
                        <input type="radio" id="agreeYes" name="policyAgreementYN" checked value="Y">
                        <label for="agreeYes">동의합니다.</label>
                        <input type="radio" id="agreeNo" name="policyAgreementYN"  value="N">
                        <label for="agreeNo" class="mr0">동의하지 않습니다.</label>
                      </div>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="btn-row btn-row-board">
            <input type="button" value="취소" class="btn-cancle">
            <a href="javascript:saveNotice()">
              <input type="button" value="저장" class="btn-save">
            </a>
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

  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>

    //include
    
    $("#footer").load("/resources/landing/include/footer.html");

    //input file
    $('.file-btn').on('click', function() {
      $(this).parents('.file-row').find('.file').trigger('click');
    });
    $('.file').on('change', function() {
      var fileName = $(this)[0].files[0].name;    
      $(this).parents('.file-row').find('.file-name').val(fileName);
    });

    //address
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수
          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("customer_address3").value = extraAddr;
          } else {
            document.getElementById("customer_address3").value = '';
          }
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('address_postcode').value = data.zonecode;
          document.getElementById("customer_address1").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("customer_address2").focus();
        }
      }).open();
    }

    //input file
    $('.file-btn').on('click', function() {
      $(this).parents('.file-row-form').find('.file').trigger('click');
    });
    $('.file').on('change', function() {
      var fileName = $(this)[0].files[0].name;    
      $(this).parents('.file-row-form').find('.file-name').val(fileName);
    });
    
/*
	$("#file_list").change(function(){
		const imageInput = $("#file_list")[0];
        $("#file_list").add($("#file_list")[0]);
	});
	//.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
*/
	function deleteFileRow(){
		//Datatable 초기화
		var t = $('#addFileList').DataTable();
		t.rows().remove().draw();

		//Input file 내용 삭제
		var agent = navigator.userAgent.toLowerCase();
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
		    // ie 일때 input[type=file] init.
		    $("#file_list").replaceWith( $("#excelFile").clone(true) );
		} else {
		    //other browser 일때 input[type=file] init.
		    $("#file_list").val("");
		}
		return;
	}
	
	function formatSizeUnits(bytes){
		  if      (bytes >= 1073741824) { bytes = (bytes / 1073741824).toFixed(2) + " GB"; }
		  else if (bytes >= 1048576)    { bytes = (bytes / 1048576).toFixed(2) + " MB"; }
		  else if (bytes >= 1024)       { bytes = (bytes / 1024).toFixed(2) + " KB"; }
		  else if (bytes > 1)           { bytes = bytes + " bytes"; }
		  else if (bytes == 1)          { bytes = bytes + " byte"; }
		  else                          { bytes = "0 bytes"; }
		  return bytes;
		}
	
</script>

</body>
</html>
