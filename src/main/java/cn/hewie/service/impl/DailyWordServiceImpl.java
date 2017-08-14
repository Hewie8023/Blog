package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.DailyWordDao;
import cn.hewie.entity.DailyWord;
import cn.hewie.service.DailyWordService;

/**
 * 每日一语service实现类
 * @author Hewie
 *
 */
@Service("dailyWordService")
public class DailyWordServiceImpl implements DailyWordService{

	@Resource
	private DailyWordDao dailyWordDao;
	
	public List<DailyWord> list(Map<String, Object> map) {
		return dailyWordDao.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return dailyWordDao.getTotal(map);
	}

	public Integer update(DailyWord dailyWord) {
		return dailyWordDao.update(dailyWord);
	}

	public Integer add(DailyWord dailyWord) {
		return dailyWordDao.add(dailyWord);
	}

	public Integer delete(Integer id) {
		return dailyWordDao.delete(id);
	}

	public DailyWord latestWord() {
		return dailyWordDao.latestWord();
	}

}
