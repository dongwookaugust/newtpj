package com.pjt.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;


import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pjt.member.commend.MemberVO;
import com.pjt.service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	//로그인 화면
	@RequestMapping("/login")
	public String login() {
		return "/pjt/member/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "/pjt/member/join";
	}
	
	@RequestMapping(value="/checkId",method=RequestMethod.POST)
	@ResponseBody
	public int checkId(@RequestParam("user_id") String id) {
		System.out.println(id);
		int result = memberservice.idCheck(id);
		
		return result;
	}
	@RequestMapping("/joinForm")
	public String joinForm(MemberVO vo, RedirectAttributes RA) {
		
		int result = memberservice.join(vo);
		
		
		if(result==1){
			RA.addFlashAttribute("msg", "가입성공");
					
		}else {
			RA.addFlashAttribute("msg", "가입실패");
		}
		
//		return "redirect:/";
		return "redirect:/member/join_ok";
	}
	
	
	@RequestMapping("join_ok")
	public String join_ok() {
		
		return "/pjt/member/join_ok";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(MemberVO vo, HttpSession session,RedirectAttributes RA) {
		
		System.out.println("실행1");
		int result = memberservice.login(vo);
		System.out.println(vo.getUser_id()+"/"+result);
		System.out.println(result);
		if(result ==1) {
			session.setAttribute("id", vo.getUser_id());	
			RA.addFlashAttribute("msg", "환영합니다.");
			return "redirect:/pjt/main";
		}else {
			System.out.println("실행3");
			RA.addFlashAttribute("msg", "아이디 비밀번호 확인해주세요");
			return "redirect:/member/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/pjt/main";
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO vo = memberservice.select(id);
		model.addAttribute("vo", vo);
		return "/pjt/member/mypage";
	}
	
	//내 정보 변경
	@RequestMapping("/update_member")
	public String update_member(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO vo = memberservice.select(id);
		model.addAttribute("vo", vo);
		return "/pjt/member/update_member";
	}
	
	//비밀번호 변경
	@RequestMapping("/update_pw")
	public String update_pw(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO vo = memberservice.select(id);
		model.addAttribute("vo", vo);
		return "/pjt/member/update_pw";
	}
	
	//회원탈퇴
	@RequestMapping("/delete")
	public String delete(Model model,HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO vo = memberservice.select(id);
		model.addAttribute("vo", vo);
		return "/pjt/member/delete";
	}
	
	@RequestMapping("/update_member_form")
	public String update_member_form(MemberVO vo,RedirectAttributes RA) {
		int result = memberservice.update(vo);
		if(result==1) {
			RA.addFlashAttribute("msg", "정보수정 성공");
		}else {
			RA.addFlashAttribute("msg","정보수정 실패");
		}
		return "redirect:/member/mypage";
	}
	
	@RequestMapping("/update_pw_form")
	public String update_pw_form(@RequestParam("user_pw") String user_pw,RedirectAttributes RA,HttpSession session) {
		String id = (String)session.getAttribute("id");
		System.out.println(user_pw);
		int result = memberservice.updatePW(user_pw,id);
		if(result==1) {
			RA.addFlashAttribute("msg", "비밀번호 변경 완료");
		}else {
			RA.addFlashAttribute("msg","비밀번호 변경 실패");
		}
		return "redirect:/member/mypage";
	}
	
	@RequestMapping("delete_form")
	public String delete_form(RedirectAttributes RA,HttpSession session) {
		// 세션으로 아이디 값 불러오기
		String id = (String)session.getAttribute("id");
		int result = memberservice.delete(id);
		
		if(result==1) {
			session.invalidate();
			RA.addFlashAttribute("msg", "회원탈퇴 완료");
		}else {
			RA.addFlashAttribute("msg","회원탈퇴 실패");
			return "redirect:/member/mypage";
		}
		
		return "redirect:/pjt/main";
	}
	
}
