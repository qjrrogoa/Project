package com.company.exer.service;

import lombok.Data;

@Data
public class KakaoProfile {

public Integer id;
public String connected_at;
public Properties properties;
public KakaoAccount kakao_account;

	@Data
	public class Properties {
		public String nickname;
		public String profile_image;
		public String thumbnail_image;
		}
	
	@Data
	public class KakaoAccount {
		public Boolean profile_needs_agreement;
		public Profile profile;
		public Boolean has_age_range;
		public Boolean age_range_needs_agreement;
		public String age_range;
		public Boolean has_gender;
		public Boolean gender_needs_agreement;
		public String gender;
		
			@Data
			public class Profile {
				public String nickname;
				public String thumbnail_image_url;
				public String profile_image_url;
				public Boolean is_default_image;
				}

		}

}