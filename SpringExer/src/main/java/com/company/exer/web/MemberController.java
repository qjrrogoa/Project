package com.company.exer.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.company.exer.service.KakaoProfile;
import com.company.exer.service.MemberDTO;
import com.company.exer.service.MemberService;
import com.company.exer.service.OAuthToken;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/Member/")
public class MemberController {

	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="Join.do",method = RequestMethod.GET)
	public String Join() {
		return "member/Join";
	}
	
	@RequestMapping(value="Join.do",method = RequestMethod.POST)
	public String JoinOk(@RequestParam Map map, HttpSession session) {
		
		int affected = memberService.join(map);
		if(affected==1) {
			session.setAttribute("id",map.get("id"));
			return "forward:/BBS/List.do";
		}
		else
			return "member/Join";
	}
	
	@RequestMapping(value="Login.do",method = RequestMethod.GET)
	public String Login() {
		return "member/Login";
	}
	
	@RequestMapping(value="Login.do",method = RequestMethod.POST)
	public String LoginOk(@RequestParam Map map, Model model, HttpSession session) {
		boolean flag = memberService.login(map);
		if(flag) {
			session.setAttribute("id",map.get("id"));
		}
		else {
			model.addAttribute("NotMember","아뒤와 비번이 틀려요");
		}
		return "forward:/BBS/List.do";
	}

	
	
	@RequestMapping(value="KakaoLogin.do",produces="application/json;charset=UTF-8")
	public String KakaoLogin(String code,HttpSession session) {
		
		///POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		//a태그라 무조건 get방식인데 아래 라이브러리 사용하면 post가능
		RestTemplate rt = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		//Body데이터를 담은 맵
		//HttpBody 오브젝트 생성
		MultiValueMap<String,String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "2e146e4170e9378e12b5438929a05c2f");
		params.add("redirect_uri", "http://localhost:9090/exer/Member/KakaoLogin.do");
		params.add("code", code);
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = 
				new HttpEntity<>(params,headers);
		
		//Http 요청하기 - Post방식으로 - 그리고 response변수의 응답 받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
			);

		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(),OAuthToken.class);
		}
		catch (JsonParseException e) {
			e.printStackTrace();
		} 
		catch (JsonMappingException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token());
		
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest2 = 
				new HttpEntity<>(headers2);
		
		//Http 요청하기 - Post방식으로 - 그리고 response변수의 응답 받음
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
			);

		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(),KakaoProfile.class);
		}
		catch (JsonParseException e) {
			e.printStackTrace();
		} 
		catch (JsonMappingException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		
		//UserObject username,password
		System.out.println("찍고 아이디 : "+kakaoProfile.getId());
		System.out.println("찍고 이름 : "+kakaoProfile.properties.getNickname());
		
//		MemberDTO dto = MemberDTO.builder()
//				.id(kakaoProfile.getId().toString())
//				.pwd(garbagePassword.toString())
//				.name(kakaoProfile.properties.getNickname())
//				.build();
		Map map = new HashMap();
		map.put("id", kakaoProfile.getId().toString());
		map.put("name", kakaoProfile.properties.getNickname());
		map.put("pwd","1234");
		//회원 이름 길이 조절해야한다!
		//가입자 혹은 비가입자 체크 해서 처리
		//비가입자면 회원가입 처리 
		
		boolean flag = memberService.joinCheck(map);
		
		//이미 가입 완료ㅕ
		if(flag == true) {
			memberService.login(map);
			session.setAttribute("id",map.get("id"));
			System.out.println("2222222222222222 "+map.get("id"));
			return "forward:/BBS/List.do";

		}

		//비 가입자
		else {
			memberService.join(map);
			session.setAttribute("id",map.get("id"));
			System.out.println("1111111111111111111"+map.get("id"));
			return "forward:/BBS/List.do";

		}
	}
	
	
	@RequestMapping("Logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "forward:/Stamp/Home.do";
	}
}