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
  <title>Form</title>

  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<%@include file="../header.jsp"%>

  <div class="slogan container container--90">
    <div class="slogan--item">
      <h1>
        Oddaj rzeczy, których już nie chcesz<br />
        <span class="uppercase">potrzebującym</span>
      </h1>

      <div class="slogan--steps">
        <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
        <ul class="slogan--steps-boxes">
          <li>
            <div><em>1</em><span>Wybierz rzeczy</span></div>
          </li>
          <li>
            <div><em>2</em><span>Spakuj je w worki</span></div>
          </li>
          <li>
            <div><em>3</em><span>Wybierz fundację</span></div>
          </li>
          <li>
            <div><em>4</em><span>Zamów kuriera</span></div>
          </li>
        </ul>
      </div>
    </div>
  </div>

<section class="form--steps" id="form">
  <div class="form--steps-container">

      <!-- STEP 5 -->
      <div class="active" >
        <h3>Podsumowanie Twojej darowizny</h3>
      <form:form method="post" modelAttribute="donation" action="/donation/form5">
        <div class="summary">
          <div class="form-section">
            <h4>Oddajesz:</h4>
            <ul>
              <li>
                <span class="icon icon-bag"></span>
                  <span class="summary--text">${donation.quantity}
                      <c:choose>
                        <c:when test="${donation.quantity==1}">
                          worek
                        </c:when>
                        <c:when test="${donation.quantity>1 && donation.quantity<5}">
                          worki
                        </c:when>
                        <c:otherwise>
                          worków
                        </c:otherwise>
                       </c:choose>
                    <c:forEach var="category" items="${donation.categories}">
                      - ${category.name}<br>
                    </c:forEach>

                  </span>
              </li>

              <li>
                <span class="icon icon-hand"></span>
                <span class="summary--text">Dla fundacji "${donation.institution.name}"</span>
              </li>
            </ul>
          </div>

          <div class="form-section form-section--columns">
            <div class="form-section--column">
              <h4>Adres odbioru:</h4>
              <ul>
                <li>${donation.street}</li>
                <li>${donation.city}</li>
                <li>${donation.zipCode}</li>
                <li>${donation.number}</li>
              </ul>
            </div>

            <div class="form-section--column">
              <h4>Termin odbioru:</h4>
              <ul>
                <li>${donation.pickUpDate}</li>
                <li>${donation.pickUpTime}</li>
                <li>${donation.pickUpComment}</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step"><a href="/donation/form4"/>Wstecz</button>
          <button type="submit" class="btn">Potwierdzam</button>
          </form:form>
        </div>
      </div>
  </div>
</section>

<%@include file="../footer.jsp"%>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
