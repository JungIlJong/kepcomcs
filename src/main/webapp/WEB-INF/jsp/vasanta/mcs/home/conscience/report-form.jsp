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
  <meta property="og:image" content="https://www.kepcomcs.co.kr/resources/landing/images/main/logo.png">
  <meta property="og:url" content="http://kepcomcs.co.kr">
  <title>비위양심신고센터 | 한전MCS</title>
  <meta name="description" content="전력량계 검침업무, 전기요금 청구서 송달업무, 전기요금 체납관리업무, 고객서비스 영업현장업무 전 과정에 걸친 검침토털 서비스 제공 전문기업">
  <meta name="keywords" content="한전MCS 한전mcs, 한전엠씨에스, KEPCOMCS, kepcomcs">
  <link rel="stylesheet" href="/resources/landing/css/common.css">
  <link rel="stylesheet" href="/resources/landing/css/sub.css">
  <link rel="stylesheet" href="/resources/landing/css/manage.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/select.dataTables.min.css">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="/resources/landing/js/select.dataTables.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  <script src="https://www.google.com/recaptcha/api.js?render=6Le8_iQcAAAAACCuc_W--e48akBOB61Uzu839PkO"></script>
<script type="text/javascript">
	$(function() {
		if($.cookie('kepcomcssResponseNumber') != "<%=session.getAttribute("sResponseNumber")%>" ){
	
			alert("비정상적인 접근입니다.\휴대폰 인증 후에 접속해 주셔야 합니다.")
			location.href="./report-certification";
			
		}else{
			$('#cn_name').text($.cookie('authorName'));
			$('#cn_hp').text($.cookie('authorHp'));
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
					
			      	if($('#cn_division').val() == ""){ 
			      		$('#cn_division').focus();
			    		alert("소속(지점, 지사)를 입력해주세요."); return;  
			      	}
// 			      	if($('#cn_enum').val() == ""){
// 			      		$('#cn_enum').focus();
// 		    			alert("사번을 입력해주세요."); return;
// 		    		}else if($('#cn_enum').val().length != 8){
// 		    			$('#cn_enum').focus();
// 		    			alert("사번은 숫자 8자리를 입력해야합니다."); return;
// 		    		}
		    		if($('#cn_content').val() == ""){
		    			$('#cn_content').focus();
		    		 	alert("내용을 입력해 주세요."); return;
		    		}
					myForm = document.getElementById('myForm2');
		   			var formData = new FormData(myForm);
		   			formData.append("board_author", $('#cn_name').text());
		   			formData.append("frstRegisterId", $('#cn_enum').val());
		   			formData.append("sosok", $('#cn_division').val());
		   			formData.append("author_hp", $('#cn_hp').text());
		   			formData.append("board_type", "1328");
		   			formData.append("board_content", $('#cn_content').val()); 
		   			formData.append("file_list", $("#file_list")[0].files[0])
		   			formData.append("google_token", token);

					if($("#file_list")[0].files[0] != null && $("#file_list")[0].files[0] != "" && $("#file_list")[0].files[0] !== "undefined"){

			      		if($("#file_list")[0].files[0].size > 10485760){
			      		 	alert("첨부 파일 용량이 10MB를 초과하였습니다.\n파일을 다시 선택해 주세요."); return;
				      	}

			      		if( $("#file_list")[0].files[0] != "" ){
			                var ext = $("#file_list")[0].files[0].name.split('.').pop().toLowerCase();
			        	    if($.inArray(ext, ['gif','png','jpg','zip','rar','ar']) == -1) {
			        	       alert('등록 할수 없는 확장자명입니다.');
			        	       return;
			       	  		}
			            }
					}
					
		   			$.ajax({
		   	            type: "POST",
		   	            enctype: 'multipart/form-data',
		   	         	url: "/set/boardfile",
		   	            data: formData,
		   	            processData: false,
		   	            contentType: false,
		   	            cache: false,
		   	            timeout: 600000,
		   	            success: function (data) {
		   	            	if(parseInt(data.result))
		   	        		{
		   		        		replaceUrl = "/mber/conscience/report";
		   	            		alert("정상적으로 등록되었습니다.");
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


	function validateEmail(sEmail) {
		
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if (filter.test(sEmail)) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	$(document).ready(function () {
		$('.numCheck').keydown(function(event) {
			 this.value=this.value.replace(/[^0-9]/g,'');
		});
		$('.numCheck').keyup(function(event) {
		 	this.value=this.value.replace(/[^0-9]/g,'');
		});
	});

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
      <li>비위양심신고센터</li>
    </ul>     
    <div class="contents esg-conts report-conts">     
      <div class="esg-tit-wrap agree-tit-wrap">
        <h1>비위양심신고센터</h1>
        <ul class="report-step">
          <li>
            <p>개인정보 동의</p>
          </li>
          <li>
            <p>휴대폰 본인 인증</p>
          </li>
          <li>
            <p>글작성</p>
          </li>
        </ul>
        <p class="conts-desc_08 txt-ac step-desc mob-ani-none">한전MCS의 깨끗한 경영을 위해 민원을 작성해주세요.</p>
      </div>
      <div class="report-agree-wrap mob-ani-none">
      <form action="" enctype="multipart/form-data" id="myForm2"></form>
        <form action="" enctype="multipart/form-data" id="myForm">
        <h3>작성하기</h3>
          <ul class="board-form">
             <li>
          	 	 <div class="board-form-tit" style="padding-bottom: 20px;"><img src="/resources/landing/images/customer/ico_essencial.png" style="width:11px;height:11px;">&nbsp;소속(지점, 지사)</div>
          	 	 <div class="board-form-conts"><input type="text" id="cn_division" class="input-style" placeholder="소속지점, 지사를 입력해 주세요" maxlength="100"></div>
          	 </li>
          	 <li>
          	 	 <div class="board-form-tit" style="padding-bottom: 20px;">이름</div>
          	 	 <div class="board-form-conts"><span id="cn_name" style="font-size: 10pt;font-weight: bold;"></span></div>
          	 </li>
          	 <li>
          	 	 <div class="board-form-tit" style="padding-bottom: 20px;"><img src="/resources/landing/images/customer/ico_essencial.png" style="width:11px;height:11px;">&nbsp;사번</div>
          	 	 <div class="board-form-conts"><input type="text"  id="cn_enum" class="input-style numCheck" placeholder="사번을 입력해 주세요" maxlength="8"></div>
          	 </li>
          	 <li>
          	 	 <div class="board-form-tit" style="padding-bottom: 20px;">연락처</div>
          	 	 <div class="board-form-conts"><span id="cn_hp" style="font-size: 10pt;font-weight: bold;"></span></div>
          	 </li>
         	 <li>
              <div class="board-form-tit"><img src="/resources/landing/images/customer/ico_essencial.png" style="width:11px;height:11px;;">&nbsp;내용</div>
              <div class="board-form-conts">
                <textarea name="editor2" id="cn_content" class="input-style" style="height:150px;resize: vertical;"></textarea>
              </div>
            </li>
            <li>
              <div class="board-form-tit">첨부파일</div>
              <div class="board-form-conts">
                <div class="file-row-wrap">
                  <div class="file-row-form">
                    <input type="file" class="file" id="file_list">
                    <input type="button" class="file-btn" value="파일선택">
                  </div>
                  <div>
                  </div>
                </div>
                <div>
                  <table id="addFileList">
                    <thead>
                      <tr>
                        <th style="text-align:center;">삭제</th>
                        <th style="text-align:center;">첨부파일명</th>
                        <th style="text-align:center;">용량</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
              </div>
            </li>           
          </ul>
          <div class="btn-row btn-row-board">
            <input type="button" value="취소" class="btn-cancle" onClick="gotoList();">
            <input type="button" value="저장" class="btn-save" onClick="saveNotice();">
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

  <script>
    $("#footer").load("/resources/landing/include/footer.html");

    //date
    //document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

    //input file
    $('.file-btn').on('click', function() {
      $(this).parents('.file-row-form').find('.file').trigger('click');
    });
    $('.file').on('change', function() {
      var fileName = $(this)[0].files[0].name;    
      $(this).parents('.file-row-form').find('.file-name').val(fileName);
    });

    //datatables
    $('#addFileList').DataTable({
      "lengthChange": false,
      "searching": false,
      "info": false,
      "paging": false,
      "ordering": false,
      "language": {
          "emptyTable": "첨부된 파일이 없습니다."
        },
      "columnDefs": [ {
        orderable: false,
        className: 'select-checkbox',
      } ],
      "select": {
        style: 'os'
      },
    });

	$("#file_list").change(function(){
		const imageInput = $("#file_list")[0];
		console.log("imageInput: ", imageInput.files);
		console.log("imageInput: ", imageInput.files[0].name);
		var t = $('#addFileList').DataTable();
		t.row().remove();
        t.row.add( [
	            '<a href="#" onclick="deleteFileRow();return false;" style="color:red;">삭제</a>',
	            imageInput.files[0].name,
	            formatSizeUnits(imageInput.files[0].size)
	        ] ).draw( false );

        $("#file_list").add($("#file_list")[0]);
	});
	//.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")

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
