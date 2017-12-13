CREATE TABLE category(
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	
	CONSTRAINT pk_category_id PRIMARY KEY (id)
);

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(50),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);

CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(400),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	
);	

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

-- adding three categories
INSERT INTO category(name,description,image_url,is_active) VALUES ('Action'    , 'Description of an Action Game!'    ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Adventure' , 'Description of an Adventure Game!' ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Casual'    , 'Description of an Casual Game!'    ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Indie'     , 'Description of an Indie Game!'     ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('MMO'       , 'Description of an MMO Game!'       ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Racing'    , 'Description of an Racing Game!'    ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('RPG'       , 'Description of an RPG Game!'       ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Simulation', 'Description of an Simulation Game!','cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Sports'    , 'Description of an Sports Game!'    ,'cat_3.png',true);
INSERT INTO category(name,description,image_url,is_active) VALUES ('Strategy'  , 'Description of an Strategy Game!'  ,'cat_3.png',true);

-- adding three users 
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Joao', 'Pinto', 'ADMIN', true, 'admin', 'jp@gmail.com', '999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Ines', 'Pinto', 'SUPPLIER', true, '12345', 'ip@gmail.com', '888888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Joana', 'Pinto', 'SUPPLIER', true, '12345', 'joana@gmail.com', '7777777777');

-- adding a supplier correspondece address
INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (2, '102 Sabarmati Society, Mahatma Gandhi Road', 'Near Salt Lake, Gandhi Nagar', 'Ahmedabad', 'Gujarat', 'India', '111111', true, false );

-- adding a cart for testing 
INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (null, 0, 0);

-- adding five products
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'PLAYERUNKNOWNS BATTLEGROUNDS', 'PUBG Corporation', 
'PLAYERUNKNOWNS BATTLEGROUNDS is a last-man-standing shooter being developed with community feedback. Players must fight to locate weapons and supplies in a 
massive 8x8 km island to be the lone survivor. This is BATTLE ROYALE.', 29.99, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Rocket League®', 'Psyonix, Inc', 'Soccer meets driving once again in the long-awaited, physics-based multiplayer-focused sequel to 
Supersonic Acrobatic Rocket-Powered Battle-Cars! Choose a variety of high-flying vehicles equipped with huge rocket boosters to score amazing aerial goals and 
pull-off incredible game-changing saves!', 19.99, 2, true, 4, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'The Wild Eight', 'HypeTrain Digital', 'The Wild Eight is an unforgiving survival game set in Alaska full of mystery and danger. Explore,
 hunt and craft shoulder-to-shoulder with friends or random players online. Unless you are brave enough to survive this nightmare on your own?', 12.39, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Oxygen Not Included', 'Klei Entertainment', 'Oxygen Not Included is a space-colony simulation game. Deep inside an alien space rock 
your industrious crew will need to master science, overcome strange new lifeforms, and harness incredible space tech to survive, and possibly, thrive.', 22.99, 8, true, 8, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Sid Meier’s Civilization® VI', 'Firaxis', 'Civilization VI offers new ways to interact with your world, expand your empire across 
the map, advance your culture, and compete against history’s greatest leaders to build a civilization that will stand the test of time. Play as one of 20 
historical leaders including Roosevelt (America) and Victoria (England).', 59.99, 5, true, 10, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDJGFDYA1234', 'Grand Theft Auto V', 'Rockstar', 'GTA Online: The Doomsday Heist Now Available. The risks are colossal, the enemies all 
but unstoppable... but the rewards are mouth-watering and a massive adrenaline spike is absolutely guaranteed. Assemble your crew for the biggest Online 
adventure yet, across 3 sprawling acts.', 59.99, 5, true, 7, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDGAHUS12YGH', 'DARK SOULS™ III', 'FromSoftware, Inc.', 'Dark Souls continues to push the boundaries with the latest, ambitious chapter in
 the critically-acclaimed and genre-defining series. Prepare yourself and Embrace The Darkness!', 59.99, 5, true, 2, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZABCX', 'DiRT Rally', 'Codemasters Racing Studio', 'DiRT Rally is the most authentic and thrilling rally game ever made, road-tested
 over 80 million miles by the DiRT community. It perfectly captures that white knuckle feeling of racing on the edge as you hurtle along dangerous roads,
 knowing that one crash could irreparably harm your stage time.', 49.99, 20, true, 6, 3, 0, 0 );

