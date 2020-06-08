package co.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.model.DTO;
import co.model.DAO;

/**
 * Servlet implementation class IdchkProc
 */
@WebServlet("/IdchkProc")
public class IdchkProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public IdchkProc() {super();}

	//idchk.jsp에서 검색한 id

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		DAO mdao=DAO.getInstance("jointest");
		
		
		String id = request.getParameter("id"); 
		if(id.equals("")||id==null) {
			writer.println("<script>alert('input something!');</script>");
			writer.println("<script>history.back();</script>");//입력값이 없으면 돌아간다
			return;
		}

		DTO exist=null;
		try {
			exist=mdao.selectUser(id);
		} catch (SQLException e) {e.printStackTrace();}
		

		if(exist==null) {
			System.out.println("없음!");
//			writer.println("<script>alert('ok u can use!');</script>");
//			writer.println("<script>history.back();</script>");//입력값이 없으면 돌아간다
				
			request.setAttribute("idchked", id);
			request.setAttribute("chkedok", "new");
            RequestDispatcher rd = request.getRequestDispatcher("idchk.jsp");
            rd.forward(request, response);
		}else {
			writer.println("<script>alert('id already exist!');</script>");
			writer.println("<script>history.back();</script>");//입력값이 없으면 돌아간다
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
