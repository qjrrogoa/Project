package controller.pdm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.FileUtils;
import model.pdm.BBSDAO;

public class PasswordController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String no = req.getParameter("no");
		String mode = req.getParameter("mode");
		String originalFilename = req.getParameter("originalFilename");
		String password = req.getParameter("password");
		BBSDAO dao = new BBSDAO(req.getServletContext());
		boolean flag = dao.isCorrectPassword(no,password);
		dao.close();
		
		if(!flag) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out= resp.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않아요');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		
		if("UPDATE".equals(mode)) {
			req.getRequestDispatcher("/PDM/Edit.kosmo").forward(req, resp);
		}
		else {
			dao = new BBSDAO(getServletContext());
			int succOrFail = dao.delete(no);
			dao.close();
			if(succOrFail == 1) {
				FileUtils.deleteFile(req, "/Upload", originalFilename);
			}
			req.setAttribute("SUCCFAIL", succOrFail);
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
		}
	}
}
