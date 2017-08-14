package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Comment;

/**
 * 评论service接口
 * @author Hewie
 *
 */
public interface CommentService {

	/**
	 * 查询用户评论信息
	 * @param map
	 * @return
	 */
	public List<Comment> list(Map<String,Object> map);
	
	/**
	 * 添加评论
	 * @param comment
	 * @return
	 */
	public int add(Comment comment);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 修改评论
	 * @param comment
	 * @return
	 */
	public int update(Comment comment);
	
	/**
	 * 删除评论信息
	 * @param blogId
	 * @return
	 */
	public Integer delete(Integer id);
	
}
