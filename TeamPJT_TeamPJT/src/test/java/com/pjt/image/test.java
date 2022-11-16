package com.pjt.image;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pjt.command.BoardVO;
import com.pjt.command.ImgVO;
import com.pjt.service.BoardServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class test {
	@Autowired	
	private BoardServiceImpl service;
	
	@Test
	public void bookEnrollTEsts() {
		BoardVO bvo = new BoardVO();
		// 상품 정보
//		bvo.set("service 테스트");
//		bvo.setAuthorId(27);
//		bvo.setPubleYear("2021-03-18");
//		bvo.setPublisher("출판사");
//		bvo.setCateCode("202001");
//		bvo.setBookPrice(20000);
//		bvo.setBookStock(300);
//		bvo.setBookDiscount(0.23);
//		bvo.setBookIntro("책 소개 ");
//		bvo.setBookContents("책 목차 ");
		
		bvo.setBoard_category("카테고리");
		bvo.setBoard_content("내용");
		bvo.setBoard_score(5);
		bvo.setBoard_strength("장점");
		bvo.setBoard_title("제목");
		bvo.setBoard_weakness("단점");
		bvo.setUser_id("test1");
		
		// 이미지 정보
		List<ImgVO> imageList = new ArrayList<>(); 
		
		ImgVO image1 = new ImgVO();
		ImgVO image2 = new ImgVO();
		
		image1.setImg_fileName("test Image 1");
		image1.setImg_uploadPath("test image 1");
		image1.setImg_uuid("test1111");
		
		image2.setImg_fileName("test Image 2");
		image2.setImg_uploadPath("test image 2");
		image2.setImg_uuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		bvo.setImageList(imageList);        
		
		// bookEnroll() 메서드 호출
		service.register(bvo);
		
		System.out.println("등록된 VO : " + bvo);
	}

}
