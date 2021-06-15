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
    .chk_btn {
        cursor:pointer;
    }
    .read_only{ display: none;}
           /* The Modal (background) */
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
		
</style>
</head>
<body>

		<!-- Page Header-->
        <header class="masthead" style="background-image: url('/resources/images/cafe_image.jpeg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>MODIFY</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
         <div id="modal" class="searchModal">
		<div class="search-modal-content">	
			<div class="container" style="display: flex;justify-content: center;">
			<br/><br/><br/><br/><br/>
			<div class="wrap-login100">
					<div class="login100-form-title">
						<span class="login100-form-title-1">
							password check
						</span>
					</div>
					
	    			<form class="login100-form validate-form">
	        			
	        			<div class="wrap-input100 validate-input m-b-60">
	            				<span class="label-input100">Password</span>
	            				<input type="password" class="input100" id="password" name="password">
	            				<span class="focus-input100"></span>
	        			</div>
	        			
		        		<div class="btn" style=" padding-top:0%; margin-left:15%;">
	            			<div class="cancel_btn" id="btn-cancel" role="button" style=" margin: 10%;color: grey;text-decoration=none;">CANCEL</div>
	           		 		<div class="login_btn" id="btn-pwchk" style=" margin: 10%;">OK</div>
	        			</div>
	    			</form>

	    			
			</div>
		</div>
		</div>
	</div>
    
		<div class="container" style="display: flex;justify-content: center;">
			<br/><br/><br/><br/><br/>
			<div class="wrap-login100">
			
	    			<form class="login100-form validate-form" id="loginForm" action="/login" method="post">
	    				<sec:authentication property="principal.member.userid" var="userid"/>
	        			<div class="wrap-input100 validate-input m-b-26">
	          				<span class="label-input100">ID</span>
	            			<input type="text" class="input100" id="id" value="${userid}"readonly>
	            			<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input m-b-26">
	            				<span class="label-input100">Password</span>
	            				<input type="password" class="input100" id="newpassword">
	            				<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input m-b-26">
	          				<span class="label-input100">Name</span>
	            			<input type="text" class="input100" id="newname">
	            			<span class="focus-input100"></span>
	        			</div>
	    			</form>

	    			<div class="btn m-b-50">
            			<a href="/member/mypage" class="cancel_btn" role="button" >CANCEL</a>
           		 		<div id="btn-update-member">OK</div>
        			</div>
        			<br/><br/><br/><br/><br/>
			</div>
		</div>

<%@include file = "../includes/footer.jsp" %>

        

        