<%@ include file="common/header.jspf"%>
<!Doctype html>
<html>
<title>ListDrivers</title>
<body
	style="background-image: url('https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');">
	<div class="container" style="margin-top: 100px;">
		<h1 class="container" style="text-align: center;">List</h1>
		<h1 class="container" style="text-align: center;">Of Drivers</h1>
		<br>
		<hr>
		<table class="table" style="background-color:#F3EFC6;">
			<thead>
				<tr>
					<th>Driver Id</th>
					<th>Username</th>
					<th>Assigned CarId</th>
					<th>Delete</th>
					<th>Used Cars</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${drivers}" var="driver">
					<tr>
						<td>${driver.id}</td>
						<td>${driver.username}</td>
						<td>${driver.assignedCarId}</td>
						<td><a href="delete-driver?id=${driver.id}"
							class="btn btn-warning">Delete</a></td>
						<td><a href="driver/used-cars?driverId=${driver.id}"
							class="btn btn-warning">Used Cars</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="text-align: center; background-color: #FDF7BD;">
			<a href="add-driver" class="btn btn-outline-info">Add Driver</a> <br>
			<br> <a href="http://localhost:8084/welcome"
				class="btn btn-outline-info">Return To Home Page</a>
		</div>
	</div>
</body>
</html>
<%@ include file="common/footer.jspf"%>
