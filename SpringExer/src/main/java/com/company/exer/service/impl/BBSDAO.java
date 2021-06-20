package com.company.exer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.exer.service.BBSDTO;
import com.company.exer.service.BBSService;

@Repository("bbsDAO")
public class BBSDAO {
	
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;
	
	public List<BBSDTO> selectList() {
		return sqlMapper.selectList("bbsSelectList");
	}

	public BBSDTO selectOne(Map map) {
		return sqlMapper.selectOne("bbsSelectOne",map);
	}

	public int insert(Map map) {
		return sqlMapper.insert("bbsInsert",map);
	}

	public int update(Map map) {
		return sqlMapper.update("bbsUpdate",map);
	}

	public int delete(Map map) {
		return sqlMapper.delete("bbsDelete",map);
	}

	public int like(Map map) {
		return sqlMapper.insert("bbsLike",map);
	}
	
	public int likeCheck(Map map) {
		return sqlMapper.selectOne("bbsLikeCheck",map);
	}
	
	public int likeCount(Map map) {
		return sqlMapper.update("bbsLikeCount",map);
	}  
	
	public int unlike(Map map) {
		return sqlMapper.delete("bbsUnLike",map);
	}
	
	public int stampInsert(Map map) {
		return sqlMapper.delete("stampInsert",map);
	}
	

	
}
