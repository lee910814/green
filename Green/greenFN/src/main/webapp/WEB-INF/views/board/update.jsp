<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body class="writeBody">
   <h2 class="writeTopTitle">글 작성</h2>
     <div class="writeTopUnderLine"></div>
     <div class="writeMain">
     
   <form method="post" enctype="multipart/form-data">
       <input type="hidden" name="midx" value="${login.idx }">
       <div class="writeTitle">
           <input type="text" name="title" id="title" placeholder="제목" required value="${dto.title }">
         </div>
         <div class="writeRadioDiv">
           <label class="typhoonLabel" for="typhoon">
                <input type="radio" 
                      name="category" 
                      id="typhoon" 
                      value="typhoon"
                      ${dto.category == 'typhoon' ? 'checked' : '' }
                      ><span>Typhoon</span>
           </label>
           <label class="airLabel" for="air">
              <input type="radio" 
                    name="category" 
                    id="air" 
                    value="air"
                    ${dto.category == 'air' ? 'checked' : '' }
                    ><span>Air</span>
           </label>
           <label class="covid19Label" for="covid19">
                <input type="radio" 
                      name="category" 
                      id="covid19" 
                      value="covid19"
                      ${dto.category == 'covid19' ? 'checked' : '' }
                      ><span>Covid19</span>
           </label>
         </div>
         <div class="writeTextArea">
        <textarea name="content" id="content" placeholder="여기에 작성하세요" 
                required onkeyup="fn_checkByte(this)" autofocus>${dto.content }</textarea>
         </div>
         <div class="wrtieFile">
           <sup class="writeSup">( <span id="nowByte"> 0 </span> / 3758096384bytes )</sup>
         </div>
         
         <div class="writeCansle">
           <input type="submit" value="수정">
           <button id="writeCansleBtn">취소</button>
         </div>
   </form>
   
   </div>
<script>
      document.getElementById('writeCansleBtn').onclick = (event) =>{
         event.preventDefault()
         history.back()
      }
      
    //textarea 바이트 수 체크하는 함수
      function fn_checkByte(obj) {
            const maxByte = 3758096384; //최대 3758096384바이트(3.5기가)
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
                  document.getElementById("nowByte").style.color = "blue";
              }
        }
</script>
</body>

</html>