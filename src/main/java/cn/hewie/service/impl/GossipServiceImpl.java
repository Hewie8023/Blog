package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.GossipDao;
import cn.hewie.entity.Gossip;
import cn.hewie.service.GossipService;

/**
 * 碎语service实现类
 * @author Hewie
 *
 */
@Service("gossipService")
public class GossipServiceImpl implements GossipService{

	@Resource
	private GossipDao gossipDao;

	public List<Gossip> list(Map<String, Object> map) {
		return gossipDao.list(map);
	}

	public List<Gossip> countList() {
		return gossipDao.countList();
	}

	public Long getTotal(Map<String, Object> map) {
		return gossipDao.getTotal(map);
	}

	public Integer add(Gossip gossip) {
		return gossipDao.add(gossip);
	}

	public Integer update(Gossip gossip) {
		return gossipDao.update(gossip);
	}

	public Integer delete(Integer id) {
		return gossipDao.delete(id);
	}

	public Gossip findById(Integer id) {
		return gossipDao.findById(id);
	}
}
