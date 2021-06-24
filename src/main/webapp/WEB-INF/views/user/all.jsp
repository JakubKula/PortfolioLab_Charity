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
  <title>Users</title>

  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<%@include file="../header2.jsp"%>

  <div class="form--steps-container">

    <form action="" method="post">
      <!-- STEP 3 -->
      <div class="active" >
        <h3>Lista Użytkowników:</h3>

          <c:forEach var="user" items="${users}">
            <div class="form-group form-group--checkbox">
              <label>
                <span class="description">
                      <div class="title">Id ${user.id}</div>
                      <div class="subtitle">
                        Email ${user.email}
                      </div>
                    </span>
              </label>
            </div>

          <button type="button" class="btn prev-step"><a href="/user/edit/${user.id}"/>Edytuj</button>
          <button type="button" class="btn next-step">
            <a href="/user/confirm?id=${user.id}&email=${user.email}"/>Zablokuj</button>

          </c:forEach>
          </form>
        </div>
      </div>
  </div>
</section>

<%@include file="../footer.jsp"%>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
