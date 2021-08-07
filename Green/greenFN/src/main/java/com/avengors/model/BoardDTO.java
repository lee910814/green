package com.avengors.model;

public class BoardDTO {
	private int idx;
    private int midx;
    private String title;
    private String content;
    private String category;
    private String uploadfile;
    private int viewCount;
    private String deleted;
    private String wdate;
    
    public BoardDTO(int idx, int midx, String title, String content, String category, String uploadfile) {
    	this.idx = idx;
        this.midx = midx;
        this.title = title;
        this.content = content;
        this.category = category;
        this.uploadfile = uploadfile;
    }
    
    public BoardDTO() {}
    
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(String uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
    
    
}
