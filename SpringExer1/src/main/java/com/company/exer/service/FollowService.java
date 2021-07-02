package com.company.exer.service;

import java.util.List;
import java.util.Map;

public interface FollowService {

	int follow(Map map);
	int unFollow(Map map);
	List<FollowDTO> followList(Map map);
	List<FollowDTO> followerList(Map map);
	int followCheck(Map map);
}
