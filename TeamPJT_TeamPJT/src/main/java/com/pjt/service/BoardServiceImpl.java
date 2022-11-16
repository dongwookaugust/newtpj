package com.pjt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pjt.command.BoardVO;

import com.pjt.command.Criteria;

import com.pjt.command.ImgVO;
import com.pjt.command.RecommendVO;
import com.pjt.mapper.BoardMapper;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper bmp;
	
	
	@Override
	public BoardVO getDetaile(int board_num) {
		return bmp.getDetaile(board_num);
	}
	
	@Override
	public void register(BoardVO vo) {
		bmp.register(vo);
		if(vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}
		System.out.println("1"+vo.getImageList());
		System.out.println("2"+vo.getBoard_num());
		for(ImgVO attach : vo.getImageList()) {
			attach.setBoard_num(vo.getBoard_num());
			bmp.imageEnroll(attach);
		}
		
	}
	
	@Override
	public void modify(BoardVO vo) {
		bmp.modify(vo);
	}
	
	@Override
	public List<BoardVO> search(String Board_title) {
		return bmp.search(Board_title);
	}
	
	@Override
	public ArrayList<BoardVO> getlist(Criteria cri) {
		ArrayList<BoardVO>list = bmp.pagingList(cri);
		return list;
	}
	
	@Override
	public int getTotal() {
		int total = bmp.getTotal();
		return total;
	}
	
	@Override
	public List<BoardVO> top4() {
		
		return bmp.top4();
	}
	
	@Override
	public List<ImgVO> top4_img() {
		
		return bmp.top4_img();
	}
	
	@Override
	public int searchCount(String Board_title) {
		
		return bmp.searchCount(Board_title);
	}

	@Override
	public void recommend_Merge(RecommendVO vo) {
		bmp.recommend_Merge(vo);
		
	}
	
	@Override
	public String getRecommend(RecommendVO vo) {
		
		return bmp.getRecommend(vo);
	}
	
	@Override
	public int recommendCount(int board_num) {
		// TODO Auto-generated method stub
		return bmp.recommendCount(board_num);
	}
	
	@Override
	public void boardViewCount(int board_num) {
		bmp.boardViewCount(board_num);
		
	}
	
	@Override
	public ImgVO getImg(int board_num) {
		
		return bmp.getImg(board_num);
	}
	
	@Override
	public void delete(int board_num) {
		bmp.delete(board_num);
		
	}
	
}
