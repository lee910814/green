<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<body class="mypageBody">
    <div class="mypageRoot">
	    <div class="myPageForm">
	        <form method="POST">
	            <h2 class="mypageTitle">정보수정</h2>
	            <div class="mypageInfo">
	                <div class="idDiv">
	                    <p>ID : ${login.email }</p>
	                </div>
	                
	                <div class="passwordDiv">
	                    <div class="modifyInputDiv hidden">
	                        <input type="password" name="userpw" placeholder="비밀번호" oninput="fn_pw_check()">
	                    	<input type="password" name="userpw2" placeholder="비밀번호 확인" oninput="checkPw()">
	                    	<div id="pwMsg"></div>
	                    </div>
	                </div>
	                
	                <div class="myPageNameDiv">
	                    <p>이름 : ${login.name}</p>
	                    <div class="modifyInputDiv hidden">
	                        <input type="text" name="name" placeholder="이름" value="${login.name }">
	                    </div>
	                </div>
	
	                <div class="myPageDate">
	                    <p>생년월일 : ${login.birth}</p>
	                    <div class="modifyInputDiv hidden">
	                        <input type="date" name="birth" value="${login.birth}">
	                    </div>
	                </div>
	                
	                <div class="genderDiv">
	                    <p>성별 : ${login.gender}</p>
	                    <div class="modifyInputDiv hidden">
	                        <label class="genderLabel"><input type="radio" name="gender" value="male" ${login.gender == 'male' ? 'checked' : '' }>남성</label>
	                        <label class="genderLabel"><input type="radio" name="gender" value="female" ${login.gender == 'female' ? 'checked' : '' }>여성</label>
	                    </div>
	                </div>
	
	                <div class="addressDIv">
	                    <p>주소 : (${login.postcode }) ${login.address1} ${login.address2 }</p>
                     	<div class="modifyInputDiv hidden">
	                       <input type="text" id="post_code" name="postcode" value="${login.postcode }" size="10">
		                   <input id="FindPostBtn" type="button" onclick="showPostcode()" value="우편번호 찾기">
		                   <input type="text" id="address1" name="address1" value="${login.address1 }" size="50">
		                   <input type="text" id="address2" name="address2" value="${login.address2 }">
                       	</div>
	                </div>
	                
	                <div class="mypageBtns">
	                	<div>
			                <button class="modifyBtn">수정</button>
			                <input class="mofsubmitBtn hidden" type="submit" value="수정완료">
	                	</div>
	                	<div>
			                <button class="cancelBtn hidden">취소</button>
			                <button class="deleteBtn hidden">회원탈퇴</button>
	                	</div>
	                </div>
	                <input type="hidden" name="idx" value="${login.idx }">
	            </div>
	        </form>
	    </div>
    </div>
    <script>
    // 정보수정란 열기
    const modifyInputDiv = document.querySelectorAll('.modifyInputDiv')
    const modifyBtn = document.querySelector('.modifyBtn')
    const submitBtn = document.querySelector('.mofsubmitBtn')
    const cancelBtn = document.querySelector('.cancelBtn')
    const deleteBtn = document.querySelector('.deleteBtn')
    
    modifyBtn.onclick = (event) => {
        event.preventDefault()
        modifyInputDiv.forEach(e => {
            if(e.classList.contains('hidden')){
                e.classList.remove('hidden')
                modifyBtn.classList.add('hidden')
                submitBtn.classList.remove('hidden')
                cancelBtn.classList.remove('hidden')
                deleteBtn.classList.remove('hidden')
            }            
        }) 
    }
    
    // 취소버튼
    cancelBtn.onclick = (event) => {
    	event.preventDefault()
    	modifyInputDiv.forEach(e => {
    		e.classList.add('hidden')
    		modifyBtn.classList.remove('hidden')
            submitBtn.classList.add('hidden')
            cancelBtn.classList.add('hidden')
            deleteBtn.classList.add('hidden')
    	})
    }
    
    // 회원탈퇴
    deleteBtn.onclick = (event) => {
    	event.preventDefault()
    	confirm('정말 탈퇴하시겠습니까?')
    	if(confirm){
    		const url = '${cpath}/member/myPage'
    		const opt = {
    			method: 'delete'	
    		}
    		fetch(url, opt).then(resp => resp.text())
    		.then(text => {
    			if(text == 1){
    				alert('이용해 주셔서 감사합니다.')
    				sessionStorage.clear();
    				location.replace('${cpath}')
    			}else{
    				alert('비정상적인 접근입니다.')
    			}
    		})
    	}
    }
    
  	//비밀번호 확인
	const pw1 = document.querySelector('input[name="userpw"]')
	const pw2 = document.querySelector('input[name="userpw2"]')
	
	const pwMsg = document.getElementById('pwMsg')
	let pwFlag = 1
	function checkPw() {
		if(pw1.value == pw2.value) {
			pwMsg.innerText = '일치'
			pwMsg.style.color = 'blue'
			pwFlag = 0
		}else {
			pwMsg.innerText = '일치 하지 않습니다'
			pwMsg.style.color = 'red'
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
			pwMsg.style.color = 'red'
    	}
    	if(!pattern1.test(pw1.value) || !pattern2.test(pw1.value)|| !pattern3.test(pw1.value) || pw1.value.length<8 || pw1.value.length>50){
    		pwMsg.innerText = '영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.'
			pwMsg.style.color = 'red'
    	}else{
    		pwMsg.innerText = '적합한 비밀번호입니다'
    		pwMsg.style.color = 'blue'
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
        		pwMsg.style.color = 'red'
            }
            if (SamePass_1 > 0 || SamePass_2 > 0) {
                pwMsg.innerText = '영문, 숫자는 3자 이상 연속 입력할 수 없습니다.'
            	pwMsg.style.color = 'red'
            }
            if (!pw_passed) {
                break;
            }
        }
        
     }
  	
    // 수정완료
   	const myPageForm = document.forms[0]
    myPageForm.onsubmit = function(event){
   		event.preventDefault()
   		if(pwFlag != 0) {
			alert('비밀번호가 일치하지 않습니다')
			pw1.value = ''	
			pw2.value = ''
			pw1.focus()
			return;
		}
   		const ob = {}
		const formData = new FormData(event.target)
		
		for(key of formData.keys()){
			ob[key] = formData.get(key)
		}
   		console.log(ob)
   		const url = '${cpath}/member/myPage'
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
			console.log(text)
			if(text == 1) {
				alert('수정 성공')
				location.replace('${cpath}')
			}else {
				alert('비정상적인 접근입니다.')
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