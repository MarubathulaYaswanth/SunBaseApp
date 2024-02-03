<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>HomePage</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='resource/css/home.css' />">
<script type="text/javascript">
	var currentData1, currentData2, currentData3, currentData4, currentData5, currentData6, currentData7, currentData8;

	function showForm(data1, data2, data3, data4, data5, data6, data7, data8) {
		currentData1 = data1;
		currentData2 = data2;
		currentData3 = data3;
		currentData4 = data4;
		currentData5 = data5;
		currentData6 = data6;
		currentData7 = data7;
		currentData8 = data8;
		var formField1 = document.getElementById('formField1');
		formField1.value = data1;
		var formField2 = document.getElementById('formField2');
		formField2.value = data2;
		var formField3 = document.getElementById('formField3');
		formField3.value = data3;
		var formField4 = document.getElementById('formField4');
		formField4.value = data4;
		var formField5 = document.getElementById('formField5');
		formField5.value = data5;
		var formField6 = document.getElementById('formField6');
		formField6.value = data6;
		var formField7 = document.getElementById('formField7');
		formField7.value = data7;
		var formField8 = document.getElementById('formField8');
		formField8.value = data8;
		var hiddenForm = document.getElementById('hiddenForm').style.display = 'block';
	}

	function saveForm() {
		var hiddenForm = document.getElementById('hiddenForm').style.display = 'none';
	}

	function searchForm() {
        var searchField = document.getElementById('searchFieldDropdown').value;
        var searchInput = document.getElementById('searchInput').value.toLowerCase();

        var table = document.getElementById('Membersdata');
        var rows = Array.from(table.rows).slice(1);
		
        var found=false;
        
        rows.forEach(function(row) {
            var columnValue = row.cells[getColumnIndex(searchField)].innerText.toLowerCase();
            if (columnValue.includes(searchInput)) {
                row.style.display = ''; // Show the row
                found=true;
            } else {
                row.style.display = 'none'; // Hide the row
            }
        });
        var notFoundMessage = document.getElementById('notFoundMessage');
        notFoundMessage.style.color = 'red';
        notFoundMessage.style.display = found ? 'none' : 'block';
    }

	function sortTable() {
		var dropdown = document.getElementById("sortDropdown");
		var selectedOption = dropdown.options[dropdown.selectedIndex].value;
		var table = document.getElementById("Membersdata");
		var rows = Array.from(table.rows).slice(1);

		rows.sort(function(a, b) {
			var x = a.cells[getColumnIndex(selectedOption)].innerText
					.toLowerCase();
			var y = b.cells[getColumnIndex(selectedOption)].innerText
					.toLowerCase();
			return x.localeCompare(y);
		});
		while (table.rows.length > 1) {
			table.deleteRow(1);
		}
		rows.forEach(function(row) {
			table.appendChild(row);
		});
	}

	function getColumnIndex(columnName) {
		var headers = document.getElementById("Membersdata").rows[0].cells;
		for (var i = 0; i < headers.length; i++) {
			if (headers[i].innerText.toLowerCase() === columnName.toLowerCase()) {
				return i;
			}
		}
		return -1;
	}
</script>
</head>
<body>
	<header>
		<a href="memberpage">
			<h2
				style="padding-top: 20px; padding-left: 30px; color: white; text-decoration: none;">AddMember</h2>
		</a> <select id="sortDropdown" onchange="sortTable()"
			style="margin-left: 30px;">
			<option value="" disabled selected hidden>Sort by</option>
			<option value="firstName">First Name</option>
			<option value="lastName">Last Name</option>
			<option value="street">Street</option>
			<option value="address">Address</option>
			<option value="city">City</option>
			<option value="state">State</option>
			<option value="email">Email</option>
			<option value="phone">Phone</option>
		</select>
	</header>

	<form action="search" method="post">
		<select id="searchFieldDropdown">
			<option value="" disabled selected hidden>Search by</option>
			<option value="firstname">First Name</option>
			<option value="lastname">Last Name</option>
			<option value="street">Street</option>
			<option value="address">Address</option>
			<option value="city">City</option>
			<option value="state">State</option>
			<option value="email">Email</option>
			<option value="phone">Phone</option>
		</select> <input type="text" id="searchInput" name="searchInput"
			placeholder="Enter search value">
		<button type="button" onclick="searchForm();">Search</button>
	</form>

	<div>
		<center>
			<table id="Membersdata" border="1" width="100%";>
				<tr style="background-color: #f2f2f2;">
					<th>FirstName</th>
					<th>LastName</th>
					<th>Street</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="member" items="${Members}">
					<tr>
						<td>${member.firstName}</td>
						<td>${member.lastName}</td>
						<td>${member.street}</td>
						<td>${member.address}</td>
						<td>${member.city}</td>
						<td>${member.state}</td>
						<td>${member.email}</td>
						<td>${member.phone}</td>
						<td><a href="javascript:void(0);"
							onclick="showForm('${member.firstName}','${member.lastName}','${member.street}','${member.address}','${member.city}','${member.state}','${member.email}','${member.phone}');">Edit</a></td>
						<td><a href="DeleteMember/${member.email}">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</center>
	</div>
	<center><h1><div id="notFoundMessage" style="display: none;">Not Found</div></h1></center>
	<br>
	<br>

	<h2>${searchResult}</h2>

	<br>
	<br>

	<center>
		<div id="hiddenForm" style="display: none;">
			<h2 style="color: red;">Edit Member</h2>
			<form action="edit" method="post">
				<label for="formField1">FirstName:</label> <input type="text"
					id="formField1" name="firstname"><br> <label
					for="formField2">LastName:</label> <input type="text"
					id="formField2" name="lastname"><br> <label
					for="formField3">Street:</label> <input type="text" id="formField3"
					name="street"><br> <label for="formField4">Address:</label>
				<input type="text" id="formField4" name="address"><br>
				<label for="formField5">City:</label> <input type="text"
					id="formField5" name="city"><br> <label
					for="formField6">State:</label> <input type="text" id="formField6"
					name="state"><br> <label for="formField7">Email:</label>
				<input type="text" id="formField7" name="email" readonly><br>
				<label for="formField8">Phone:</label> <input type="text"
					id="formField8" name="phone"><br> <input type="submit"
					value="save">
			</form>
		</div>
	</center>

	<footer style="margin-top: 400px;"></footer>
</body>
</html>
