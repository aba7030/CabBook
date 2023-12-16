<%@ include file="common/header.jspf" %>
<%-- <%@ include file="common/navigation.jspf" %> --%>
<!Doctype html>
<html>
<title>Driver</title>
<body style="background-image: url('https://images.pexels.com/photos/845405/pexels-photo-845405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');">
<div class="container" style="text-align:center; margin-top:150px; background-color:#F3EFC6;">

	<h1>Enter</h1>
	<h1>Driver Details</h1>
	<br>
	<hr>
	<form:form method="post" modelAttribute="driver">
		<fieldset class="mb-3">
			<form:label path="username">Username-:</form:label>
			<form:input type="text" path="username" required="required"/>
			<form:errors path="username" cssClass="text-warning"/>
		</fieldset>

		<fieldset class="mb-3">
			<form:label path="assignedCarId">Assign CarId-:</form:label>
			<form:input type="text" path="assignedCarId" required="required"/>
			<form:errors path="assignedCarId" cssClass="text-warning"/>
		</fieldset>

		<input type="submit" class="btn btn-outline-info"/>

	</form:form>

</div>
</body>
</html>
<%@ include file="common/footer.jspf" %>

