<%@ include file="common/header.jspf"%>
<!Doctype html>
<html>

<body
	style="background-image: url('https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');">
	<div class="container" style="margin-top: 100px;">
		<h1 class="container" style="text-align: center;">List</h1>
		<h1 class="container" style="text-align: center;">Of Cars</h1>
		<br>
		<hr>
		<table class="table" style="background-color: LightGray;">
			<thead>
				<tr>
					<th>Id</th>
					<th>Model</th>
					<th>Color</th>
					<th>Seating Capacity</th>
					<th>DriverId</th>
					<th>Book</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cars}" var="car">
					<tr>
						<td>${car.id}</td>
						<td>${car.model}</td>
						<td>${car.color}</td>
						<td>${car.seatingCapacity}</td>
						<td>${car.driverId}</td>
						<td><a href="book-car?carId=${car.id}&username=${username}"
							class="btn btn-warning">Book</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ include file="common/footer.jspf"%>
