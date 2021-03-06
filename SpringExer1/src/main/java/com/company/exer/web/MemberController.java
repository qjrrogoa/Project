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
import com.company.exer.service.NaverOAuthToken;
import com.company.exer.service.NaverProfile;
import com.company.exer.service.KakaoOAuthToken;
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
			return "forward:/Review/List.do";
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
			model.addAttribute("NotMember","????????? ????????? ?????????");
		}
		return "forward:/Review/List.do";
	}
	
	
	@RequestMapping(value="KakaoLogin.do",produces="application/json;charset=UTF-8")
	public String KakaoLogin(String code,HttpSession session) {
		
		///POST???????????? key=value ???????????? ?????? (??????????????????)
		//a????????? ????????? get???????????? ?????? ??????????????? ???????????? post??????
		RestTemplate rt = new RestTemplate();
		
		//HttpHeader ???????????? ??????
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		//Body???????????? ?????? ???
		//HttpBody ???????????? ??????
		MultiValueMap<String,String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "2e146e4170e9378e12b5438929a05c2f");
		params.add("redirect_uri", "http://localhost:9090/exer/Member/KakaoLogin.do");
		params.add("code", code);
		
		//HttpHeader??? HttpBody??? ????????? ??????????????? ??????
		HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = 
				new HttpEntity<>(params,headers);
		
		//Http ???????????? - Post???????????? - ????????? response????????? ?????? ??????
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
			);

		ObjectMapper objectMapper = new ObjectMapper();
		KakaoOAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(),KakaoOAuthToken.class);
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
		
		System.out.println("????????? ????????? ?????? : "+oauthToken.getAccess_token());
		
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeader ???????????? ??????
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpHeader??? HttpBody??? ????????? ??????????????? ??????
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest2 = 
				new HttpEntity<>(headers2);
		
		//Http ???????????? - Post???????????? - ????????? response????????? ?????? ??????
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
		
//		MemberDTO dto = MemberDTO.builder()
//				.id(kakaoProfile.getId().toString())
//				.pwd(garbagePassword.toString())
//				.name(kakaoProfile.properties.getNickname())
//				.build();
		Map map = new HashMap();
		map.put("id", kakaoProfile.getId().toString());
		map.put("name", kakaoProfile.properties.getNickname());
		map.put("pwd","1234");
		
		
		//????????? ?????? ???????????? ?????? ?????? ??????
		//??????????????? ???????????? ?????? 
		boolean flag = memberService.joinCheck(map);
		
		//?????? ?????? ??????
		if(flag == true) {
			memberService.login(map);
			session.setAttribute("id",map.get("id"));
			return "forward:/Review/List.do";
		}

		//??? ?????????
		else {
			memberService.join(map);
			session.setAttribute("id",map.get("id"));
			return "forward:/Review/List.do";
		}
	}
	
	//////////????????? ?????????
	@RequestMapping(value="NaverLogin.do",produces="application/json;charset=UTF-8")
	public String NaverLogin(String code,HttpSession session) {
				
				///POST???????????? key=value ???????????? ?????? (??????????????????)
				//a????????? ????????? get???????????? ?????? ??????????????? ???????????? post??????
				RestTemplate rt = new RestTemplate();
				
				//HttpHeader ???????????? ??????
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
				
				//Body???????????? ?????? ???
				//HttpBody ???????????? ??????
				MultiValueMap<String,String> params = new LinkedMultiValueMap<String, String>();
				params.add("grant_type", "authorization_code");
				params.add("client_id", "OKVhsE6FDsMVPSDUedj7");
				params.add("client_secret", "M7pGLbvRrE");
				params.add("code", code);

				//HttpHeader??? HttpBody??? ????????? ??????????????? ??????
				HttpEntity<MultiValueMap<String,String>> naverTokenRequest = 
						new HttpEntity<>(params,headers);
				
				//Http ???????????? - Post???????????? - ????????? response????????? ?????? ??????
				ResponseEntity<String> response = rt.exchange(
						"https://nid.naver.com/oauth2.0/token",
						HttpMethod.POST,
						naverTokenRequest,
						String.class
					);
				
				ObjectMapper objectMapper = new ObjectMapper();
				NaverOAuthToken oauthToken = null;
				try {
					oauthToken = objectMapper.readValue(response.getBody(),NaverOAuthToken.class);
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
				
				System.out.println("????????? ????????? ?????? : "+oauthToken.getAccess_token());
				
				RestTemplate rt2 = new RestTemplate();
				
				//HttpHeader ???????????? ??????
				HttpHeaders headers2 = new HttpHeaders();
				headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
				headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
				
				//HttpHeader??? HttpBody??? ????????? ??????????????? ??????
				HttpEntity<MultiValueMap<String,String>> naverfileRequest2 = 
						new HttpEntity<>(headers2);
				
				//Http ???????????? - Post???????????? - ????????? response????????? ?????? ??????
				ResponseEntity<String> response2 = rt2.exchange(
						"https://openapi.naver.com/v1/nid/me",
						HttpMethod.POST,
						naverfileRequest2,
						String.class
					);

				ObjectMapper objectMapper2 = new ObjectMapper();
				NaverProfile naverProfile = null;
				try {
					naverProfile = objectMapper2.readValue(response2.getBody(),NaverProfile.class);
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
				
//				MemberDTO dto = MemberDTO.builder()
//						.id(kakaoProfile.getId().toString())
//						.pwd(garbagePassword.toString())
//						.name(kakaoProfile.properties.getNickname())
//						.build();
				Map map = new HashMap();
				map.put("id", naverProfile.getResponse().id);
				map.put("name", naverProfile.getResponse().name);
				map.put("pwd","1234");
				
				System.out.println("aaaaaaaaaaaaaaaaaaaa"+map.get("id"));
				System.out.println("bbbbbbbbbbbbbbbbbbbb"+map.get("name"));
				//????????? ?????? ???????????? ?????? ?????? ??????
				//??????????????? ???????????? ?????? 
				boolean flag = memberService.joinCheck(map);
				
				//?????? ?????? ??????
				if(flag == true) {
					memberService.login(map);
					session.setAttribute("id",map.get("id"));
					return "forward:/Review/List.do";
				}

				//??? ?????????
				else {
					memberService.join(map);
					session.setAttribute("id",map.get("id"));
					return "forward:/Review/List.do";
				}
	}
	
	
	
	
	
	@RequestMapping("Logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "forward:/Stamp/Home.do";
	}
	
	
	
	@RequestMapping("Mypage.do")
	public String Mypage(@RequestParam Map map, Model model,HttpSession session){
		if(session.getAttribute("id")!=null) {
			String followerId = session.getAttribute("id").toString();
			MemberDTO dto = memberService.mypage(map);
			map.put("followerId", followerId);
			map.put("followId", map.get("id"));
			System.out.println("asfdjsafjsald"+map.get("followId"));
			int followCheck = memberService.followCheck(map);
			int followCnt=memberService.followCnt(map);
			int followerCnt=memberService.followerCnt(map);
			
			model.addAttribute("followCheck",followCheck);
			model.addAttribute("followCnt",followCnt);
			model.addAttribute("followerCnt",followerCnt);
			model.addAttribute("dto", dto);
		}
		else {
			MemberDTO dto = memberService.mypage(map);
			map.put("followId", map.get("id"));
			int followCnt=memberService.followCnt(map);
			int followerCnt=memberService.followerCnt(map);
			model.addAttribute("dto", dto);
			model.addAttribute("followCnt",followCnt);
			model.addAttribute("followerCnt",followerCnt);
		}
		
		return "/member/Mypage";
	}
}