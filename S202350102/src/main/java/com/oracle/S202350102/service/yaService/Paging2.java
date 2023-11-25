package com.oracle.S202350102.service.yaService;

import lombok.Data;

@Data
public class Paging2 {
	private int currentPage = 1;	private int rowPage   = 9;
	private int pageBlock = 10;		
	private int start;				private int end;
	private int startPage;			private int endPage;
	private int total;				private int totalPage;
    private int brd_md;
	public Paging2(int total, String currentPage1) {
		
		this.total = total;
		if (currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1);	
		}
		
		start = (currentPage - 1) * rowPage + 1;
		end   = start + rowPage - 1;
		//								7			10
		totalPage = (int) Math.ceil((double)total / rowPage);
		startPage = currentPage - (currentPage - 1) % pageBlock;
		endPage = startPage + pageBlock - 1;
		
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
