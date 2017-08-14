package cn.hewie.entity;

import java.util.Date;

/**
 * 评论实体
 * @author Hewie
 *
 */
public class Comment {

	private Integer id;//编号
	private Blog blog;//被评论的博客
	private String content;//评论内容
	private Date commentDate;//评论时间
	private String visitorIP;//评论者IP
	private String visitorName;//评论者名字
	private String visitorEmail;//评论者email
	private String visitorImage;//评论者头像
	
	private Integer state;//评论审核,0未审核，1审核通过，2审核不通过
	

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getVisitorIP() {
		return visitorIP;
	}
	public void setVisitorIP(String visitorIP) {
		this.visitorIP = visitorIP;
	}
	public String getVisitorName() {
		return visitorName;
	}
	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
	public String getVisitorEmail() {
		return visitorEmail;
	}
	public void setVisitorEmail(String visitorEmail) {
		this.visitorEmail = visitorEmail;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getVisitorImage() {
		return visitorImage;
	}
	public void setVisitorImage(String visitorImage) {
		this.visitorImage = visitorImage;
	}
}
