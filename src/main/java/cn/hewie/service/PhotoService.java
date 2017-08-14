package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Photo;

/**
 * 图片service接口类
 * @author Hewie
 *
 */
public interface PhotoService {

	/**
	 * 分页查询图片
	 * @param map
	 * @return
	 */
	public List<Photo> list(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Photo findById(Integer id);
	
	/**
	 * 更新图片信息
	 * @param photo
	 * @return
	 */
	public Integer update(Photo photo);
	
	
	/**
	 * 添加图片
	 * @param photo
	 * @return
	 */
	public Integer add(Photo photo);
	
	/**
	 * 删除图片信息
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	/**
	 * 获取上一张图片
	 * @param id
	 * @return
	 */
	public Photo getLastPhoto(Integer id);
	
	/**
	 * 获取下一张图片
	 * @param id
	 * @return
	 */
	public Photo getNextPhoto(Integer id);
}
