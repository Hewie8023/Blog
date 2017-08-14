package cn.hewie.controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hewie.entity.Blog;
import cn.hewie.entity.Comment;
import cn.hewie.service.BlogService;
import cn.hewie.service.CommentService;
import cn.hewie.util.ResponseUtil;

/**
 * 评论controller层
 * 
 * @author Hewie
 *
 */

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Resource
	private CommentService commentService;

	@Resource
	private BlogService blogSrevice;

	/**
	 * 添加，修改评论
	 * @param comment
	 * @param iamgeCode
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Comment comment, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
//		String sRand=(String) session.getAttribute("sRand");//获取正确的验证码
		JSONObject result = new JSONObject();
		
		//获取头像名
		Random random = new Random();
		int randNum = random.nextInt(10);//返回[0,10)集合中的整数，注意不包括10
		String visitorImage = "head"+randNum+".jpg";
		comment.setVisitorImage(visitorImage);
		
		int resultTotal = 0;
//		if(!imageCode.equals(sRand)){
//			result.put("success", false);
//			result.put("errorInfo", "验证码填写错误!");
//		}else{
		String visitorIP = request.getRemoteAddr();//获取用户IP
		comment.setVisitorIP(visitorIP);
		if(comment.getId() == null){
			//添加
			resultTotal = commentService.add(comment);
			//评论次数加一
			Blog blog = blogSrevice.findById(comment.getBlog().getBlogId());
			blog.setReplyHit(blog.getReplyHit()+1);
			blogSrevice.update(blog);
		}else{
			//修改
		}
//		}
		if(resultTotal > 0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
}
