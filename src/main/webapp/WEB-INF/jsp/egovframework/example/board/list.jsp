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


<c:set var="msg" value="${msg}" />
<%-- <c:out value="${msg}" /> --%>

<script type="text/javaScript" language="javascript" defer="defer">
$( document ).ready(function() {
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
});

// 등록 페이지 이동
function add(){
	location.href = "<c:url value='/mgmt.do'/>";
}

// 상세 페이지 이동
function view(idx){
	location.href = "<c:url value='/view.do'/>?idx=" + idx;
}

// 
function setPwd(pw){ 
	$('#userPw').val(pw)
};
 
// 로그인 폼 체크
function check(){ 
	let userId = $("#userId").val().trim();
	let userPw = $("#userPw").val().trim();
	
	if(userId == null || userId.length < 1){
		alert("아이디를 선택해주세요.");
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
				<form class="form-inline" action="/login.do" method="post" onsubmit="return check();">
					<div class="form-group">
					  <label for="userId">ID:</label>
					  <select class="form-control" id="userId" name="userId" onchange="setPwd(this.value);">
				     	<option value="">선택하세요</option>
					    <option value="test1">test1</option>
					    <option value="test2">test2</option>
					    <option value="admin">admin</option>
					 </select>
					 <!-- <input type="text" class="form-control" id="userId" name="userId" value="test1"> -->
					</div>
					<div class="form-group">
					  <label for="userPw">Password:</label>
					  <input type="password" class="form-control" id="userPw" name="userPw" autoComplete="false">
					</div> 
					<button type="submit" class="btn btn-default">로그인</button>
				</form>
				</c:if>
			</div>
			<div class="panel-body">
				<div class="row">	
				<div class="col-sm-8">
					<div class="btn btn-default disabled">총 <c:out value="${tot}"/>개</div>
				</div>
				<form class="form-inline" action="/list.do" action="POST">
					<div class="form-group"> 
					  <input type="text" id="searchKeyword" name="searchKeyword" class="form-control" placeholder="검색어를 입력해주세요.">
					</div> 
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				</div>
				<table class="table table-striped table-hover">
				    <thead>
				      <tr>
				        <th>번호</th>
				        <th>제목</th>
				        <th>조회수</th>
				        <th>작성자</th>
				        <th>작성일</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:forEach var="board" items="${list}">
				      <tr>
				        <td><c:out value="${board.idx}" /></td>
				        <td><a href="javascript:view(${board.idx});">
				        	<c:out value="${board.title}" /> ...<c:out value="${board.extra__replyCount}" />
				        </a></td> 
				        <td><c:out value="${board.count}" /></td>
				        <td><c:out value="${board.writerName}" /></td>
				        <td><c:out value="${board.indate}" /></td>
				      </tr> 
				      </c:forEach>
				    </tbody>
				  </table>
			</div>
			<div class="panel-footer"> 
				<c:if test="${sessionScope.userName != null && sessionScope.userId != null}">
				<button type="button" class="btn btn-success" onclick="javascript:add();">등록</button>
				<!-- <button type="button" class="btn btn-info">수정</button> 
				<button type="button" class="btn btn-warning">취소</button>
				<button type="button" class="btn btn-danger">삭제</button>-->
				</c:if>
			</div>
		</div>
		
		
	</div>
</body>
</html>
