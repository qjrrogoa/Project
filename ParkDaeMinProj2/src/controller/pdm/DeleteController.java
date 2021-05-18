package controller.pdm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;
import model.pdm.FileUtils;

public class DeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		BBSDAO dao = new BBSDAO(req.getServletContext());
		int succOrFail = dao.delete(no);
		dao.close();
		req.setAttribute("SUCCFAIL", succOrFail);
		req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
	}
}
