package com.avengors.controller;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.avengors.service.MailService;
import com.avengors.utils.Hash;

@RestController
public class MailController {
	
	@Autowired private MailService ms;
		
	@GetMapping(value="/mailto/{mailAddress}/", produces="text/plain;charset=utf-8")
	public String mailto(@PathVariable String mailAddress, HttpSession session) throws IOException {

		System.out.println("인증번호를 받을 이메일 주소 : " + mailAddress);
		
		String authNumber = ms.getAuthNumber();
		String hashNumber = Hash.getHash(authNumber);
		session.setAttribute("hashNumber", hashNumber);
		
		String account = null;
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/mailAccount.dat");
		File f = new File(filePath);
		if(f.exists() == false) {
			return "메일 계정정보 없음";
		}
		
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		
		String result = ms.sendMail(mailAddress, authNumber, account);
		
		if(result.equals(authNumber)) {
			return hashNumber;
		}else {
			return result;
		}
		
	}

	@GetMapping("/getAuthResult/{userNumber}")
	public boolean getAuthResult(@PathVariable String userNumber, HttpSession session) {
		System.out.println("userNum : " + userNumber);
		return Hash.getHash(userNumber).equals((String)session.getAttribute("hashNumber"));
	}
}
