package com.pjt.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pjt.command.BoardVO;

import com.pjt.command.Criteria;

import com.pjt.command.ImgVO;
import com.pjt.command.RecommendVO;

public interface BoardMapper {
	public BoardVO getDetaile(int board_num);
	public void register(BoardVO vo);
	public void modify(BoardVO vo);
	public List<BoardVO> search(String Board_title);
	public List<BoardVO> getlist();

	public int getTotal();
	public ArrayList<BoardVO> pagingList(Criteria cri);
	public void imageEnroll(ImgVO vo);
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
