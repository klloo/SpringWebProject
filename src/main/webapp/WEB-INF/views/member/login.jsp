<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
<%@include file = "../includes/top_menu.jsp" %>

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css?after">
<!--===============================================================================================-->
<style>
	.btn {
        display: flex;
        justify-content: center;
    }
    .btn > a {
        margin: 2%;
        color: grey;
        text-decoration=none;
    }
    .btn > div {
        margin: 2%;
    }
    .write_btn {
        cursor:pointer;
    }
    .read_only{ display: none;}
</style>
</head>
<body>

		<!-- Page Header-->
        <header class="masthead" style="background-image: url('/resources/images/cafe_image.jpeg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>LOGIN</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
		<div class="container" style="display: flex;justify-content: center;">
			<br/><br/><br/><br/><br/>
			<div class="wrap-login100">
			
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
							<div class="contact100-form-checkbox">
								<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
								<label class="label-checkbox100" for="ckb1">
									Remember me
								</label>
							</div>
	
						</div>
	    			</form>

	    			<div class="btn m-b-50">
            			<a href="/board/list" class="cancel_btn" role="button" >CANCEL</a>
           		 		<div class="login_btn" id="btn-login">LOGIN</div>
        			</div>
        			<br/><br/><br/><br/><br/>
			</div>
		</div>

<%@include file = "../includes/footer.jsp" %>

        

        