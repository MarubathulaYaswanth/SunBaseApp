<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="resource/css/login.css" ></c:url>">

</head>
<body>
	
    <header><h2>User Login Form</h2></header>
    <form action="goToHome" method="post" autocomplete="nope">

        <label for="login_id">Login Id:</label>
        <input type="text" id="email" name="loginid" placeholder="login id"required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="password"required><br>

        <br>

        <input type="submit" value="Login">
        <center><h1 style="color:red">${responsemsg}</h1></center>
    </form>
    <footer></footer>
</body>
</html>
