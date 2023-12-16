<%@ include file="common/header.jspf"%>
<!Doctype html>
<html>
<body
	style="background-image: url('https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');">
	<div class="container" style="margin-top: 100px;">
		<h1 class="container" style="text-align: center;">AVAILAIBLE</h1>
		<h1 class="container" style="text-align: center;">CARS</h1>
		<br>
		<hr>
		<table class="table" style="background-color:#F3EFC6;">
			<thead>
				<tr>
					<th>Car Id</th>
					<th>Model</th>
					<th>Color</th>
					<th>Seating Capacity</th>
					<th>Available For Booking?</th>
					<th>DriverId</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cars}" var="car">
					<tr>
						<td>${car.id}</td>
						<td>${car.model}</td>
						<td>${car.color}</td>
						<td>${car.seatingCapacity}</td>
						<td>${car.availableForBooking}</td>
						<td>${car.driverId}</td>
						<td><a href="delete-car?id=${car.id}" class="btn btn-warning">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="text-align: center; background-color:#FDF7BD;">
			<a href="add-car" class="btn btn-outline-info">Add Car</a> <br>
			<br> <a href="http://localhost:8084/welcome"
				class="btn btn-outline-info">Return To Home Page</a>
		</div>
	</div>
</body>
</html>
<%@ include file="common/footer.jspf"%>
