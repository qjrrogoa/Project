package com.company.exer.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.exer.service.FollowDTO;
import com.company.exer.service.FollowService;
import com.company.exer.service.ReviewService;

@Controller
@RequestMapping("/Follow/")
public class FollowController {
	
	@Resource(name="followService")
	private FollowService followService;

	@RequestMapping(value="follow.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String follow(@RequestParam Map map) {
		int check = followService.followCheck(map);
		if(check==0) {
			followService.follow(map);
		}
		else {
			followService.unFollow(map);
		}
		return check+"";
	}
	
	@RequestMapping("followerList")
	public @ResponseBody List followerList(@RequestParam Map map,Model model) {
		System.out.println("asdfasdfasdf"+map.get("followId"));
		List<FollowDTO> followerList = followService.followerList(map);
		model.addAttribute("followerList",followerList);
		return followerList;
	}
	
	@RequestMapping("followList")
	public @ResponseBody List followList(@RequestParam Map map,Model model) {
		List<FollowDTO> followList = followService.followList(map);
		model.addAttribute("followList",followList);
		
		System.out.println("followList" + followList);

		return followList;
	}
	
}
