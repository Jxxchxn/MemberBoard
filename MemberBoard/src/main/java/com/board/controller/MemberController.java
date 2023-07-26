package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	MemberMapper mmp;
	
	// 회원가입 페이지로 이동
	@RequestMapping("/memberJoinForm")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	
	// 아이디 중복 확인
	@RequestMapping("/idCheck")
	public @ResponseBody int idCheck(@RequestParam("mID") String mID) {
		MemberVO m = mmp.idCheck(mID);
		if(m != null || mID.equals("")) {
			return 0;	// 사용 불가
		}
		return 1;	// 사용 가능
	}
	
	// 회원가입
	@RequestMapping("/memberJoin")
	public String memberJoin(MemberVO m, String mPW01, String mPW02, RedirectAttributes rttr, HttpSession session) {
		if(m.getMID() == null || m.getMID().equals("") ||
			mPW01 == null || mPW01.equals("") || mPW02 == null || mPW02.equals("") ||
			m.getMName() == null || m.getMName().equals("") ||
			m.getMAge() == 0 ||
			m.getMGender() == null || m.getMGender().equals("") ) {
			rttr.addFlashAttribute("msgType", "실패 메시지");
			rttr.addFlashAttribute("msg", "모든 필수 정보를 입력해주세요.");
			return "redirect:/memberJoin";
		}
			if(!mPW01.equals(mPW02)) {
				rttr.addFlashAttribute("msgType", "실패 메시지");
				rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			}
		m.setMProfile("");
		int result = mmp.memberJoin(m);
		if(result == 1) {
			rttr.addFlashAttribute("msgType", "성공 메시지");
			rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
			session.setAttribute("mvo", m);
			return "redirect:/";
		} else {
			
			rttr.addFlashAttribute("msgType", "실패 메시지");
			rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
			return "redirect:/memberJoin";
		}
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("/memberLoginForm")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	// 로그인
	@RequestMapping("/memberLogin")
	public String memberLogin(MemberVO m, RedirectAttributes rttr, HttpSession session) {
		if(m.getMID() == null || m.getMID().equals("") ||
			m.getMPW() == null || m.getMPW().equals("") ) {			
			rttr.addFlashAttribute("msgType", "실패 메시지");
			rttr.addFlashAttribute("msg", "아이디 또는 비밀번호를 입력해주세요.");
		}
		MemberVO mvo = mmp.memberLogin(m);
		if(mvo != null) {	// 로그인 성공
			rttr.addFlashAttribute("msgType", "성공 메시지");
			rttr.addFlashAttribute("msg", "로그인되었습니다.");
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msgType", "성공 메시지");
			rttr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:/memberLoginForm";
		}
	}
	
	// 로그아웃
	@RequestMapping("/memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
