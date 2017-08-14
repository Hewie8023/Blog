package cn.hewie.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.hewie.entity.Blog;
import cn.hewie.entity.Msg;
import cn.hewie.service.MsgService;
import cn.hewie.util.ResponseUtil;

/**
 * 留言controller层
 * 
 * @author Hewie
 *
 */

@Controller
@RequestMapping("/")
public class MsgController {

	@Resource
	private MsgService msgService;
	
	/**
	 * 留言list
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/message")
	public ModelAndView msglist(HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("state", 1);
		mav.addObject("msglist", msgService.list(map));
		mav.addObject("pageTitle", "留言板 —— Hewie个人博客 — 学习、记录、分享");
		//mav.addObject("mainPage", "foreground/message/msglist.jsp");
		mav.setViewName("message");
		return mav;
	}
	
	/**
	 * 添加，修改评论
	 * @param msg
	 * @param iamgeCode
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/message/save")
	public String save(Msg msg, @RequestParam("imageCode") String imageCode, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		String sRand=(String) session.getAttribute("sRand");//获取正确的验证码
		JSONObject result = new JSONObject();
		int resultTotal = 0;
		if(!imageCode.equals(sRand)){
			result.put("success", false);
			result.put("errorInfo", "验证码填写错误!");
		}else{
			//获取头像名
			Random random = new Random();
			int randNum = random.nextInt(10);//返回[0,10)集合中的整数，注意不包括10
			String msgImage = "head"+randNum+".jpg";
			msg.setMsgImage(msgImage);
			String msgIP = request.getRemoteAddr();//获取用户IP
			msg.setMsgIP(msgIP);
			if(msg.getId() == null){
				//添加 
				resultTotal = msgService.add(msg);
			}else{
				//修改
			}
		}
		if(resultTotal > 0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
}
