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
				MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
				int successOrFail;
				if(mr !=null) {//파일 업로드 성공일때 DB 입력처리]
					String id = req.getSession().getAttribute("user").toString();
					String title = mr.getParameter("title");
					String content = mr.getParameter("content");
					String trip = mr.getParameter("trip");
					String attachfile = mr.getFilesystemName("attachfile");
					//데이타베이스 CRUD작업과 관련된 모델 호출]
					BBSDAO dao = new BBSDAO(req.getServletContext());
					BBSDTO dto = new BBSDTO();
					dto.setId(id);
					dto.setAttachfile(attachfile);
					dto.setContent(content);
					dto.setTitle(title);
					dto.setTrip(trip);
					File file=mr.getFile("attachfile");
					String filename=file.getName();
					String ext=filename.substring(filename.lastIndexOf(".")+1);
					if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")||ext.equalsIgnoreCase("JPEG")){
						successOrFail=dao.insert(dto);
					}
					else {
						successOrFail=0;
					}
					
					if(successOrFail ==0) {
						FileUtils.deleteFile(req,"/Upload",attachfile);
					}
					dao.close();
				}
				else {
					successOrFail = -1;
				}
			
				//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
				req.setAttribute("SUCCFAIL",successOrFail);
				req.setAttribute("WHERE","INS");
				req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
				
	}
}
