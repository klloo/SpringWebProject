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
        *{
            border-collapse: collapse;
            margin: 0%;
            padding: 0%;
            text-decoration: none;
            color: black;
            list-style: none;
        }
        a:hover {  color: black; text-decoration: none;}
        .title{
            margin: 8%;
            text-align: center;
        }
        .table_div {
            padding-left: 10%;
            padding-right: 10%;
            padding-bottom: 15%;
        }
        .table th {
            font-size: 75%;
        }
        .write_btn{
            padding-top: 2%;
            padding-bottom: 2%;
        }
        .btn-edit{
            font-size: 80%;
            font-style: italic;
        }
        .img{
            padding-left: 10%;
            padding-right: 10%;
        }
        .table > tbody > tr > td > a{
            color: black;
        }
        .table > tbody > tr > td:last-child{
            color:grey;
        }
        .date{
            color:grey;
		}

		.paging {
        display: flex;
        justify-content: center;
       }
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
		.btn {
	        display: flex;
	        justify-content: center;
	        padding-top:0%;
	        margin-left:15%;
	    }
	    .cancel_btn {
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
	

     </style>
 

<!-- Page Header-->
        <header class="masthead" style="background-image: url('/resources/images/cafe_image.jpeg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>MY PAGE</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
<div class="table_div">
	
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
					
	    			<form class="login100-form validate-form" id="loginForm" action="/login" method="post">
	        			
	        			<div class="wrap-input100 validate-input m-b-60">
	            				<span class="label-input100">Password</span>
	            				<input type="password" class="input100" id="password" name="password">
	            				<span class="focus-input100"></span>
	        			</div>
	        			<sec:authentication property="principal.member.userid" var="userid"/>
	        			<input type="hidden" id="id" value="${userid}"/>
	        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        		<div class="btn">
	            			<div class="cancel_btn" id="btn-cancel" role="button" >CANCEL</div>
	           		 		<div class="login_btn" id="btn-pwchk">OK</div>
	        			</div>
	    			</form>

	    			
			</div>
		</div>
		</div>
	</div>
    
    <div class="write_btn" style="float:right">
		<div>
			<div type="button" id="btn-edit" class="btn-edit">EDIT</div>
		</div>
	</div>
	<h5>INFO</h5>
 	<table class="table">
        <thead class="thead">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>REGISTRATION DATE</th>
        </tr>
        </thead>
        <tbody id="tbody">
        	<tr>
				<td> <sec:authentication property="principal.member.userid"/> </td>
				<td> <sec:authentication property="principal.member.userName"/></td>
				<sec:authentication property="principal.member.regDate" var="regdate"/>
				<td> <fmt:formatDate pattern="yyyy. MM. dd" value="${regdate}"/></td>
			</tr>
        </tbody>
    </table>
    <br><br>
    <!-- 목록 출력 영역 -->
    <div style="margin-bottom:20px;">
    <h5>${total}개의 글</h5>
    </div>
    <table class="table">
        <thead class="thead">
        <tr>
            <th>NO</th>
            <th>TITLE</th>
            <th>WRITER</th>
            <th>DATE</th>
            <th>VIEWS</th>
        </tr>
        </thead>
        <tbody id="tbody">
        	<c:set var="no" value="${(pageMaker.cri.pageNum-1)*10+1}"/>
        	<c:forEach var="board" items="${boardList}">
        		<tr>
					<td> <c:out value="${no}"/> </td>
					<c:set var="no" value="${no+1}"/>
					<td> <a href="/board/read?bno=${board.bno}"/><c:out value="${board.title}"/></td>
					<td> 
						<c:if test="${board.isanonymous eq 'true'}">익명</c:if>
						<c:if test="${board.isanonymous eq 'false'}"><c:out value="${board.writer}"/></c:if>
					</td>
					<td class="date"> <fmt:formatDate pattern="yyyy. MM. dd" value="${board.regdate}"/></td>
					<td> <c:out value="${board.viewcnt}"/> </td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
    <br/> <br/> <br/>
    <div class="paging">
    	<ul class="pagination">
		    <c:if test="${pageMaker.prev}">
		    <li class = "paginate_button previous">
		    	<a href="${pageMaker.startPage-1}" style="color:grey"><c:out value="<"/></a>
		    </li>
		    <span>&nbsp;&nbsp;&nbsp;</span>
		    </c:if>
		    
		    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		    <li class = "paginate_button">
		    	<a href="${num}" style="color:
		    	<c:if test="${pageMaker.cri.pageNum == num}">black;</c:if>
		    	<c:if test="${pageMaker.cri.pageNum != num}">grey;</c:if>
		    	">${num}</a>
		    </li>
		    <span>&nbsp;&nbsp;&nbsp;</span>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next}">
		    <li class = "paginate_button next">
		    	<a href="${pageMaker.endPage+1}" style="color:grey"><c:out value=">"/></a>
		    </li>
		    </c:if>
    	</ul>
    </div>
    <form id='actionForm' action="/member/mypage" method='get'>
    	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
    	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
    </form>
</div>

<%@include file = "../includes/footer.jsp" %>

        