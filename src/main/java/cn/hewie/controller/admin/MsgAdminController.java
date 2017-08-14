package cn.hewie.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.hewie.entity.Blog;
import cn.hewie.entity.Msg;
import cn.hewie.entity.PageBean;
import cn.hewie.service.MsgService;
import cn.hewie.util.ResponseUtil;
import cn.hewie.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 博客留言管理Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/admin/msg")
public class MsgAdminController {

	@Resource
	private MsgService msgService;
	
	/**
	 * 分页查询博客评论信息
	 * @param page
	 * @param rows
	 * @param state
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,@RequestParam(value="state",required=false) String state,HttpServletResponse response) throws Exception{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("state", state);//状态
		map.put("start", pageBean.getStart());
		map.put("size",pageBean.getPageSize());
		List<Msg> msgList = msgService.list(map);
		Long total = msgService.getTotal(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(msgList, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 审核评论
	 * @param ids
	 * @param state
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/review")
	public String review(@RequestParam(value="ids",required=false) String ids,@RequestParam(value="state",required=false) Integer state,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i = 0; i < idsStr.length; i++){
			Msg msg = new Msg();
			msg.setId(Integer.parseInt(idsStr[i]));
			msg.setState(state);
			msgService.update(msg);
		}
		JSONObject result = new JSONObject();
		result.put("success",true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 博客评论信息删除
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		JSONObject result = new JSONObject();
		for(int i = 0; i < idsStr.length; i++){
			msgService.delete(Integer.parseInt(idsStr[i]));
		}
		result.put("success",true);
		ResponseUtil.write(response, result);
		return null; 
	}
}
