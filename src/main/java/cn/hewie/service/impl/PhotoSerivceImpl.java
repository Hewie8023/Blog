package cn.hewie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hewie.dao.PhotoDao;
import cn.hewie.entity.Photo;
import cn.hewie.service.PhotoService;

/**
 * 图片Serivce实现类
 * @author Hewie
 *
 */
@Service("photoService")
public class PhotoSerivceImpl implements PhotoService{

	@Resource
	private PhotoDao photoDao;

	public List<Photo> list(Map<String, Object> map) {
		return photoDao.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return photoDao.getTotal(map);
	}

	public Photo findById(Integer id) {
		return photoDao.findById(id);
	}

	public Integer update(Photo photo) {
		return photoDao.update(photo);
	}

	public Integer add(Photo photo) {
		return photoDao.add(photo);
	}

	public Integer delete(Integer id) {
		return photoDao.delete(id);
	}

	public Photo getLastPhoto(Integer id) {
		return photoDao.getLastPhoto(id);
	}

	public Photo getNextPhoto(Integer id) {
		return photoDao.getNextPhoto(id);
	}
	
	
}
