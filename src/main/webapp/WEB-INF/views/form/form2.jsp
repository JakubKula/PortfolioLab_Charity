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
  <div class="form--steps-instructions">
    <div class="form--steps-container">
      <h3>Ważne!</h3>
      <p class="active">
        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
        wiedzieć komu najlepiej je przekazać.
      </p>
    </div>
  </div>

  <div class="form--steps-container">
    <div class="form--steps-counter">Krok <span>2</span>/4</div>
    <form:form method="post" modelAttribute="donation" action="/donation/form2">
      <!-- STEP 2 -->
      <div class="active" >
        <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

        <div class="form-group form-group--inline">
          <label >
            Liczba 60l worków:

                <form:input type="number" path="quantity" step="1" min="1" required="true" cssStyle="  border: 1px solid #3c3c3c;
                                                                                                        background: transparent;
                                                                                                        padding: 4px 14px;
                                                                                                        max-width: 200px;
                                                                                                        width: 100%;
                                                                                                        resize: none;
                                                                                                        font-size: 1.8rem;"/>
                <form:errors path="quantity"/>
          </label>
        </div>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step"><a href="/donation/form1"/>Wstecz</button>
          <button type="submit" class="btn next-step">Dalej</button>
        </div>
        </form:form>
      </div>
  </div>
</section>

<%@include file="../footer.jsp"%>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
