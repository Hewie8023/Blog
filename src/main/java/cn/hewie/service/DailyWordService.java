package cn.hewie.service;

import java.util.List;
import java.util.Map;

import cn.hewie.entity.DailyWord;

/**
 * 每日一语Service接口类
 * @author Hewie
 *
 */
public interface DailyWordService {

	/**
	 * 分页查询每日一语
	 * @param map
	 * @return
	 */
	public List<DailyWord> list(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 更新每日一语
	 * @param dailyWord
	 * @return
	 */
	public Integer update(DailyWord dailyWord);
	
	/**
	 * 添加每日一语
	 * @param dailyWord
	 * @return
	 */
	public Integer add(DailyWord dailyWord);
	
	/**
	 * 删除每日一语
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	
	/**
	 * 获取发布日期最新的每日一语
	 * @return
	 */
	public DailyWord latestWord();
}
