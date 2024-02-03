<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EditPage</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
		/* Set your desired background color */
		width:100%;
	}
	
	header {
		background-color: #3498db;
		/* Header color */
		color: #fff;
		/* Header text color */
		padding: 10px;
		text-align: center;
		font-size: 10px;
		height:40px;
		width: 100%;
	}
	
	form {
		max-width: 600px;
		margin: 20px auto;
		background-color: #fff;
		padding: 10px;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	form label {
		display: block;
		margin-bottom: 8px;
		font-weight: bold;
	}
	
	form input {
		width: 97%;
		padding: 10px;
		margin-bottom: 15px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	
	form input[type="date"] {
		width: calc(100% - 22px);
		/* Adjust the width for date input */
	}
	
	form input[type="submit"] {
		background-color: #333;
		/* Set your desired submit button background color */
		color: #fff;
		/* Set your desired submit button text color */
		padding: 10px 15px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	
	.g1 {
		width: 10%;
	}
	
	.g2 {
		width: 16%;
	}
	
	.g3 {
		width: 14.5%;
	}
	
	footer {
		background-color: #3498db;
		/* Footer color */
		color: #fff;
		/* Footer text color */
		text-align: center;
		width: 100%;
		height:30px;
		padding: 10px;
	}
	
	.response {
	    color: #fff;
	    padding: 8px 15px;
	    text-decoration: none;
	    border-radius: 5px;
	}
</style>
</head>
<body>
	<header style="font-size:20px"><b><center>EDIT MEMBER FORM</center></b></header>
	 <div style="">
        <form action="${pageContext.request.contextPath }/Edit" method="post"> 
        
            <label for="firstname">FirstName:</label>
            <input type="text" id="firstname" name="firstname" required><br>

            <label for="lastname">LastName:</label>
            <input type="text" id="lastname" name="lastname" required><br>
	        

            <label for="street">Street:</label>
            <input type="text" id="street" name="street" required><br>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required><br>
            
            
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required><br>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required><br>
            
            <label for="Email">EMAIL:</label>
            <input type="email" id="email" name="email" required><br>
            
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required><br>
            
            <input type="submit" value="Edit Member">
        </form>
    </div><br><br>
	<center><a href="${pageContext.request.contextPath}/gotoMemberPage" class="member-btn">AddMember</a></center>    
	<h1>${editresponse}</h1>
	<footer></footer>
        
</body>
</html>