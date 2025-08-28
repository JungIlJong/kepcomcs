<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
  <meta name="format-detection" content="telephone=no"> 
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
  <link rel="stylesheet" href="/resources/landing/css/datatables.min.css">
  <link rel="stylesheet" href="/resources/landing/css/responsive.dataTables.min.css">
  <link rel="shortcut icon" href="/resources/landing/images/main/mcs.png">
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/pages.js"></script>
  <script src="/resources/landing/js/ScrollTrigger.min.js"></script>
  <script src="/resources/landing/js/datatables.min.js"></script>
  <script src="/resources/landing/js/dataTables.responsive.min.js"></script>
  <script src="/resources/landing/js/select.dataTables.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/nuxodin/ie11CustomProperties@4.1.0/ie11CustomProperties.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  <script src="https://www.google.com/recaptcha/api.js?render=6Le8_iQcAAAAACCuc_W--e48akBOB61Uzu839PkO"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/sh-common.css">
<script type="text/javascript">
	
	var board_no = <%=request.getParameter("board_no") %>;
	$(function() {
		//$('#notice_type').val(board_type)
		var board_no = <%=request.getParameter("board_no") %>;
		if (board_no != null || board_no != "" || board_no != 'undefined'){
			readBoardData();
		}
	})
	function gotoList(){
		location.href="/customer/localproduct-list";
	}
	function readBoardData(){

		var form = {
				board_type :  "20",
				board_no :  <%=request.getParameter("board_no") %>,
				board_pwd : '<%=request.getParameter("board_pwd") %>'
		    };
	    
		$.ajax({
			headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			},
		    url:"/get/board/view", // 요청 할 주소
		    async:true,// false 일 경우 동기 요청으로 변경
		    type:'POST', // GET, PUT
		    dataType:'json',// xml, json, script, html
	        data: JSON.stringify(form),
		    success:function(data) {
				request = data;
				if(parseInt(request.result))
				{
					if(request.data)
					{
					
						if(request.result == "1"){
								$('#board_title').val(request.data[0].board_title);
								$('#board_author').val(request.data[0].name);
								$('#board_content').val(request.data[0].board_content);
								$('#board_name').val(request.data[0].name);
								$('#board_link').val(request.data[0].link_url);
								$('#board_phone').val(request.data[0].phone);
								if(request.data[0].detail_img_file_name != '' && request.data[0].detail_img_file_name != null && request.data[0].detail_img_file_name !== undefined){
									$('#board_img').val(request.data[0].detail_img_file_name);
									var t = $('#addFileList').DataTable();
									t.row().remove();
							        t.row.add( [
								            '<a href="#" onclick="deleteFileRow();return false;" style="color:red;">삭제</a>',
								            request.data[0].detail_img_file_name,
								            ''
								        ] ).draw( false );

								}
						}
					}
				}
			},// 요청 완료 시
		    error:function(jqXHR) {alert("비정상적인 접근 입니다. \n관리자에게 문의해 주세요.")},// 요청 실패.
		    complete:function(jqXHR) {}// 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		});
		
	}

	
	function saveNotice(){
		var board_type = 20;

		grecaptcha.ready(function() {
	          grecaptcha.execute('6Le8_iQcAAAAACCuc_W--e48akBOB61Uzu839PkO', {action: 'submit'}).then(function(token) {
		          
	      		if($('#board_title').val() == ""){ 
	      			$('#board_title').focus();
	    			alert("글 제목을 입력해 주세요."); return;
	    		}else if($('#board_author').val() == ""){
	    			$('#board_author').focus();
	    			alert("이름을 입력해 주세요."); return;
	    		}else if($('#board_phone').val() == ""){
	    			$('#board_phone').focus();
	    			alert("연락처를 입력해 주세요."); return;
	    		}else if($('#board_link').val() == ""){
	    			$('#board_link').focus();
	    			alert("판매처 링크를 입력해 주세요."); return;
	    		}else if($('#board_content').val() == ""){
	    			$('#board_content').focus()
	    		 	alert("내용을 입력해 주세요."); return;
	    		}else if($('#board_pwd').val() ==""){
	    			$('#board_pwd').focus();
	    		 	alert("비밀번호를 입력해 주세요."); return;
	    		}else if($('#board_re_pwd').val() ==""){
	    			$('#board_re_pwd').focus();
	    		 	alert("비밀번호를 모두 입력해 주세요."); return;
	    		}
	      		
	      		var link = $("#board_link").val();
	    	 	if(link.indexOf("http") != 0){
	    	 		$('#board_link').focus();
	    	 		alert("판매처 URL 형식이 맞지 않습니다. 확인해주세요.");return;
	    	 	}

	    		if($('#board_pwd').val() != $('#board_re_pwd').val()){
	    			$('#board_pwd').focus();
	    			alert("비밀번호가 같지 않습니다. 다시 확인해 주세요."); return;
	    		}
	    		
	    			var formData = new FormData();
	    			formData.append("board_no", <%=request.getParameter("board_no") %>);
	    			formData.append("board_title", $('#board_title').val());
	    			formData.append("board_author", $('#board_author').val()); 
	    			formData.append("board_content", $('#board_content').val());
	    			formData.append("link_url", $('#board_link').val());
	    			formData.append("name", $('#board_author').val()); 
	    			formData.append("phone", $('#board_phone').val());
	    			formData.append("board_type", board_type);
	    			formData.append("file_list", $("#file_list")[0].files[0])
	    			formData.append("board_pwd", SHA256($('#board_pwd').val())); 
	    			formData.append("google_token", token); 
	    			formData.append("board_img", $('#board_img').val());
	    			
					if($("#file_list")[0].files[0] != null && $("#file_list")[0].files[0] != "" && $("#file_list")[0].files[0] !== "undefined"){
			      		if($("#file_list")[0].files[0].size > 10485760){
			      		 	alert("첨부 파일 용량이 10MB를 초과하였습니다.\n파일을 다시 선택해 주세요."); return;
				      	}

			      		if( $("#file_list")[0].files[0] != "" ){
			                var ext = $("#file_list")[0].files[0].name.split('.').pop().toLowerCase();
			        	    if($.inArray(ext, ['gif','png','jpg','pdf']) == -1) {
			        	       alert('등록 할수 없는 확장자명입니다.\n*.gif,*.png,*.jpg형식만 등록이 가능합니다.');
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
	    	            		if(<%=request.getParameter("board_no") %> != "" && <%=request.getParameter("board_no") %> != null){
	    	            			alert("정상적으로 수정되었습니다.");
	    	            			location.href="/customer/localproduct-view?board_no=" + <%=request.getAttribute("board_no") %>;
	    	            		}else{
	    	            			alert("정상적으로 등록되었습니다.");
	    	            			location.href="/customer/localproduct-list";
	    	            			
	    	            		}
	    		        		
	    	            		
	    	            	
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
        <h1>로컬생산품 판로지원</h1>
        <p>한전MCS는 상생기업으로 앞장 서겠습니다.</p>
      </div>
      <ul class="rocation">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/customer/opinion">고객소통</a>
        </li>
        <li>로컬생산품 판로지원</li>
      </ul>
    </div>
    <div class="contents" id="newBusinessWrite"> 
      <div class="conts-ani" data-trigger>
        <h2 class="board-h2">작성하기</h2>
        <form action="" enctype="multipart/form-data">
          <ul class="board-form">
            <li>
              <div class="board-form-tit">제목</div>
              <div class="board-form-conts">
                <input type="text" id="board_title" class="input-style" placeholder="제목을 입력해 주세요" maxlength="50">
              </div>
            </li>
            <li class="board-form-name">
              <div class="board-form-tit">이름</div>
              <div class="board-form-conts">
                <input type="text" id="board_author" class="input-style" placeholder="이름을 입력해 주세요" maxlength="10">
              </div>
            </li>
             <li class="board-form-name">
              <div class="board-form-tit">연락처</div>
              <div class="board-form-conts">
                <input type="text" id="board_phone" class="input-style" placeholder="연락처를 입력해 주세요" maxlength="13">
              </div>
            </li>
            <li class="board-form-name">
              <div class="board-form-tit">판매처 링크</div>
              <div class="board-form-conts">
                <input type="text" id="board_link" class="input-style" placeholder="URL을 입력해 주세요" value="http://" maxlength="200">
              </div>
            </li>
            <li>
              <div class="board-form-tit">상품사진</div>
              <div class="board-form-conts">
                <div class="file-row-wrap">
                  <div class="file-row-form">
                    <input type="file" class="file" id="file_list" accept=".gif, .jpg, .png">
                    <input type="button" class="file-btn" value="파일선택">
                    <input type="hidden" id="board_img">
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
            <li>
              <div class="board-form-tit">내용</div>
              <div class="board-form-conts">
                <textarea name="editor2" id="board_content" class="input-style" style="height:150px" maxlength="100000"></textarea>
              </div>
            </li>
            <li>
              <div class="board-form-tit">비밀번호</div>
              <div class="board-form-conts">
                <input type="password" class="input-style" id="board_pwd" maxlength="50">
              </div>
            </li>
            <li>
              <div class="board-form-tit">비밀번호 확인</div>
              <div class="board-form-conts">
                <input type="password" class="input-style"  id="board_re_pwd" maxlength="50">
              </div>
            </li>
            <li>
              <div class="board-form-tit"></div>
              <div class="board-form-conts">
              <div class="g-recaptcha" data-sitekey="6LfsriQcAAAAAAtLluhB2gz9Kx-mEZlPr_kg3shD"></div>
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

  <div id="footer"></div>

  <div class="btn-top">
    TOP
    <p class="top-line"></p>
  </div>

  <!-- //main -->

  <script>
    
    $("#footer").load("/resources/landing/include/footer.html");
    

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
		$('#board_img').val("");
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
		    $("#file_list").val(" ");
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
	
	function SHA256(s){
	      
        var chrsz   = 8;
        var hexcase = 0;
      
        function safe_add (x, y) {
            var lsw = (x & 0xFFFF) + (y & 0xFFFF);
            var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
            return (msw << 16) | (lsw & 0xFFFF);
        }
      
        function S (X, n) { return ( X >>> n ) | (X << (32 - n)); }
        function R (X, n) { return ( X >>> n ); }
        function Ch(x, y, z) { return ((x & y) ^ ((~x) & z)); }
        function Maj(x, y, z) { return ((x & y) ^ (x & z) ^ (y & z)); }
        function Sigma0256(x) { return (S(x, 2) ^ S(x, 13) ^ S(x, 22)); }
        function Sigma1256(x) { return (S(x, 6) ^ S(x, 11) ^ S(x, 25)); }
        function Gamma0256(x) { return (S(x, 7) ^ S(x, 18) ^ R(x, 3)); }
        function Gamma1256(x) { return (S(x, 17) ^ S(x, 19) ^ R(x, 10)); }
      
        function core_sha256 (m, l) {
             
            var K = new Array(0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1,
                0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3,
                0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786,
                0xFC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
                0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147,
                0x6CA6351, 0x14292967, 0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13,
                0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B,
                0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
                0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A,
                0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208,
                0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2);
 
            var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 
                       0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
 
            var W = new Array(64);
            var a, b, c, d, e, f, g, h, i, j;
            var T1, T2;
      
            m[l >> 5] |= 0x80 << (24 - l % 32);
            m[((l + 64 >> 9) << 4) + 15] = l;
      
            for ( var i = 0; i<m.length; i+=16 ) {
                a = HASH[0];
                b = HASH[1];
                c = HASH[2];
                d = HASH[3];
                e = HASH[4];
                f = HASH[5];
                g = HASH[6];
                h = HASH[7];
      
                for ( var j = 0; j<64; j++) {
                    if (j < 16) W[j] = m[j + i];
                    else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);
      
                    T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
                    T2 = safe_add(Sigma0256(a), Maj(a, b, c));
      
                    h = g;
                    g = f;
                    f = e;
                    e = safe_add(d, T1);
                    d = c;
                    c = b;
                    b = a;
                    a = safe_add(T1, T2);
                }
      
                HASH[0] = safe_add(a, HASH[0]);
                HASH[1] = safe_add(b, HASH[1]);
                HASH[2] = safe_add(c, HASH[2]);
                HASH[3] = safe_add(d, HASH[3]);
                HASH[4] = safe_add(e, HASH[4]);
                HASH[5] = safe_add(f, HASH[5]);
                HASH[6] = safe_add(g, HASH[6]);
                HASH[7] = safe_add(h, HASH[7]);
            }
            return HASH;
        }
      
        function str2binb (str) {
            var bin = Array();
            var mask = (1 << chrsz) - 1;
            for(var i = 0; i < str.length * chrsz; i += chrsz) {
                bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
            }
            return bin;
        }
      
        function Utf8Encode(string) {
            string = string.replace(/\r\n/g,"\n");
            var utftext = "";
      
            for (var n = 0; n < string.length; n++) {
      
                var c = string.charCodeAt(n);
      
                if (c < 128) {
                    utftext += String.fromCharCode(c);
                }
                else if((c > 127) && (c < 2048)) {
                    utftext += String.fromCharCode((c >> 6) | 192);
                    utftext += String.fromCharCode((c & 63) | 128);
                }
                else {
                    utftext += String.fromCharCode((c >> 12) | 224);
                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                    utftext += String.fromCharCode((c & 63) | 128);
                }
      
            }
      
            return utftext;
        }
      
        function binb2hex (binarray) {
            var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
            var str = "";
            for(var i = 0; i < binarray.length * 4; i++) {
                str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
                hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
            }
            return str;
        }
      
        s = Utf8Encode(s);
        return binb2hex(core_sha256(str2binb(s), s.length * chrsz));
      
    }
  </script>

</body>
</html>
