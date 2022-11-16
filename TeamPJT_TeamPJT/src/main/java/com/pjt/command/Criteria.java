package com.pjt.command;

public class Criteria {

	//select * from (select rownum as rnum, bno,writer from tbl_board where ? >= rownum order by bno desc) where rnum>=?;
	
	private int pageNum; //페이지 번호
	private int count; //한 페이지에 보일 게시물 숫자
	
	public Criteria() {
		//최초 게시판 진입 시 보일 기본값 설정(1번페이지, 10개 게시물)
		this.pageNum=1;
		this.count=10;
	}

	public Criteria(int pageNum, int count) {
		super();
		this.pageNum = pageNum;
		this.count = count;
	}
	
	public int getPageStart() {
		
		return ((pageNum -1)*count)+1;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}
	
	public int getCount_oracle() {
		return (pageNum * count);
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
