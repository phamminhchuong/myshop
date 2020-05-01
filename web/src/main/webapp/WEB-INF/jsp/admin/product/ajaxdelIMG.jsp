<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

          <%@include file="/templates/taglib.jsp" %>
 <c:forEach items="${listimg}" var="objimg">
<div id="div-1">
<div id="div-2" onclick="delimage(${objimg.id_image})"><span id="x">X</span></div>
<img alt="" width="100" height="100" src="${pageContext.request.contextPath}/files/${objimg.nameimg}">
</div>
</c:forEach>
