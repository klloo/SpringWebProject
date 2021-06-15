<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css_main/styles.css" rel="stylesheet" />
    
    <title>SPRING</title>
</head>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="/board/list">HYBoard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto py-4 py-lg-0">
				<sec:authorize access="isAuthenticated()"> 
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/member/mypage">
						<sec:authentication property="principal.member.userName"/>
					</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/logout ">Logout</a></li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/member/join">Join</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/member/login">Login</a></li>
				</sec:authorize>
                </ul>
            </div>
        </div>
     </nav>
        
</body>
</html>
<%@include file = "../includes/page_header.jsp" %>

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css?after">
<!--===============================================================================================-->
<style>
	.btn {
        display: flex;
        justify-content: center;
        padding-top:0%;
        margin-left:15%;
    }
    .btn > a {
        margin: 10%;
        color: grey;
        text-decoration=none;
    }
    .btn > div {
        margin: 10%;
    }
    .write_btn {
        cursor:pointer;
    }
    .read_only{ display: none;}
    .searchModal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 10; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		/* Modal Content/Box */
		.search-modal-content {
		margin-top:10%; /* 15% from the top and centered */
		}
		.checks input[type="checkbox"]:checked + label:before { 
		/* 체크박스를 체크했을때 */
		 content: '\2714';
		  /* 체크표시 유니코드 사용 */ 
		  color: #99a1a7; 
		}

</style>
</head>
<body>
   <div id="loginmodal" class="searchModal">
		<div class="search-modal-content">	
			<div class="container" style="display: flex;justify-content: center;">
			<div class="wrap-login100">
					<div class="login100-form-title">
						<span class="login100-form-title-1">
							LOGIN
						</span>
					</div>
					
	    			<form class="login100-form validate-form" id="loginForm" action="/login" method="post">
	        			<div class="wrap-input100 validate-input m-b-26">
	          				<span class="label-input100">ID</span>
	            			<input type="text" name="username" class="input100" id="id">
	            			<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input m-b-26">
	            				<span class="label-input100">Password</span>
	            				<input type="password" class="input100" id="password" name="password">
	            				<span class="focus-input100"></span>
	        			</div>
	        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        		
		        		<div class="flex-sb-m w-full p-b-30">
							<div class="contact100-form-checkbox checks">
								<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
								<label class="label-checkbox100" for="ckb1">
									Remember me
								</label>
							</div>
	
						</div>
						<div class="flex-sb-m w-full p-b-30">
						<div class="validate-input m-b-26">
	            				<div class="input100" style="color:red;">${requestScope.loginFailMsg}</div>
	            				<span class="focus-input100"></span>
	        			</div>
	        			</div>
						
	    				<div class="btn validate-input">
            				<a href="/board/list" class="cancel_btn" role="button" id="">CANCEL</a>
           		 			<div class="login_btn" id="btn-login">LOGIN</div>
        				</div>
	    			</form>

			</div>
		</div>
		</div>
	</div>

		

<%@include file = "../includes/footer.jsp" %>

        

        