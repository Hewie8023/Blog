package cn.hewie.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.hewie.entity.Blogger;
import cn.hewie.service.BloggerService;
import cn.hewie.util.CryptographyUtil;

/**
 * 博主Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/")
public class BloggerController {

	@Resource
	private BloggerService bloggerService;
	
	@RequestMapping("/blogger/login")
	public String login(Blogger blogger,HttpServletRequest request){
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUserName(), CryptographyUtil.md5(blogger.getPassword(), "Hewie"));
		try{
			subject.login(token);//登录验证֤
			return "redirect:/admin/main.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("blogger", blogger);
			request.setAttribute("errorInfo", "用户名或者密码错误！");
			return "login";
		}
	}
	
	@RequestMapping("/blogger/lo_gin")
	public String lo_gin(Blogger blogger,HttpServletRequest request){
		Subject subject = SecurityUtils.getSubject();
		String s = request.getContentType();
		String ss= request.getServletPath();
		HttpSession session = request.getSession();
		UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUserName(), CryptographyUtil.md5(blogger.getPassword(), "Hewie"));
		try{
			Blogger currentBlogger = bloggerService.find();//获取博主信息
			currentBlogger.setPassword(null);
			session.setAttribute("currentBlogger", currentBlogger);
			subject.login(token);//登录验证
			return "redirect:/diary/list.html";
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("blogger", blogger);
			request.setAttribute("errorInfo", "用户名或者密码错误！");
			return "lo_gin";
		}
	}
	
	
	@RequestMapping("/blogger")
	public ModelAndView aboutMe()throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("aboutMeTitle", "关于博主 —— Hewie个人博客 — 学习、记录、分享");
		mav.setViewName("blogger");
		return mav;
	}
	
	/**
	 * 用户注销
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/blogger/logout")
	public String logout()throws Exception{
		SecurityUtils.getSubject().logout();//清除session
		return "redirect:/lo_gin.jsp";
	}
}
