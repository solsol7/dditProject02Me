<%@page import="vo.TourismVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>대전전시관</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/fullpage.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/swiper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/board.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/detail.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/js/custom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/tourism.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Mproject/css/main.css?ver=1.2">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/swiper-min.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/slide.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/scroll.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Mproject/js/tourism.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95544088854ec9cb3a80eaad450b5e1e"></script>
<%

	TourismVO vo = (TourismVO)request.getAttribute("tourDetail");
	
%>
	
<script>
$(function(){
	mypath = "<%=request.getContextPath()%>";

	<%-- $(".gbBtn").on('click',function(){
		location.href="<%=request.getContextPath()%>/tourismGood.do";
		
	}); --%>
	
	// 지도
	var container =document.getElementById('map');
	var options ={
		center : new kakao.maps.LatLng(<%=vo.getTr_lat()%> ,<%=vo.getTr_long()%>),
		level :3
	};

	var map = new kakao.maps.Map(container ,options);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(<%=vo.getTr_lat()%>, <%=vo.getTr_long()%>); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);  
	
	
	$(".gbBtn").on('click',function(){
		gb=$(this).attr('id');
		trNo = "<%=vo.getTr_no()%>";
		
		$.updateGB(gb, trNo);
	}); 


});

</script >

</head>

<body class="main">
	<ul id="skip_navi">
		<li><a href="#content">본문 바로가기</a></li>
		<li><a href="#gnb">메인메뉴 바로가기</a></li>
	</ul>

	<div id="wrap">
		<!-- S. header -->
		<header id="header" class="slidedown">
			<div class="inner wrap">
				<h1 class="logo">
					<a href="<%=request.getContextPath()%>/admin/jsp/index.jsp" title="">NORI Daejeon</a>
				</h1>
				<a href="#" class="btn_menu" data-util="menu">메뉴 열기</a>
				<nav id="gnb">
					<ul class="gnb">
						<li><a href="tourisme.html">관광정보</a></li>
						<li><a href="food.html">맛집정보</a></li>
						<li><a href="event.html">이벤트</a></li>
						<li><a href="celebration.html">행사안내</a></li>
						<li><a href="community.html">커뮤니티</a>
							<ul>
								<li><a href="/html/notice.html" class="board_notice">공지사항</a></li>
								<li><a href="/html/qa.html" class="board_Dgallery">Q&A</a></li>
							</ul></li>
					</ul>
				</nav>
				<div class="util_member">
					<a href="login.html">로그인</a> <a href="join.html">회원가입</a> <a
						href=mypage.html">마이페이지</a>
				</div>

			</div>
		</header>
		<div class="area_subVisual">
			<div style="background-image: url(<%=request.getContextPath()%>/Mproject/images/m01.jpg);"></div>
			<div class="subTit">
				<div>
					<h2 data-aos="fade-up">관광정보</h2>
				</div>
				<div>
					<i data-aos="fade-up" data-aos-delay="350">대전의 다양한 관광정보를 확인하세요</i>
				</div>
			</div>
		</div>
	
		<!--container -->

		<section id="container">
			<div id="content">
				<article class="area_preview">
					<div class="wrap">
						<div id="hitNum">조회수 : <%=vo.getTr_hit() %></div>
						<div class="preview_inn">
						<div class="img">
						<img src="<%=request.getContextPath()%>/imageView.do?saveFileName=<%=vo.getSave_file_name()%>" >	
							</div>
							<div class="preview_info">
								<ul>
									<li><b>관 광 지</b>
										<p class="tx_point">
											<%=vo.getTr_name()%></p></li>
									<li><b>주  소</b>
										<p><%=vo.getTr_addr()%></p></li>
									<li><b>문 의 처</b>
										<p><%=vo.getTr_tel()%></p></li>
									<li><b>내  용</b>
										<p><%=vo.getTr_con()%></p></li>
								</ul>
							</div>
						
						</div>		
						
						<!-- 지도 -->
						<div id="map" style="width:500px; height:400px;"></div>
						

						
						
						<!-- 좋아요, 싫어요 -->
						<div class="like_wrap">
							<div class="good_ico gbBtn" id="good_ico"><a href="#"><img src="<%=request.getContextPath()%>/Mproject/images/good.PNG"><span class="good_num" id="good_num"><%=vo.getTr_good() %></span></a> </div>
							<div class="bad_ico gbBtn" id="bad_ico"><a href="#"><img src="<%=request.getContextPath()%>/Mproject/images/bad.PNG"><span class="good_num" id="bad_num"><%=vo.getTr_bad() %></span></a> </div>
						</div>
						
						
						
						<div class="note_area">
							<b>관람시 주의사항</b>
							<ul class="list_bullet">

							</ul>
						</div>




						<!-- 댓글 -->
						<div class="comment-area">

							<div class="comment-list">

								

								<div class="comment-list-box">
									<div class="list-top">
										<div class="write-info">
											<h1>공주사람</h1>
											<div class="date">2023-01-02 오전 4:00:26</div>
										</div>
										<div class="btn-box" style="text-align: right;">
											<input type="hidden" name="txt_Memo_Del_Seq" value="2">

											<div class="comment-delete"
												onclick="fnc_Memo_Del(document.frm_Send, '', 6);">
												<p>삭제</p>
											</div>
										</div>
									</div>
									<div class="comment-contents">나도 가고싶</div>
								</div>

								<div class="comment-list-box">
									<div class="list-top">
										<div class="write-info">
											<h1>공주사람</h1>
											<div class="date">2023-01-02 오전 4:00:26</div>
										</div>
										<div class="btn-box" style="text-align: right;">
											<input type="hidden" name="txt_Memo_Del_Seq" value="2">

											<div class="comment-delete"
												onclick="fnc_Memo_Del(document.frm_Send, '', 6);">
												<p>삭제</p>
											</div>
										</div>
									</div>
									<div class="comment-contents">나도 가고싶</div>
								</div>

								<div class="comment-write">
									<div class="inner">
										<div class="title">댓글작성</div>
										<div class="comment-input-area">
											<div class="input-wrap">
												<div class="input-area half name-box">
													<div class="input-inner">
														<h1>이름</h1>
														<input type="hidden" name="memo_Bd_Seq" value="5">

														<input type="text" name="txt_Memo_Name" id="txt_Memo_Name"
															placeholder="이름을 입력해주세요.">

													</div>
												</div>
												<input type="hidden" name="txt_Memo_Email"
													id="txt_Memo_Email" value="">

												<div class="input-area half pwd-box">
													<div class="input-inner">
														<h1>비밀번호</h1>
														<input type="password" name="txt_Memo_Pwd"
															id="txt_Memo_Pwd" placeholder="비밀번호를 입력해주세요.">
													</div>
												</div>

											</div>
											<div class="input-wrap">
												<div class="input-area height-auto">
													<div class="input-inner">
														<textarea name="mtx_Memo_Cont" id="mtx_Memo_Cont"
															placeholder="내용을 입력해주세요."></textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="submit-btn">
											<a href="javascript:void(0);"
												onclick="fnc_Save_Memo(document.frm_Send);"><p>등록</p></a>
										</div>
									</div>
								</div>
								




							</div>
						</div>
				</article>
			</div>
		</section>

		<!-- // container -->






		<!-- footer -->
		<footer id="footer">
			<div id="dokdo_bg" class="dokdo_area">
				<div id="dokdo_inn" class="wrap">

					<p>“ 아름다운 대전 ”</p>
					<div class="circle1"></div>
					<div class="circle1_1"></div>
					<div class="circle2"></div>
					<div class="circle2_1"></div>
					<i class="tx1">성심당</i>

				</div>
			</div>
			<div class="footer_inn">
				<div class="wrap">
					<address>
						<p class="copyright">© 2023 All rights reserved .</p>
					</address>
					<a href="#" class="org qacircle"> <i class="fa fa-pencil"></i> Q&A</a>
				</div>
			</div>
		</footer>
		<!-- //footer -->
		<!-- //footer -->
	</div>
</body>

</html>