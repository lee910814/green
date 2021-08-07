package com.avengors.model;

import org.apache.ibatis.annotations.Param;


public interface MemberDAO {
	
	int checkId(String email);
		
	int join(MemberDTO dto);
	
	MemberDTO selectOne(@Param("email")String email);

	int deleteMember(MemberDTO dto);

	int updateMember(MemberDTO dto);
	
}
