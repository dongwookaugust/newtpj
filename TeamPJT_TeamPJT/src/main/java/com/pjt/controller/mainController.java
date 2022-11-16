package com.pjt.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pjt.command.BoardVO;
import com.pjt.command.ImgVO;
import com.pjt.service.BoardService;

@Controller
@RequestMapping("/pjt/")
public class mainController {
	
	@Autowired
	BoardService bs;
	
	@RequestMapping("/main")
	public String main(Model mo) {
		List<ImgVO> ls_img = bs.top4_img();
		List<BoardVO>ls = bs.top4();
		int idx=0;
		for(BoardVO vo : ls) {
			ImgVO img= bs.getImg(vo.getBoard_num());
			
			if(img!=null) {
				String path = img.getImg_uploadPath();
				img.setImg_uploadPath(path.replace("\\", "/"));
			}
			mo.addAttribute("img"+idx,img);
			idx++;
			System.out.println(idx+"/"+img);
		}
		
		mo.addAttribute("ls_img",ls_img);
		mo.addAttribute("ls",ls);
			
		return "pjt/main";
	}
	
	
	
	
	
}
