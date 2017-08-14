package cn.hewie.dao;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Gossip;

/**
 * 碎语Dao接口类
 * @author Hewie
 *
 */
public interface GossipDao {

	/**
	 * 查询碎语list
	 * @param map
	 * @return
	 */
	public List<Gossip> list(Map<String,Object> map);
	
	/**
	 * 按照年月查询碎语
	 * @return
	 */
	public List<Gossip> countList();
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加碎语
	 * @param gossip
	 * @return
	 */
	public Integer add(Gossip gossip);
	
	/**
	 * 更新碎语
	 * @param gossip
	 * @return
	 */
	public Integer update(Gossip gossip);
	
	/**
	 * 删除碎语
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Gossip findById(Integer id);
}  
