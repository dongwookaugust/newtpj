package com.pjt.command;

import java.sql.Date;
import java.util.List;

import lombok.Data;



@Data
public class BoardVO {

	private int board_num;
	private String board_category;
	private String board_title;
	private String board_content;
	private Date board_date;
	private double board_score;
	private int board_view;
	private String user_id;
	private String board_strength;
	private String board_weakness;

	private List<ImgVO> imageList;
}
