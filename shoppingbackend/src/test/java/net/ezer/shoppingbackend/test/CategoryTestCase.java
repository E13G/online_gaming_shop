package net.ezer.shoppingbackend.test;


import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ezer.shoppingbackend.dao.CategoryDAO;
import net.ezer.shoppingbackend.dto.Category;

public class CategoryTestCase {
	private static AnnotationConfigApplicationContext context;
	
	private static CategoryDAO categoryDAO;
	
	private Category category;
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("net.ezer.shoppingbackend");
		context.refresh();
		
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}
	
	/*@Test
	public void testAddCategory() {
		
		category = new Category();
		category.setName("Hamburger");
		category.setDescription("American sandwich");
		category.setImageURL("CAT_1.png");
		
		assertEquals("ERROR added to Database", true, categoryDAO.add(category));
	}*/
	
	/*@Test
	public void testGetCategory() {
		category = categoryDAO.get(8);
		
		assertEquals("ERROR fetched to Database", "Hamburger", category.getName());
	}*/
	
	/*@Test
	public void testUpdateCategory() {
		category = categoryDAO.get(9);
		category.setName("Adventure");
		category.setDescription("Description of an Adventure Game");
		
		assertEquals("ERROR updated to Database", true, categoryDAO.update(category));
	}*/
	
	/*@Test
	public void testDeleteCategory() {
		
		category = categoryDAO.get(8);
		
		assertEquals("ERROR added to Database", true, categoryDAO.delete(category));
	}*/
	
	/*@Test
	public void testListCategory() {
		assertEquals("ERROR got the List",2,categoryDAO.list().size());
	}*/
	
	/*@Test
	public void TestCRUDCategory(){
		
		category = new Category();
		category.setName("Indie");
		category.setDescription("Description of an Indie Game");
		category.setImageURL("CAT_1.png");
		
		assertEquals("ERROR added to Database", true, categoryDAO.add(category));
		
		category = new Category();
		category.setName("MMO");
		category.setDescription("Description of an MMO Game");
		category.setImageURL("CAT_3.png");
		
		assertEquals("ERROR added to Database", true, categoryDAO.add(category));
		
		//fetching and updating the category
		category = categoryDAO.get(10);
		category.setName("Casual");
		category.setDescription("Description of an Casual Game");
		
		assertEquals("ERROR updated to Database", true, categoryDAO.update(category));
		
		//delete the category
		assertEquals("ERROR added to Database", true, categoryDAO.delete(category));
		
		//list
		assertEquals("ERROR got the List",4,categoryDAO.list().size());
		
	}*/
}
