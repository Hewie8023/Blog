package cn.hewie.dao;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Notice;

/**
 * 网站公告Dao接口类
 * @author Hewie
 *
 */
public interface NoticeDao {

	/**
	 * 查询网页公告
	 * @param map
	 * @return
	 */
	public List<Notice> list(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加公告
	 * @param notice
	 * @return
	 */
	public Integer add(Notice notice);
	
	/**
	 * 更新公告
	 * @param notice
	 * @return
	 */
	public Integer update(Notice notice);
	
	/**
	 * 删除公告
	 * @param notice
	 * @return
	 */
	public Integer delete(Integer id);
	
	
}
