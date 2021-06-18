package com.company.exer.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BBSDTO {
	private String no;
	private String id;
	private String title;
	private String content;
	private String name;
	private int likecount;
	private int likecheck;
	private String lat;
	private String lng;
}
