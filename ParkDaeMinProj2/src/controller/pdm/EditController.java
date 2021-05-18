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

public class EditController extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		//req.getRequestDispatcher("/Pdm/Edit.jsp?no="+no).forward(req, resp);
		System.out.println("get방식 no:"+no);
		req.getRequestDispatcher("/Pdm/Edit.jsp?").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			String no = req.getParameter("no");
			System.out.println("post방식 no:"+no);
			
			req.setAttribute("nowPage", req.getParameter("nowPage"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String trip = req.getParameter("trip");
			
			System.out.println(title);
			System.out.println(content);
			System.out.println(trip);
			BBSDAO dao = new BBSDAO(req.getServletContext());
			BBSDTO dto = new BBSDTO();
			dto.setTrip(trip);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setNo(no);
			int successOrFail=dao.update(dto);
			dao.close();
			req.setAttribute("WHERE","EDT");
			req.setAttribute("SUCCFAIL",successOrFail);
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
			
	}
}
