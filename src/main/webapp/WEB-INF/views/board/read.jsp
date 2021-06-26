<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
<%@include file = "../includes/top_menu.jsp" %>
<%@include file = "../includes/page_header.jsp" %>
<link rel="stylesheet" href="/resources/css_table/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style>
        *{
            border-collapse: collapse;
            margin: 0%;
            padding: 0%;
            text-decoration: none;
            color: black;
            list-style: none;
        }
        .blog_title{
            margin: 8%;
            text-align: center;
            padding-bottom: 10%;
        }
        .edit_btn{
            color: black;
            font-size: 80%;
            font-style: italic;
            padding-right: 10%;
        }
         a:hover {  color: black; text-decoration: none;}

        .delete_btn{
            font-size: 80%;
            font-style: italic;
            cursor:pointer;
        }
        .title{
            padding-bottom: 3%;
        }
        .write_info{
            flex:1;
            display: flex;
        }
        .btn{
            display: flex;
        }
        .date{
            color: rgb(153, 153, 153);
            font-size: 90%;
        }
        .writer {
        	font-size: 90%;
        }
        .views {
       	 	color: rgb(153, 153, 153);
            font-size: 90%;
        }
        .post_form{
            padding-left: 15%;
            padding-right: 15%;
        }
        .under{
            display: flex;
        }
        .content{
            font-size: 120%;
            padding-bottom: 25%;
        }
        .id_info{ display: none;}
         .checks input[type="checkbox"]:checked + label:before { 
		/* 체크박스를 체크했을때 */
		 content: '\2714';
		  /* 체크표시 유니코드 사용 */ 
		  color: #99a1a7; 
		}
        
     </style>
<br/><br/><br/>
<input type="text" class="id_info" id="id" value="${board.bno}" readonly>

<div class="post_form">
    <h2 class="title"> <c:out value="${board.title}"></c:out></h2>
    <div class="under">
        <div class="write_info">
            <div class="writer">
                 <c:if test="${board.isanonymous eq 'true'}">익명</c:if>
				 <c:if test="${board.isanonymous eq 'false'}"><c:out value="${board.writer}"/></c:if>
            </div>
            <span>&nbsp;&nbsp;&nbsp;</span>
            <div class="date">
                 <fmt:formatDate pattern="yyyy. MM. dd HH:mm" value="${board.regdate}"/>
            </div>
             <span>&nbsp;&nbsp;&nbsp;</span>
            <div class="views">
                조회<span>&nbsp;</span><c:out value="${board.viewcnt}"/>
            </div>
            
        </div>
        <sec:authorize access="isAuthenticated()"> 
        	<sec:authentication property="principal" var="pinfo"/>
        	<c:if test="${pinfo.username eq board.userid}">
		       	<div class="btn">
		            <a href="/board/update?bno=${board.bno}" role="button" class="edit_btn">EDIT</a>
		            <span>&nbsp;&nbsp;&nbsp;</span>
		           	<div class="delete_btn"id="btn-delete">DELETE</div>
		        </div>
	        </c:if>
	    </sec:authorize>
    </div>
    <hr style="border:solid 0.2px grey">
    <br/>
    <div class="content" > 
        ${board.content}
    </div>
    <div class="likes" > 
	    <sec:authorize access="isAuthenticated()"> 
	    	<sec:authentication property="principal.member.userid" var="userinfo"/>
	    </sec:authorize>
	    <input type="hidden" id="loginInfo" value="${userinfo}" readonly/>
	    <input type="hidden" id="heartValue" value="${heart}" readonly/>
		<img class="heart" id="heart" type="button" height=25px/>
		<span class="views" id="views">&nbsp;<c:out value="${board.likecnt}"/>&nbsp;&nbsp;&nbsp;</span>
		<img src="/resources/images/speech_bubble2.png" height=22px/>
		<span class="views" id="replies">&nbsp;<c:out value="${board.replycnt}"/>&nbsp;&nbsp;&nbsp;</span>
    </div>
    <br/> <br/>
    <sec:authorize access="isAuthenticated()"> 
    	<div class="container">
			<form>
	        	<div class="wrap-input100 validate-input m-b-26">
	          		<span class="label-input100" id="replyer">
			            <sec:authentication property="principal.member.userName"/>
	          		</span>
	            	<input type="text" class="input100" id="reply" placeholder="댓글 내용 입력">
	        	</div>
	        </form>
	        <div class="checks" style="display:inline-block;">
				<input class="input-checkbox100" id="ckb1" type="checkbox" name="isAnonymousReply">
				<label class="label-checkbox100" for="ckb1" style="display:inline-block;">익명</label>
			</div>
           	<span type="button" class="write_btn" id="btn-reply-save" style="display:inline-block; float:right;">WRITE</span>
        
		</div>
	</sec:authorize>
      <br/> <br/>
      <c:forEach var="reply" items="${replyList}">
	      <div class="replies m-b-20" style="background-color:rgb(248, 248, 248); border-radius:10px;">
	      	<input type="hidden" id="rno" value="${reply.rno}" readonly>
	          <div class="container" style="padding:10px;">
		          <span>
			          	<c:choose>
			          		<c:when test="${reply.userid eq board.userid}">글쓴이</c:when>
			                 <c:when test="${reply.isanonymous eq 'true'}">익명</c:when>
							 <c:when test="${reply.isanonymous eq 'false'}"><c:out value="${reply.replyer}"/></c:when>
						</c:choose>
		            </span>
		            <sec:authorize access="isAuthenticated()"> 
			            <sec:authentication property="principal" var="pinfo"/>
	        			<c:if test="${pinfo.username eq reply.userid}">
	        			
			            	<div id="btn-reply-del" style="float:right; font-size: 90%; cursor:pointer; color:grey" onClick='deleteReply("${reply.rno}")'>
			             		삭제
			                	&nbsp;&nbsp;&nbsp;
			            	</div>
			            </c:if>
			           </sec:authorize>
			          
		            
		            <div class="date"  style="float:right;">
		                 <fmt:formatDate pattern="yyyy. MM. dd HH:mm" value="${reply.replyDate}"/>
		            	<span>&nbsp;&nbsp;&nbsp;</span>
		            </div>
		            
					<hr/>
		            <div>
		            	<c:out value="${reply.reply}"/> 
		            </div>
	          </div>
	      </div>
      </c:forEach>
      
      
<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>
</div>



<script src="/resources/js/like.js"></script>
<script src="/resources/js/reply.js"></script>
<%@include file = "../includes/footer.jsp" %>
