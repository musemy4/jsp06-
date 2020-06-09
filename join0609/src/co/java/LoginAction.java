package co.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.model.DAO;
import co.model.DTO;


@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	DAO dao = DAO.getInstance("jointest");
	
	
	///////////////////// �޼���
	boolean checkUser(String inputid, String inputpw) {
		DTO user=null;
		try {
			 user=dao.selectUser(inputid);//db에서 정보를 가져온다.
		} catch (SQLException e) {e.printStackTrace();}
		
		if(user==null)return false;
		if(user.getId().equals(inputid)) {
			return user.getPw().equals(inputpw);
		}
		return false;
	}

	boolean isRemembered(String remember) {//on�̳� null
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
	
	///////////////////// doget����
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		String inputid=(String)request.getParameter("inputid");
		String inputpw=(String)request.getParameter("inputpw");
		String remember=(String)request.getParameter("remember");
	
		
		String isLogin=(String)session.getAttribute("loginid");
		if(isLogin==null) { //로그인 될수있는 상태이면
			
			if(checkUser(inputid,inputpw)) {//

				//remember
				if(isRemembered(remember)) {
					createCookies("rememberid", inputid,response);
					System.out.println("��Ű����!");
					
				}else{
					removeCookie(request.getCookies(),"rememberid",inputid,response);
					System.out.println("��Ű������");
					
				}
				
				String from=(String)request.getParameter("from");
				
				session.setAttribute("loginid", inputid);
				response.sendRedirect(from);
			}else {
				//checkUser==false
				writer.println("<script>alert('error in inputs!');</script>");
				writer.println("<script>history.back();</script>");
				
			}
		} else {
						
			session.removeAttribute("loginid");
			writer.println("<script>alert('logout Success!');</script>");
			writer.println("<script>location.href='/join0608/index.jsp'</script>");
		}

		
				
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
