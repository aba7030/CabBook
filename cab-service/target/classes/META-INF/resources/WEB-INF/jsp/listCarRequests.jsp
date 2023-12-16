<%@ include file="common/header.jspf"%>
<!Doctype html>
<html>
<title>ListCars</title>
<body
	style="background-image: url('https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');">
	<div class="container" style="margin-top: 100px;">
		<h1 class="container" style="text-align: center;">List</h1>
		<h1 class="container" style="text-align: center;">Of Cars</h1>
		<br>
		<hr>
		<table class="table" style="background-color:#F3EFC6;">
			<thead>
				<tr>
					<th>RequestId</th>
					<th>DriverId</th>
					<th>CarId</th>
					<th>Request Status</th>
					<th>Approve</th>
					<th>Reject</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${car_requests}" var="cr">
					<tr>
						<td>${cr.id}</td>
						<td>${cr.driverId}</td>
						<td>${cr.carId}</td>
						<td>${cr.requestStatus}</td>
						<td><a
							href="approve-request?requestId=${cr.id}&driverId=${cr.driverId}&carId=${cr.carId}"
							class="btn btn-warning">Approve</a></td>
						<td><a href="reject-request?requestId=${cr.id}"
							class="btn btn-warning">Reject</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="text-align: center; background-color:#FDF7BD;">

			<a href="http://localhost:8084/welcome" class="btn btn-outline-info">Return
				To Home Page</a>
		</div>

	</div>
</html>
<%@ include file="common/footer.jspf"%>
