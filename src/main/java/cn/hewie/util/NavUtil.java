package cn.hewie.util;

/**
 * 面包屑导航util实现类
 * @author Hewie
 *
 */
public class NavUtil {

	public static String getBlogListNavigation(String typeName,String id){
		StringBuffer navCode = new StringBuffer();
		navCode.append("<blockquote class=' shadow'><a  href='/index.html' title='网站首页'>网站首页</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;"+typeName+"</cite></a></blockquote>");
		return navCode.toString();
	}
	
	public static String getSearchNavigation(String keyword){
		StringBuffer navCode = new StringBuffer();
		navCode.append("<blockquote class=' shadow'><a  href='/index.html' title='网站首页'>网站首页</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;搜索结果&nbsp>><font color='#ED6D5A'>"+keyword+"</font></cite></a></blockquote>");
		return navCode.toString();
	}
	
	public static String getBlogArticleNavigation(String typeName,String id,String title){
		StringBuffer navCode = new StringBuffer();
		navCode.append("<blockquote class=' shadow'><a  href='/index.html' title='网站首页'>网站首页</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;</cite></a><a href='/blog/list.html?typeId="+id+"' title='"+typeName+"'>"+typeName+"</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;"+title+"</cite></a></blockquote>");
		return navCode.toString();
	}
	
	public static String getGossipNavigation(){
		StringBuffer navCode = new StringBuffer();
		navCode.append("<blockquote class=' shadow'><a  href='/index.html' title='网站首页'>网站首页</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;闲言碎语</cite></a></blockquote>");
		return navCode.toString();
	}
	
	public static String getDiaryListNavigation(){
		StringBuffer navCode = new StringBuffer();
		navCode.append("<blockquote class=' shadow'><a  href='/index.html' title='网站首页'>网站首页</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;日记</cite></a>(<a href='javascript:logout()'>安全退出</a>)</blockquote>");
		return navCode.toString();
	}
	
	public static String getDiaryArticleNavigation(String title){
		StringBuffer navCode = new StringBuffer();
		navCode.append("<blockquote class=' shadow'><a  href='/index.html' title='网站首页'>网站首页</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;</cite></a><a href='/diary/list.html' title='日记'>日记</a>");
		navCode.append("<a><cite>&nbsp;>&nbsp;"+title+"</cite></a></blockquote>");
		return navCode.toString();
	}
}
