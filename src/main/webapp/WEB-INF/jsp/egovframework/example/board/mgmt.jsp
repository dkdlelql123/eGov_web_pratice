<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>등록/수정화면</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>" />
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
function cancle(){
	location.href = "<c:url value='/list.do'/>";
}

function add(){
	let title = $("#title").val().trim();
	if(title.length < 1){
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return;
	}
	
	let contents = $("#contents").val().trim();
	if(contents.length < 1){
		alert("내용을 입력해주세요.");
		$("#contents").focus();
		return;
	}
	
	if( !confirm("작성하시겠습니까?") ){
		return;
	}
	document.boardForm.action = "<c:url value='/addMgmt.do'/>";
	document.boardForm.submit(); 
}
</script>
</head>
<body>
	<div class="container">
		<h1>My First Bootstrap Page</h1>
		<div class="panel panel-default">
			<div class="panel-heading">
				<p>안녕하세요</p>
			</div>
			<div class="panel-body">
			<!-- 게시물 번호, 제목, 내용, 조회수, 작성자, 작성일 -->
			<form class="form-horizontal" modelAttribute="boardVO" id="boardForm" name="boardForm" action="POST">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="idx">idx:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="idx" name="idx" placeholder="-" readonly>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="title">제목:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" maxlength="30">
			    </div>
			  </div> 
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="writer">작성자:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" maxlength="10" value="${boardVO.writer}" readonly>
			    </div>
			  </div>
			   <div class="form-group">
			    <label class="control-label col-sm-2" for="indate">작성일:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="indate" name="indate" placeholder="작성일" maxlength="11" value="${boardVO.indate}" readonly>
			    </div>
			  </div>
			  <div class="form-group">
				  <label class="control-label col-sm-2" for="contents">contents:</label>
				  <div class="col-sm-10">
				  	<textarea class="form-control" rows="5" id="contents" name="contents" maxlength="500"></textarea>
				  </div>
			  </div> 
			</form>
			</div>
			<div class="panel-footer"> 
				<button type="button" class="btn btn-success" onclick="add();">등록</button>
				<button type="button" class="btn btn-info">수정</button>
				<button type="button" class="btn btn-warning" onclick="javascript:cancle();">취소</button>
			</div>
		</div>
	</div>
</body>
</html>
