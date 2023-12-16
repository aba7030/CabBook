<%@ include file="common/header.jspf"%>
<%-- <%@ include file="common/navigation.jspf" %> --%>
<!Doctype html>
<html>
<body
	style="background-image: url('https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');">
	<div class="container"
		style="text-align: center; margin-top: 150px; background-color:#F3EFC6;">

		<h1>Enter</h1>
		<h1>Car Details</h1>
		<br>
		<hr>
		<form:form method="post" modelAttribute="car">

			<fieldset class="mb-3">
				<form:label path="model">Model-:</form:label>
				<form:input type="text" path="model" required="required" />
				<form:errors path="model" cssClass="text-warning" />
			</fieldset>

			<fieldset class="mb-3">
				<form:label path="color">Color-:</form:label>
				<form:input type="text" path="color" required="required" />
				<form:errors path="color" cssClass="text-warning" />
			</fieldset>

			<fieldset class="mb-4">
				<form:label path="seatingCapacity">Seating Capacity-:</form:label>
				<form:input type="text" path="seatingCapacity" required="required" />
				<form:errors path="seatingCapacity" cssClass="text-warning" />
			</fieldset>

			<input type="submit" class="btn btn-outline-info" />

		</form:form>

	</div>
</body>
</html>
<%@ include file="common/footer.jspf"%>

