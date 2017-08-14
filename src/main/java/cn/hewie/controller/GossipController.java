package cn.hewie.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.hewie.service.GossipService;
import cn.hewie.util.NavUtil;

/**
 *碎语controller层
 * 
 * @author Hewie
 *
 */

@Controller
@RequestMapping("/gossip")
public class GossipController {

	@Resource
	private GossipService gossipService;
	
	/**
	 * 碎语list
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		String navCode = NavUtil.getGossipNavigation();
		mav.addObject("navCode", navCode);
		mav.addObject("gossiplist", gossipService.list(null));
		mav.addObject("pageTitle", "闲言碎语 —— Hewie个人博客 — 学习、记录、分享");
		mav.addObject("mainPage", "foreground/gossip/list.jsp");
		mav.setViewName("gossip");
		return mav;
	}
}
