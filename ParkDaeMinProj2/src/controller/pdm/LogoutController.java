package controller.pdm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().invalidate();
		//로그아웃 처리후 로그인 페이지로 이동]
		resp.sendRedirect(req.getContextPath()+"/Pdm/Main.jsp");
	
	}
}
