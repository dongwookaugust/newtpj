package com.pjt.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.pjt.command.MovieVO;
import com.pjt.mapper.MovieMapper;

import lombok.extern.java.Log;
import oracle.jdbc.driver.json.binary.JsonpOsonArray;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieMapper mapper;
	
	@Override
	public ArrayList<MovieVO> movieList() {
		ArrayList<MovieVO> list = mapper.movieList();
		return list;
	}

	@Override
	public void insert(String url) {
		
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements elements = doc.select("div.sect-movie-chart");
		Elements movieList_ol = elements.eq(0).select("ol");
		
		for(int i = 0; i<movieList_ol.select("li").size();i++) {
				MovieVO vo = new MovieVO();
				
				String detailUrl = "http://www.cgv.co.kr"+movieList_ol.select("li").eq(i).select("div.box-image a").eq(0).attr("href");
				
				Document detailDoc;
				try {
					detailDoc = Jsoup.connect(detailUrl).get();
					Elements baseMovie = detailDoc.select("div.sect-base-movie");
					
					String title = baseMovie.select("div.box-contents div.title strong").text();
					String img = baseMovie.select("div.box-image span.thumb-image img").attr("src");
					String director = baseMovie.select("div.box-contents div.spec dd").eq(0).text();
					String actors = baseMovie.select("div.box-contents div.spec dd.on").eq(0).text();
					String genre = baseMovie.select("div.box-contents div.spec dd.on").eq(0).next().text();
					genre = genre.replace("장르 :", "");	
					String grade = baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[0];
					String mvtime = baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[1].replace(",","");
					mvtime = mvtime.replace("분", "");
					String mvopen = baseMovie.select("div.box-contents div.spec dd.on").eq(2).text();
					
					vo.setActors(actors);
					vo.setDirector(director);
					vo.setGenre(genre);
					vo.setGrade(grade);
					vo.setImg(img);
					vo.setMvopen(mvopen);
					vo.setMvtime(mvtime);
					vo.setTitle(title);
					vo.setMvnum(Integer.toString(i+1));
					
					System.out.println(vo);
					
					
					mapper.insert(vo);	
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		
	}
	
	@Override
	public MovieVO getMovieInfo(String mvnum) {
		MovieVO vo = mapper.getMovieInfo(mvnum);
		System.out.println(vo);
		return vo;
	}
}
