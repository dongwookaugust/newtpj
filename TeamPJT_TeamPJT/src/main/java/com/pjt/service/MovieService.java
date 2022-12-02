package com.pjt.service;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.pjt.command.MovieVO;

public interface MovieService {

	public ArrayList<MovieVO> movieList();
	public void insert(String url);
	public MovieVO getMovieInfo(String mvnum);
}
