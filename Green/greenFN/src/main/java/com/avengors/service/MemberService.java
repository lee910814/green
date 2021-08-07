package com.avengors.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengors.model.MemberDAO;
import com.avengors.model.MemberDTO;
import com.avengors.utils.Hash;


@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public int checkId(String email) {
		return dao.checkId(email);
	}
	
	public int join(MemberDTO dto) {
		String salt = Hash.getSalt();
		dto.setSalt(salt);
		dto.setUserpw(Hash.getHash(salt + dto.getUserpw()));
		return dao.join(dto);
	}

	public MemberDTO login(String email, String userpw) {
		MemberDTO dto = dao.selectOne(email);
		if(dto.getUserpw().equals(Hash.getHash(dto.getSalt() + userpw))) {
			return dto;
		}
		return null;
	}

	public int update(MemberDTO dto) {
		String salt = Hash.getSalt();
		dto.setSalt(salt);
		dto.setUserpw(Hash.getHash(salt + dto.getUserpw()));
		return dao.updateMember(dto);
	}

	public int deleteMember(MemberDTO dto) {
		return dao.deleteMember(dto);
	}

	
	
}
