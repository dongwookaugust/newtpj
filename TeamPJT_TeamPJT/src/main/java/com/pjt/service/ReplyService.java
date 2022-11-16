package com.pjt.service;

import java.util.List;



import com.pjt.command.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> getList(int board_num); 
	public void delReply(int reply_num);
	public void addReply(String reply_coment, int board_num,String user_id);
}
