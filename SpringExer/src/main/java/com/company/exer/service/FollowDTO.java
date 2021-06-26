package com.company.exer.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FollowDTO {
	private String followNo;
	private String followerId;
	private String followId;
	private String followCnt;
	private String followerCnt;
	private int followCheck;
}
