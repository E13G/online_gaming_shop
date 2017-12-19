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
		case "Manage Products":
			$("#navManegement").addClass('active');
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
	
	//dimissing the alert after 3 seconds
	
	var $alert = $('.alert');
	
	if($alert.length){
		
		setTimeout(function(){
			$alert.fadeOut('slow');
		},5000)
	}
	
var $adminTable = $('#adminProductsTable');
	
	// execute the below code only where we have this table
	if($adminTable.length){
		
		var jsonUrl= window.context + '/json/data/admin/products';
		
		$adminTable.DataTable({
			
			lengthMenu : [[10,25,50,-1] , [' 10  ',' 25 ', ' 50 ', ' All ']],
			pageLength : 25,
			
			ajax: {
				url : jsonUrl,
				dataSrc : ''
			},

			columns:[
				{
					data:'id'
				},
				
				{
					data:'code',
					mRender: function (data, type, row) {
                        return "<img class='adminDataTableImg' src='" + window.context + "/resources/images/" + data + ".jpg'/>"
                    }
				},
				{
					data:'name'
				},
				{
					data:'brand'
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
					data: 'price',
					mRender:function(data,type,row){
							return data + ' \u20ac';
						}
				},	
				{
					data: 'active',
					bSortable:false,
					mRender: function(data,type,row){
						var str = '';
						
						str += '<label class="switch">'
					    if(data){
					    	str+='<input type="checkbox" checked="checked" value="'+row.id+'"/>'
					    }else{
					    	str+='<input type="checkbox"  value="'+row.id+'"/>'
					    }
						str+= '<div class="slider"></div></label>'

						return str;
					}
				},
				{
					data:'id',
					bSortable:false,
					mRender:function(data,type,row){
						
						var str = '';
						str+= '<a href="'+window.context+'/manage/'+data+'/product" class="btn btn-sm rounded btn-warning">'
						str+= '<i class="material-icons">create</i> </a>'
					
						return str;
					}
				}
			],
			
			initComplete:function(){
				var api = this.api();
				api.$('.switch input[type="checkbox"]').on('change',function(){
					var checkbox = $(this);
					var checked  = checkbox.prop('checked');
					var title    = (checked)? 'Product Activation' : 'Product Deactivation'
					var dMsg     = (checked)? 'You want to activate the product ?' : 'You want to deactivate the product ?'
					var value    = checkbox.prop('value');
					
					bootbox.confirm({
						size: 'medium',
						title: title,
						closeButton: false,
						message: dMsg,
						callback: function(confirmed){
							
							if(confirmed){
								console.log(value);
								
								var activationUrl = window.context+'/manage/product/'+value+'/activation';
								
								$.post(activationUrl, function(data){
									bootbox.alert({
										size:'medium',
										title: 'Information',
										closeButton: false,
										message: data
									});
								});
							}else{
								checkbox.prop('checked',!checked);
							}
						}
					})
				});
			}
		});
	}
	
	//--------------------------------
	//validation code for category
	
	var $categoryForm = $('#categoryForm');
	
	 if ($categoryForm.length) {
	        $categoryForm.validate({
	            rules: {
	                name: {
	                    required: true,
	                    minlength: 2
	                },
	                description: {
	                    required: true
	                }
	            },
				
				messages : {
					
					name : {
						required: 'Please add the category name!',
						minlength: 'The category name should not be less than 2 characters'
					},
					
					description : {
						
						required: 'Please add a description for ths category!'
					}
				},
				
				errorElement: 'em',
				errorPlacement: function(error, element) {
					
					error.addClass('help-block')
					error.insertAfter(element)
				}
			});
	}

});
