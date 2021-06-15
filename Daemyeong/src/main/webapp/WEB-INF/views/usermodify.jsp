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
                <a class="navbar-brand" href="#page-top" style="color:black">대명농구회</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#projects">Player</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Video</a></li>
                         <li class="nav-item"><a class="nav-link" href="#">Notice</a></li>
                    </ul>
                    <ul class="navbar-nav ml-auto">	
                		<c:if test="${ userinfo eq null }">	
	                        <li class="nav-item mx-0 mx-lg-1" id="signupli"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="signup" href="${root}/user/mvsignup">Sign up</a></li>
	                        <li class="nav-item mx-0 mx-lg-1" id="signinli"><a type="button" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-bs-toggle="modal" data-bs-target="#loginModal">Sign in</a></li>
                        </c:if>
                        <c:if test="${ userinfo ne null }">	
	                        <li class="nav-item mx-0 mx-lg-1" id="logoutli" ><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="logout">Logout</a></li>
	                        <li class="nav-item mx-0 mx-lg-1" id="userinfoli"><a type="button" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" data-bs-toggle="modal" data-bs-target="#infoModal">UserInfo</a></li>
                    	</c:if>
                    </ul>
                </div>
            </div>
        </nav>
<div align="center">
<img src="${root }/assets/img/daemyeonglogo.jpg"/>
</div>
        <div class="row">
       
                    <div class="col-lg-4 mx-auto">
                     <br /> <br /> <br /> <br />
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
                        <form method = "post" action = "" id="sendForm" name="sentMessage" novalidate="novalidate">
                        <input type="hidden" name="act" id="act" value="modify">
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>ID</label>
                                    <input class="form-control" id="id" name="id" type="text" readonly value="${userinfo.id}" placeholder="${userinfo.id}" required="required" data-validation-required-message="Please enter your id." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Password</label>
                                    <input class="form-control" id="password" name="password" type="password" value="${userinfo.password}" required="required" data-validation-required-message="Please enter your password."/>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Name</label>
                                    <input class="form-control" id="name" name="username" type="text" value="${ userinfo.username }" required="required" data-validation-required-message="Please enter your name." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <br />
                            <div id="success"></div>
                            <div class="form-group"><button class="btn btn-primary btn-xl" id="usermodify" type="submit">수정</button></div>
                        </form>
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
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
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
        <!-- Core theme JS-->
        <script src="${root }/js/scripts.js"></script>
    </body>
</html>
