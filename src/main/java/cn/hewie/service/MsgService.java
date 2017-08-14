package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Msg;

/**
 * 留言Service接口类
 * @author Hewie
 *
 */
public interface MsgService {

	/**
	 * 查询用户留言信息
	 * @param map
	 * @return
	 */
	public List<Msg> list(Map<String,Object> map);
	
	/**
	 * 添加留言
	 * @param msg
	 * @return
	 */
	public int add(Msg msg);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 删除留言信息
	 * @param blogId
	 * @return
	 */
	public Integer delete(Integer id);
	
	/**
	 * 修改留言
	 * @param msg
	 * @return
	 */
	public int update(Msg msg);
}
