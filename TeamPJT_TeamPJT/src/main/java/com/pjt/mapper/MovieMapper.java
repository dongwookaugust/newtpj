package com.pjt.mapper;

import java.util.ArrayList;
import java.util.List;

import com.pjt.command.MovieVO;
import com.pjt.command.MovieVO;

public interface MovieMapper {
	public ArrayList<MovieVO> movieList();
	public void insert(MovieVO vo);
	public MovieVO getMovieInfo(String mvnum);
}
