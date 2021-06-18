package com.company.exer.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.exer.service.MemberService;

@Controller
@RequestMapping("/Member/")
public class MemberController {

	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="Join.do",method = RequestMethod.GET)
	public String Join() {
		return "member/Join";
	}
	
	@RequestMapping(value="Join.do",method = RequestMethod.POST)
	public String JoinOk(@RequestParam Map map, HttpSession session) {
		
		int affected = memberService.join(map);
		if(affected==1) {
			session.setAttribute("id",map.get("id"));
			return "forward:/BBS/List.do";
		}
		else
			return "member/Join";
	}
	
	@RequestMapping(value="Login.do",method = RequestMethod.GET)
	public String Login() {
		return "member/Login";
	}
	
	@RequestMapping(value="Login.do",method = RequestMethod.POST)
	public String LoginOk(@RequestParam Map map, Model model, HttpSession session) {
		boolean flag = memberService.login(map);
		if(flag) {
			session.setAttribute("id",map.get("id"));
		}
		else {
			model.addAttribute("NotMember","아뒤와 비번이 틀려요");
		}
		return "forward:/BBS/List.do";
	}
	
	@RequestMapping("Logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
}

