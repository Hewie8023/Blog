package cn.hewie.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

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
import cn.hewie.service.CommentService;
import cn.hewie.service.DailyWordService;
import cn.hewie.service.DiaryService;
import cn.hewie.service.GossipService;
import cn.hewie.service.LinkService;
import cn.hewie.service.MsgService;
import cn.hewie.service.NoticeService;
import cn.hewie.service.PhotoService;
import cn.hewie.service.UpdateLogService;
import cn.hewie.util.ResponseUtil;
import net.sf.json.JSONObject;

/**
 * 系统Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {

	@Resource
	private BloggerService bloggerService;
	
	@Resource
	private LinkService linkService;
	
	@Resource
	private BlogTypeService blogTypeService;
	
	@Resource
	private BlogService blogService;
	
	@Resource
	private DailyWordService dailyWordService;
	
	@Resource
	private NoticeService noticeService;
	
	@Resource
	private UpdateLogService updateLogService;
	
	@Resource
	private PhotoService photoService;
	
	@Resource
	private GossipService gossipService;
	
	@Resource
	private DiaryService diaryService;
	
	@Resource
	private CommentService commentService;
	
	@Resource
	private MsgService msgService;
	
	/**
	 * 刷新系统缓存
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/refreshSystem")
	public String refreshSystem(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
		
		Blogger blogger = bloggerService.find();//获取博主信息
		blogger.setPassword(null);
		application.setAttribute("blogger", blogger);
		
		String blogNum = blogService.getTotal(null)+"";//获取博客总数
		application.setAttribute("blogNum", blogNum);
		
		String photoNum = photoService.getTotal(null)+"";//获取照片总数
		application.setAttribute("photoNum", photoNum);
		
		String gossipNum = gossipService.getTotal(null)+"";//获取碎语总数
		application.setAttribute("gossipNum", gossipNum);
		
		String diaryNum = diaryService.getTotal(null)+"";//获取日记总数
		application.setAttribute("diaryNum", diaryNum);
		
		String commentNum = commentService.getTotal(null)+"";//获取评论总数
		application.setAttribute("commentNum", commentNum);
		
		String msgNum = msgService.getTotal(null)+"";//获取留言总数
		application.setAttribute("msgNum", msgNum);
		
		List<Link> linkList = linkService.linkList(null);// 查询所有的友情链接信息
		application.setAttribute("linkList", linkList);
		
		List<BlogType> blogTypeCountList = blogTypeService.countList();//查询博客类别以及博客的数量
		application.setAttribute("blogTypeCountList", blogTypeCountList);
		
		List<Blog> blogCountList = blogService.countList();//根据日期分组查询博客
		application.setAttribute("blogCountList", blogCountList);
		
		List<Blog> hotBlogList = blogService.getHotBlogList();//获取最热的10篇博客
		application.setAttribute("hotBlogList", hotBlogList);
		
		List<Blog> randBlogList = blogService.getRandBlogList();//随机文章
		application.setAttribute("randBlogList", randBlogList);
		
		DailyWord dailyWord = dailyWordService.latestWord();//获取最新的每日一语
		//application.setAttribute("dailyWord", dailyWord);
		
		List<Notice> noticeList = noticeService.list(null);	//获取网站公告
		if(dailyWord != null){
			Notice dailyWordCh = new Notice("每日一语  — "+dailyWord.getDailyWordC());
			//Notice dailyWordEn = new Notice("One word one day — "+dailyWord.getDailyWordE());
			noticeList.add(dailyWordCh);//添加每日一语
			//noticeList.add(dailyWordEn);
		}
		application.setAttribute("noticeList", noticeList);
		
		List<UpdateLog> updateLogList = updateLogService.list(null);//获取更新日志
		application.setAttribute("updateLogList", updateLogList);
		
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		
		return null;
	}
}
