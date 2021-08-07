<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

</head>
<body class="joinBody">
    
	<div class="overlay hidden"></div>
    <div class="authForm hidden">
    	<input type="text" name="userNumber" placeholder="인증번호를 입력하세요">
    	<button id="authFormBtn">확인</button>
    </div>
    
	<div class="joinForm">
		<form method="POST">
			<h2>회원가입</h2>
			<div class="join">
	
	
				<div class="checkId">
					<div>
						<input type="email" name="email" placeholder="아이디" required oninput="checkId()">
						<button id="checkEmail">인증</button>
					</div>
					<div id="idMsg"></div>
				</div>
	
	
				<div class="checkPw">
					<input type="password" name="userpw" placeholder="비밀번호" required oninput="fn_pw_check()">
					<input type="password" name="userpw2" placeholder="비밀번호 확인" required oninput="checkPw()">
					<div id="pwMsg"></div>
				</div>
				<div class="NameBir">
					<input type="text" name="name" placeholder="이름" required>
					<input type="date" name="birth" required>
				</div>
				<div class="gender">
					<label><input type="radio" name="gender" value="male">남성</label>
					<label><input type="radio" name="gender" value="female">여성</label>
				</div>
				
				<div class="addressWarp">
					<div class="postCodeDiv">
						<input type="text" id="post_code" name="postcode" readonly size="10" placeholder="우편번호" required>
						<button id="addressBtn" onclick="showPostcode()">우편번호 찾기</button>
					</div>
					<input type="text" id="address1" name="address1" readonly size="50" placeholder="주소" required>
					<input type="text" id="address2" name="address2" placeholder="상세 주소 입력" required>
				</div>
			</div>
			
			<div id="joinSubmit">
				<input type="submit" value="회원가입" id="joinFormBtn">
			</div>
		</form>
	</div>
	
	<script>
		//ID 중복확인
		const email = document.querySelector('input[name="email"]')
		const idMsg = document.getElementById('idMsg')
		let idFlag = 1;
		function checkId() {
			idMsg.innerText = ''
			if(email.value == '') {
				idMsg.innerText = ''
				return;
			}
			const url = '${cpath}/member/checkId/' + email.value + '/'
			const opt = {
				method: 'GET'
			}
			fetch(url, opt)
			.then(function(resp) {return resp.text()})
			.then(function(text) {
				console.log('${cpath}')
				if(text == 0) {
					idMsg.innerText = '사용 가능한 E-mail'
					idMsg.style.color = 'rgba(58, 58, 255, 0.8)'
					idFlag = 0;
				}else {
					idMsg.innerText = '사용할수 없는 E-mail'
					idMsg.style.color = 'rgba(255, 0, 0, 0.5)'
					let idFlag = 1;
				}
			}) 
		}
		
		//이메일 인증
		const checkEmailBtn = document.getElementById('checkEmail')
		let emailFlag = 1
		
		function sendMailHandler(event) {
			idMsg.innerText = ''
			const sendEmail = document.querySelector('input[name="email"]')
			const url = '${cpath}/mailto/' + sendEmail.value + '/'
			const opt = {
				method: 'GET'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				if(text.length == 128) {	
					idMsg.innerText = '인증번호를 전송했습니다'
					idMsg.style.color = 'rgba(58, 58, 255, 0.8)'
					document.querySelector('.overlay').classList.remove('hidden')
					document.querySelector('.authForm').classList.remove('hidden')
				}
				else {						
					idMsg.innerText = text
					idMsg.style.color = 'rgba(255, 0, 0, 0.5)'
				}
			})
		}
		checkEmailBtn.onclick = (event) =>{
			event.preventDefault()
			if(idFlag == 0) {
				sendMailHandler()
			}else{
				alert('사용이 불가능한 이메일 입니다.')
			}
		}
		const authFormBtn = document.getElementById('authFormBtn')
		function emailFlagHandler() {
			let userNumber = document.querySelector('input[name="userNumber"]')
			const url = '${cpath}/getAuthResult/' + userNumber.value
			const opt = {
				method: 'GET'
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				userNumber.innerHTML = ''
				document.querySelector('.overlay').classList.add('hidden')
				document.querySelector('.authForm').classList.add('hidden')
				if(text == 'true') {
					alert('인증 성공!')
					idMsg.innerText = '인증 성공'
					idMsg.style.color = 'green'
					emailFlag = 0
				}else {
					alert('인증 실패!')
					idMsg.innerText = '인증 실패'
					idMsg.style.color = 'rgba(255, 0, 0, 0.5)'
					emailFlag = 1
				}
			})
		}
		authFormBtn.onclick = (event) => {
			event.preventDefault()
			console.log('onclick!!')
			emailFlagHandler()
		}
		
		
		
		//비밀번호 확인
		const pw1 = document.querySelector('input[name="userpw"]')
		const pw2 = document.querySelector('input[name="userpw2"]')
		
		const pwMsg = document.getElementById('pwMsg')
		let pwFlag = 1
		function checkPw() {
			if(pw1.value == pw2.value) {
				pwMsg.innerText = '일치'
				pwMsg.style.color = 'rgba(58, 58, 255, 0.8)'
				pwFlag = 0
			}else {
				pwMsg.innerText = '일치 하지 않습니다'
				pwMsg.style.color = 'rgba(255, 0, 0, 0.5)'
				pwFlag = 1
			}
		}
		
		//비밀번호 확인 테스트
    	function fn_pw_check() {
        	var pattern1 = /[0-9]/;
        	var pattern2 = /[a-zA-Z]/;
        	var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
        	var pw_passed = true;
        	if(pw1.value.length == 0) {
        		pwMsg.innerText = '비밀번호를 입력해주세요'
				pwMsg.style.color = 'rgba(255, 0, 0, 0.5)'
        	}
        	if(!pattern1.test(pw1.value) || !pattern2.test(pw1.value)|| !pattern3.test(pw1.value) || pw1.value.length<8 || pw1.value.length>50){
        		pwMsg.innerText = '영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.'
    			pwMsg.style.color = 'rgba(255, 0, 0, 0.5)'
        	}else{
        		pwMsg.innerText = '적합한 비밀번호입니다'
        		pwMsg.style.color = 'rgba(58, 58, 255, 0.8)'
        	}
        	var SamePass_0 = 0; //동일문자 카운트
            var SamePass_1 = 0; //연속성(+) 카운드
            var SamePass_2 = 0; //연속성(-) 카운드 
            for (var i = 0; i < pw1.value.length; i++) {
                var chr_pass_0;
                var chr_pass_1;
                var chr_pass_2;
                if (i >= 2) {
                    chr_pass_0 = pw1.value.charCodeAt(i - 2);
                    chr_pass_1 = pw1.value.charCodeAt(i - 1);
                    chr_pass_2 = pw1.value.charCodeAt(i);
                    //동일문자 카운트
                    if ((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
                        SamePass_0++;
                    }else {
                        SamePass_0 = 0;
                    }
                    //연속성(+) 카운드
                    if (chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {
                        SamePass_1++;
                    }else {
                        SamePass_1 = 0;
                    }
                    //연속성(-) 카운드
                    if (chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {
                        SamePass_2++;
                    }else {
                        SamePass_2 = 0;
                    }
                }
                if (SamePass_0 > 0) {
                	pwMsg.innerText = '동일문자를 3자 이상 연속 입력할 수 없습니다.'
            		pwMsg.style.color = 'rgba(255, 0, 0, 0.5)'
                }
                if (SamePass_1 > 0 || SamePass_2 > 0) {
                    pwMsg.innerText = '영문, 숫자는 3자 이상 연속 입력할 수 없습니다.'
                	pwMsg.style.color = 'rgba(255, 0, 0, 0.5)'
                }
                if (!pw_passed) {
                    break;
                }
            }
            
         }

		//회원 가입
		
		const joinForm = document.forms[0]
		joinForm.onsubmit = function(event) {
			event.preventDefault()
			if(pwFlag != 0) {
				alert('비밀번호가 일치하지 않습니다')
				pw1.value = ''	
				pw2.value = ''
				pw1.focus()
				return;
			}
			if(emailFlag != 0) {
				alert('이메일 인증이 필요합니다')
				return;
			}
			const ob = {}
			const formData = new FormData(event.target)
			
			for(key of formData.keys()){
				ob[key] = formData.get(key)
			}
			const url = '${cpath}/member/join'
			const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json; charset=utf-8',
				}
			}
			fetch(url, opt)
			.then(function(resp) { return resp.text() })
			.then(function(text) {
				if(text == 1) {
					alert('가입 성공')
					location.replace('${cpath}')
				}else {
					alert('가입 실패')
				}
			})
			
		}
		
		
		
	</script>
    <!-- 주소API -->
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
      function showPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드

               // 각 주소의 노출 규칙에 따라 주소를 조합
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로 이를 참고하여 분기
               var fullAddr = '' // 최종 주소 변수
               var extraAddr = '' // 조합형 주소 변수
               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다
               if (data.userSelectedType === 'R') {
                  // 사용자가 도로명 주소를 선택
                  fullAddr = data.roadAddress
               } else { // 지번 주소 선택 (J)
                  fullAddr = data.jibunAddress
               }
               // 사용자가 선택한 주소가 도로명 타입일때 조합한다
               if (data.userSelectedType === 'R') {
                  //법정동명이 있을 경우 추가한다
                  if (data.bname !== '') {
                     extraAddr += data.bname
                  }
                  //건물명이 있을 경우 차가한다
                  if (data.buildingName !== '') {
                     extraAddr += (extraAddr !== '' ? ', '
                           + data.buildingName : data.buildingName)
                  }
                  // 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다
                  fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')'
                        : '')
               }
               // 우편번호와 주소정보를 해당 필드에 넣는다. 5자리 새 우편번호 사용
               document.getElementById('post_code').value = data.zonecode
               document.getElementById('address1').value = fullAddr
               // 커서를 상세주소 필드로 이동한다
               document.getElementById('address2').focus()
            }
         }).open()
      }
   </script>

</body>
</html>





























