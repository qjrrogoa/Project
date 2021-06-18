package com.company.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.test.service.TestDTO;
import com.company.test.service.TestService;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO dao;
	@Override
	public int insert(TestDTO dto) {	
		//1.회원아이디 중복 체크
		int count=dao.isExistMember(dto);
		//2.중복 아이디가 아니면 insert ,중복이면 -1반환
		if(count ==1) return -1;	
		
		return dao.insert(dto);
	}///

}
