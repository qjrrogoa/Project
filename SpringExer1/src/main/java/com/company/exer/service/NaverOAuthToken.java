package com.company.exer.service;

import lombok.Data;

@Data
public class NaverOAuthToken {
	public String access_token;
	public String refresh_token;
	public String token_type;
	public String expires_in;
}
