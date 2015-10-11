<jsp:include page='<%=(String) request.getAttribute("includeHeader")%>' />
	<div class="container">
	<form action="#" method="post">
	<div class="row">
	<div class="col-md-4 col-lg-4">
		<div class="form-group">
			<label for="userid">User ID </label>
			 <input type="text" class="form-control" name=userid
			 placeholder="1000xxxxxx or 6000xxxxxx">
			 	
			 <label for="emailAddress">Email Address</label>
			 <input type="text" class="form-control" name=emailAddress
			 placeholder="firstname.lastname@mavs.uta.edu" 
			 value = '<%=(String) request.getAttribute("emailAddress")%>'
			 readonly ="readonly" >
			 
			<label for="newemail">New Email Address</label>
			 <input type="text" class="form-control" name=newemail
			 placeholder="firstname.lastname@mavs.uta.edu">
			 
			 <label for="Username">New User Name</label>
			 <input type="text" class="form-control" name=username>
			 
			 <label for="password">New Password</label>
			 <input type="password" class="form-control" name=password>
			 
			 <label for="repeatPassword">Repeat Password</label>
			 <input type="password" class="form-control" name=repeatPassword>
		</div>
	</div>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button></p>	
	</form>
	</div>
<%@include file="templates/footer.jsp"%>