<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<body class="oneWordBody">
	<div class="oneWordTitleWarp">
		<div class="earthImg" style="background-image: url('${serverPath }/병든지구.jpg')"></div>
		<div class="oneWordTitle">지구를 응원해주세요</div>
	</div>
	<div class="oneWordWrap">
		<p id="loginName">${login.name }</p>
		<!-- 입력폼 -->
		<form id="oneWordForm">
			<input type="hidden" name="midx" value="${login.idx }">
			<textarea class="oneWordContent" name="content"
				placeholder="글을 입력해 주세요" required onkeyup="fn_checkByte(this)" autofocus></textarea>
			<sup>(<span id="nowByte">0</span>/100bytes)
			</sup>
			<p>
				<input type="submit" value="글쓰기">
			</p>
		</form>

		<!-- 출력폼 -->
		<div id="oneWordList">
			<c:forEach items="${list }" var="list">
				<ul id="owUl">
					<li>${list.name }</li>
					<li>${list.content }</li>
					<li>${list.wdate }</li>
					<c:if test="${list.midx == login.idx }">
						<button class="onewordDeleteBtn" id="${list.idx }">삭제</button>
					</c:if>
				</ul>
			</c:forEach>
		</div>


		<div class="paging-number">
			<c:if test="${paging.prev }">
				<a href="${cpath }/board/oneWord?page=${paging.begin - 1}"> < </a>
			</c:if>

			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
				<a href="${cpath }/board/oneWord?page=${i}"> ${i == param.page ? '<strong>' : ''}
					${i } ${i == param.page ? '</strong>' : ''} </a>
			</c:forEach>

			<c:if test="${paging.next }">
				<a href="${cpath }/board/oneWord?page=${paging.end + 1}"> > </a>
			</c:if>
		</div>
	</div>

	<script>
	window.onload = () => {
		document.getElementById('utilCate').classList.remove('hidden')
	}
	// 한마디 작성
	const oneWordForm = document.getElementById('oneWordForm')
	oneWordForm.onsubmit = function(event){
		event.preventDefault()
		const formData = new FormData(oneWordForm)
		const ob = {}
		
		for(key of formData.keys()){
			ob[key] = formData.get(key)
		}
		const data = JSON.stringify(ob)
		
		const url = '${cpath}/board/oneWord'
		const opt = {
			method: 'POST',
			body: data,
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		
		fetch(url, opt)
		.then(resp => {	return resp.text()})
		.then(text => {
			if(text == 1){
				oneWordForm.reset()
				location.reload() 
			}else{
				alert('비정상적 접근입니다!!')
			}
		})
	}
	
	// 글삭제
	const onewordDeleteBtn = document.querySelectorAll('.onewordDeleteBtn')
	onewordDeleteBtn.forEach(element => {
		element.onclick = function(event){
			event.preventDefault()
			const idx = event.target.id
			const url = '${cpath}/board/oneWord/delete/' + idx
			const opt = {
					method: 'DELETE'
			}
			fetch(url,opt).then(resp => resp.text())
			.then(text => {
				if(text == 1){
					location.reload()
				}else{
					alert('비정상적 접근입니다')
				}
			})
		}
	})
	
	//textarea 바이트 수 체크하는 함수
    function fn_checkByte(obj) {
    	const maxByte = 100; //최대 100바이트
        const text_val = obj.value; //입력한 문자
        const text_len = text_val.length; //입력한 문자수

        let totalByte = 0;
        for (let i = 0; i < text_len; i++) {
        	const each_char = text_val.charAt(i);
            const uni_char = escape(each_char) //유니코드 형식으로 변환
            if (uni_char.length > 4) {
               // 한글 : 2Byte
               totalByte += 2;
            } else {
               // 영문,숫자,특수문자 : 1Byte
               totalByte += 1;
            }
         }
     	if (totalByte > maxByte) {
            alert('최대 100Byte까지만 입력가능합니다.');
            document.getElementById("nowByte").innerText = totalByte;
            document.getElementById("nowByte").style.color = "red";
        }else{
            document.getElementById("nowByte").innerText = totalByte;
            document.getElementById("nowByte").style.color = "rgb(255, 156, 90)";
        }
	}
	
</script>

</body>

<%@ include file="../footer.jsp"%>