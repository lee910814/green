<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<body class="ListBody">
	<div id="ListH1"><h1>Air pollution</h1></div>
	<div class="ListWrap">
		<div id="airChart">
			<div>
				<img id="airImg">
				<div id="airBtns" class="btn--dust-group">
			 		<button class="btn btn--dust active" value="pm10">미세먼지</button>
			    	<button class="btn btn--dust" value="pm25">초미세먼지</button>
				</div>
			</div>
		    <table id="airTable" class="table table--dust" style="display: inline-block">
		        <thead>
		        <tr>
		            <th>관측지점</th>
		            <th>오늘</th>
		            <th>내일</th>
		            <th id="more">모레</th>
		        </tr>
		        </thead>
		        <tbody id="dustTBody">
		        <tr id="서울">
		        </tr>
		        <tr id="경기북부">
		        </tr>
		        <tr id="경기남부">
		        </tr>
		        <tr id="인천">
		        </tr>
		        <tr id="영동">
		        </tr>
		        <tr id="영서">
		        </tr>
		        <tr id="세종">
		        </tr>
		        <tr id="충북">
		        </tr>
		        <tr id="충남">
		        </tr>
		        <tr id="대전">
		        </tr>
		        <tr id="경북">
		        </tr>
		        <tr id="경남">
		        </tr>
		        <tr id="대구">
		        </tr>
		        <tr id="울산">
		        </tr>
		        <tr id="부산">
		        </tr>
		        <tr id="전북">
		        </tr>
		        <tr id="전남">
		        </tr>
		        <tr id="광주">
		        </tr>
		        <tr id="제주">
		        </tr>
		        </tbody>
		    </table>
		</div>
        <div id="ListList">
            <c:forEach items="${list }" var="dto">
            	<div class="news Lists">
            		<a href="${cpath }/board/view?idx=${dto.idx }&page=${param.page}&paramCate=${dto.category}">
            			<div class="newsFlex">
            				<div class="newsImage ListImage" style="background-image: url('${serverPath}/${dto.uploadfile }')"></div>
            				
							<div class="newsRightInfo ListRightInfo">
							
								<div class="newsBoxHeader ListBoxHeader">
									
									<div class="newsTit ListTit">${dto.title }</div>
									
									<div class="newsDateAndViewCount">
										<span class="newsDate">${dto.wdate }</span><span
										class="newsViewCount"><img
										src="http://221.164.9.200:9876/좋아요.png" class="goodImg">${dto.viewCount }</span>
									</div>
									
								</div>
								
								<div class="newsContent ListContent">
									<p>${dto.content }</p>
								</div>
							</div>
            			</div>
            		</a>
            	</div>
            </c:forEach>
	        <div class="ListPaging paging-number">
				<c:if test="${paging.prev }">
					<a href="${cpath }/board/list3?page=${paging.begin - 1}&category=air"> < </a>
				</c:if>
			
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
					<a href="${cpath }/board/list3?page=${i}&category=air"> ${i == param.page ? '<strong>' : ''}
					${i } ${i == param.page ? '</strong>' : ''} </a>
				</c:forEach>
			
				<c:if test="${paging.next }">
					<a href="${cpath }/board/list3?page=${paging.begin + 1}&category=air"> > </a>
				</c:if>
			</div
        </div>
	</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/air.js"></script>
<script>
	window.onload = () => {
		document.getElementById('utilCate').classList.remove('hidden')
	}
</script>
</body>
</html>