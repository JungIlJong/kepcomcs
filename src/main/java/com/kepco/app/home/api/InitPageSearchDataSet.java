package com.kepco.app.home.api;

import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class InitPageSearchDataSet {
	
	
	private static final InitPageSearchDataSet instance = new InitPageSearchDataSet();
	private Boolean first_bool = false;
	private String TestStr = "";
	private List<Map<String, String>> pages = null;
	public InitPageSearchDataSet() {
		// TODO Auto-generated constructor stub
		 try {
	        	
	        	System.out.println(getCurrentData()+" Start InitPageSearchDataSet");
	        	System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
	        	System.out.println("Start Crwaler");
	        	System.out.println(getCurrentData()+" End InitPageSearchDataSet");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static InitPageSearchDataSet getInstance() {
		
        return instance;
    }
	public void logic() {
        System.out.println("싱글톤 객체 로직 호출");
    }
	public String getCurrentData()
	{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
	}
	
	public void setPageController(RequestMappingHandlerMapping requestHandlerMapping) {
		setFirst_bool(true);
		try {
			InitPageSearchDataSet test = InitPageSearchDataSet.getInstance();
		
			System.out.println("setPageController");
			List<Map<String, String>> pages = new ArrayList<Map<String, String>>();
	
			List<Map<String, String>> result = new ArrayList<Map<String, String>>();
	
			Map<RequestMappingInfo, HandlerMethod> map = requestHandlerMapping.getHandlerMethods();
	
			for (Entry<RequestMappingInfo, HandlerMethod> elem : map.entrySet()) {
	
				RequestMappingInfo key = elem.getKey();
	
				HandlerMethod method = elem.getValue();
				String path = "";
				if(key.getPatternsCondition().getPatterns().toArray()[0] != null)
				{
					path = String.valueOf(key.getPatternsCondition().getPatterns().toArray()[0]);
				}
				else
				{
					
				}
				if(method.getMethod().getDeclaringClass().getName().indexOf("com.kepco.app.mcs.home") > -1 && method.getMethod().getReturnType().getSimpleName().indexOf("String") > -1 && path.indexOf("/{") < 0 && method.getMethod().getDeclaringClass().getName().indexOf("com.kepco.app.home.api") < 0)
				{
					Map<String, String> item = new HashMap<String, String>();
		
					
					item.put("path",path);
		
					item.put("cls", method.getMethod().getDeclaringClass().getSimpleName());
		
					item.put("method", method.getMethod().getName());
		
						
					StringBuffer sb = new StringBuffer();
		
					for (MethodParameter param : method.getMethodParameters()) {
		
						sb.append(param.getParameterType().getSimpleName()).append(", ");
		
					}
		
					if (sb.toString().length() > 0) {
		
						item.put("param", sb.toString().substring(0, sb.toString().length() - 2));
		
					} else {
		
						item.put("param", "");
		
					}
					String rtn = "";
					if(method.getMethod().getReturnType().getSimpleName() != null)
					{
						rtn = method.getMethod().getReturnType().getSimpleName();
					}
		
					item.put("rtn", rtn);
					HashMap<String,String> pageData = getHtmlText(item.get("path"));
					
					if(!pageData.get("title").trim().equals(""))
					{
						item.put("title", pageData.get("title"));
						item.put("value", pageData.get("value"));
						pages.add(item);
					}
				}
	
			}
			
			test.setPages(pages);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public HashMap<String,String> getHtmlText(String path) {
		//String url = "https://www.kepcomcs.co.kr"+path;
		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
		String url = "https://www.kepcomcs.co.kr"+path;
		System.out.println("getHtmlText : "+url);
		String htmlText = "";
		String title= "";
		HashMap<String,String> htmlData = new HashMap<String,String>();
		if(!path.equals("/setsearchpage") && !path.equals("/robots.txt") )
		{
			try {
				TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager(){
		            public X509Certificate[] getAcceptedIssuers(){return new X509Certificate[0];}
		            public void checkClientTrusted(X509Certificate[] certs, String authType){}
		            public void checkServerTrusted(X509Certificate[] certs, String authType){}
	    		}};
				SSLContext sc = SSLContext.getInstance("TLS");
		        sc.init(null, trustAllCerts, new SecureRandom());
		        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	
		        Connection con = Jsoup.connect(url);
		        Response res = con.execute();
				System.out.println(new ObjectMapper().writeValueAsString(res.headers()));
				con.cookies(res.headers());
			    Document doc2 = con.get();
			    Elements bodyTag = doc2.getElementsByTag("body");//doc2.select("body");
			    //bodyTag.get(0).getElementsByTag("h1").get(0).text();
			    title= bodyTag.get(0).getElementsByTag("h1").get(0).text(); 
			    		//bodyTag.get(0).select(".page-tit-wrap h1").text();
			    
			    htmlText= bodyTag.get(0).select("main").text();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				htmlText = "";
				title= "";
			}
		}
		htmlData.put("title",title);
		htmlData.put("value",htmlText);
		return htmlData;
	}
	
	public void getPageController() {
		
		if(this.pages.size() > 0)
		{
			System.out.println(this.pages.size());
		}
		else
		{
			System.out.println("No Pages");
		}
	}
	
	
	

	
	public Boolean getFirst_bool() {
		return first_bool;
	}

	public void setFirst_bool(Boolean first_bool) {
		this.first_bool = first_bool;
	}

	public String getTestStr() {
		return this.TestStr;
	}

	public void setTestStr(String testStr) {
		this.TestStr = testStr;
	}

	public List<Map<String, String>> getPages() {
		return this.pages;
	}

	public void setPages(List<Map<String, String>> pages) {
		this.pages = pages;
	}
	
	
}
