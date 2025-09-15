<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%	//占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙占� null占쏙옙 占쏙옙占쏙옙占쏙옙 占싸븝옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙悶占쏙옙占� 占쏙옙占쏙옙 占쌕띰옙占싹댐옙.
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

    String sSiteCode = "BV413";				// NICE占싸븝옙占쏙옙 占싸울옙占쏙옙占쏙옙 占쏙옙占쏙옙트 占쌘듸옙
    String sSitePassword = "py5Jt1RPSwrJ";			// NICE占싸븝옙占쏙옙 占싸울옙占쏙옙占쏙옙 占쏙옙占쏙옙트 占싻쏙옙占쏙옙占쏙옙

    String sCipherTime = "";			// 占쏙옙호화占쏙옙 占시곤옙
    String sRequestNumber = "";			// 占쏙옙청 占쏙옙호
    String sResponseNumber = "";		// 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호
    String sAuthType = "";				// 占쏙옙占쏙옙 占쏙옙占쏙옙
    String sName = "";					// 占쏙옙占쏙옙
    String sDupInfo = "";				// 占쌩븝옙占쏙옙占쏙옙 확占싸곤옙 (DI_64 byte)
    String sConnInfo = "";				// 占쏙옙占쏙옙占쏙옙占쏙옙 확占싸곤옙 (CI_88 byte)
    String sBirthDate = "";				// 占쏙옙占쏙옙占쏙옙占�(YYYYMMDD)
    String sGender = "";				// 占쏙옙占쏙옙
    String sNationalInfo = "";			// 占쏙옙/占쌤깍옙占쏙옙占쏙옙占쏙옙 (占쏙옙占쌩곤옙占싱듸옙 占쏙옙占쏙옙)
	String sMobileNo = "";				// 占쌨댐옙占쏙옙占쏙옙호
	String sMobileCo = "";				// 占쏙옙탈占�
    String sMessage = "";
    String sPlainData = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // 占쏙옙占쏙옙타占쏙옙 占쏙옙占쏙옙占쌌니댐옙.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType		= (String)mapresult.get("AUTH_TYPE");
        sName			= (String)mapresult.get("NAME");
		//sName			= (String)mapresult.get("UTF8_NAME"); //charset utf8 占쏙옙占쏙옙 占쌍쇽옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占�
        sBirthDate		= (String)mapresult.get("BIRTHDATE");
        sGender			= (String)mapresult.get("GENDER");
        sNationalInfo  	= (String)mapresult.get("NATIONALINFO");
        sDupInfo		= (String)mapresult.get("DI");
        sConnInfo		= (String)mapresult.get("CI");
        sMobileNo		= (String)mapresult.get("MOBILE_NO");
        sMobileCo		= (String)mapresult.get("MOBILE_CO");

        session.setAttribute("sResponseNumber", sResponseNumber);
        
        String session_sRequestNumber = "KEPCOMCSPOLICY";
        if(!sRequestNumber.equals(session_sRequestNumber))
        {
            sMessage = "占쏙옙占실곤옙 占쏙옙占쏙옙치 占쏙옙占쏙옙占쌉니댐옙.";
            sResponseNumber = "";
            sAuthType = "";
        }
    }
    else if( iReturn == -1)
    {
        sMessage = "占쏙옙호화 占시쏙옙占쏙옙 占쏙옙占쏙옙占쌉니댐옙.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "占쏙옙호화 처占쏙옙 占쏙옙占쏙옙占쌉니댐옙.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "占쏙옙호화 占쌔쏙옙 占쏙옙占쏙옙占쌉니댐옙.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "占쏙옙호화 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌉니댐옙.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "占쌉뤄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌉니댐옙.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "占쏙옙占쏙옙트 占싻쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌉니댐옙.";
    }    
    else
    {
        sMessage = "占싯쇽옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌉니댐옙. iReturn : " + iReturn;
    }

%>
<%!

	public String requestReplace (String paramValue, String gubun) {

        String result = "";
        
        if (paramValue != null) {
        	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;
            
        }
        return result;
  }
%>
  <script src="/resources/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/landing/js/jquery.waypoints.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
$(document).ready(function() {
	$.cookie('kepcomcssResponseNumber', '<%=sResponseNumber%>');
	$.cookie('authorName', '<%=sName%>');
	$.cookie('authorHp', '<%=sMobileNo%>');
	opener.location.href="/mber/esg/social/socialinquiry-form";
	self.close(); 
});
///////
</script>
<html>
<head>
    <title>NICE占쏙옙占쏙옙占쏙옙 - CheckPlus 占싫심븝옙占쏙옙占쏙옙占쏙옙 占쌓쏙옙트</title>
</head>
<body>
    <center>
    <p><p><p><p>
    占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싹뤄옙 占실억옙占쏙옙占싹댐옙.<br>
    <table border=1>
        <tr>
            <td>占쏙옙호화占쏙옙 占시곤옙</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
        </tr>
        <tr>
            <td>占쏙옙청 占쏙옙호</td>
            <td><%= sRequestNumber %></td>
        </tr>            
        <tr>
            <td>NICE占쏙옙占쏙옙 占쏙옙호</td>
            <td><%= sResponseNumber %></td>
        </tr>            
        <tr>
            <td>占쏙옙占쏙옙占쏙옙占쏙옙</td>
            <td><%= sAuthType %></td>
        </tr>
		<tr>
            <td>占쏙옙占쏙옙</td>
            <td><%= sName %></td>
        </tr>
		<tr>
            <td>占쌩븝옙占쏙옙占쏙옙 확占싸곤옙(DI)</td>
            <td><%= sDupInfo %></td>
        </tr>
		<tr>
            <td>占쏙옙占쏙옙占쏙옙占쏙옙 확占싸곤옙(CI)</td>
            <td><%= sConnInfo %></td>
        </tr>
		<tr>
            <td>占쏙옙占쏙옙占쏙옙占�(YYYYMMDD)</td>
            <td><%= sBirthDate %></td>
        </tr>
		<tr>
            <td>占쏙옙占쏙옙</td>
            <td><%= sGender %></td>
        </tr>
				<tr>
            <td>占쏙옙/占쌤깍옙占쏙옙占쏙옙占쏙옙</td>
            <td><%= sNationalInfo %></td>
        </tr>
        </tr>
			<td>占쌨댐옙占쏙옙占쏙옙호</td>
            <td><%= sMobileNo %></td>
        </tr>
		<tr>
			<td>占쏙옙탈占�</td>
			<td><%= sMobileCo %></td>
        </tr>
		<tr>
			<td colspan="2">占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占싹뱄옙占쏙옙占쏙옙 占쏙옙 占쌍쏙옙占싹댐옙. <br>
			占싹븝옙 占쏙옙占쏙옙占쏙옙占� null占쏙옙 占쏙옙占싹되댐옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙占� 占실댐옙 占쏙옙占싸쇽옙(02-2122-4615)占쏙옙 占쏙옙占실바띰옙占싹댐옙.</td>
		</tr>
		</table><br><br>        
    <%= sMessage %><br>
    </center>
</body>
</html>