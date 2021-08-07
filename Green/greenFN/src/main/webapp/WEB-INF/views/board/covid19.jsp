<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<body class="ListBody">
	<div id="ListH1"><h1>COVID19</h1></div>
    <div class="ListWrap">
        <div id="ListChart">
			<div id="covidGraph"></div>
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
					<a href="${cpath }/board/list3?page=${paging.begin - 1}&category=covid19"> < </a>
				</c:if>
			
				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
					<a href="${cpath }/board/list3?page=${i}&category=covid19"> ${i == param.page ? '<strong>' : ''}
					${i } ${i == param.page ? '</strong>' : ''} </a>
				</c:forEach>
			
				<c:if test="${paging.next }">
					<a href="${cpath }/board/list3?page=${paging.begin + 1}&category=covid19"> > </a>
				</c:if>
			</div
        </div>
    </div>
    
<div class="temp hidden"></div>

<script>
	let result;	
	let temp = document.querySelector('.temp')
	//데이터 저장용 함수
	function dataInit(e) {
		const dataName = e.nationNm
		const ConfirmedPatient = e.natDefCnt
		const div = document.createElement('div')
		div.className = 'data1'
		div.innerText = dataName + ':' + ConfirmedPatient
		console.log(div)
		document.querySelector('.temp').appendChild(div)
	}
	// 임시 저장용 디브
	// API 정보 가져오기
	// API 정보 가져오기
	   
	    function ajax() {
		    const url = '${cpath}/board/covid19/json'
		    const opt = {
		         method: 'GET'
		    }
		    fetch(url, opt).then(resp => resp.json())
		    .then(json => {
				const arr = json.response.body.items.item
				arr.forEach(e => {
					switch(e.nationNm){
					case '미국':
						dataInit(e)
						break;
					case '인도': 
						dataInit(e)
						break;
					case '브라질': 
						dataInit(e)
						break;
					case '러시아': 
						dataInit(e)
						break;
					case '프랑스': 
						dataInit(e)
						break;
					case '영국': 
						dataInit(e)
						break;
					case '아르헨티나':
						dataInit(e)
						break;
					case '이탈리아': 
						dataInit(e)
						break;
					case '스페인': 
						dataInit(e)
						break;
					case '한국': 
						dataInit(e)
						break;
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 차트 -->
<script type="text/javascript">
	function googlechart() {

		google.charts.load('current', {packages: ['corechart', 'bar']});
		google.charts.setOnLoadCallback(drawBasic);
	
			function drawBasic() {
				const dat = temp.childNodes
				let sample = [
				      ['Country', '확진자 수']
				]
				console.log(dat.length)
				for(let i = 0; i < dat.length; i++) {
					let country = dat[i].innerText.split(':')[0]
					let count = parseInt(dat[i].innerText.split(':')[1])
					const arr = [country, count]
					sample.push(arr)
				}
				console.log(sample)
			    var data = google.visualization.arrayToDataTable(sample);
			    const today = new Date().toISOString().split('T')[0]
			    var options = {
			      title: '세계 주요국 코로나 현황',
			      chartArea: {width: '50%'},
			      hAxis: {
			        title: today + ' 기준',
			        minValue: 0
			      },
			      vAxis: {
			        title: '나라별'
			      }
			    };
			    var chart = new google.visualization.BarChart(document.getElementById('covidGraph'));
			    chart.draw(data, options);
			}
	}
	$(window).resize(function(){
		googlechart()
	})
</script>

</body>
</html>