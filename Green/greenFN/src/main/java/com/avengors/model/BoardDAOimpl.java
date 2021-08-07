package com.avengors.model;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.avengors.utils.PagingVO;

//DAO구현하는 클래스
@Repository
public class BoardDAOimpl implements BoardDAO{
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//총게시글
	@Override
	public int countBoard() {
		return sql.selectOne("countBoard");
	}
	
	// 목록
	@Override
	public List<BoardDTO> selectListBoard(PagingVO paging) {
		return sql.selectList("selectListBoard", paging);
	}
	
	//글 작성
	@Override
	public int boardWrite(BoardDTO dto) {
		return sql.insert("boardWrite", dto);
	}
	
	//조회수 업
	@Override
	public int CountUp(int idx) {
		return sql.update("CountUp", idx);
	}
	
	// 상세보기
	@Override
	public BoardDTO selectOne(int idx) {
		return sql.selectOne("selectOne",idx);
	}
	//삭제
	@Override
	public int deleteBoard(int idx) {
		return sql.delete("deleteBoard",idx);
		
	}
	//수정
	@Override
	public int updateBoard(BoardDTO boardto) {
		return sql.update("updateBoard", boardto);
	}
	@Override
	public int countCategoryBoard(String category) {
		return sql.selectOne("countCategoryBoard", category);
	}
	@Override
	public List<BoardDTO> boardCategoryList(PagingVO paging) {
		return sql.selectList("boardCategoryList", paging);
	}
	
	

}
