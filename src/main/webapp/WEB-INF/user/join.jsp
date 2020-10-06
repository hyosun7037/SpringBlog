<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">
	<!-- submit을 하면 true가 리턴되면 제출하고, false가 리턴되면 변화X -->
	<form action="/blog/user?cmd=joinProc" method="post" class="was-validated" onSubmit ="return validate()">
		<div class="form-group">
			<label for="username">Username:</label> 
			
			<div style="display:flex; justify-content:space-between; align-items:center;">
			<input style="width:90on%;" type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
			<button type="button" class="btn btn-warning float-right" onClick="usernameCheck('${principal.username}')">중복확인</button>
			</div>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="password">Password:</label> 
			<input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div> 
		<div class="form-group">
			<label for="email">Email:</label> 
			<input type="email" class="form-control" id="email" placeholder="Enter email"
				name="email" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<div>
			<label for="address">Address:</label> 
			</div>
			
			<div style="display:flex; justify-content:space-between; align-items:center;">
			<input type="text"
				class="form-control" id="address" placeholder="Enter address"
				name="address" style="width:93%;" required readonly>
			<button type="button" class="btn btn-info" onClick="goPopup();">검색</button>
			</div>
				
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
			
		</div>
		<button type="submit" class="btn btn-primary">회원가입 완료</button>
	</form>
</div>


<script src="/blog/js/join.js"></script>

<%@include file="../include/footer.jsp"%>