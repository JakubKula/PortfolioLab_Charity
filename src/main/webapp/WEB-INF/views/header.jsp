<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<meta charset="UTF-8"/>
<header class="header--main-page" id="header">
    <nav class="container container--70">
        <sec:authorize access="isAnonymous()">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj <sec:authentication property = "principal.username"/>
                <c:set var="username"><sec:authentication property = "principal.username"/></c:set>
<%--                <c:out value='${username.substring(0,username.indexOf("@"))}' escapeXml="false"/>--%>
<%--                <c:out value='${username.indexOf("@")}' escapeXml="false"/>--%>
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="/logout">Wyloguj</a></li>
                    <sec:authorize access="hasRole('ADMIN')">
                        <li><a href="/institution/all">Instytucje</a></li>
                        <li><a href="/admin/all">Admini</a></li>
                        <li><a href="/user/all">Użytkownicy</a></li>
                    </sec:authorize>
                </ul>
            </li>
        </ul>
        </sec:authorize>


        <ul>
            <li><a href="/#header" class="btn btn--without-border active">Start</a></li>
            <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/donation/form1" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>