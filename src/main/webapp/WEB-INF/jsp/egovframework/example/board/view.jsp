<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>상세화면</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>" />
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
function list(){
	location.href = "<c:url value='/list.do'/>";
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
				<form class="form-horizontal" action="" method="post">
				  <div class="form-group">
				    <label class="text-right col-sm-2" for="idx">idx:</label>
				    <div class="col-sm-10">
				      idx
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="text-right col-sm-2" for="title">제목:</label>
				    <div class="col-sm-10">
				      제목
				    </div>
				  </div> 
				  <div class="form-group">
				    <label class="text-right col-sm-2" for="writer">작성자:</label>
				    <div class="col-sm-10">
				      작성자
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="text-right col-sm-2" for="indate">작성일:</label>
				    <div class="col-sm-10">
				      작성일
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="text-right col-sm-2" for="indate">contents:</label>
				    <div class="col-sm-2">
				      contents
				    </div>
				  </div>
				
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">Submit</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="panel-footer">  
				<button type="button" class="btn btn-info">수정</button>  
				<button type="button" class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-default" onclick="javascript:list();">목록</button>  
			</div>
		</div>
	</div>
</body>
</html>
