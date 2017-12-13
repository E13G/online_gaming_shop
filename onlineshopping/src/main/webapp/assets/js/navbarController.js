$(function() {
	//solving the active menu 
	console.log(menu);
	switch(menu){
		
		case "About Us":
			$("#navAbout").addClass('active');
			
			break;
		case "Contact Us":
			$("#navContacts").addClass('active');
			
			break;
		default:
			if(menu == "Home")break;
			$("#navHome").addClass('active');
			$("#a_"+menu).addClass('active');
			console.log("a_"+menu)
			break;
	}
	
})
