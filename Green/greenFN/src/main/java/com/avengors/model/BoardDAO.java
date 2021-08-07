package com.avengors.model;

import java.util.List;
import java.util.Map;

import com.avengors.utils.PagingVO;

public interface BoardDAO {

	//조회
	public BoardDTO selectOne(int idx) ;
	// 글전체 갯수
	public int countBoard();
	//카테고리기준
	public int countCategoryBoard(String category);
	
	
	//삭제
	public int deleteBoard(int idx);

	
	//수정
	public int updateBoard(BoardDTO boardto) ;

	//등록
	int boardWrite(BoardDTO dto);


	// 페이징후 리스트
	public List<BoardDTO> selectListBoard(PagingVO paging);
	//카테고리 페이징
	public List<BoardDTO> boardCategoryList(PagingVO paging);
	
	

	// 조회수 업
	public int CountUp(int idx);
	

	


}
