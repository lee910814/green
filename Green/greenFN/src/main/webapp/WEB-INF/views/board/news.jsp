<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<body class="newsBody">
	<div class="newsRoot">
		<div class="newsTopTitle">
			<div>새소식</div>
			<div class="newsWriteBtn"><a href="${cpath }/board/write">작성하기</a></div>
		</div>
		<div class="newsWrap">
			<c:forEach items="${list}" var="dto">
				<div class="news">
					<a href="${cpath }/board/view?idx=${dto.idx }&page=${param.page}&paramCate=news">
						<div class="newsFlex">
							<div class="newsImage" style="background-image: url('${serverPath}/${dto.uploadfile }')"></div>
							<div class="newsRightInfo">
								<div class="newsBoxHeader">
									<div class="newsTit">${dto.title }</div>
									<div class="newsDateAndViewCount">
										<span class="newsDate">${dto.wdate }</span><span
										class="newsViewCount"><img
										src="http://221.164.9.200:9876/좋아요.png" class="goodImg">${dto.viewCount }</span>
									</div>
								</div>
								<div class="newsContent">
									<p>${dto.content }</p>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="newsPaging paging-number">
			<c:if test="${paging.prev }">
				<a href="${cpath }/board/news?page=${paging.begin - 1}"> < </a>
			</c:if>
		
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a href="${cpath }/board/news?page=${i}"> ${i == param.page ? '<strong>' : ''}
				${i } ${i == param.page ? '</strong>' : ''} </a>
			</c:forEach>
		
			<c:if test="${paging.next }">
				<a href="${cpath }/board/news?page=${paging.end + 1}"> > </a>
			</c:if>
		</div>
	</div>
	<script>
	window.onload = () => {
		document.getElementById('utilCate').classList.remove('hidden')
	}
	</script>
</body>
</html>