package bean;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	/*쿠키를 <쿠키이름, 쿠키객체>쌍 형태로 저장하는 맵을 생성 */
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	public Cookies(HttpServletRequest request)  // 요청 http서블릿리퀘스트 클래스에 파라미터 request전달 받아 
	{
		Cookie[] cookies=request.getCookies(); // Cookie배열을 읽어와 각각의 Cookie객체를 CookieMap에 저장한다. 
		if(cookies != null) 
		{
			for(int i=0;i<cookies.length;i++) 
			{
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	public Cookie getCookie(String name) //위 쿠키맵에 지정된 이름의 쿠키 객체를 구한다. 존재하지 않으면 null을 리턴.
	{
		return cookieMap.get(name);
	}
	
	public String getValue(String name) throws IOException // 도메인 설정하지 않은 쿠기 추가.?
	{
		Cookie cookie = cookieMap.get(name);
		if(cookie==null)
		{
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "euc-kr");
	}
	
	public boolean exists(String name) 	// 지정 이름의 Cookie가 존재하면 true, 아니면 false 리턴
	{
		return cookieMap.get(name) != null;
	}
	
	public static Cookie createCookie(String name, String value) throws IOException
	{	// 이름이 name 값이 value 인 쿠키 객체 생성&리턴
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}
	
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException
	{	// + 경로, 유효시간maxAge인 쿠키 객체 생성&리턴
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException
	{	// +도메인 
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
}
