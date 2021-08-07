package com.avengors.model;

//IDX     NOT NULL NUMBER        
//MIDX             NUMBER        
//WDATE            VARCHAR2(20)  
//CONTENT NOT NULL VARCHAR2(100) 
//DELETED          VARCHAR2(5)

public class OneWordDTO {
	
	private int idx, midx;
	private String name, wdate, content, deleted;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	

}
