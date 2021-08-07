<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
body {
	margin: 0;
	padding: 0;
}

/*배경*/
.container {
	width: 100%;
	height: 1500px;
	background: url("https://images.pexels.com/photos/4198029/pexels-photo-4198029.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}

.container:before {
	content: '';
	position: absolute;
	width: 100%;
	/*height: 100%;*/
	left: 0;
	top: 0;
	background-color: rgba(0, 0, 0, 0.2);
}

/*검색창*/

/*검색창 끝*/
.header {
	float: left;
	margin-left: 300px;
}

/*게시판, 배너있는 하얀색 배경*/
.nav {
	/*background: white;*/
	height: 1000px;
	width: 80%;
	border-radius: 10px;
	margin: 100px 0 0 80px;
	background: white;
	display: inline-block;
}

.none {
	display: none
}

#ticker {
	float: left;
	width: 100px;
}

.rank {
	width: 100px;
	display: inline-block;
	margin: 15px 0 0 15px;
	float: left;
	text-align: center;
}

.block {
	margin: 17px 0 0 0px;
	padding: 0 5px;
	height: 20px;
	overflow: hidden;
	background: #fff;
	width: 800px;
	font-family: Gulim;
	font-size: 18px;
	float: left;
	display: inline-block;
}

.block ul, .block li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.block li a {
	display: block;
	height: 20px;
	line-height: 20px;
	color: #555;
	text-decoration: none;
}

.menu {
	float: left;
	border-bottom: 3px solid rgb(30, 56, 204);
	/*border-radius: 10px;*/
	height: 70px;
	width: 90%;
	margin: 20px 0 0 50px;
}

.menu ul li {
	text-decoration: none;
	float: left;
	margin: 8px 35px 0px 40px;
	text-align: center;
	list-style: none;
	font-size: 25px;
	font-weight: bold;
	font-family: sans-serif;
}

.menu ul li a {
	text-decoration: none;
	color: black;
}

.banner {
	width: 900px;
	height: 100px;
	margin: 10px 0 0 80px;
}

/*배너*/
.item-a {
	width: 200px;
	height: 50px;
	margin-right: 5px;
}

/*배너사진*/
.item-a img {
	width: 200px;
}

.item-b {
	width: 200px;
	height: 50px;
	margin-right: 5px;
}

.item-b img {
	width: 200px;
}

.item-c {
	width: 200px;
	height: 50px;
	margin-right: 5px;
}

.item-c img {
	width: 200px;
}

.item-d {
	width: 200px;
	height: 50px;
	margin-right: 5px;
}

.item-d img {
	width: 200px;
}

/*웹진 게시판 */
.imgborad {
	height: 650px;
	width: 650px;
	
	
}

/*게시판 사이즈 */
.board {
	height: 800px;
	width: 100%;
	float: left;
	margin-top: 50px;
}

.banner ul li {
	float: left;
	list-style: none;
}

.col-md-6 {
	width: 600px;
	float: left;
	margin-left: 25px;
	height: 180px;
	border-bottom: 1px solid #555;
	margin-top: 20px;
}

.content {
	margin-top: 5px;
	width: 450px;
}

.web-board1 {
	display: flex;
}

<!--웹진 게시판 이미지-->
.web-img {
	margin-top: 10px;
}

.cardborad {
	width: 250px;
	height: 800px;
	float: right;
	margin-right: 25px;
	margin-top: -653px;
	margin-left: -500px;
	
}

.coard-content {
	height: 400px;
}

.imgborad hover {
	cursor: pointer;
}

.post-slider {
	border: 1px solid red;
	width: 75%;
	margin-left:50px;
}

.post-slider .post-wrapper {
	border: 1px solid red;
	width: 65%;
	height: 350px;
	margin: 0px auto;
	float: left;
}

.post-slider .post-wrapper .post {
	display: inline-block;
	background-color: aqua;
}

.post img {
	width: 200px;
	margin-right: 20px;
}

.search-box {
	
}
.header{
text-align:center;}
.h1{
text-align:center;
color:white;
font-size:2rem;
margin-top:60px;
}
<!--더보기-->
.plus{
border:1px solid black;
width:620px;
text-align:right;

}
.plus i{
color:gray;}
.plus i a{
color:gray;



}
</style>
</head>

<body>
	<div class="container">
		<div class="header">
			<div class="h1">
				<h1>Green</h1>
				<!--날씨정보-->
			</div>
		

		<div class="nav">
			<div class="rank">
				<!--새소식타이틀-->
				새소식
			</div>
			<div class="block">
				<!--실시간소식-->

				<ul id="ticker" class="ticker">

					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
				</ul>
			</div>
			<div>
				<div class="menu">
					<!--메뉴바-->
					<ul>
						<li><a href="${cpath }">홈</a></li>
						<li><a href="land" >대지</a></li>
						<li><a href="air" >하늘</a></li>
						<li><a href="">메뉴</a></li>
						<li><a href="">공지사항</a></li>
						<li><a href="list">새소식</a></li>
					</ul>
				</div>
			</div>

			<!--게시판-->
			<div class="board">
				<a href="list">
					<!--웹진 게시판 1-->
					<div class="imgborad">
					<div class="plus"><i class="fas fa-plus fa-1x"><a href="list">더보기</a></i></div>
						<div class="col-md-6">
							<div class="web-board1">
								<div class="col p-4 d-flex flex-column position-static">
									<a href=""><strong class="d-inline-block mb-2 text-success">홍길동</strong></a>
									<a href="">
										<h3 class="mb-0">안녕하세요</h3>
									</a> <a href="">
										<div class="mb-1 text-muted">Nov 11</div>
									</a> <a href="">
										<p class="content">This is a wider card with supporting
											text below as a natural lead-in to additional content.</p>
									</a>
								</div>
								<div class="web-img">
									<a href=""><svg class="bd-placeholder-img" width="150"
											height="150" xmlns="http://www.w3.org/2000/svg" role="img"
											aria-label="Placeholder: Thumbnail"
											preserveAspectRatio="xMidYMid slice" focusable="false">
                                        <title>Placeholder</title>
                                        <rect width="100%" height="100%"
												fill="#55595c" />
											<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                    </svg></a>
								</div>
							</div>
						</div>
						

						<!--웹진 게시판 2-->
						<div class="col-md-6">
							<div class="web-board1">
								<div class="col p-4 d-flex flex-column position-static">
									<a href=""><strong class="d-inline-block mb-2 text-success">Design</strong></a>
									<a href="">
										<h3 class="mb-0">Post title</h3>
									</a> <a href="">
										<div class="mb-1 text-muted">Nov 11</div>
									</a> <a href="">
										<p class="content">This is a wider card with supporting
											text below as a natural lead-in to additional content.</p>
									</a>
								</div>
								<div class="web-img">
									<a href=""><svg class="bd-placeholder-img" width="150"
											height="150" xmlns="http://www.w3.org/2000/svg" role="img"
											aria-label="Placeholder: Thumbnail"
											preserveAspectRatio="xMidYMid slice" focusable="false">
                                        <title>Placeholder</title>
                                        <rect width="100%" height="100%"
												fill="#55595c" />
											<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                    </svg></a>
								</div>
							</div>
						</div>


						<!--웹진 게시판 3-->
						<div class="col-md-6">
							<div class="web-board1">
								<div class="col p-4 d-flex flex-column position-static">
									<a href=""><strong class="d-inline-block mb-2 text-success">Design</strong></a>
									<a href="">
										<h3 class="mb-0">Post title</h3>
									</a> <a href="">
										<div class="mb-1 text-muted">Nov 11</div>
									</a> <a href="">
										<p class="content">This is a wider card with supporting
											text below as a natural lead-in to additional content.</p>
									</a>
								</div>
								<div class="web-img">
									<a href=""><svg class="bd-placeholder-img" width="150"
											height="150" xmlns="http://www.w3.org/2000/svg" role="img"
											aria-label="Placeholder: Thumbnail"
											preserveAspectRatio="xMidYMid slice" focusable="false">
                                        <title>Placeholder</title>
                                        <rect width="100%" height="100%"
												fill="#55595c" />
											<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                    </svg></a>
								</div>
							</div>
						</div>
					</div>
				</a>



				<!--카드형게시판 시작-->

				<div class="cardborad">
					<div class="coard-content">
						<!--카드형 게세판1-->
						<div class="col">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                </svg>

								<div class="card-body">

									<div class="d-flex justify-content-between align-items-center">
										<small class="time">9 mins</small>
									</div>
								</div>
							</div>
						</div>
						<!--카드형 게세판2-->
						<div class="col">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                </svg>

								<div class="card-body">

									<div class="d-flex justify-content-between align-items-center">
										<small class="text-time">9 mins</small>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                                </svg>

								<div class="card-body">

									<div class="d-flex justify-content-between align-items-center">
										<small class="time">9 mins</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		

		<!--배너-->
		<!-- <div class="flow_banner_box">
                <div id=""></div>" -->
		<div class="page-wrapper">
			<div class="post-slider">

				<div class="post_wrapper">

					<div class="post">
						<a href=""><img src="Greenpeace-logo.webp"> </a>
					</div>
					<div class="post">
						<a href=""><img src="환경연합.jpg"> </a>
					</div>
					<div class="post">
						<a href=""><img src="Greenpeace-logo.webp"></a>
					</div>
					<div class="post">
						<a href=""><img src="Greenpeace-logo.webp"></a>
					</div>
					<div class="post">
						<a href=""><img src="Greenpeace-logo.webp"></a>
					</div>

				</div>
			</div>
		</div>



		<script>
			// 내용넣기
			const tickerList = document.querySelectorAll('.ticker > li')
			console.log(tickerList)
			
			function inTicker() {
				const url = '${cpath}/board/tiker'
				const opt = {
					method: 'GET',
					headers: {
						'Content-Type': 'application/json; charset=utf-8'
					},
				}
				fetch(url, opt)
				.then(function(resp) { return resp.json()})
				.then(function(json) {
					for(let i = 0; i < tickerList.length; i++) {
						tickerList[i].innerText = json[i].value
						//게시글읽는거 넣기
					}
				})						
			}
			inTicker()
			
			
			
			// nav슬라이드 반응형
            $(function () {
                var ticker = function () {
                    setTimeout(function () {
                        $('#ticker li:first')
                            .animate({ marginTop: '-20px' }, 400,
                                function () {
                                    $(this).detach()
                                        .appendTo('ul#ticker').removeAttr('style');
                                });
                        ticker();
                    }, 3000);
                }; ticker();
            });

			
            
            // footer 슬라이드 반응형
            $('.post_wrapper').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
            });



        </script>
</body>

</html>

<%@ include file="../footer.jsp"%>