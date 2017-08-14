package cn.hewie.entity;

import java.util.Date;

/**
 * 博客更新日志实体类
 * @author Hewie
 *
 */
public class UpdateLog {

	private Integer id;//编号
	private String logContent;//更新内容
	private Date date;//更新日期
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
