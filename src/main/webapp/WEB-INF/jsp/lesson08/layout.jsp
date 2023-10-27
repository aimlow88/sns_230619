<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
	  	<link rel="stylesheet" href="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_css_bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- AJAX사용하려면 jquey 원본 사용 slim사용 안됨 -->
		<script src="/script/code.jquery.com_jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 		<script src="/script/cdnjs.cloudflare.com_ajax_libs_popper.js_1.12.9_umd_popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 		<script src="/script/maxcdn.bootstrapcdn.com_bootstrap_4.0.0_js_bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 		<!-- date picker 사용을 위한 스크립트 -->
 		<link rel="stylesheet" href="/script/code.jquery.com_ui_1.13.2_themes_base_jquery-ui.css">
		<script src="/script/code.jquery.com_ui_1.13.2_jquery-ui.js"></script>

		<!-- 내가 만든 stylesheet -->
		<link rel="stylesheet" type="text/css" href="/css/lesson08/memo/style.css">
	
		<meta charset="UTF-8">
		<title>회원 가입</title>
	</head>
	<body>
		<div class="container">
			<div id="wrap">
				<jsp:include page="header.jsp" />
				
				<jsp:include page="view2.jsp" />
				
				<jsp:include page="footer.jsp" />
				

			</div>
		</div>
	</body>
</html>