package com.company.exer.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.exer.service.BBSDTO;
import com.company.exer.service.StampDTO;
import com.company.exer.service.StampService;

@Controller
@RequestMapping("/Stamp/")
public class StampController {

	@Resource(name="stampService")
	private StampService stampService;
	
	
	@RequestMapping("Home.do")
	public String stampInsert(Model model) {
		
		//stampService.stampUp();
		List<StampDTO> list= stampService.stampList();
		model.addAttribute("list",list);
		return "home";
	}
	
}
