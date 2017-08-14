<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

${navCode }

 <div class="blog-main-left" style="width: 100%;">
	<!-- 文章内容（使用Kingeditor富文本编辑器发表的） -->
	<div class="article-detail shadow">
	    <div class="article-detail-title">
	        ${diary.title }
	    </div>
	    <div class="article-detail-info">
	        <span>编辑时间：<fmt:formatDate value="${diary.releaseDate }"   pattern="yyyy/MM/dd HH:mm:ss" type="date" dateStyle="long" /></span>
	        <span>作者：${diary.author }</span>
	    </div>
	    <div class="article-detail-content">
	    	${diary.content }
	   		<div style="text-align: center;">
	            <span class="line_m">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	            <span class="theend">The End</span>
	            <span class="line_m">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
           </div>
         </div>
	     <br />
	     <br />

	    <div style="margin-top: -20px;">
			<nav aria-label="...">
				<ul class="pager">
					${pageCode }
				</ul>
			</nav>
		</div>
	</div>
</div>


