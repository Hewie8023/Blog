package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Blog;
import cn.hewie.entity.BlogType;

/**
 * 博客类型Service接口
 * @author Hewie
 *
 */
public interface BlogTypeService {

	/**
	 *查询所有博客类型，以及对应的博客数量
	 * @return
	 */
	public List<BlogType> countList();
	
	/**
	 * 分页查询博客类别信息
	 * @param map
	 * @return
	 */
	public List<BlogType> list(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 博客类别添加
	 * @param blogType
	 * @return
	 */
	public Integer add(BlogType blogType);
	
	/**
	 * 博客类别更新
	 * @param blogType
	 * @return
	 */
	public Integer update(BlogType blogType);
	
	/**
	 * 博客类别删除
	 * @param blogTypeId
	 * @return
	 */
	public Integer delete(Integer blogTypeId);
	
	/**
	 * 获取指定Id的类别名称
	 * @param blogTypeId
	 * @return
	 */
	public String getTypeNameById(Integer blogTypeId);
}
