<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file = "../includes/header.jsp" %>
<%@include file = "../includes/top_menu.jsp" %>
<%@include file = "../includes/page_header.jsp" %>


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
        .write_btn a{
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
     </style>
 


<div class="table_div">

	<sec:authorize access="isAuthenticated()"> 
	    <div class="write_btn" style="float:right">
	        <div>
	            <a href="/board/register" >WRITE</a>
	        </div>
	    </div>
    </sec:authorize>
    
    <br><br><br>

    <!-- 목록 출력 영역 -->
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
    <form id='actionForm' action="/board/list" method='get'>
    	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
    	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
    </form>
</div>

<%@include file = "../includes/footer.jsp" %>

        