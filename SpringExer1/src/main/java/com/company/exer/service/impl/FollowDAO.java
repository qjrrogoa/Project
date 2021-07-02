package com.company.exer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.exer.service.FollowDTO;
import com.company.exer.service.FollowService;

@Repository("followDAO")
public class FollowDAO{

	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public int follow(Map map) {
		return sqlMapper.insert("follow",map);
	}

	public int unFollow(Map map) {
		return sqlMapper.delete("unFollow",map);
	}

	public List<FollowDTO> followerList(Map map) {
		return sqlMapper.selectList("followerList",map);
	}
	
	public List<FollowDTO> followList(Map map) {
		return sqlMapper.selectList("followList",map);
	}
	public int followCheck(Map map) {
		return sqlMapper.selectOne("check",map);
	}
}
