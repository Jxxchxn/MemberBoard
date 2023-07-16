package com.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.MemberVO;

@Mapper
public interface MemberMapper {

	public MemberVO idCheck(String mID);
	public int memberJoin(MemberVO m);
	public MemberVO memberLogin(MemberVO mvo);
	public int infoUpdate(MemberVO mvo);
	public MemberVO memberInfo(String mID);
	public void profileUpdate(MemberVO mvo);
}
