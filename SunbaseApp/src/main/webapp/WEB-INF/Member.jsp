<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- ... rest of your code ... -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Member Registration Form</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="resource/css/register.css" ></c:url>">
</head>
<body>
    <div>
        <header>
        </header>
    </div>
    <div>
        <form action="addmemberPage" method="post"> 

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

            <input type="submit" value="Add Member">
            <center><h2>${saveresponse}</h2></center>
            Goto Home-page<a href="home">Home</a>
        </form>
    </div>
    <div>
        <footer></footer>
    </div>
</body>
</html>
