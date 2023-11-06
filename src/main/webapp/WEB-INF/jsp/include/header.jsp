<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- -- JSTL을 사용하려면 아래의 태그를 붙여 넣는다. -->--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="h-100 header bg-info d-flex justify-content-between">
	<%-- logo --%>
	<div class="logo d-flex align-items-center">
		<h1 class="text-white ml-3">Marondalgram</h1>
	</div>
	
	<%-- 로그인 정보 --%>
	<div class="login-info d-flex align-items-center mr-5">
		<c:if test="${!empty userName}">
			<span class="text-white">${userName}님 안녕하세요</span>
			<a href="/user/sign-out" class="ml-2 text-white font-weight-bold">로그아웃</a>
		</c:if>
	</div>
</div>