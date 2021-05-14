package controller.pdm;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.PagingUtil;
import model.pdm.BBSDAO;
import model.pdm.BBSDTO;

public class ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//가]사용자 요청을 받는다	
				//나]요청을 분석한다.
				//다]모델에서 필요한 로직 호출해서 결과값이 있으면 받기
				BBSDAO dao = new BBSDAO(req.getServletContext());
				Map map = new HashMap();
				//페이징을 위한 로직 시작]
				//전체 레코드수	
				int totalRecordCount=dao.getTotalRecordCount();
				//페이지 사이즈 
				int pageSize =Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
				//블락페이지
				int blockPage=Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));
				//전체 페이지수
				int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
				//현재 페이지 번호
				int nowPage=req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
				//시작 및 끝 ROWNUM구하기
				int start = (nowPage -1)*pageSize+1;
				int end = nowPage * pageSize;
				//페이징을 위한 로직 끝]
				map.put("start", start);
				map.put("end", end);
				List<BBSDTO> list = dao.selectList(map);
				dao.close();
				//페이징관련 로직 호출
				String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/PDM/List.kosmo?");
				
				//라]결과값이 있으면 리퀘스트 영역에 저장
				req.setAttribute("list", list);
				//페이징과 관련된 속성들]
				req.setAttribute("pagingString",pagingString);
				req.setAttribute("totalRecordCount", totalRecordCount);
				req.setAttribute("pageSize", pageSize);
				req.setAttribute("nowPage", nowPage);
				//마]결과값을 뿌려줄 뷰(JSP페이지) 선택후 포워딩
				//뷰선택]
				req.getRequestDispatcher("/Pdm/List.jsp").forward(req, resp);
				//포워딩]
				
			}////////////
	}
