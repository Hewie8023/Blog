package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.NoticeDao;
import cn.hewie.entity.Notice;
import cn.hewie.service.NoticeService;

/**
 * 网站公告service实现类
 * @author Hewie
 *
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Resource
	private NoticeDao noticeDao;

	public List<Notice> list(Map<String, Object> map) {
		return noticeDao.list(map);
	}

	public Integer add(Notice notice) {
		return noticeDao.add(notice);
	}

	public Integer update(Notice notice) {
		return noticeDao.update(notice);
	}

	public Integer delete(Integer id) {
		return noticeDao.delete(id);
	}

	public Long getTotal(Map<String, Object> map) {
		return noticeDao.getTotal(map);
	}
	
}
