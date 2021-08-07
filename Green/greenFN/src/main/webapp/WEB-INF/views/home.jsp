<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<body class="homeBody">
	
	<!-- loginForm -->
    <div class="loginForm hidden">

        <form>
            <h2>로그인</h2>
            <div class="login_id">
                <input type="email" name="email" placeholder="아이디">
                <input type="password" name="userpw" placeholder="비밀번호">
            </div>
            <div class="submitBtn">
                <input type="submit" value="로그인">
            </div>
            <div class="anotherLogin">
                <div id="naverIdLogin">
                	<a href="${url }">
                		<img width="300" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
                	</a>
                </div>
            </div>
        </form>
    </div>

	<!-- header -->
    <header id="homeHeader">
        <div class="cate"><a href="">≡</a></div>
        <div class="title">
        	<a href="${cpath }">
        		<h1>Green</h1>
        	</a>
        </div>
        <div class="memberInform">
			<p>
            	<a href="" class="login">로그인</a>
            	<a href="${cpath }/logout" class="logout hidden">로그아웃</a>
            	<a href="${cpath }/member/join" class="joinBtn">회원가입</a>
            	<a href="${cpath }/member/myPage" class="myPage hidden">회원정보</a>
			</p>
        </div>
    </header>

    
    <!-- aside -->
    <aside class="mainAside">
        <div class="closeBtn"><a href=""><</a></div>
        <div class="asideList">
            <p><a href="${cpath }">홈</a></p>
            <p><a href="${cpath }/board/introduce">소개글</a></p>
            <p><a href="${cpath }/board/news?page=1">새소식</a></p>
            <p><a href="${cpath }/board/write">글쓰기</a></p>
            <p><a href="${cpath }/board/oneWord?page=1">한마디</a></p>
        </div>
    </aside>
    
    
    <!-- overlay --> 
    <div class="aisdeOverlay hidden"></div>
    <div class="overlay hidden"></div>
    
	<main>
		<div class="part3 sea"><a href="${cpath }/board/list3?page=1&category=typhoon">Natural Disasters</a></div>
		<div class="part3 air"><a href="${cpath }/board/list3?page=1&category=air">Air pollution</a></div>
		<div class="part3 land"><a href="${cpath }/board/list3?page=1&category=covid19">Covid19</a></div>
	</main>
    

	<script>
		
        //aside
        const aisdeOverlay = document.querySelector('.aisdeOverlay')
        const overlay = document.querySelector('.overlay')
        const openBtn = document.querySelector('.cate > a')
        const closeBtn = document.querySelector('.closeBtn > a')
        const aside = document.querySelector('.mainAside')
        const body = document.querySelector('body')

        const openHandler = (event) => {
            event.preventDefault()
            aside.style.left = '0px'
            aisdeOverlay.classList.remove('hidden')
            body.classList.add('overFlow')
    	    }
        const closeHandler = (event => {
            event.preventDefault()
            aside.style.left = '-350px'
            aisdeOverlay.classList.add('hidden')
            body.classList.remove('overFlow')
     	   })
        openBtn.onclick = openHandler
        closeBtn.onclick = closeHandler
        aisdeOverlay.onclick = closeHandler

        // loginBtn
        const loginForm = document.querySelector('.loginForm')
        const loginBtn = document.querySelector('.login')

        const loginHandler = (event) => {
            event.preventDefault()
            loginForm.classList.remove('hidden')
            overlay.classList.remove('hidden')
            body.classList.add('overFlow')
        	}
        loginBtn.onclick = loginHandler
        overlay.onclick = () => {
            overlay.classList.add('hidden')
            loginForm.classList.add('hidden')
            body.classList.remove('overFlow')
      	  }
       
    </script>

	<script>
		//로그인
		const loginFormInfo = document.forms[0]
		loginFormInfo.onsubmit = function(event) {
			event.preventDefault()
			const ob = {}
			const formData = new FormData(event.target)
			
			for(key of formData.keys()) {
				ob[key] = formData.get(key)
			}
			
			const url = '${cpath}/member/login'
			const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json; charset=utf-8', 
				}
			}
			fetch(url, opt)
			.then(function(resp) {return resp.text() })
			.then(function(text) {
				if(text != 'true') {
					alert('로그인 실패!')
				}
				location.reload();
			})
		}
		
		//로그인 상태 확인
		const login = '${login.name}'
		const NaverName = '${NaverName}'
		function checkLogin() {
			const memberInform = document.querySelectorAll('.memberInform > p > a')
			for(let i = 0; i < memberInform.length; i++) {
				if(login != '' || NaverName != ''){
					i % 2 == 0 ? memberInform[i].classList.add('hidden') : memberInform[i].classList.remove('hidden')
				}else{
					i % 2 == 0 ? memberInform[i].classList.remove('hidden') : memberInform[i].classList.add('hidden')
				}
			}
		}
		checkLogin()
		
		window.onload = () => {
			document.getElementById('utilCate').classList.add('hidden')
		}
	</script>

<%@ include file="footer.jsp" %>
