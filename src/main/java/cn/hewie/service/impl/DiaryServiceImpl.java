package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.DiaryDao;
import cn.hewie.entity.Diary;
import cn.hewie.service.DiaryService;

/**
 * 日记service实现类
 * @author Hewie
 *
 */
@Service("diaryService")
public class DiaryServiceImpl implements DiaryService{

	@Resource
	private DiaryDao diaryDao;
	
	public List<Diary> list(Map<String, Object> map) {
		return diaryDao.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return diaryDao.getTotal(map);
	}

	public Diary findById(Integer id) {
		return diaryDao.findById(id);
	}

	public Integer update(Diary diary) {
		return diaryDao.update(diary);
	}

	public Diary getLastDiary(Integer id) {
		return diaryDao.getLastDiary(id);
	}

	public Diary getNextDiary(Integer id) {
		return diaryDao.getNextDiary(id);
	}

	public Integer add(Diary diary) {
		return diaryDao.add(diary);
	}

	public Integer delete(Integer id) {
		return diaryDao.delete(id);
	}
}
