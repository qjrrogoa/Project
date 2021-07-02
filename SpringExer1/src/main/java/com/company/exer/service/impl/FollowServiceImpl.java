package com.company.exer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.company.exer.service.FollowDTO;
import com.company.exer.service.FollowService;

@Service("followService")
public class FollowServiceImpl implements FollowService {

	@Resource(name="followDAO")
	private FollowDAO dao;
	
	@Override
	public int follow(Map map) {
		return dao.follow(map);
	}

	@Override
	public int unFollow(Map map) {
		return dao.unFollow(map);
	}

	@Override
	public List<FollowDTO> followerList(Map map) {
		return dao.followerList(map);
	}
	
	@Override
	public List<FollowDTO> followList(Map map) {
		return dao.followList(map);
	}

	@Override
	public int followCheck(Map map) {
		return dao.followCheck(map);
	}



}
