package com.company.test.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.test.service.TestDTO;
import com.company.test.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	private TestService service;
	//입력처리
	@RequestMapping(value="/join",method = RequestMethod.POST)
	public String join(TestDTO dto,Model model) {
		//서비스 호출
		int result=service.insert(dto);
		if(result ==-1) {
			model.addAttribute("message", "이미 중복된 아이디가 있어요");
			return "Join";
		}
		else if(result ==-2) {
			model.addAttribute("message", "입력값이 너무 커요");
			return "Join";
		}
		//회원가입 완료시 메인으로
		return "forward:/";
	}
	//입력폼으로 이동
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String joinForm() {
		return "Join";
	}
	
}
