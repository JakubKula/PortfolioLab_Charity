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
  <title>Institutions</title>

  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<%@include file="../header2.jsp"%>

  <div class="form--steps-container">

    <form action="" method="post">
      <!-- STEP 3 -->
      <div class="active" >
        <h3>Lista Fundacji:</h3>

          <c:forEach var="institution" items="${institutions}">
            <div class="form-group form-group--checkbox">
              <label>
                <span class="description">
                      <div class="title">Fundacja: ${institution.name}</div>
                      <div class="subtitle">
                        Cel i misja: ${institution.description}
                      </div>
                    </span>
              </label>
            </div>

          <button type="button" class="btn prev-step"><a href="/institution/edit/${institution.id}"/>Edytuj</button>
          <button type="button" class="btn next-step">
            <a href="/institution/confirm?id=${institution.id}&name=${institution.name}&description=${institution.description}"/>Usuń</button>

          </c:forEach>
          </form>
    <br><br>
    <button type="button" class="btn prev-step"><a href="/institution/add"/>Dodaj Fundację</button>
        </div>
      </div>
  </div>
</section>

<%@include file="../footer.jsp"%>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
