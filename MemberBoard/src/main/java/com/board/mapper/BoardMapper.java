package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.board.domain.BoardVO;

@Mapper
public interface BoardMapper {

	public List<BoardVO> boardList();
	public void boardInsert(BoardVO vo);
	public BoardVO boardContent(int idx);
	public void boardDelete(int idx);
	public void boardUpdate(BoardVO vo);
	
	// 조회수 증가
	@Update("update tbl_board2 set bcount = bcount + 1 where bidx = #{bidx}")
	public void boardCount(int bidx);
}
