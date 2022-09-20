<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인화면</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>" />
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
function add(){
	location.href = "<c:url value='/mgmt.do'/>";
}
function view(){
	location.href = "<c:url value='/view.do'/>";
}
</script>
</head>
<body>
	<div class="container">
		<h1>My First Bootstrap Page</h1>
		<div class="panel panel-default">
			<div class="panel-heading">
				<form class="form-inline" action="/login.do">
					<div class="form-group">
					  <label for="email">ID:</label>
					  <input type="text" class="form-control" id="ID">
					</div>
					<div class="form-group">
					  <label for="pwd">Password:</label>
					  <input type="password" class="form-control" id="pwd">
					</div> 
					<button type="submit" class="btn btn-default">로그인</button>
				</form>
			</div>
			<div class="panel-body">
				<form class="form-inline" action="/list.do">
					<div class="form-group">
					  <label for="email">검색</label>
					  <input type="text" class="form-control" id="검색어를 입력해주세요.">
					</div> 
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<table class="table table-striped table-hover">
				    <thead>
				      <tr>
				        <th>번호</th>
				        <th>제목</th>
				        <th>내용</th>
				        <th>조회수</th>
				        <th>작성자</th>
				        <th>작성일</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>John</td>
				        <td><a href="javascript:view();">Doe</a></td>
				        <td>john@example.com</td>
				        <td>John</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				      </tr> 
				    </tbody>
				  </table>
			</div>
			<div class="panel-footer"> 
				<button type="button" class="btn btn-success" onclick="javascript:add();">등록</button>
				<!-- <button type="button" class="btn btn-info">수정</button> 
				<button type="button" class="btn btn-warning">취소</button>
				<button type="button" class="btn btn-danger">삭제</button>-->
			</div>
		</div>
	</div>
</body>
</html>
