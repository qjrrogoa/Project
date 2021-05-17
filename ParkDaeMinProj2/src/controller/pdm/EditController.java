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
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		if(mode !=null) {
			String no = req.getParameter("no");
			BBSDAO dao = new BBSDAO(req.getServletContext());
			String referer=req.getHeader("referer");
			int beginIndex=referer.lastIndexOf("/")+1;
			String prevPage = referer.substring(beginIndex);
			BBSDTO dto = dao.SelectOne(no,prevPage);
			dao.close();
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/Pdm/Edit.jsp").forward(req, resp);
			}
		else {
			req.setCharacterEncoding("UTF-8");
			MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			int successOrFail;
			if(mr !=null) {
				String no = mr.getParameter("no");
				req.setAttribute("no",no);
				req.setAttribute("nowPage", mr.getParameter("nowPage"));
				String originalFilename = mr.getParameter("originalFilename");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				String trip = mr.getParameter("trip");
				String attachfile = mr.getFilesystemName("attachfile");
				if(attachfile==null) {  
					attachfile = originalFilename;
				}
				BBSDAO dao = new BBSDAO(req.getServletContext());
				BBSDTO dto = new BBSDTO();
				dto.setAttachfile(attachfile);
				dto.setTrip(trip);
				dto.setContent(content);
				dto.setTitle(title);
				dto.setNo(no);
				File file=mr.getFile("attachfile");
				String filename=file.getName();
				String ext=filename.substring(filename.lastIndexOf(".")+1);
				if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")||ext.equalsIgnoreCase("JPEG")){
					successOrFail=dao.update(dto);
				}
				else {
					successOrFail=0;
				}
				if(successOrFail ==1 && mr.getFilesystemName("attachfaile")!=null) {//DB업데이트 성공하고 파일 교체시에만 파일 삭제
					FileUtils.deleteFile(req,"/Upload",originalFilename);
				}
				dao.close();
			}
			else { 
				successOrFail = -1;
			}
			req.setAttribute("SUCCFAIL",successOrFail);
			req.setAttribute("WHERE","EDT");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
			
		}
	
	}
}
