package cn.hewie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.hewie.entity.Blogger;
import cn.hewie.entity.Diary;
import cn.hewie.entity.PageBean;
import cn.hewie.service.BloggerService;
import cn.hewie.service.DiaryService;
import cn.hewie.util.CryptographyUtil;
import cn.hewie.util.NavUtil;
import cn.hewie.util.PageUtil;
import cn.hewie.util.StringUtil;

/**
 *日记controller层
 * 
 * @author Hewie
 *
 */

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Resource
	private BloggerService bloggerService;
	
	@Resource
	private DiaryService diaryService;
	
	@RequestMapping("/list")
	public ModelAndView list(Blogger blogger,@RequestParam(value="page",required=false)String page,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		try{
			if(StringUtil.isEmpty(page)){
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page),8); //每页八条
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", pageBean.getStart());
			map.put("size", pageBean.getPageSize());
			List<Diary> diaryList = diaryService.list(map);
			mav.addObject("diaryList", diaryList);
			//缩略图
			for(Diary diary:diaryList){
				List<String> imageList=diary.getImageList();
				String diaryInfo=diary.getContent();
				Document doc=Jsoup.parse(diaryInfo);
				Elements jpgs=doc.select("img[src$=.jpg]");
				for(int i=0;i<jpgs.size();i++){
					Element jpg=jpgs.get(i);
					jpg.addClass("img-fluid tm-news-item-img");
					imageList.add(jpg.toString());
					if(i==0){
						break;//只取一张
					}
				}
			}
			String navCode = NavUtil.getDiaryListNavigation();
			mav.addObject("navCode", navCode);
			mav.addObject("pageCode", PageUtil.genPagination(request.getContextPath()+"/diary/list.html", diaryService.getTotal(map), Integer.parseInt(page), 8, null));
			mav.addObject("pageTitle", "心情日记 —— Hewie个人博客 — 学习、记录、分享");
			mav.addObject("mainPage", "foreground/diary/list.jsp");
			mav.setViewName("diary");
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
	@RequestMapping("/articles/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		Diary diary = diaryService.findById(id);
		
		String navCode = NavUtil.getDiaryArticleNavigation(diary.getTitle());
		mav.addObject("navCode", navCode);
		mav.addObject("diary", diary);
		mav.addObject("pageCode", this.getUpAndDownPageCode(diaryService.getLastDiary(id), diaryService.getNextDiary(id), request.getServletContext().getContextPath()));
		mav.addObject("pageTitle", diary.getTitle()+" —— Hewie个人博客 — 学习、记录、分享");
		mav.addObject("mainPage", "foreground/diary/view.jsp");
		mav.setViewName("diary");
		return mav;
	}
	
	/**
	 * 获取上一篇和下一篇日记
	 * @param lastDiary
	 * @param nextDiary
	 * @param projectContext
	 * @return
	 */
	private String getUpAndDownPageCode(Diary lastDiary,Diary nextDiary,String projectContext){
		StringBuffer pageCode = new StringBuffer();
		String title = null;
		if(lastDiary==null || lastDiary.getId() == null){
			pageCode.append("<li class='previous disabled'><a href='#'><span aria-hidden='true'>&larr;</span> 没有了</a></li>");
		}else{
			if(lastDiary.getTitle().length() > 15){
				title = lastDiary.getTitle().substring(0, 15);
			}else{
				title = lastDiary.getTitle();
			}
			pageCode.append("<li class='previous' ><a title='"+lastDiary.getTitle()+"' href='"+projectContext+"/diary/articles/"+lastDiary.getId()+".html' ><span aria-hidden='true'>&larr;&nbsp;&nbsp;</span>"+title+"...</a></li>");
		}
		if(nextDiary==null || nextDiary.getId() == null){
			pageCode.append("<li class='next disabled'><a href='#'>没有了<span aria-hidden='true'>&rarr;</span></a></li>");
		}else{
			if(nextDiary.getTitle().length() > 15){
				title = nextDiary.getTitle().substring(0, 15);
			}else{
				title = nextDiary.getTitle();
			}
			pageCode.append("<li class='next' ><a title='"+nextDiary.getTitle()+"' href='"+projectContext+"/diary/articles/"+nextDiary.getId()+".html' >"+title+"...<span aria-hidden='true'>&nbsp;&nbsp;&rarr;</span></a></li>");
		}
		
		return pageCode.toString();
	}
}
