package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.UpdateLogDao;
import cn.hewie.entity.UpdateLog;
import cn.hewie.service.UpdateLogService;

/**
 * 更新日志service实现类
 * @author Hewie
 *
 */
@Service("updateLogService")
public class UpdateLogServiceImpl implements UpdateLogService{

	@Resource
	private UpdateLogDao updateLogDao;

	public List<UpdateLog> list(Map<String, Object> map) {
		return updateLogDao.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return updateLogDao.getTotal(map);
	}

	public Integer add(UpdateLog updateLog) {
		return updateLogDao.add(updateLog);
	}

	public Integer update(UpdateLog updateLog) {
		return updateLogDao.update(updateLog);
	}

	public Integer delete(Integer id) {
		return updateLogDao.delete(id);
	}
	
	
}
