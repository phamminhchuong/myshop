<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<div id="page-content" class="page-wrapper">

            <!-- BLOG SECTION START -->
            <div class="blog-section mb-50">
                <div class="container">
                    <div class="row">
                    	<tiles:insertAttribute name="body"></tiles:insertAttribute>
						<tiles:insertAttribute name="left-bar"></tiles:insertAttribute>
					</div>
                </div>
            </div>
            <!-- BLOG SECTION END -->             
        </div>

<tiles:insertAttribute name="footer"></tiles:insertAttribute>