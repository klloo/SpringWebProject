<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
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
            <a class="navbar-brand" href="/board/list">Blue &#x1F352;</a>
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