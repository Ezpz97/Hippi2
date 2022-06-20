<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="${R}common.css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="${R}common.js"></script>
  <style>
      form { margin-bottom: 5px; }
      a.btn { float: right; }
  </style>
</head>
<body>
<div class="container">
  <h1>가게 목록</h1>
  <form:form method="get" modelAttribute="pagination">
    <form:hidden path="pg" value="1" />
    <form:hidden path="sz" />
    <span>구:</span>
    <form:select path="li" class="form-control">
      <form:option value="0">전체</form:option>
      <form:options itemValue="id" itemLabel="location" items="${ locations }" />
    </form:select>    
    <button type="submit" class="btn">검색</button>
    <a href="create?${pagination.queryString}" class="btn">가게등록</a>
  </form:form>
  
  <table class="list">
    <thead>
      <tr>
        <th>ID</th>
        <th>이름</th>
        <th>시간</th>
        <th style="width:70px;">구</th>
        <th>위치</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="store" items="${ stores }">
        <tr data-url="edit?id=${store.id}&${pagination.queryString}">
          <td>${ store.id }</td>
          <td>${ store.name }</td>
          <td>${ store.time }</td>
          <td>${ store.location.location }</td>
          <td>${ store.locate }</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <my:pagination pageSize="${ pagination.sz }" recordCount="${ pagination.recordCount }" 
                 queryStringName="pg" />
</div>
</body>
</html>

