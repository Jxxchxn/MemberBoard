package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.BoardVO;
import com.board.mapper.BoardMapper;

@RequestMapping("/board")
@RestController	// 기본으로 @ResponseBody 적용
public class BoardRestController {

	@Autowired
	BoardMapper bmp;
	
	@GetMapping("/list")
	public List<BoardVO> boardList() {
		List<BoardVO> list = bmp.boardList();
		
		return list;
	}
	
	@PostMapping("/insert")
	public void boardInsert(BoardVO vo) {
		bmp.boardInsert(vo);
	}
	
	@GetMapping("/{bidx}")
	public BoardVO boardContent(@PathVariable("bidx") int bidx) {
		BoardVO vo = bmp.boardContent(bidx);
		
		return vo;
	}
	
	@PutMapping("/update")
	public void boardUpdate(@RequestBody BoardVO vo) {
		bmp.boardUpdate(vo);
	}
	
	@DeleteMapping("/{bidx}")
	public void boardDelete(@PathVariable("bidx") int bidx) {
		bmp.boardDelete(bidx);
	}
	
	@PutMapping("/count/{bidx}")
	public BoardVO boardCount(@PathVariable("bidx") int bidx) {
		bmp.boardCount(bidx);
		BoardVO vo = bmp.boardContent(bidx);
		
		return vo;
	}
	
}
