package cn.hewie.dao;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.UpdateLog;

/**
 * 更新日志dao接口类
 * @author Hewie
 *
 */
public interface UpdateLogDao {

	/**
	 * 查询更新日志
	 * @param map
	 * @return
	 */
	public List<UpdateLog> list(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加更新日志
	 * @param updateLog
	 * @return
	 */
	public Integer add(UpdateLog updateLog);
	
	/**
	 * 更新更新日志
	 * @param updateLog
	 * @return
	 */
	public Integer update(UpdateLog updateLog);
	
	/**
	 * 删除更新日志
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
}
