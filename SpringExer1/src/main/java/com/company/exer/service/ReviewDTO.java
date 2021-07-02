package com.company.exer.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private String rvNo;
	private String id;
	private String rvTitle;
	private String rvCtt;
	private String name;
	private int rvLikeCnt;
	private int rvLikeCheck;
	private String rvLat;
	private String rvLng;
}
