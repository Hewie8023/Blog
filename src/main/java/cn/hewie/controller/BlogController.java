package cn.hewie.controller;

import java.util.Arrays;
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

import cn.hewie.entity.Blog;
import cn.hewie.entity.PageBean;
import cn.hewie.lucene.BlogIndex;
import cn.hewie.service.BlogService;
import cn.hewie.service.BlogTypeService;
import cn.hewie.service.CommentService;
import cn.hewie.util.NavUtil;
import cn.hewie.util.PageUtil;
import cn.hewie.util.StringUtil;

/**
 *博客Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

	@Resource
	private BlogService blogService;
	
	@Resource
	private BlogTypeService blogTypeService;
	
	@Resource
	private CommentService commentService;
	
	private BlogIndex blogIndex = new BlogIndex();
	
	/**
	 * 博客页listContrller
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView index(@RequestParam(value="page",required=false)String page,
								@RequestParam(value="typeId",required=false)String typeId,
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
		map.put("typeId", typeId);
		map.put("releaseDateStr", releaseDateStr);
		List<Blog> blogList = blogService.list(map);
		mav.addObject("blogList",blogList);
		String typeName = null;
		if(StringUtil.isNotEmpty(typeId)){
			typeName = blogTypeService.getTypeNameById(Integer.parseInt(typeId));
		}else{
			typeName = "博客专栏";
		}
		String navCode = NavUtil.getBlogListNavigation(typeName, typeId);
		mav.addObject("navCode", navCode);
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
		StringBuffer param = new StringBuffer();
		if(StringUtil.isNotEmpty(typeId)){
			param.append("typeId="+typeId+"&");
		}
		if(StringUtil.isNotEmpty(releaseDateStr)){
			param.append("releaseDateStr="+releaseDateStr+"&");
		}
		mav.addObject("pageCode", PageUtil.genPagination(request.getContextPath()+"/blog/list.html", blogService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		mav.addObject("pageTitle", "Hewie个人博客 — 学习、记录、分享");
		mav.addObject("pageKeywords", typeName+" —— 个人博客网站,个人原创网站,计算机视觉,视觉深度学习,OpenCV");
		mav.addObject("pageDescription", typeName+" —— Hewie个人原创独立博客网站,记录博主学习和成长之路。关注计算机视觉技术和OpenCV的学习研究。");
		mav.addObject("mainPage", "foreground/blog/bloglist.jsp");
		mav.setViewName("blog");
		return mav;
	}
	
	/**
	 * 请求博客详细信息
	 * @param blogId
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/articles/{blogId}")
	public ModelAndView details(@PathVariable("blogId") Integer blogId,HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		Blog blog = blogService.findById(blogId);
		
		String keyWords = blog.getKeyWord();
		if(StringUtil.isNotEmpty(keyWords)){
			String arr[] = keyWords.split(" ");
			mav.addObject("keyWords", StringUtil.filterWhite(Arrays.asList(arr)));
		}else{
			mav.addObject("keyWords", null);
		}
		mav.addObject("blog", blog);
		String typeName = null;
		typeName = blogTypeService.getTypeNameById(blog.getBlogType().getBlogTypeId());
		String navCode = NavUtil.getBlogArticleNavigation(typeName, blog.getBlogType().getBlogTypeId()+"", blog.getTitle());
		mav.addObject("navCode", navCode);
		blog.setClickHit(blog.getClickHit()+1);
		blogService.update(blog);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("blogId", blog.getBlogId());
		map.put("state", 1);
		mav.addObject("commentList", commentService.list(map));
		mav.addObject("pageCode", this.getUpAndDownPageCode(blogService.getLastBlog(blogId), blogService.getNextBlog(blogId), request.getServletContext().getContextPath()));
		mav.addObject("pageTitle", blog.getTitle()+" —— Hewie个人博客 — 学习、记录、分享");
		mav.addObject("pageKeywords", blog.getTitle()+" —— 个人博客网站,个人原创网站,计算机视觉,视觉深度学习,OpenCV");
		mav.addObject("pageDescription", blog.getTitle()+" —— Hewie个人原创独立博客网站,记录博主学习和成长之路。关注计算机视觉技术和OpenCV的学习研究。");
		mav.addObject("mainPage", "foreground/blog/view.jsp");
		mav.setViewName("blog");
		return mav;
	}
	
	/**
	 * 获取上一篇和下一篇博客
	 * @param lastBlog
	 * @param nextBlog
	 * @param projectContext
	 * @return
	 */
	private String getUpAndDownPageCode(Blog lastBlog,Blog nextBlog,String projectContext){
		StringBuffer pageCode = new StringBuffer();
		String title = null;
		if(lastBlog==null || lastBlog.getBlogId() == null){
			pageCode.append("<li class='previous disabled'><a href='#'><span aria-hidden='true'>&larr;</span> 没有了</a></li>");
		}else{
			if(lastBlog.getTitle().length() > 15){
				title = lastBlog.getTitle().substring(0, 15);
			}else{
				title = lastBlog.getTitle();
			}
			pageCode.append("<li class='previous' ><a data-toggle='tooltip' data-placement='bottom' title='"+lastBlog.getTitle()+"' href='"+projectContext+"/blog/articles/"+lastBlog.getBlogId()+".html' ><span aria-hidden='true'>&larr;&nbsp;&nbsp;</span>"+title+"...</a></li>");
		}
		if(nextBlog==null || nextBlog.getBlogId() == null){
			pageCode.append("<li class='next disabled'><a href='#'>没有了<span aria-hidden='true'>&rarr;</span></a></li>");
		}else{
			if(nextBlog.getTitle().length() > 15){
				title = nextBlog.getTitle().substring(0, 15);
			}else{
				title = nextBlog.getTitle();
			}
			pageCode.append("<li class='next' ><a data-toggle='tooltip' data-placement='bottom' title='"+nextBlog.getTitle()+"' href='"+projectContext+"/blog/articles/"+nextBlog.getBlogId()+".html' >"+title+"...<span aria-hidden='true'>&nbsp;&nbsp;&rarr;</span></a></li>");
		}
		
		return pageCode.toString();
	}
	
	/**
	 * 根据关键字查询相关博客信息
	 * @param q
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/q")
	public ModelAndView search(@RequestParam(value="q",required=false) String q,@RequestParam(value="page",required=false) String page,HttpServletRequest request)throws Exception{
		int pageSize = 10;//每页10条记录，lucene搜索结果
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		ModelAndView mav = new ModelAndView();
		String navCode = NavUtil.getSearchNavigation(q);
		mav.addObject("navCode", navCode);
		mav.addObject("pageTitle","搜索关键字'"+q+"'结果页面 —— Hewie个人博客 — 学习、记录、分享");
		mav.addObject("mainPage", "foreground/blog/result.jsp");
		List<Blog> blogList = blogIndex.searchBlog(q);
		Integer toIndex = blogList.size()>=Integer.parseInt(page)*pageSize?Integer.parseInt(page)*pageSize:blogList.size();
		mav.addObject("blogList", blogList.subList((Integer.parseInt(page)-1)*pageSize, toIndex));
		mav.addObject("pageCode", this.getUpAndDownPageCode(Integer.parseInt(page), blogList.size(), q, pageSize, request.getServletContext().getContextPath()));
		mav.addObject("q", q);
		mav.addObject("resultTotal", blogList.size());
		mav.setViewName("blog");
		return mav;
	}
	
	/**
	 * 获取上一页下一页查询记录
	 * @param page
	 * @param totalNum
	 * @param q
	 * @return
	 */
	private String getUpAndDownPageCode(Integer page,Integer totalNum,String q,Integer pageSize, String projectContext){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		StringBuffer pageCode = new StringBuffer();
		if(totalPage==0){
			return "";
		}else{
			pageCode.append("<nav>");
			pageCode.append(" <ul class='pager'>");
			if(page>1){
				pageCode.append(" <li><a href='"+projectContext+"/blog/q.html?page="+(page-1)+"&q="+q+"'>上一页</a></li>");
			}else{
				pageCode.append(" <li class='disabled'><a href='#'>上一页</a></li>");
			}
			if(page<totalPage){
				pageCode.append(" <li><a href='"+projectContext+"/blog/q.html?page="+(page+1)+"&q="+q+"'>下一页</a></li>");
			}else{
				pageCode.append(" <li class='disabled'><a href='#'>下一页</a></li>");
			}
			pageCode.append("</ul>");
			pageCode.append("</nav>");
		}
		return pageCode.toString();
	}
	
}
