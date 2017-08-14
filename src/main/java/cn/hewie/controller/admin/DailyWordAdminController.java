package cn.hewie.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.hewie.entity.DailyWord;
import cn.hewie.entity.PageBean;
import cn.hewie.service.DailyWordService;
import cn.hewie.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 每日一语管理Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/admin/dailyWord")
public class DailyWordAdminController {

	@Resource
	private DailyWordService dailyWordService;
	
	/**
	 * 分页查询友情链接信息
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
		List<DailyWord> dailyWordList = dailyWordService.list(map);
		Long total = dailyWordService.getTotal(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(dailyWordList, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或者修改友情链接信息 
	 * @param DailyWord
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(DailyWord dailyWord,HttpServletResponse response) throws Exception{
		int resultTotal = 0;
		if(dailyWord.getId() == null){
			//添加
			resultTotal = dailyWordService.add(dailyWord);
			
		}else{
			//修改
			resultTotal = dailyWordService.update(dailyWord);
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
	 * 友情链接信息删除
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		JSONObject result = new JSONObject();
		JSONArray errorInfo = new JSONArray();
		for(int i = 0; i < idsStr.length; i++){
			dailyWordService.delete(Integer.parseInt(idsStr[i]));
		}
		result.put("errorInfo", errorInfo);
		result.put("success",true);
		ResponseUtil.write(response, result);
		return null; 
	}
}
