package com.pjt.command;


public class PageVO {
	
		
	private int startPage;		
	private int endPage;		
	
	private boolean prev,next;  
	
	private int total;      
	private Criteria cri;  
	public int getStartPage() {
		return startPage;
	}
	
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;  
		this.total = total;  
		
		
		this.endPage = (int)Math.ceil(cri.getPageNum() / (double)10) * 10;
		
		
		this.startPage = endPage - 10 + 1;
		
		
		int realEnd = (int)Math.ceil(total / (double)cri.getCount());
		
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		
		this.prev = this.startPage > 1;
		
		
		this.next = realEnd > this.endPage; //활성화
		
		System.out.println("[endPage]:"+endPage);
		System.out.println("[startPage]:"+startPage);
		
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}

}
