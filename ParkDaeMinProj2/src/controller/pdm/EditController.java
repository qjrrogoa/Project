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
		if(mode !=null) {//수정 폼으로 이동
		//파라미터 받기
			String no = req.getParameter("no");
			//모델 호출 및 결과 값 받기
			BBSDAO dao = new BBSDAO(req.getServletContext());
			String referer=req.getHeader("referer");
			int beginIndex=referer.lastIndexOf("/")+1;
			String prevPage = referer.substring(beginIndex);
			BBSDTO dto = dao.SelectOne(no,prevPage);
			dao.close();
			//리퀘스트 영역에 저장]
			req.setAttribute("dto", dto);
			//포워드]
			req.getRequestDispatcher("/Pdm/Edit.jsp").forward(req, resp);
			}
		else {//수정처리
			//한글처리]
			req.setCharacterEncoding("UTF-8");
			//3]요청분석- 입력처리 요청
			//4]모델호출 및 결과값 받기
			//파일 업로드와 관련된 모델(비지니스 로직) 호출
			MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			//DB입력 성공시에는 1, 실패시0, 파일용량 초과시에는 -1
			int successOrFail;
			if(mr !=null) {//파일을 첨부 안했거나 혹은 첨부 했다면 500kb이하
				String no = mr.getParameter("no");
				//※MultipartRequest가 파라미터를
				//가로챔으로 포워드 하더라도 파라미터가 전달되지 않는다.
				//그래서 리퀘스트 영역에 저장
				//키값을 리퀘스트 영역에 저장] 수정 완료후 View.kosmo로 이동하기 위함
				req.setAttribute("no",no);
				//현재 페이지번호를 리퀘스트 영역에 저장
				req.setAttribute("nowPage", mr.getParameter("nowPage"));
				String originalFilename = mr.getParameter("originalFilename");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				String trip = mr.getParameter("trip");
				String attachfile = mr.getFilesystemName("attachfile");
				if(attachfile==null) { // 파일 미 첨부 즉 수정시 기존 파일을 새로운 파일로 미 교체
					attachfile = originalFilename;
				}
				
				//데이타베이스 CRUD작업과 관련된 모델 호출]
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
					//파일 삭제 로직 호출]
					FileUtils.deleteFile(req,"/Upload",originalFilename);
				}
				dao.close();
			}
			else {//파일 용량 초과시
				successOrFail = -1;
			}
			//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			req.setAttribute("SUCCFAIL",successOrFail);
			//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
			req.setAttribute("WHERE","EDT");
			//6]뷰로 이동
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
			
		}
	
	}
}
