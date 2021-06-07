<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/daterangepicker/daterangepicker.css">
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

		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(/resources/images/bg-01.jpg);">
					<span class="login100-form-title-1"> Write </span>
				</div>
	    			<form class="login100-form validate-form">
	        			<div class="wrap-input100 validate-input m-b-26">
	          				<span class="label-input100">TITLE</span>
	            			<input type="text" class="input100" id="title" placeholder="title">
	            			<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input m-b-26">
	            				<span class="label-input100">WRITER</span>
	            				<input type="text" class="input100" id="writer" placeholder="writer">
	            				<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input">
	            			<span class="label-input100">CONTENT</span>
	            			<textarea class="form-control" id="content"></textarea>
	            			<span class="focus-input100"></span>
	        			</div>
	    			</form>
	    			 <div class="btn m-b-50">
            			<a href="/board/list" class="cancel_btn" role="button" >CANCEL</a>
           		 		<div class="write_btn" id="btn-save">WRITE</div>
        			</div>
			</div>
		</div>

<%@include file = "../includes/footer.jsp" %>

        

        