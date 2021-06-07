<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>

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
            padding-left: 1%;
            color: rgb(153, 153, 153);
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
     </style>
<a href="/" style="text-decoration: none;">
    <h1 class="blog_title">HUI YEONG'S BOARD </h1>
</a>
<input type="text" class="id_info" id="id" value="${board.bno}" readonly>
<div class="post_form">
    <h2 class="title"> <c:out value="${board.title}"></c:out></h2>
    <div class="under">
        <div class="write_info">
            <div class="writer">
                 <c:out value="${board.writer}"/>
            </div>
            <div class="date">
                 <fmt:formatDate pattern="yyyy. MM. dd" value="${board.regdate}"/>
            </div>
        </div>
       <div class="btn">
                <a href="/board/update?bno=${board.bno}" role="button" class="edit_btn">EDIT</a>
                <div class="delete_btn"id="btn-delete">DELETE</div>
            </div>
    </div>
    <hr style="border:solid 0.5px black">
    <div class="content" style="white-space: pre-line;"> <!--줄바꿈 해주는거..-->
         <c:out value="${board.content}"/>
    </div>
</div>



<%@include file = "../includes/footer.jsp" %>
