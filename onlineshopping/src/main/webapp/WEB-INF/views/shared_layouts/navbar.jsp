<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/home">Game World</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li id="navEmpty"      class="nav-item"></li>
				<li id="navAbout"      class="nav-item"><a class="nav-link" href="${contextRoot}/about">             About           </a></li>
				<li id="navContacts"   class="nav-item"><a class="nav-link" href="${contextRoot}/contacts">          Contacts        </a></li>
				
				<security:authorize access="isAnonymous()">
					<li id="navRegister"   class="nav-item"><a class="nav-link" href="${contextRoot}/register">           Sign Up    </a></li>
					<li id="navLogin"      class="nav-item"><a class="nav-link" href="${contextRoot}/login">              Login      </a></li>
				</security:authorize>
				
				<security:authorize access="hasAuthority('ADMIN')">
					<li id="navManegement" class="nav-item"><a class="nav-link" href="${contextRoot}/manage/products">   Manage Products </a></li>	
				</security:authorize>
				
				<security:authorize access="isAuthenticated()">		
				<div  id="navName" class="dropdown nav-item">
					<a class="nav-link" href="javascript:void(0)" 
					class="btn btn-default dropdown-toggle"
					id="dropdownMenu1"
					data-toggle="dropdown">
					${userModel.fullName}
					<span class="caret"></span>
					</a>
					
					<div class="dropdown-menu">
					
							<security:authorize access="hasAuthority('USER')">
								<a class="dropdown-item" href="${contextRoot}/cart/show"> <i
										class="material-icons btn-sm">shopping_cart</i>  ${ userModel.cart.cartLines } - ${ userModel.cart.total }
										&#8364;
								</a>
							</security:authorize>

							<a class="dropdown-item" href="${contextRoot}/perform-logout">Logout</a>
					</div>
				</div>
				</security:authorize>
			</ul>
		</div>
	</div>
	
</nav>
<br/>

<script>
	window.userRole = '${userModel.role}';
</script>

