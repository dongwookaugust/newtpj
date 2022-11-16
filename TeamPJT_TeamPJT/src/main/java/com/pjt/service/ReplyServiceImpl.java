package com.pjt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.command.Criteria;
import com.pjt.command.ReplyPageVO;
import com.pjt.command.ReplyVO;
import com.pjt.mapper.ReplyMapper;

import lombok.Setter;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyMapper rm;
	
	@Override
	public List<ReplyVO> getList(int board_num) {
		return rm.getList(board_num);
	}
	
	@Override
	public void addReply(String reply_coment, int board_num, String user_id) {
		rm.addReply(reply_coment, board_num, user_id);		
	}
	
	@Override
	public void delReply(int reply_num) {
		rm.delReply(reply_num);		
	}
}
