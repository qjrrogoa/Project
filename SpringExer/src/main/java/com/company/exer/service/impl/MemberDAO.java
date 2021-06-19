package com.company.exer.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.exer.service.MemberService;

@Repository("memberDAO")
public class MemberDAO {

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public int join(Map map) {
		return sqlMapper.insert("memberJoin",map);
	}

	public boolean login(Map map) {
		return sqlMapper.selectOne("memberLogin",map);
	}

	public boolean joinCheck(Map map) {
		return sqlMapper.selectOne("memberJoinCheck",map);
	}

}
