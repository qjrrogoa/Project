package com.company.exer.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.exer.service.MemberDTO;
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
	
	public MemberDTO mypage(Map map) {
		return sqlMapper.selectOne("memberMypage",map);
	}

	public int followCheck(Map map) {
		return sqlMapper.selectOne("followCheck",map);
	}

	public int followCnt(Map map) {
		return sqlMapper.selectOne("followCnt",map);
	}

	public int followerCnt(Map map) {
		return sqlMapper.selectOne("followerCnt",map);
	}

}
