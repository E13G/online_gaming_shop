package net.ezer.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;

@Entity
public class Address implements Serializable {
	
	private static final long serialVersionUID = -4014375846116604042L;
	/*PRIVATE FIELDS*/
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "address_line_one")
	@NotBlank(message = "Indique a sua morada")
	private String addressLineOne;
	
	@Column(name = "address_line_two")
	@NotBlank(message = "Indique a sua morada alternativa")
	private String addressLineTwo;
	
	@NotBlank(message = "Indique a sua cidade")
	private String city;
	
	@NotBlank(message = "Indique o seu País")
	private String state;
	
	@NotBlank(message = "Indique o seu País")
	private String country;
	
	@Column(name = "postal_code")
	@NotBlank(message = "Indique o seu Código de Postal")
	private String postalCode;
	
	@Column(name = "is_shipping")
	private boolean shipping;
	
	@Column(name = "is_billing")
	private boolean billing;
	
	/*METHODS*/
	
	@Override
	public String toString() {
		return "Address{" +
				"id=" + id +
				", userid=" + userId +
				", addressLineOne='" + addressLineOne + '\'' +
				", city='" + city + '\'' +
				", country='" + country + '\'' +
				", postalCode='" + postalCode + '\'' +
				", shipping=" + shipping +
				", billing=" + billing +
				'}';
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddressLineOne() {
		return addressLineOne;
	}

	public void setAddressLineOne(String addressLineOne) {
		this.addressLineOne = addressLineOne;
	}
	
	

	public String getAddressLineTwo() {
		return addressLineTwo;
	}

	public void setAddressLineTwo(String addressLineTwo) {
		this.addressLineTwo = addressLineTwo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public boolean isShipping() {
		return shipping;
	}

	public void setShipping(boolean shipping) {
		this.shipping = shipping;
	}

	public boolean isBilling() {
		return billing;
	}

	public void setBilling(boolean billing) {
		this.billing = billing;
	}
	
	
}
