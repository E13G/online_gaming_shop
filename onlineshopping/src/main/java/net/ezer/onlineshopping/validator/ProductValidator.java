package net.ezer.onlineshopping.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import net.ezer.shoppingbackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> unknownClass) {
		
		return Product.class.equals(unknownClass);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Product product = (Product) target;
		
		//check if the file has been selected or not
		if(product.getFile()==null || product.getFile().getOriginalFilename().equals("")) {
			
			errors.rejectValue("full", null, " Please select an image file to upload");
			return;
		}
		
		if( !product.getFile().getContentType().equals("image/jpeg")||
			!product.getFile().getContentType().equals("image/png") ||
			!product.getFile().getContentType().equals("image/gif")) {
			
			errors.rejectValue("full", null, " Please use only image file for upload!");
			return;
			
		}

	}

}
