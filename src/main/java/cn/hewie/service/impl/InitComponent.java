package cn.hewie.service.impl;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import cn.hewie.entity.Blog;
import cn.hewie.entity.BlogType;
import cn.hewie.entity.Blogger;
import cn.hewie.entity.DailyWord;
import cn.hewie.entity.Link;
import cn.hewie.entity.Notice;
import cn.hewie.entity.UpdateLog;
import cn.hewie.service.BlogService;
import cn.hewie.service.BlogTypeService;
import cn.hewie.service.BloggerService;
import cn.hewie.service.DailyWordService;
import cn.hewie.service.LinkService;
import cn.hewie.service.NoticeService;
import cn.hewie.service.UpdateLogService;
import cn.hewie.util.StringUtil;

@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware{

	private static ApplicationContext applicationContext;
	
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		
		BloggerService bloggerService = (BloggerService) applicationContext.getBean("bloggerService");
		Blogger blogger = bloggerService.find();//获取博主信息
		blogger.setPassword(null);
		application.setAttribute("blogger", blogger);
		
		LinkService linkService = (LinkService) applicationContext.getBean("linkService");
		List<Link> linkList = linkService.linkList(null);// 查询所有的友情链接信息
		application.setAttribute("linkList", linkList);
		
		BlogTypeService blogTypeService=(BlogTypeService) applicationContext.getBean("blogTypeService");
		List<BlogType> blogTypeCountList = blogTypeService.countList();//查询博客类别以及博客的数量
		application.setAttribute("blogTypeCountList", blogTypeCountList);
		
		BlogService blogService=(BlogService) applicationContext.getBean("blogService");
		List<Blog> blogCountList = blogService.countList();//根据日期分组查询博客
		application.setAttribute("blogCountList", blogCountList);
		
		List<Blog> randBlogList = blogService.getRandBlogList();//随机文章
		application.setAttribute("randBlogList", randBlogList);
		
		List<Blog> hotBlogList = blogService.getHotBlogList();//获取最热的10篇博客
		application.setAttribute("hotBlogList", hotBlogList);
		
		DailyWordService dailyWordService = (DailyWordService) applicationContext.getBean("dailyWordService");
		DailyWord dailyWord = dailyWordService.latestWord();//获取最新的每日一语
		//application.setAttribute("dailyWord", dailyWord);
		
		NoticeService noticeService = (NoticeService) applicationContext.getBean("noticeService");
		List<Notice> noticeList = noticeService.list(null);	//获取网站公告
		if(dailyWord != null){
			Notice dailyWordCh = new Notice("每日一语  — "+dailyWord.getDailyWordC());
			//Notice dailyWordEn = new Notice("One word one day — "+dailyWord.getDailyWordE());
			noticeList.add(dailyWordCh);//添加每日一语
			//noticeList.add(dailyWordEn);
		}
		application.setAttribute("noticeList", noticeList);
		
		UpdateLogService updateLogService = (UpdateLogService) applicationContext.getBean("updateLogService");
		List<UpdateLog> updateLogList = updateLogService.list(null);//获取更新日志
		application.setAttribute("updateLogList", updateLogList);
	}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	
}
