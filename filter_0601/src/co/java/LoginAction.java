package co.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 서버 전체의 로그인 세션을 담당
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	String memberid="nana";
	String memberpw="1234";
	
	///////////////////// 메서드
	boolean checkUser(String inputid, String inputpw) {
		if(memberid.equals(inputid)) {
			return memberpw.equals(inputpw);
		}
		return false;
	}

	boolean isRemembered(String remember) {//on이나 null
		return remember!=null;
	}
		
	void createCookies(String key, String value, HttpServletResponse response) {
		Cookie cookie=new Cookie(key,value);
		response.addCookie(cookie);
	}
	
	void removeCookie(Cookie[] cookies, String key, String value, HttpServletResponse response) {
		if(cookies!=null) {
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals(key)){
					Cookie cookie = new Cookie(key,value);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	}
	
	String getCookieValue(Cookie[] cookies,String key){
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals(key)){
					return cookies[i].getValue();
				}
			}
		} return null;
	}
	
	///////////////////// doget시작
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		String inputid=(String)request.getParameter("inputid");
		String inputpw=(String)request.getParameter("inputpw");
		String remember=(String)request.getParameter("remember");
	
		System.out.println("isRemembered(remember):"+isRemembered(remember));
		
		//로그인제어
		String isLogin=(String)session.getAttribute("loginid");
		if(isLogin==null) { //로그인되어있지않으면 로그인 들어감
			
			//로그인 성공시!
			if(checkUser(inputid,inputpw)) {//로그인성공시

				//remember 쿠키 제어
				if(isRemembered(remember)) {//리멤버가 체크되어있으면 쿠키를 굽자
					createCookies("rememberid", memberid,response);//member되어있으면
					System.out.println("쿠키생성!");
					
				}else{
					removeCookie(request.getCookies(),"rememberid",memberid,response);
					System.out.println("쿠키없어짐");
					
				}
				
				//주소관리: 어디에서 로그인을 접근했는지
				String from=(String)request.getParameter("from");
				//System.out.println("어디서왔니?loginAction:"+from);//그냥 로그인에서 왔으면  null이뜰거야 아마?
				
				session.setAttribute("loginid", memberid);
				response.sendRedirect(from);
			}else {
				//checkUser==false
				writer.println("<script>alert('error in inputs!');</script>");
				writer.println("<script>history.back();</script>");
				
			}
		} else {//로그인이 이미되어있으면 로그아웃버튼이다
						
			session.removeAttribute("loginid");//세션제거
			writer.println("<script>alert('logout Success!');</script>");
			writer.println("<script>location.href='/filter_0601/index.jsp'</script>");
		}

		
				
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
