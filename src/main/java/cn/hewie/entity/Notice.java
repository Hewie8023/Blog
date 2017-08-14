package cn.hewie.entity;

import java.util.Date;

/**
 * 网站公告实体类
 * @author Hewie
 *
 */
public class Notice {

	private Integer id;//编号
	private String notice;//公告内容
	private Date date;//公告日期
	
	
	
	public Notice() {
		super();
	}
	
	
	public Notice(String notice) {
		super();
		this.notice = notice;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
