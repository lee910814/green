package com.avengors.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.avengors.model.MemberDTO;
import com.avengors.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService ms;
	
	private final Logger log = LoggerFactory.getLogger(MemberController.class);
	

	@PostMapping("/join")
	public int join(@RequestBody MemberDTO dto) {
		
		return ms.join(dto);
	}
	
	@GetMapping("/checkId/{email}")
	public int checkId(@PathVariable String email) {
		if(email.contains("@gmail.com") ||
		   email.contains("@naver.com") ||
		   email.contains("@hotmail.com") ||
		   email.contains("@daum.net") ||
		   email.contains("@nate.com") ||
		   email.contains("@yahoo.com")) {
			return ms.checkId(email);			
		}else {
			return -1;
		}
	}
	
	@PostMapping("/login")
	public boolean login(@RequestBody HashMap<String, String> map, HttpSession session) {
		String email = map.get("email");
		String userpw = map.get("userpw");
		MemberDTO dto = ms.login(email, userpw);
		if(dto != null) {
			session.setAttribute("login", dto);
//			session.setMaxInactiveInterval(3600);
			return true;			
		}
		return false;
	}
	
	@DeleteMapping("/myPage")
	public int deleteMember(HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		if(dto != null) {
			int result = ms.deleteMember(dto);
			if(result == 1) {
				session.invalidate();
			}
			return result;
		}
		return 0;
	}
	
	@PostMapping("/myPage")
	public int mypageModify(@RequestBody MemberDTO dto, HttpSession session) {
		int result = ms.update(dto);
		if(result == 1) {
			session.invalidate();
		}
		return result;
	}
	
	
	
	
}
