package cn.hewie.entity;

/**
 * 博客类型实体
 * @author Hewie
 *
 */
public class BlogType {
	
	private Integer blogTypeId;//编号
	private String typeName;//博客类型名称
	private Integer orderNo;//排序序号 从小到大排序
	private Integer blogCount;//数量
	
	public Integer getBlogTypeId() {
		return blogTypeId;
	}
	public void setBlogTypeId(Integer blogTypeId) {
		this.blogTypeId = blogTypeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getBlogCount() {
		return blogCount;
	}
	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}
}