<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body class="viewBody">
	<div id="viewHeader">
	
		<div id="viewH1"><h1>${dto.title }</h1></div>
		
		<div id="viewHeader2">
			<div id="viewWdateCount">
				<div>${dto.wdate }</div>
				<div id="viewViewCount">
					<span class="newsViewCount"><img
					src="http://221.164.9.200:9876/좋아요.png" class="goodImg">${dto.viewCount }</span>
				</div>
			</div>
			<div id="Btns">
				<a href="${cpath }/board/update?idx=${dto.idx}&page=${param.page }&paramCate=${param.paramCate }">수정하기</a>
				<button class="viewDeleteBtn">삭제하기</button>
			</div>
		</div>
		<div id="viewMain">
			<div id="viewImage" style="background-image: url('${serverPath}/${dto.uploadfile }')"></div>
			<div id="viewContent">${dto.content }</div>
		</div>
	</div>
	
	<div></div>

<script>
window.onload = () => {
   	document.getElementById('utilCate').classList.remove('hidden')
}
</script>
</body>
</html>