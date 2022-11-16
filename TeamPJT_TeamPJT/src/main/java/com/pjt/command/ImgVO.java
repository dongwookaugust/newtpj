package com.pjt.command;

import lombok.Data;

@Data
public class ImgVO {
	//경로
	private String img_uploadPath;
	//이미지 고유ID
	private String img_uuid;
	
	private String img_fileName;
	private int board_num;
}
