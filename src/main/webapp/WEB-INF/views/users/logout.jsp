<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Login</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<%@include file="../header2.jsp"%>

<section class="login-page">
  <h2>Wyloguj się</h2>
  <form  action="<c:url value="/logout"/>" method="post">
    <h1>Zalogowany jako (<sec:authentication property = "principal.username"/>), czy chcesz sie wylogować?</h1>
    <input class="btn " type="submit" value="Wyloguj"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</section>

<%@include file="../footer.jsp"%>
</body>
</html>
