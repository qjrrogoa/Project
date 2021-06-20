package com.company.exer.web;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.company.exer.service.BBSDTO;
import com.company.exer.service.BBSService;

@SessionAttributes({"id"})
@Controller
@RequestMapping("/BBS")
public class BBSController {

	@Resource(name="bbsService")
	private BBSService bbsService; 
	

	@RequestMapping("List.do")
	public String List(Model model) {
		List<BBSDTO> list = bbsService.selectList();
		model.addAttribute("list",list);
		System.out.println(list);
		return "bbs/List";
	}
	
	@RequestMapping(value="Write.do",method = RequestMethod.GET)
	public String Write() {
		return "bbs/Write";
	}
	
	@RequestMapping(value="Write.do",method = RequestMethod.POST)
	public String WriteOk(@RequestParam Map map,@ModelAttribute("id") String id) {
		map.put("id", id);
		bbsService.insert(map);
		return "forward:/BBS/List.do";
	}
	
	@RequestMapping("View.do")
	public String View(Model model,
			HttpServletRequest req,
			@RequestParam Map map
			) {
		if(req.getSession().getAttribute("id")!=null) {
		String id = req.getSession().getAttribute("id").toString();
		map.put("id", id);
		int check = bbsService.likeCheck(map);
		BBSDTO dto = bbsService.selectOne(map);
		dto.setLikecheck(check);
		model.addAttribute("dto",dto);
		}
		else {
			BBSDTO dto = bbsService.selectOne(map);
			model.addAttribute("dto",dto);
		}
		return "bbs/View";
	}
	
	@RequestMapping(value="Edit.do", method = RequestMethod.GET)
	public String Edit(@RequestParam Map map,Model model ) {
		BBSDTO dto = bbsService.selectOne(map);
		model.addAttribute("dto",dto);
		return "bbs/Edit";
	}
	
	@RequestMapping(value="Edit.do",method = RequestMethod.POST)
	public String EditOk(@RequestParam Map map,Model model) {
		BBSDTO dto = bbsService.selectOne(map);
		model.addAttribute("dto",dto);
		bbsService.update(map);
		return "forward:/BBS/List.do";
	}
	
	@RequestMapping("Delete.do")
	public String delete(@RequestParam Map map) {
		bbsService.delete(map);
		return "forward:/BBS/List.do";
	}
	
	@RequestMapping(value="Like.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String Like(@RequestParam Map map) throws IOException {
		int check = bbsService.likeCheck(map);
		if(check==0) {
			bbsService.like(map);
			//bbsServic  e.stampInsert(map);
		}
		else {
			bbsService.unlike(map); 
		}
		
		bbsService.likeCount(map);
		BBSDTO dto=bbsService.selectOne(map);
		if(dto.getLikecount()>=2) {
			bbsService.stampInsert(map);
		}
		return check+"";
	}
	
	
}
