package com.pjt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pjt.command.MovieVO;
import com.pjt.member.commend.MemberVO;
import com.pjt.service.MemberService;
import com.pjt.service.MovieService;



@Controller
@RequestMapping("/movie/")
public class MovieController {

	@Autowired
	private MovieService movieservice;
	
	//영화 리스트 출력
	@RequestMapping("/list")
	public String movieList(Model model,HttpServletRequest request) {
		ArrayList<MovieVO> list = movieservice.movieList();
		model.addAttribute("list",list);
		return "pjt/movie";
	}
	
	//cgv사이트에서 현재 상영중인 영화 데이터 가져온 후 DB 추가
	@RequestMapping("/add")
	public String add() {
		
		String url = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		movieservice.insert(url);
		return "pjt/movie";
	}
	
	//영화 상세정보 출력
	@RequestMapping("/movieView")
	public String movieView(String mvnum,Model model) {
		MovieVO vo = movieservice.getMovieInfo(mvnum);
		model.addAttribute("vo", vo);
		return "pjt/movieView";
	}
	
	
}
