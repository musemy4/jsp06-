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
		//System.out.println("필터에서 uri:"+uri);
		
		String isLogin=(String)session.getAttribute("loginid");
		
		
		//보드와 렉처는 로그인해야함. msg, uri와 함께 보냄
		if(uri.equals("/filter_0601/board.jsp")||uri.equals("/filter_0601/lecture.jsp")) {//모든 jsp에서 두 페이지에서 로그인이 필요함
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
