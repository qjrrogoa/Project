package controller.pdm;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;


import model.pdm.BBSDAO;
import model.pdm.BBSDTO;
import model.pdm.FileUtils;

public class WriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("user") != null) {
			req.getRequestDispatcher("/Pdm/Write.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("SUCCFAIL",0);
			req.setAttribute("WHERE","WRI");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
			
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				req.setCharacterEncoding("UTF-8");
				int successOrFail;
					String id = req.getSession().getAttribute("user").toString();
					String title = req.getParameter("title");
					String content = req.getParameter("content");
					String trip = req.getParameter("trip");
					BBSDAO dao = new BBSDAO(req.getServletContext());
					BBSDTO dto = new BBSDTO();
					dto.setId(id);
					dto.setContent(content);
					dto.setTitle(title);
					dto.setTrip(trip);
					successOrFail=dao.insert(dto);
					dao.close();
				req.setAttribute("SUCCFAIL",successOrFail);
				req.setAttribute("WHERE","INS");
				req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
				
	}
}
