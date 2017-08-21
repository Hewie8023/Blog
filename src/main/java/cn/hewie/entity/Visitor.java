package cn.hewie.entity;

/**
 * 访客实体类
 * @author Hewie
 *
 */
public class Visitor {

	private Integer visitorId;//编号
	private String visitorName;//用户名
	private String visitorIP;//用户IP
	private String visitorEmail;//用户邮箱
	private String visitorUrl;//用户网站
	private String visitorQQ;//用户qq
	
	public Integer getVisitorId() {
		return visitorId;
	}
	public void setVisitorId(Integer visitorId) {
		this.visitorId = visitorId;
	}
	public String getVisitorName() {
		return visitorName;
	}
	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
	public String getVisitorIP() {
		return visitorIP;
	}
	public void setVisitorIP(String visitorIP) {
		this.visitorIP = visitorIP;
	}
	public String getVisitorEmail() {
		return visitorEmail;
	}
	public void setVisitorEmail(String visitorEmail) {
		this.visitorEmail = visitorEmail;
	}
	public String getVisitorUrl() {
		return visitorUrl;
	}
	public void setVisitorUrl(String visitorUrl) {
		this.visitorUrl = visitorUrl;
	}
	public String getVisitorQQ() {
		return visitorQQ;
	}
	public void setVisitorQQ(String visitorQQ) {
		this.visitorQQ = visitorQQ;
	}
}
