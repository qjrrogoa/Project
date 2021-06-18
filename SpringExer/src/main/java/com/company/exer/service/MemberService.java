package com.company.exer.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberService {

	int join(Map map);
	boolean login(Map map);
	
}
