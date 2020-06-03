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
 * ���� ��ü�� �α��� ������ ���
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	String memberid="nana";
	String memberpw="1234";
	
	///////////////////// �޼���
	boolean checkUser(String inputid, String inputpw) {
		if(memberid.equals(inputid)) {
			return memberpw.equals(inputpw);
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
	
		System.out.println("isRemembered(remember):"+isRemembered(remember));
		
		//�α�������
		String isLogin=(String)session.getAttribute("loginid");
		if(isLogin==null) { //�α��εǾ����������� �α��� ��
			
			//�α��� ������!
			if(checkUser(inputid,inputpw)) {//�α��μ�����

				//remember ��Ű ����
				if(isRemembered(remember)) {//������� üũ�Ǿ������� ��Ű�� ����
					createCookies("rememberid", memberid,response);//member�Ǿ�������
					System.out.println("��Ű����!");
					
				}else{
					removeCookie(request.getCookies(),"rememberid",memberid,response);
					System.out.println("��Ű������");
					
				}
				
				//�ּҰ���: ��𿡼� �α����� �����ߴ���
				String from=(String)request.getParameter("from");
				//System.out.println("��𼭿Դ�?loginAction:"+from);//�׳� �α��ο��� ������  null�̶�ž� �Ƹ�?
				
				session.setAttribute("loginid", memberid);
				response.sendRedirect(from);
			}else {
				//checkUser==false
				writer.println("<script>alert('error in inputs!');</script>");
				writer.println("<script>history.back();</script>");
				
			}
		} else {//�α����� �̵̹Ǿ������� �α׾ƿ���ư�̴�
						
			session.removeAttribute("loginid");//��������
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
