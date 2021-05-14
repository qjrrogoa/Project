package controller.pdm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;

public class CheckController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String id = req.getParameter("id");
		System.out.println("아이디:"+id);
		BBSDAO dao = new BBSDAO(req.getServletContext());
		boolean flag = dao.Check(id);
		System.out.println(flag);
		dao.close();
		
		if(flag==true) {
//			req.getRequestDispatcher("/Pdm/Membership.jsp").forward(req, resp);
			resp.getWriter().write("1");
		}
		else {
//			req.getRequestDispatcher("/Pdm/Main.jsp").forward(req, resp);
			resp.getWriter().write("-1");
		}

	}
}
