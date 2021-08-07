<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="serverPath" value="http://221.164.9.200:9876"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial scale=1">
<link href="${cpath}/resources/css/style.css" rel="stylesheet" />
<title>Green</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!--jQuery CDN-->

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!--bootstrap CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<!--폰트 어썸-->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>

<body id="utilBody">
    <div id="utilCate" class="utilCate hidden"><a href="">≡</a></div>
	
	<header id="utilHeader">
	    <div id="utilH1"><a href="${cpath }"><h1>Green</h1></a></div>
	    
	    <nav id="headerNav">
	        <div class="inUtil"><a href="${cpath}">홈</a></div>
	        <div class="inUtil"><a href="${cpath}/board/news?page=1">새소식</a></div>
	        <div class="inUtil"><a href="${cpath}/board/list3?page=1&category=typhoon">태풍</a></div>
	        <div class="inUtil"><a href="${cpath}/board/list3?page=1&category=air">미세먼지</a></div>
	        <div class="inUtil"><a href="${cpath}/board/list3?page=1&category=covid19">Covid19</a></div>
	        <div id="closeUtil"><a href="">^</a></div>
	    </nav>
	</header>
	
	<div class="HNavOverlay hidden"></div>
</body>
	
<script>
	
	const openUtilNav = document.getElementById('utilCate')
	openUtilNav.onclick = () => {
	    event.preventDefault()
	    document.getElementById('utilHeader').style.top = '0px'
	    document.querySelector('.HNavOverlay').classList.remove('hidden')
	    document.querySelector('html').classList.add('overFlow')
	}
	function closeUtilNav() {
	    event.preventDefault()
		document.getElementById('utilHeader').style.top = '-110px'
		document.querySelector('.HNavOverlay').classList.add('hidden')
	    document.querySelector('html').classList.remove('overFlow')
	}
	const closeUtil = document.getElementById('closeUtil')
	closeUtil.onclick = () => {
		closeUtilNav()
	}
	const HNavOverlay = document.querySelector('.HNavOverlay')
	HNavOverlay.onclick = () => {
		closeUtilNav()
	}
	
</script>



    
    
    
    
    
    
    
    