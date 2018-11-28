<%@ page import="java.util.*" %>
<%@ page import="com.Calendar.Event" %>
<%@ page import="com.Calendar.EventController" %>
<%@ page import="com.DAO.EventDao" %>
<%@ page import="org.springframework.context.ConfigurableApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% String appContextFile = "WEB-INF/AppContext.xml"; // Use the settings from this xml file %>
<% ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("AppContext.xml"); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login v3</title>
	<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <link href="<c:url value="/template/css/style.css" />" rel="stylesheet" type="text/css" />
 </head>
 
    <h1>Login</h1>
    <form action="drop" method="POST">
        <input type="submit" value="Drop all data"  style="border: 3px solid #FF0000;position: fixed; bottom: 0; right: 0"><br/>
    </form>
    <c:choose>
        <c:when test="${username == null}">
            <h2><a href="register">Link to Register</a></h2>

            <c:if test="${auth != null}">
                <span style="color: darkred;font-style: italic"><strong>Incorrect username or password!</strong></span>
            </c:if>


            <form action="home" method="POST">
            Username: <input type="text" class="input100" name="username"/><br>
            Password: <input type="password"class="input100" name="password"/><br>
            <input type="submit" value="login" lass="login100-form-btn" /><br><br/>
        </c:when>
        <c:otherwise>
            <form action="userEvents" method="POST">
                <input type="submit"Value="User Page">
            </form>
            <form action="logout" method="POST">
                <input type="submit" value="Log out"><br/><br/>
            </form>
            </form>
 </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${events != null}">
            <em style="color: gray;"><strong>Showing All Events</strong></em><br/>
            <c:forEach var="event" items="${events}">
                <br/>
                Event Id: <c:out value="${event.id}"></c:out> <br/>
                Event: <c:out value="${event.eventName}"></c:out> <br/>
                Date: <c:out value="${event.eventDate}"></c:out> <br/>
                Description: <c:out value="${event.eventDescription}"></c:out> <br/>
                Creator: <c:out value="${event.eventAuthor}"></c:out> <br/>
                <c:set var="eName" scope="session" value="${event.eventName}"/>
                <c:if test="${(event.eventAuthor != sessionScope.username && sessionScope.username != null) && !fn:contains(likedEvents, event.id)}">
                <form action="userEvents/likedEvent" method="POST">
                    <input type="hidden" name="it" value="${event.id}"/>
                    <input type="submit" value="Like">
                    <br/>
                </form>
                </c:if>
            </c:forEach>
        </c:when>
    </c:choose>
    <!-- /container -->
<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
