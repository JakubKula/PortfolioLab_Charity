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
  <h2>Zaloguj się</h2>
  <form method="post" action="/login">
    <div class="form-group">
      <input type="email" name="username" class="form-control" id="email" placeholder="Email" required/>
    </div>
    <div class="form-group">
      <input type="password" name="password" class="form-control" id="password" placeholder="Hasło" required/>
      <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
    </div>

    <div class="form-group form-group--buttons">
      <a href="/register" class="btn btn--without-border">Załóż konto</a>
      <button class="btn" type="submit">Zaloguj się</button>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
  </form>
</section>

<%@include file="../footer.jsp"%>
</body>
</html>
