package cn.hewie.entity;

import java.util.Date;

/**
 * 留言实体类
 * @author Hewie
 *
 */
public class Msg {

	private Integer id;//编号
	private String msgName;//姓名
	private String msgEmail;//邮箱
	private String msgIP;//ip
	private String msgContent;//内容
	private Date msgDate;//留言日期
	private Integer state;//审核状态
	private String msgDateStr;
	private String msgImage;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMsgName() {
		return msgName;
	}
	public void setMsgName(String msgName) {
		this.msgName = msgName;
	}
	public String getMsgEmail() {
		return msgEmail;
	}
	public void setMsgEmail(String msgEmail) {
		this.msgEmail = msgEmail;
	}
	public String getMsgIP() {
		return msgIP;
	}
	public void setMsgIP(String msgIP) {
		this.msgIP = msgIP;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getMsgDateStr() {
		return msgDateStr;
	}
	public void setMsgDateStr(String msgDateStr) {
		this.msgDateStr = msgDateStr;
	}
	public String getMsgImage() {
		return msgImage;
	}
	public void setMsgImage(String msgImage) {
		this.msgImage = msgImage;
	}
}
