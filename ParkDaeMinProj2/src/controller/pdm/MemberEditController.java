package controller.pdm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;
import model.pdm.MemberDTO;

public class MemberEditController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Pdm/MemberEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getSession().getAttribute("user").toString();
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String[] inters = req.getParameterValues("inter");
		String inter="";
		if(inters==null) {
			inter="없음";
		}
		else {
			for(String value:inters) 
				inter+=value + " ";
		}
		String grade = req.getParameter("grade");
		String intro = req.getParameter("intro");
		
		System.out.println(id);
		System.out.println(password);
		System.out.println(name);
		System.out.println(gender);
		System.out.println(inter);
		System.out.println(grade);
		System.out.println(intro);

		MemberDTO dto = new MemberDTO(id, password, name, gender, inter, grade, intro, null);
		BBSDAO dao = new BBSDAO(req.getServletContext());
		
		int affected = dao.MemberEdit(dto);
		System.out.println(affected);
		dao.close();
		req.getRequestDispatcher("/Pdm/Main.jsp").forward(req, resp);
	}
}
