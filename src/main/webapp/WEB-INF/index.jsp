<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/nav.jsp"%>
<div class="container">
 <form class="form-inline justify-content-start" action="/blog/board?cmd=search" method="get">
			<input class="form-control mr-sm-2" type="hidden" name="cmd" value="search"> 
			<input class="form-control mr-sm-2" type="hidden" name="page" value="0"> <input class="form-control mr-sm-2 input-lg" type="text" name="keyword"
				placeholder="Search">
			<button class="btn btn-primary" type="submit">검색</button>
 </form>
 <br />
 <br />
<table class="table">
    <thead>  
      <tr>    	
      	<th>글번호</th>
        <th>제목</th>
        <th>작성날짜</th> 
      </tr>
    </thead>
     <tbody id ="tbody">
     <!-- postList는 mapper에 작성한 이름 -->
    	<c:forEach var="post" items = "${postList}">  
			      <tr>    
			      	<td>${post.id}</td>
			        <td><a href="/board/detail/${post.id}">${post.title}</a></td>
			        <td>${post.createDate}</td>
			      </tr> 
	    </c:forEach>
     </tbody>
  </table>
  </div>
</body>

<%@include file="include/footer.jsp"%>