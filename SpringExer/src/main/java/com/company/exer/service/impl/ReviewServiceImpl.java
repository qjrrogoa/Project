package com.company.exer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.company.exer.service.ReviewDTO;
import com.company.exer.service.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Resource(name="reviewDAO")
	private ReviewDAO dao;
	
	@Override
	public List<ReviewDTO> selectList() {
		return dao.selectList();
	}

	@Override
	public ReviewDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int like(Map map) {
		return dao.like(map);
	}

	@Override
	public int likeCheck(Map map) {
		return dao.likeCheck(map);
	}

	@Override
	public int likeCount(Map map) {
		return dao.likeCount(map);
	}

	@Override
	public int unlike(Map map) {
		return dao.unlike(map);
	}

	@Override
	public int stampInsert(Map map) {
		return dao.stampInsert(map);
	}



	

}
