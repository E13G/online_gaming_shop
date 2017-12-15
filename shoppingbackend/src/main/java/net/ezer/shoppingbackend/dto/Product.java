package net.ezer.shoppingbackend.dto;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String code;
	
	@NotBlank(message="Please Enter Product Name!")
	private String name;
	
	@NotBlank(message="Please Enter Company Name!")
	private String brand;
	
	@JsonIgnore
	@NotBlank(message="Please Enter Product's Description!")
	private String description;
	
	@Column(name = "unit_price")
	@Digits(integer=3,fraction=2)
	@DecimalMin(value="0.99" , message="The price cannot be less than 0.99€ !")
	private double price;
	
	@Min(value=(long) 0, message="The quantity cannot be negative !")
	private int quantity;
	
	@Column(name = "is_active")
	private boolean active;
	
	@JsonIgnore
	@Column(name = "category_id")
	private int categoryId;
	
	@JsonIgnore
	@Column(name = "supplier_id")
	private int supplierId;
	
	private int purchases;
	
	private int views;
	
	@Transient
	private MultipartFile file;
	
	
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	//default constructor
	public Product() {
		this.code = "PRD" + UUID.randomUUID().toString().substring(26).toUpperCase();
	}
	
	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", code='" + code + '\'' +
				", name='" + name + '\'' +
				", description='" + description + '\'' +
				", quantity=" + quantity +
				", price=" + price +
				", active=" + active +
				", categoryId=" + categoryId +
				", purchases=" + purchases +
				", views=" + views +
				'}';
	}

	//getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getPurchases() {
		return purchases;
	}

	public void setPurchases(int purchases) {
		this.purchases = purchases;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	
	
}
