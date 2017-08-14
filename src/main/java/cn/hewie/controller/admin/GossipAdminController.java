package cn.hewie.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.hewie.entity.Diary;
import cn.hewie.entity.Gossip;
import cn.hewie.entity.PageBean;
import cn.hewie.service.GossipService;
import cn.hewie.util.ResponseUtil;
import cn.hewie.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 时光轴管理Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/admin/gossip")
public class GossipAdminController {

	@Resource
	private GossipService gossipService;
	
	/**
	 * 添加或者修改时光轴信息 
	 * @param gossip
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Gossip gossip,HttpServletResponse response) throws Exception{
		int resultTotal = 0;
		if(gossip.getId() == null){
			//添加
			resultTotal = gossipService.add(gossip);
			
		}else{
			//修改
			resultTotal = gossipService.update(gossip);
		}
		JSONObject result = new JSONObject();
		if(resultTotal > 0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 分页查询时光轴信息
	 * @param page
	 * @param rows
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,HttpServletResponse response) throws Exception{
		PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size",pageBean.getPageSize());
		List<Gossip> gossipList = gossipService.list(map);
		Long total = gossipService.getTotal(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(gossipList, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 时光轴信息删除
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i = 0; i < idsStr.length; i++){
			gossipService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success",true);
		ResponseUtil.write(response, result);
		return null; 
	}
	
	/***
	 * 通过id查找实体
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id") String id,HttpServletResponse response)throws Exception{
		Gossip gossip = gossipService.findById(Integer.parseInt(id));
		JSONObject result = JSONObject.fromObject(gossip);
		ResponseUtil.write(response, result);
		return null;
	}
}
