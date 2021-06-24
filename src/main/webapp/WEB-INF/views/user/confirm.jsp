<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Confirm</title>

  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<%@include file="../header2.jsp"%>

<h3 class="color-header text-uppercase">Czy na pewno chcesz zablokować tego użytkownika?</h3>

<div class="schedules-content">
  <table class="table">
    <thead>
    <tr class="d-flex">
      <th class="col-1">ID</th>
      <th class="col-2">Email</th>

      <th class="col-1 center">AKCJE</th>
    </tr>
    </thead>
    <tbody class="text-dark-text">
    <tr class="d-flex">
      <td class="col-1">${param.id}</td>
      <td class="col-2">${param.email}</td>


      <td><a href="/user/all" class="btn btn-success ">Anuluj</a> </td>
      <td><a href="/user/block/${param.id}" class="btn btn-danger rounded-0 text-light m-1">Zablokuj</a></td>
    </tr>
    </tbody>
  </table>
</div>

<%@include file="../footer.jsp"%>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
