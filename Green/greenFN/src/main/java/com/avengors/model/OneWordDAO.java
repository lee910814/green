package com.avengors.model;

import java.util.HashMap;
import java.util.List;

import com.avengors.utils.PagingVO;

public interface OneWordDAO {

	int oneWordWrite(HashMap<String, String> map);
	
	public int countOneWord();
	
	List<OneWordDTO> selectList(PagingVO vo);

	int oneWordDelete(int idx);

}
