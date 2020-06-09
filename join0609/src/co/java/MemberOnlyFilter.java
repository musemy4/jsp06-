package co.java;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="MemberOnlyFilter", urlPatterns={"*.jsp"})
public class MemberOnlyFilter implements Filter {

    public MemberOnlyFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		String uri = req.getRequestURI();
		//System.out.println("���Ϳ��� uri:"+uri);
		
		String isLogin=(String)session.getAttribute("loginid");
		
		
		//����� ��ó�� �α����ؾ���. msg, uri�� �Բ� ����
		if(uri.equals("/join0608/board.jsp")||uri.equals("/join0608/lecture.jsp")) {//jsp파일중에서 board와 lecture는 멤버제한이 있음
			if(isLogin==null) {
				String msg="u should login";
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp?msg="+msg+"&uri="+uri);
		        dispatcher.forward(request, response);

			}
		}
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {}

}
