package net.ezer.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ezer.shoppingbackend.dao.ProductDAO;
import net.ezer.shoppingbackend.dto.Product;

public class ProductTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static ProductDAO productDAO;
	
	private Product product;
	
	@BeforeClass
	public static void init() {
		context =  new AnnotationConfigApplicationContext();
		context.scan("net.ezer.shoppingbackend");
		context.refresh();
		
		productDAO = (ProductDAO) context.getBean("productDAO");
		
		
	}
	
	@Test
	public void TestCRUDProduct(){
		
		product = new Product();
		product.setName("ARK");
		product.setBrand("Studio Wildcard");
		product.setDescription("Stranded on the shores of a mysterious island, you must "
				+ "learn to survive. Use your cunning to kill or tame the primeval creatures"
				+ " roaming the land, and encounter other players to survive, dominate... and"
				+ " escape!");
		product.setPrice(59.99);
		product.setActive(true);
		product.setCategoryId(3);
		product.setSupplierId(3);
		
		assertEquals("ERROR added to Database", true, productDAO.add(product));
	
		
		//fetching and updating the category
		product = productDAO.get(9);
		product.setName("ARK: Survival Evolved");

		
		assertEquals("ERROR updated to Database", true, productDAO.update(product));
		
		//delete the category
		assertEquals("ERROR added to Database", true, productDAO.delete(product));
		
		//list
		
		assertEquals("ERROR got the List",11,productDAO.listActiveProducts().size());
		
		assertEquals("ERROR got the List",1,productDAO.listActiveProductsByCategory(1).size());
		
		assertEquals("ERROR got the List","PLAYERUNKNOWNS BATTLEGROUNDS",productDAO.listActiveProductsByCategory(1).get(0).getName());
		
	}

}
