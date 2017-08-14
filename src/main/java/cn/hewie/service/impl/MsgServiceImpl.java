package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.MsgDao;
import cn.hewie.entity.Msg;
import cn.hewie.service.MsgService;

/**
 * 留言service实现类
 * @author Hewie
 *
 */
@Service("msgService")
public class MsgServiceImpl implements MsgService{

	@Resource
	private MsgDao msgDao;

	public List<Msg> list(Map<String, Object> map) {
		return msgDao.list(map);
	}

	public int add(Msg msg) {
		return msgDao.add(msg);
	}

	public Long getTotal(Map<String, Object> map) {
		return msgDao.getTotal(map);
	}

	public Integer delete(Integer id) {
		return msgDao.delete(id);
	}

	public int update(Msg msg) {
		return msgDao.update(msg);
	}
	


}
