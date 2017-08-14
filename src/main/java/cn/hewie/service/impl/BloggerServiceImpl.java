package cn.hewie.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.BloggerDao;
import cn.hewie.entity.Blogger;
import cn.hewie.service.BloggerService;;
/**
 * 博主Service实现类
 * @author Hewie
 *
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

	@Resource
	private BloggerDao bloggerDao;
	
	public Blogger getByUserName(String userName) {
		return bloggerDao.getByUserName(userName);
	}

	public Blogger find() {
		return bloggerDao.find();
	}

	public Integer update(Blogger blogger) {
		return bloggerDao.update(blogger);
	}

}
