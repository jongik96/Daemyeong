<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>대명농구회</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${root }/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"></head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
			$("#btn-login").click(function() {
				if($("#loginId").val() == "") {
					alert("아이디 입력!!!");
					return;
				} else if($("#loginPwd").val() == "") {
					alert("비밀번호 입력!!!");
					return;
				} else {
					$("#loginform").attr("action", "${root}/user/login").submit();
				}
			});
			
			//로그아웃 기능 연결
			$('#logout').click(function(){
			    alert('로그아웃되었습니다.');
			    location.href = "${root}/user/logout";
			})
			
			//회원정보삭제 기능 연결
			$("#delete-btn").click(function() {			
				let id="<c:out value='${userinfo.id}'/>";
				location.href = "${root}/user/deleteUser?id="+id;
			});
			$("#sendMessageButton").click(function() {
                $("#contactForm").attr("action", "${root}/user/regist").submit();
            });
			 $("#usermodify").click(function() {
                 $("#sendForm").attr("action", "${root}/user/modify").submit();
         });
        });
        
        
        </script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${root }/" style="color:black">Home</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="${root }/player/mvplayer" style="color:black">Player</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color:black">Video</a></li>
                         <li class="nav-item"><a class="nav-link" href="#" style="color:black">Notice</a></li>
                    </ul>
                    <ul class="navbar-nav ml-auto">	
                		<c:if test="${ userinfo eq null }">	
	                        <li class="nav-item mx-0 mx-lg-1" id="signupli"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="signup" href="${root}/user/mvsignup" style="color:black">Sign up</a></li>
	                        <li class="nav-item mx-0 mx-lg-1" id="signinli"><a type="button" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-bs-toggle="modal" data-bs-target="#loginModal" style="color:black">Sign in</a></li>
                        </c:if>
                        <c:if test="${ userinfo ne null }">	
	                        <li class="nav-item mx-0 mx-lg-1" id="logoutli" ><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="logout" style="color:black">Logout</a></li>
	                        <li class="nav-item mx-0 mx-lg-1" id="userinfoli"><a type="button" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-bs-toggle="modal" data-bs-target="#infoModal" style="color:black">UserInfo</a></li>
                    	</c:if>
                    </ul>
                </div>
            </div>
        </nav>
<div align="center">
<img src="${root }/assets/img/daemyeonglogo.jpg"/>
</div>        
		<div class="col-lg-12 mx-auto">
				<h1>경기 영상</h4>
				<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#play2019">2019</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#play2018">2018</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#play2017">2017</a>
  </li>
</ul>
				
				
			<div id="myTabContent" class="tab-content">
	  			<!-- 2019년 영상 -->
	  			<div class="tab-pane fade show active" id="play2019">
					<div class="col-lg-12 mx-auto" >
						<div><h3>vs S-FIVE (20세부)</h3></div>			
						<div style="float:left;">
						<iframe width="540" height="315" src="https://www.youtube.com/embed/yAJamtcMX1g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/NkEIiZrNO3Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>					
						<iframe width="540" height="315" src="https://www.youtube.com/embed/o9sr7fIz5QA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>					
						<iframe width="540" height="315" src="https://www.youtube.com/embed/Eb-YXwOBd_E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
					<div><h3>vs IMPACT (20세부)</h3></div>
					<div class="col-lg-12 mx-auto">
						
						<div style="float:left;">
						<iframe width="540" height="315" src="https://www.youtube.com/embed/6ZsxepEEErg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/vvtrS3_ro54" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/9ne5U-bAQuY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/8WV00JujFjM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
					<div class="col-lg-12 mx-auto">
					
						<div><h3>vs TBLM (20세부)</h3></div>
						<div style="float:left;">
						<iframe width="540" height="315" src="https://www.youtube.com/embed/vcNoYe9-uKw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/ApjA4IEHgto" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/2AV8vEG391g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/SftWPfBveR4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
				</div>
				
				<!-- 2018년 영상 -->
				<div class="tab-pane fade show active" id="play2018">
					<div class="col-lg-12 mx-auto" >
						<div><h3>vs 다크호스 (20세부)</h3></div>			
						<div style="float:left;">
						<iframe width="540" height="315" src="https://www.youtube.com/embed/hIjXqADrppo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/hKfDIEaqdns" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>					
						<iframe width="540" height="315" src="https://www.youtube.com/embed/FU4Y_jQxBNI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>					
						<iframe width="540" height="315" src="https://www.youtube.com/embed/B3R0-pMh7qY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
					<br/>
					<div class="col-lg-12 mx-auto">
						<div><h3>vs IMPACT (20세부)</h3></div>
						<div style="float:left;">
						<iframe width="540" height="315" src="https://www.youtube.com/embed/WzcgRlR3CgU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/w0kGbEQiRxU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/0hqSbRnbje8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/uaW_pYt7tfA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade show active" id="play2017">
					<div class="col-lg-12 mx-auto" >
						<div><h3>vs S-FIVE (20세부)</h3></div>			
						<div style="float:left;">
						<iframe width="540" height="315" src="https://www.youtube.com/embed/gdZZ6mEtX_c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<iframe width="540" height="315" src="https://www.youtube.com/embed/fsvJJ9P1wtE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>					
						<iframe width="540" height="315" src="https://www.youtube.com/embed/w1ZPuOQLEH4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>					
						<iframe width="540" height="315" src="https://www.youtube.com/embed/ahlRrNqMOZo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</div>
					
				</div>
			</div>
		
        
        <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; Your Website 2021</div></footer>
        <!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- Modal body -->
				<div class="modal-body">
					<form method="post" id="loginform" action="">
						<div class="form-group">
							<label for="loginId">ID:</label>
							<input type="text" class="form-control" placeholder="Enter ID" id="id" name="id">
						</div>
						<div class="form-group">
							<label for="loginPwd">Password:</label>
							<input type="password" class="form-control" placeholder="Enter password" id="password" name="password">
						</div>
						
						
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btn-login">LogIn</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
    </div>
  </div>
</div>
<!-- InfoModal -->
<div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- Modal body -->
				<div class="modal-body">
        <h1 style="color: black">회원 정보 확인</h1>
        <table class="table table-hover">
				<tbody>
					<tr>
						<td>아이디 : </td>
						<td>${ userinfo.id }</td>
					</tr>
					<tr>
						<td>비밀번호 : </td>
						<td>${ userinfo.password }</td>
					</tr>
					<tr>
						<td>이름 :  </td>
						<td>${ userinfo.name }</td>
					</tr>
					
				</tbody>
			</table>
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-primary" id="modify-btn" onclick="location.href='${root}/user/usermodify'" >수정</button>
        <button type="button" class="btn btn-danger" id="delete-btn">회원 탈퇴</button>
      </div>
    </div>
  </div>
</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root }/js/scripts.js"></script>
    </body>
</html>
