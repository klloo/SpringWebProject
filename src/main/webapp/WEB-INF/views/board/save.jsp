<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
<%@include file = "../includes/top_menu.jsp" %>

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/summernote/css/summernote-lite.css">
<script src="/resources/summernote/js/summernote-lite.js"></script>
<script src="/resources/summernote/js/lang/summernote-ko-KR.js"></script>
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
    .checks input[type="checkbox"]:checked + label:before { 
		/* 체크박스를 체크했을때 */
		 content: '\2714';
		  /* 체크표시 유니코드 사용 */ 
		  color: #99a1a7; 
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
                            <h1>WRITE</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
		<div class="container">
			<div class="wrap">
	    			<form class="login100-form validate-form">
	        			<div class="wrap-input100 validate-input m-b-26">
	          				<span class="label-input100">TITLE</span>
	            			<input type="text" class="input100" id="title" placeholder="title">
	            			<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input m-b-26">
	            				<span class="label-input100">WRITER</span>
	            				<input type="text" class="input100" id="writer" value=<sec:authentication property="principal.member.userName"/> readonly>
	            				<span class="focus-input100"></span>
	        			</div>
	        			<div class="flex-sb-m w-full p-b-30">
							<div class="contact100-form-checkbox checks">
								<input class="input-checkbox100" id="ckb1" type="checkbox" name="isAnonymous">
								<label class="label-checkbox100" for="ckb1">
									익명
								</label>
							</div>
						</div>
	        			<div class="wrap-input100 validate-input">
	            			<span class="label-input100">CONTENT</span>
	            			<textarea id="summernote" class="form-control"></textarea>
	            			<span class="focus-input100"></span>
	        			</div>
	        			<sec:authentication property="principal.username" var="userid"/>
	        			<input type="hidden" id="user_id" value="${userid}"/>
	    			</form>
	    			 <div class="btn m-b-50">
            			<a href="/board/list" class="cancel_btn" role="button" >CANCEL</a>
           		 		<div class="write_btn" id="btn-save">WRITE</div>
        			</div>
			</div>
		</div>
		<br/><br/><br/><br/><br/>

<script src="/resources/js/summernote.js"></script>
<%@include file = "../includes/footer.jsp" %>

        

        