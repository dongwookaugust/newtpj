package com.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pjt.command.Criteria;
import com.pjt.command.ReplyPageVO;
import com.pjt.command.ReplyVO;
import com.pjt.service.ReplyService;
import com.pjt.service.ReplyServiceImpl;

import lombok.AllArgsConstructor;



@RequestMapping("/replies")
@Controller
public class ReplyController {
	
	@Autowired
	ReplyService rs;
	
	@RequestMapping("/addReply")
	public String addReply(String reply_coment,int board_num,String user_id,Model mo) {
		rs.addReply(reply_coment, board_num, user_id);
		mo.addAttribute("board_num",board_num);
		return "redirect:/board/detaile";
	}
	
	@RequestMapping("/delReply")
	public String delReply(int reply_num,int board_num,Model mo) {
		rs.delReply(reply_num);
		mo.addAttribute("board_num",board_num);
		return "redirect:/board/detaile";
	}
}
