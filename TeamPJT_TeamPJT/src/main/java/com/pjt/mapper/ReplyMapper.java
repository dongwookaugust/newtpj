package com.pjt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pjt.command.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getList(int board_num);
	public void delReply(int reply_num);
	public void addReply(@Param("reply_coment")String reply_coment, @Param("board_num")int board_num,@Param("user_id")String user_id);
}
