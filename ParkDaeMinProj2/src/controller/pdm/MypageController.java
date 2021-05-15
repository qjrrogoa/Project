package controller.pdm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;
import model.pdm.MemberDTO;

public class MypageController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getSession().getAttribute("user").toString();
		BBSDAO dao = new BBSDAO(req.getServletContext());
		MemberDTO dto = dao.Mypage(id);
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Pdm/Mypage.jsp").forward(req, resp);
	}
	
}
