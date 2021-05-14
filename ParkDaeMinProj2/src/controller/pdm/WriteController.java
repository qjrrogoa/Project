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
			//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
			req.setAttribute("WHERE","WRI");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
			
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글처리]
				req.setCharacterEncoding("UTF-8");
				//3]요청분석- 입력처리 요청
				//4]모델호출 및 결과값 받기
				//파일 업로드와 관련된 모델(비지니스 로직) 호출
				MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
				//DB입력 성공시에는 1, 실패시0, 파일용량 초과시에는 -1
				int successOrFail;
				if(mr !=null) {//파일 업로드 성공일때 DB 입력처리]
					String id = req.getSession().getAttribute("user").toString();
					String title = mr.getParameter("title");
					String content = mr.getParameter("content");
					String trip = mr.getParameter("trip");
					String attachFile = mr.getFilesystemName("attachFile");
					//데이타베이스 CRUD작업과 관련된 모델 호출]
					BBSDAO dao = new BBSDAO(req.getServletContext());
					BBSDTO dto = new BBSDTO();
					dto.setId(id);
					dto.setAttachfile(attachFile);
					dto.setContent(content);
					dto.setTitle(title);
					dto.setTrip(trip);
					File file=mr.getFile("attachFile");
					String filename=file.getName();
					String ext=filename.substring(filename.lastIndexOf(".")+1);
					if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")||ext.equalsIgnoreCase("JPEG")){
						successOrFail=dao.insert(dto);
					}
					else {
						successOrFail=0;
					}
					
					if(successOrFail ==0) {//데이터 입력 실패시 업로된 파일 삭제
						//파일 삭제 로직 호출]
						FileUtils.deleteFile(req,"/Upload",attachFile);
					}
					dao.close();
				}
				else {//파일 용량 초과시
					successOrFail = -1;
				}
			
				//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
				req.setAttribute("SUCCFAIL",successOrFail);
				//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
				req.setAttribute("WHERE","INS");
				//[이동방법1] - 바로 목록으로 이동 : 반드시 List.jsp가 아닌 List.kosmo로
				//req.getRequestDispatcher("/DataRoom/List.kosmo").forward(req, resp);
				//[이동방법2] - 메시지 뿌려주는 jsp페이지로 이동 후 목록으로 이동
				req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
				
	}
}
