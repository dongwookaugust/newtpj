package com.pjt.service;

import java.util.ArrayList;
import java.util.List;

import com.pjt.command.BoardVO;

import com.pjt.command.Criteria;

import com.pjt.command.ImgVO;
import com.pjt.command.RecommendVO;

public interface BoardService {
	public BoardVO getDetaile(int board_num);
	public void register(BoardVO vo);
	public void modify(BoardVO vo);
	public List<BoardVO> search(String Board_title);
	public ArrayList<BoardVO> getlist(Criteria cri);
	public int getTotal();		
	public List<BoardVO> top4();
	public List<ImgVO> top4_img();
	public int searchCount(String Board_title);
	public void recommend_Merge(RecommendVO vo);
	public String getRecommend(RecommendVO vo);
	public int recommendCount(int board_num);
	public void boardViewCount(int board_num);
	public ImgVO getImg(int board_num);
	public void delete(int board_num);
}
