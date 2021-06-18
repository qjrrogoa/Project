package com.company.exer.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.company.exer.service.MemberService;

@Service("memberService")
public class MemberSeiviceImpl implements MemberService {
	
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

}
