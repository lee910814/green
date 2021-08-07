<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body class="ListBody">
	<div id="ListH1"><h1>Natural Disasters</h1></div>
    <div class="ListWrap">
        <div id="ListChart">
			<h3>연간 태풍 발생 및 한반도 영향</h3>
			<div id="chart_div"></div>
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
					<a href="${cpath }/board/list3?page=${paging.begin - 1}&category=typhoon"> < </a>
				</c:if>
			
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
					<a href="${cpath }/board/list3?page=${i}&category=typhoon"> ${i == param.page ? '<strong>' : ''}
					${i } ${i == param.page ? '</strong>' : ''} </a>
				</c:forEach>
			
				<c:if test="${paging.next }">
					<a href="${cpath }/board/list3?page=${paging.begin + 1}&category=typhoon"> > </a>
				</c:if>
			</div
        </div>
    </div>
    
<div class="temp hidden"></div>



<script>
	let result;
	let temp = document.querySelector('.temp')
	function ajax() {
		const url = '${cpath}/board/typhoon/json'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => {
			json.forEach(element => {
				for(var key in element){
					const div = document.createElement('div')
					div.className = 'sum'
					div.innerText = element[key]
					temp.appendChild(div)
				}
				
			})
			result = temp.childNodes
		})
		.then(e => googlechart())
	}
	window.onload = () => {
		document.getElementById('utilCate').classList.remove('hidden')
		ajax()
	}
</script>

<!-- 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	function googlechart() {
		
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawVisualization);
	    
	    function drawVisualization() {
	    	
	    	const dat = temp.childNodes
			let sample = [
				['년도', '태풍발생횟수', '한반도 영향도']
	        ]

	         for(let i = 1 ; i <dat.length; i++){
	        	 const year = i + 2000
	        	 let tot = dat[i].innerText.split('(')[0] * 1
	        	 let j = dat[i].innerText.split('(')[1].replace(')','') * 1
	        	 const arr = [year + "" , tot, j]        	 
	        	 sample.push(arr)
	         }
	         
			var data = google.visualization.arrayToDataTable(sample);	// draw
	        var options = {
	          title : '연간 태풍 횟수(자료 출처 : 기상청 국가기후센터데이터)',
	          vAxis: {title: '횟수'},
	          hAxis: {title: '년도'},
	          width: '100%',
	          seriesType: 'bars',
	          series: {0: {type: 'line'},1: {type: 'line'}}
	        };
	        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
	}
	$(window).resize(function(){
		googlechart()
	})
</script>


</body>
</html>