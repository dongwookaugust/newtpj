package com.pjt.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import java.util.UUID;

import javax.imageio.ImageIO;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pjt.command.BoardVO;

import com.pjt.command.Criteria;
import com.pjt.command.ImgVO;
import com.pjt.command.PageVO;
import com.pjt.command.RecommendVO;
import com.pjt.member.commend.MemberVO;
import com.pjt.service.BoardService;
import com.pjt.service.ReplyService;

import net.coobird.thumbnailator.Thumbnails;


@Controller
@RequestMapping("/board/")
public class BoardController {
 
    @Autowired
    BoardService boardService;
    
    @Autowired
    ReplyService rs;
 

    @RequestMapping("/detaile")
	public String detaile(String cookie,int board_num,Model mo, HttpSession session, HttpServletRequest request,HttpServletResponse response){
    	//?????????
    	Cookie oldCookie = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie1 : cookies) {
                if (cookie1.getName().equals("postView")) {
                    oldCookie = cookie1;
                    
                }
            }
        }

        if (oldCookie != null) {
            if (!oldCookie.getValue().contains("[" + board_num + "]")) {
            	boardService.boardViewCount(board_num);
                oldCookie.setValue(oldCookie.getValue() + "_[" + board_num + "]");
                oldCookie.setPath("/");
                oldCookie.setMaxAge(60 * 5);
                response.addCookie(oldCookie);
            }
        } else {
        	boardService.boardViewCount(board_num);
            Cookie newCookie = new Cookie("postView","[" + board_num + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(60 * 5);
            response.addCookie(newCookie);
        }
    	
    	mo.addAttribute("list", boardService.getDetaile(board_num));
    	mo.addAttribute("reply_list", rs.getList(board_num));
    	mo.addAttribute("count", boardService.recommendCount(board_num));
    	
    	String id = (String)session.getAttribute("id");
    	if(id!=null) {
    		RecommendVO vo = new RecommendVO();
    		vo.setBoard_num(board_num);
    		vo.setUser_id(id);
    		mo.addAttribute("recommend_check",boardService.getRecommend(vo));
    	}
		return "pjt/board/detaile";
	}
    
    @GetMapping("/register")
    public String register(){
    	return "pjt/board/register";
    }
    
    @PostMapping("/register")
    public String register(BoardVO vo) {
    	boardService.register(vo);
    	return "redirect:/board/list";
    }
    
    @GetMapping("/modify")
    public String modify(int board_num,Model mo) {
    	mo.addAttribute("list", boardService.getDetaile(board_num));
    	return "pjt/board/modify";
    }
    
    @PostMapping("/modify")
    public String modify(BoardVO vo,Model mo) {
    	boardService.modify(vo);
    	
    	mo.addAttribute("list", boardService.getDetaile(vo.getBoard_num()));
    	mo.addAttribute("reply_list", rs.getList(vo.getBoard_num()));
    	System.out.println(vo.getBoard_num());
    	return "redirect:/board/detaile?board_num="+vo.getBoard_num();
    }
    
    @RequestMapping("/search")
    public String search(String board_title,Model mo , Criteria cri) {
    	List<BoardVO> test = boardService.search(board_title);
    	mo.addAttribute("board_list",test);
    	int total = boardService.searchCount(board_title); 	 
		mo.addAttribute("pageMaker", new PageVO(cri, total));
    	return "pjt/board/list";
    }
    
	@RequestMapping("/list")
	public String list(Model model, Criteria cri) {
		ArrayList<BoardVO> list = boardService.getlist(cri);
				model.addAttribute("board_list", list);
		int total = boardService.getTotal(); 	 
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "pjt/board/list";
}
	// ????????? ?????? ????????? ??????
	@PostMapping(value = "uploadFile", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ImgVO>> uploadFile(MultipartFile uploadFile) {
		// ?????? ??????
		String uploadFolder = "C:\\upload";

		// ??????????????? ??????
		File checkfile = new File(uploadFile.getOriginalFilename());
		String type = null;

		try {
			type = Files.probeContentType(checkfile.toPath());

		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!type.startsWith("image")) {
			List<ImgVO> list = null;
			return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
		}
		
		// ?????? ?????? ?????????
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date toDay = new Date();
		String str = sdf.format(toDay);
		String datePath = str.replace("-", File.separator);

		// ?????? ??????
		File uploadPath = new File(uploadFolder, datePath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// ????????? ?????? ?????? ?????? 
		List<ImgVO> list = new ArrayList<>();
		
		// ????????? ?????? ?????? 
		ImgVO vo = new ImgVO();
		
		// ?????? ?????? 
		String uploadFileName = uploadFile.getOriginalFilename();
		vo.setImg_fileName(uploadFileName);
		vo.setImg_uploadPath(datePath);

		// uuid ?????? ?????? ?????? 
		String uuid = UUID.randomUUID().toString();
		vo.setImg_uuid(uuid);
		
		uploadFileName = uuid + "_" + uploadFileName;

		// ?????? ??????, ?????? ????????? ?????? File ?????? 
		File saveFile = new File(uploadPath, uploadFileName);

		// ?????? ?????? 
		try {
			uploadFile.transferTo(saveFile);

			// ????????? ??????
			
			File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
			BufferedImage bo_image = ImageIO.read(saveFile);
			
			// ????????? ??????
			double ratio = 3;

			int width = (int) (bo_image.getWidth() / ratio);
			int height = (int) (bo_image.getHeight() / ratio);

			BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);

			Graphics2D graphic = bt_image.createGraphics();

			graphic.drawImage(bo_image, 0, 0, width, height, null);

			ImageIO.write(bt_image, "jpg", thumbnailFile);

			Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		list.add(vo);
		ResponseEntity<List<ImgVO>> result = new ResponseEntity<List<ImgVO>>(list, HttpStatus.OK);
		return result;

	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(@RequestParam("filename") String filename){
	
	File file = new File("c:\\upload\\" + filename);	
	ResponseEntity<byte[]> result = null;
		try {
			
			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	@PostMapping("/recommend")
	public ResponseEntity<String> recommend(RecommendVO vo){
		ResponseEntity<String> result = null;
		if(vo.getRecommend_check()==null) {vo.setRecommend_check("0");}
		System.out.println("id"+vo.getUser_id()+"/num"+vo.getBoard_num()+"/reco"+vo.getRecommend_check());		
		boardService.recommend_Merge(vo);
		result = new ResponseEntity<String>(boardService.getRecommend(vo),HttpStatus.OK);
		return result;  
	}
	
	@RequestMapping("/delete")
	public String delete(int board_num, RedirectAttributes RA) {
//		String id = (String)session.getAttribute("id");
//		if(id.equals(boardService.getDetaile(board_num).getUser_id())) {
//			boardService.delete(board_num);
//		}
		 boardService.deleteimg(board_num);
		 boardService.delete(board_num);
		
			
		return "redirect:/board/list";
	}
	
}
