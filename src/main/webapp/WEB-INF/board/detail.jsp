<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/nav.jsp"%>

<div class="container">
	<c:if test="${sessionScope.principal.id == detailDto.boardDto.userId}">
		<a href="/board/update/${detailDto.boardDto.id}" class="btn btn-warning">수정</a>
		<button class="btn btn-danger" onclick="deleteOne(${detailDto.boardDto.id})">삭제</button>
	</c:if>

	<br /> <br />
	<h6 class="m-2">
		작성자 : <i>${detailDto.boardDto.username}</i>
	</h6>
	<br />
	<h3 class="m-2">
		<b>${detailDto.boardDto.title}</b>
	</h3>
	<hr />
	<div class="form-group">
		<div class="m-2">${detailDto.boardDto.content}</div>
	</div>

	<hr />

	<!-- 댓글 박스 -->
	<div class="row bootstrap snippets">
		<div class="col-md-12">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading m-2">
						<b>Comment</b>
					</div>
					<div class="panel-body">
						<textarea id="reply__write__form" class="form-control" placeholder="write a comment..." rows="3"></textarea>
						<br>
						<button onclick="replyWrite(${detailDto.boardDto.id}, ${sessionScope.principal.id})" class="btn btn-primary pull-right">댓글쓰기</button>
						<div class="clearfix"></div>
						<hr />

						<!-- 댓글 리스트 시작-->
						<ul id="reply__list" class="media-list">

							<!-- 여기 나중에 댓글 추가시키기 -->
							<c:forEach var="replyDto" items="${detailDto.replyDtos}">
								<li id="reply-${replyDto.id}" class="media">
									<div class="media-body">
										<strong class="text-primary">${replyDto.username}</strong>
										<p>
											${replyDto.content} <br /> <br />
										</p>
									</div>
									<div class="m-3">
										<c:if test="${replyDto.userId eq sessionScope.principal.id}">
											<i onclick="replyDelete(${replyDto.id})" class="fa fa-remove" style="cursor: pointer; font-size:30px;color:red;"></i>
										</c:if>
									</div>
								</li>
							</c:forEach>

						</ul>
						<!-- 댓글 리스트 끝-->
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- 댓글 박스 끝 -->

</div>

<script src="/blog/js/detail.js"></script>
<script>
		//deleteOne
		function deleteOne(id){
			$.ajax({
			       type:"DELETE",
			       url:"/post/"+id, // post만 넣기
			       dataType: "text"// 서버로부터 응답받을 때 데이터 타입
			    }).done((result)=>{ 
			  	 if(result == 1){ // statusCode는 int값
			  		 alert("삭제성공");
			  		 location.href="/";
			  	 }else{
			  		 alert("권한없음:삭제실패");
			  	 }
			       console.log(result); // 자바스크립트 오브젝트가 되서 날라옴
			    }).fail((error)=>{ // 실패시 ajax 통신이 안된 것
			       console.log(error);   
			    });
		},

		function updateOne(id){ // 회원가입 로직 실행		
			$.ajax({
				type:"PUT",
				url:"/post/"+id, // post만 넣기
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType: "json"// 서버로부터 응답받을 때 데이터 타입
			}).done((resp)=>{ 
				alert("수정성공");
				location.href="/post/"+id;
				console.log(resp); // 자바스크립트 오브젝트가 되서 날라옴
			}).fail((error)=>{ // 실패시 ajax 통신이 안된 것
				alert("수정실패");
				console.log(error);	
			});
		
		}
			

 
 </script>
<script src="/blog/js/reply.js"></script>
<%@ include file="../include/footer.jsp"%>