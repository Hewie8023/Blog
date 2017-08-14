 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

${navCode }

<div class="timeline-box shadow">
    <div class="timeline-main">
        <h1><i class="fa fa-clock-o"></i>时光轴<span> —— 记录生活点点滴滴</span></h1>
        <div class="timeline-line"></div>
        <div class="timeline-year">
           <!--  <h2><a class="yearToggle" href="javascript:;">2017年</a><i class="fa fa-caret-down fa-fw"></i></h2> -->
            <div class="timeline-month">
             <!--  <h3 class=" animated fadeInLeft"><a class="monthToggle" href="javascript:;">2月</a><i class="fa fa-caret-down fa-fw"></i></h3> -->
             	<c:forEach var="gossip" items="${gossiplist }">
	                <ul>
	                    <li class=" ">
	                        <div class="h4  animated fadeInLeft">
	                            <p class="date"><fmt:formatDate value="${gossip.releaseDate }"   pattern="yyyy-MM-dd HH:mm:ss" type="date" dateStyle="long" /></p>
	                        </div>
	                        <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
	                        <div class="content animated fadeInRight">${gossip.content }</div>
	                        <div class="clear"></div>
	                    </li>
	                </ul>
                </c:forEach>
             </div>
         </div>
         <h1 style="padding-top:4px;padding-bottom:2px;margin-top:40px;"><i class="fa fa-hourglass-end"></i>THE END</h1>
    </div>
</div>
