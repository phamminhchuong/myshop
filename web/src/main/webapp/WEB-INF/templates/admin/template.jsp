
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>

<tiles:insertAttribute name="header"></tiles:insertAttribute>

<tiles:insertAttribute name="leftbar"></tiles:insertAttribute>
<div class="dashboard-wrapper">
	<tiles:insertAttribute name="body"></tiles:insertAttribute>

	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</div>
</div>

</body>

</html>