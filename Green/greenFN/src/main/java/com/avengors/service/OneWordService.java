package com.avengors.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengors.model.OneWordDAO;
import com.avengors.model.OneWordDTO;
import com.avengors.utils.PagingVO;

@Service
public class OneWordService {

	@Autowired private OneWordDAO dao;
	
	public int countOneWord() {
		return dao.countOneWord();
	}
	
	public List<OneWordDTO> selectList(PagingVO vo) {
		return dao.selectList(vo);
	}
	
	public int oneWordWrite(HashMap<String, String> map) {
		return dao.oneWordWrite(map);
	}

	public int oneWordDelete(int idx) {
		return dao.oneWordDelete(idx);
	}



}
