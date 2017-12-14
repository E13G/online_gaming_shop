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
		case "Cart":
			$("#navCart").addClass('active');
			break;
		default:
			if(menu == "Home") break;
			$("#navHome").addClass('active');
			$("#a_"+menu).addClass('active');
			console.log("a_"+menu)
			break;
	}
	
	//code for jquery dataTable
	//create a dataset
	
	var jsonUrl = '';
	if(window.categoryId == ''){
		jsonUrl = window.context + '/json/data/all/products';
		console.log("All Category")
	}
	else{
		jsonUrl = window.context + '/json/data/category/'+ window.categoryId+'/products';
		console.log(window.context)
		console.log(jsonUrl)
		console.log("Single Category "+ window.categoryId)

	}
	
	var $table = $('#productListTable');
	
	// execute the below code only where we have this table
	if($table.length){
		$table.DataTable({
			
			lengthMenu : [[10,20,30,-1] , [' 10  ',' 20 ', ' 30 ', ' All ']],
			pageLength : 10,
			
			ajax: {
				url : jsonUrl,
				dataSrc : ''
			},

			columns:[
				
				{
					data:'code',
					mRender: function (data, type, row) {
                        return "<img class='dataTableImg' src='" + window.context + "/resources/images/" + data + ".jpg'/>"
                    }
				},
				{
					data:'name'
				},
				{
					data:'brand'
				},
				{
					data: 'price',
					mRender:function(data,type,row){
							return data + ' \u20ac';
						}
				},	
				{
					data: 'quantity',
					mRender: function(data, type, row){
						if(data<1){
							return '<span> Out of Stock </span>'
						}
						
						return data;
					}
						
				},
				{
					data:'id',
					width:'20%',
					bSortable:false,
					mRender:function(data,type,row){
						
						var str = '';
						str += '<a href="' + window.context+ '/show/product/'+data+'" class="btn btn-sm btn-primary"><i class="material-icons btn-md" width="50px ">visibility</i></a> &#160;'
						
						if(row.quantity < 1) {
							str += '<a href="javascript:void(0)" class="btn btn-sm btn-success disabled "> <i class="material-icons btn-md">remove_shopping_cart</i> </a>'
						}else{
							str += '<a href="' + window.context+ '/cart" class="btn btn-sm btn-success">   <i class="material-icons btn-md">add_shopping_cart</i> </a>'
						}
						
						
						
						return str;
					}
				}
			]
		});
	}
	
});
