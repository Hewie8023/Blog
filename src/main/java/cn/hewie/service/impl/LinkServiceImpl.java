package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.LinkDao;
import cn.hewie.entity.Link;
import cn.hewie.service.LinkService;;
/**
 *友情链接Service实现类
 * @author Hewie
 *
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService{

	@Resource
	private LinkDao linkDao;
	

	public List<Link> linkList(Map<String, Object> map) {
		return linkDao.linkList(map);
	}


	public Long getTotal(Map<String, Object> map) {
		return linkDao.getTotal(map);
	}


	public Integer add(Link link) {
		return linkDao.add(link);
	}


	public Integer update(Link link) {
		return linkDao.update(link);
	}


	public Integer delete(Integer id) {
		return linkDao.delete(id);
	}

	
}
