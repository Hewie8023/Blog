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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.hewie.entity.Blog;
import cn.hewie.entity.PageBean;
import cn.hewie.service.BlogService;
import cn.hewie.util.PageUtil;
import cn.hewie.util.StringUtil;

/**
 * 主页Controller
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {

	@Resource
	private BlogService blogServie;
	
	/**
	 * 主页Contrller
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(value="page",required=false)String page,
								@RequestParam(value="releaseDateStr",required=false)String releaseDateStr,
								HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		if(StringUtil.isEmpty(page)){
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page),10); //每页八条
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("releaseDateStr", releaseDateStr);
		List<Blog> blogList = blogServie.list(map);
		mav.addObject("blogList",blogList);
		//缩略图
		for(Blog blog:blogList){
			List<String> imageList=blog.getImageList();
			String blogInfo=blog.getContent();
			Document doc=Jsoup.parse(blogInfo);
			Elements jpgs=doc.select("img[src$=.png],[src$=.jpg],[src$=.gif],[src$=.bmp],[src$=.JPEG]");
			for(int i=0;i<jpgs.size();i++){
				Element jpg=jpgs.get(i);
				imageList.add(jpg.toString());
				if(i==0){
					System.out.println(imageList);
					break;//只取一张
				}
			}
		}
		mav.addObject("pageCode", PageUtil.genPagination(request.getContextPath()+"/index.html", blogServie.getTotal(map), Integer.parseInt(page), 10, null));
		mav.addObject("pageTitle", "Hewie个人博客 — 学习、记录、分享");
		mav.addObject("mainPage", "foreground/blog/list.jsp");
		mav.setViewName("mainTemp");
		return mav;
	}
}
