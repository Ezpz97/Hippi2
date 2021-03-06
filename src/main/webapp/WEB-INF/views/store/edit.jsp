<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="${R}common.css">
  <script src="${R}common.js"></script>
  <style>
    form { width: 600px; margin: auto;
      box-shadow: 0 0 4px lightgray, 2px 2px 4px gray; overflow: auto; }
    div.title { font-size: 20pt; padding: 10px; background-color: #eee; }
    table { margin: 20px; }
    td { min-width: 100; padding: 5px; }
    td:nth-child(1) { text-align: right; }
    div.buttons { padding: 10px 20px 20px 20px; }
  </style>
</head>
<body>
<div class="container">
  <form:form method="post" modelAttribute="store">
    <div class="title">가게 ${ store.id > 0 ? "수정" : "등록" }</div>
    <table>
      <tr>
        <td>이름:</td>
        <td><form:input path="name" /></td>        
      </tr>
      <tr>
        <td>시간:</td>
        <td><form:input path="time" /></td>
      </tr>
      <tr>
        <td>구:</td>
        <td><form:select path="location.id"
                itemValue="id" itemLabel="location" items="${ locations }" /></td>
      </tr>
      <tr>
        <td>태그:</td>
        <td><form:select path="tag.id"
                itemValue="id" itemLabel="tagName" items="${ tags }" /></td>
      </tr>
      <tr>
        <td>분위기:</td>
        <td><form:select path="mood.id"
                itemValue="id" itemLabel="mood" items="${ moods }" /></td>
      </tr>
      <tr>
        <td>인원수:</td>
        <td><form:select path="party.id"
                itemValue="id" itemLabel="party" items="${ partys }" /></td>
      </tr>
      <tr>
        <td>위치:</td>
        <td><form:input path="locate" /></td>
      </tr>
    </table>
    <hr />
    <div class="buttons">
      <button type="submit" class="btn" name="cmd" value="save">저장</button>
      <c:if test="${ store.id > 0 }">
        <button type="submit" class="btn" name="cmd" value="delete" data-confirm-delete>삭제</button>
      </c:if>
      <a href="list?${ pagination.queryString}" class="btn">목록으로</a>
    </div>
  </form:form>
</div>
</body>
</html>

