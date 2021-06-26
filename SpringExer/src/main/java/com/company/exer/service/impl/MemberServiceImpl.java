package com.company.exer.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.company.exer.service.MemberDTO;
import com.company.exer.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	private MemberDAO dao;
	
	@Override
	public int join(Map map) {
		 return dao.join(map);
	}

	@Override
	public boolean login(Map map) {
		return dao.login(map);
	}

	@Override
	public boolean joinCheck(Map map) {
		return dao.joinCheck(map);
	}

	@Override
	public MemberDTO mypage(Map map) {
		return dao.mypage(map);
	}

	@Override
	public int followCheck(Map map) {
		return dao.followCheck(map);
	}

	@Override
	public int followCnt(Map map) {
		return dao.followCnt(map);
	}

	@Override
	public int followerCnt(Map map) {
		return dao.followerCnt(map);
	}

}
