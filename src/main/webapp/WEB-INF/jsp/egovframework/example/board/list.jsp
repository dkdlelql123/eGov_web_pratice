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
<script type="text/javaScript" >
$(document).ready(function(){
	// 로그인시 msg 있을 경우
	<c:if test="${msg != null}">	
		alert("${msg}");
	</c:if>
});

// 등록 페이지 이동
function add(){
	location.href = "<c:url value='/mgmt.do'/>";
}

// 상세 페이지 이동
function view(){
	location.href = "<c:url value='/view.do'/>";
}

// 로그인 폼 체크
function check(){ 
	let userId = $("#userId").val().trim();
	let userPw = $("#userPw").val().trim();
	
	if(userId == null || userId.length < 1){
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	if(userPw == null || userPw.length < 1){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	return true;
}
//상세 페이지 이동
function logout(){
	location.href = "<c:url value='/logout.do'/>";
}

</script>
</head>
<body>
	<div class="container">
		<h1>My First Bootstrap Page</h1>
		<div class="panel panel-default">
			<div class="panel-heading">
				<c:if test="${sessionScope.userName != null && sessionScope.userId != null}">
					${sessionScope.userName}님 반갑습니다. <a href="javascript:logout();">로그아웃</a>
				</c:if>
				<c:if test="${sessionScope.userName == null && sessionScope.userId == null}">
				<form class="form-inline" action="/login.do" method="post" onclick="return check();">
					<div class="form-group">
					  <label for="userId">ID:</label>
					  <input type="text" class="form-control" id="userId" name="userId" value="test1">
					</div>
					<div class="form-group">
					  <label for="userPw">Password:</label>
					  <input type="password" class="form-control" id="userPw" name="userPw" value="test1">
					</div> 
					<button type="submit" class="btn btn-default">로그인</button>
				</form>
				</c:if>
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
		
		<div class="well well-sm">댓글</div>
		<div class="well well-lg">
			<form class="form-horizontal" action="" method="post">
				<div class="form-group">
				  <label for="writer">writer:</label>
				  <input type="writer" class="form-control" id="writer" name="writer">
				</div>
				<div class="form-group">
				  <label for="reply">내용:</label>
				  <textarea class="form-control" rows="3" id="reply" name="reply" maxlength="200"></textarea>
				</div> 
				<button type="submit" class="btn btn-default">작성</button>
			</form>
		</div>
	</div>
</body>
</html>
