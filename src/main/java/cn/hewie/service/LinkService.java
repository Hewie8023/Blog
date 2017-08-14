package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Blogger;
import cn.hewie.entity.Link;

/**
 * 友情链接Service接口
 * @author Hewie
 *
 */
public interface LinkService {

	/**
	 * 查找友情链接信息
	 * @param map
	 * @return
	 */
	public List<Link> linkList(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 友情链接添加
	 * @param Link
	 * @return
	 */
	public Integer add(Link link);
	
	/**
	 * 友情链接更新
	 * @param Link
	 * @return
	 */
	public Integer update(Link link);
	
	/**
	 * 友情链接删除
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
}
