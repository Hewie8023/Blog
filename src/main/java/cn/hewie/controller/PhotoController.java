package cn.hewie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.hewie.entity.Photo;
import cn.hewie.entity.PageBean;
import cn.hewie.entity.Photo;
import cn.hewie.service.PhotoService;
import cn.hewie.util.PageUtil;
import cn.hewie.util.StringUtil;

/**
 *图片Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/")
public class PhotoController {

	@Resource
	private PhotoService photoService;
	
	@RequestMapping("/album")
	public ModelAndView list(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		try{
			
			List<Photo> photoList = photoService.list(null);
			mav.addObject("photoList", photoList);
			mav.addObject("pageTitle", "美图分享 —— Hewie个人博客 — 学习、记录、分享");
			mav.setViewName("album");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 请求日记详细信息
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/images/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		Photo photo = photoService.findById(id);
		mav.addObject("photo", photo);
		photo.setClickHit(photo.getClickHit()+1);
		photoService.update(photo);
		mav.addObject("pageCode", this.getUpAndDownPageCode(photoService.getLastPhoto(id), photoService.getNextPhoto(id), request.getServletContext().getContextPath()));
		mav.addObject("pageTitle", photo.getNickName()+"—— Hewie个人博客 — 学习、记录、分享");
		mav.addObject("mainPage", "foreground/photo/view.jsp");
		mav.setViewName("photo");
		return mav;
	}
	
	/**
	 * 获取上一张和下一张图片
	 * @param lastPhoto
	 * @param nextPhoto
	 * @param projectContext
	 * @return
	 */
	private String getUpAndDownPageCode(Photo lastPhoto,Photo nextPhoto,String projectContext){
		StringBuffer pageCode = new StringBuffer();
		String title = null;
		if(lastPhoto==null || lastPhoto.getId() == null){
			pageCode.append("<li class='previous disabled'><a href='#'><span aria-hidden='true'>&larr;</span> 没有了</a></li>");
		}else{
			pageCode.append("<li class='previous' ><a title='"+lastPhoto.getNickName()+"' href='"+projectContext+"/photo/images/"+lastPhoto.getId()+".html' ><span aria-hidden='true'>&larr;&nbsp;&nbsp;</span>"+lastPhoto.getNickName()+"</a></li>");
		}
		if(nextPhoto==null || nextPhoto.getId() == null){
			pageCode.append("<li class='next disabled'><a href='#'>没有了<span aria-hidden='true'>&rarr;</span></a></li>");
		}else{
			pageCode.append("<li class='next' ><a title='"+nextPhoto.getNickName()+"' href='"+projectContext+"/photo/images/"+nextPhoto.getId()+".html' >"+nextPhoto.getNickName()+"<span aria-hidden='true'>&nbsp;&nbsp;&rarr;</span></a></li>");
		}
		
		return pageCode.toString();
	}
}
