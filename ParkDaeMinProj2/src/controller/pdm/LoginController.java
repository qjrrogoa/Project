package controller.pdm;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;
import model.pdm.BBSDTO;
import model.pdm.MemberDTO;

public class LoginController extends HttpServlet{
	
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher("/Pdm/Login.jsp").forward(req, resp);
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");

			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			BBSDAO dao = new BBSDAO(req.getServletContext());

			boolean flag = dao.IsMember(id,password);
			System.out.println(id);
			System.out.println(password);
			System.out.println(flag);
			if(flag==true) {
				resp.sendRedirect(req.getContextPath()+"/Pdm/Main.jsp");
				req.getSession().setAttribute("user",id);
			}
			else {
				req.setAttribute("WHERE", "LOG");
				req.setAttribute("SUCCFAIL",0);
				req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
			}
		}
}
