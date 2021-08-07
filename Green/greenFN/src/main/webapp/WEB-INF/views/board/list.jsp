<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
	
</script>

<div id="listBody">
	<div class="listHeader">
		<h1>Green</h1>
	</div>
	
	
	<div class="board">
		<!-- nav -->
		<div class="listNav">
			<div class="rank">
				<ul id="ticker" class="ticker">
				</ul>
			</div>
			
			<div>
				<div class="menu">
					<ul>
						<li><a href="${cpath }">HOME</a></li>
						<li><a href="${cpath }/board/covid19?page=1">COVID-19</a></li>
						<li><a href="${cpath }/board/sky?page=1">SKY</a></li>
						<li><a href="${cpath }/board/ocean?page=1">OCEAN</a></li>
						<li><a href="${cpath }/board/oneWord?page=1">Comunity</a></li>
					</ul>
				</div>	
			</div>
		</div>
		
		<!-- board -->
		<div class="board">
			<div>
				<c:forEach var="list" items="${boardList }">
					<div class="boardBox">
						<div><img src=""></div>
						<div class="boardText">
							<a href="">${list.title }</a>
							<a href="">${list.wdate }</a>
							<a href="">${list.idx }</a>
							<a href=""></a>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div id="sidebar">
                <div class="sideBoard">
                    <div id="title">
                        <strong>최신기사</strong>
                    </div>
                    <div class="article">
                    	<c:forEach var="list" items="${sideList }">
                        	<a href="${list.title}"></a>
                        </c:forEach>
                    </div>
                </div>
                <div id="title">
                    <strong>포토뉴스</strong>
                </div>
                <div id="article">
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <div id="title">
                        <strong>인기뉴스</strong>
                    </div>
                    <div id="article">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
        <!-- board end -->
		</div>
		
		
		
		
		
		<div class="paging-number">
			<c:if test="${paging.prev }">
				<a href="${cpath }/board/list?page=${paging.begin - 1}&category=${param.category}">
					<
				</a>
			</c:if>
		
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a href="${cpath }/board/list?page=${i}&category=${param.category}">
					${i == param.page ? '<strong>' : ''}
						${i }
					${i == param.page ? '</strong>' : ''}
				</a>
			</c:forEach>
			
			<c:if test="${paging.next }">
				<a href="${cpath }/board/list?page=${paging.end + 1}&category=${param.category}">
					>
				</a>
			</c:if>
		</div>
		
		<!-- slide banner -->
		
		<div class="postSlider">
			슬라이더 자리		
		</div>
		
		
	</div>
	

	
</div>

<script>
	
	
	
</script>


<%@ include file="../footer.jsp"%>