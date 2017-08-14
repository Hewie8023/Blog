package cn.hewie.entity;

import java.util.Date;

/**
 * 每日一语实体类
 * @author Hewie
 *
 */
public class DailyWord {

	private Integer id;//编号
	private String dailyWordC;//每日一语中文
	private String dailyWordE;//每日一语英文
	private Date releaseDate;//发布日期
	private String releaseDateStr;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDailyWordC() {
		return dailyWordC;
	}
	public void setDailyWordC(String dailyWordC) {
		this.dailyWordC = dailyWordC;
	}
	public String getDailyWordE() {
		return dailyWordE;
	}
	public void setDailyWordE(String dailyWordE) {
		this.dailyWordE = dailyWordE;
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
}
