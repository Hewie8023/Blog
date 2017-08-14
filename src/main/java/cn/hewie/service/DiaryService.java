package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.Diary;

/**
 * 日记service接口类
 * @author Hewie
 *
 */
public interface DiaryService {

	/**
	 * 分页查询日记
	 * @param map
	 * @return
	 */
	public List<Diary> list(Map<String,Object> map);
	
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
	public Diary findById(Integer id);
	
	/**
	 * 更新日记信息
	 * @param diary
	 * @return
	 */
	public Integer update(Diary diary);
	
	/**
	 * 获取上一个日记
	 * @param id
	 * @return
	 */
	public Diary getLastDiary(Integer id);
	
	/**
	 * 获取下一个日记
	 * @param id
	 * @return
	 */
	public Diary getNextDiary(Integer id);
	
	/**
	 * 添加日记
	 * @param diary
	 * @return
	 */
	public Integer add(Diary diary);
	
	/**
	 * 删除日记信息
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
}
