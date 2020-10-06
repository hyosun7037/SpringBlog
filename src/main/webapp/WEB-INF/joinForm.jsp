<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/nav.jsp"%>
	 <div class="container">
	<!-- submit을 하면 true가 리턴되면 제출하고, false가 리턴되면 변화X -->
	<form action="/joinProc" method="post" class="was-validated">
		<div class="form-group">
			<label for="username">Username:</label> 
			
			<div style="display:flex; justify-content:space-between; align-items:center;">
			<input style="width:90on%;" type="text" class="form-control" id="username" placeholder="Enter username" name="username">
			</div>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="password">Password:</label> 
			<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
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

		<button type="submit" class="btn btn-primary">회원가입 완료</button>
	</form>
</div>
<%@include file="include/footer.jsp"%>