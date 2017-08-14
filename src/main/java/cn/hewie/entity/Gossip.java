package cn.hewie.entity;

import java.util.Date;

/**
 * 碎语实体类
 * @author Hewie
 *
 */
public class Gossip {

	private Integer id;//编号
	private String content;//碎语内容
	private Date releaseDate;//发布日期
	private String releaseDateStr;//
	
	private Integer gossipCount;//按照年月计数
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getReleaseDateStr() {
		return releaseDateStr;
	}
	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}
	public Integer getGossipCount() {
		return gossipCount;
	}
	public void setGossipCount(Integer gossipCount) {
		this.gossipCount = gossipCount;
	}
}
