package cn.hewie.controller.admin;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.hewie.entity.PageBean;
import cn.hewie.entity.Photo;
import cn.hewie.service.PhotoService;
import cn.hewie.util.DateUtil;
import cn.hewie.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 相册管理Controller层
 * @author Hewie
 *
 */
@Controller
@RequestMapping("/admin/photo")
public class PhotoAdminController {

	@Resource
	private PhotoService photoService;
	
	/**
	 * 分页查询图片信息
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
		List<Photo> photoList = photoService.list(map);
		Long total = photoService.getTotal(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(photoList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或者修改照片信息 
	 * @param photo
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Photo photo,@RequestParam("imageFile")MultipartFile imageFile,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int resultTotal = 0;
		if(!imageFile.isEmpty()){
			String filePath = request.getServletContext().getRealPath("/");
			String imageName = DateUtil.getCurrentDateStr()+"."+imageFile.getOriginalFilename().split("\\.")[1];
			imageFile.transferTo(new File(filePath+"static/photo/"+imageName));
			photo.setImageName(imageName);
		}
		if(photo.getId() == null){
			//添加
			resultTotal = photoService.add(photo);
			
		}else{
			//修改
			resultTotal = photoService.update(photo);
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
	 * 图片删除
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids",required=false) String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i = 0; i < idsStr.length; i++){
			photoService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success",true);
		ResponseUtil.write(response, result);
		return null; 
	}
}
