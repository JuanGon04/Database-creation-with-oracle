--creation of tables

CREATE TABLE place (
    id_place VARCHAR (20),
    updated_at DATE,
    created_at DATE,
    user_id VARCHAR(20),
    name_place VARCHAR(30),
    city_id VARCHAR(20),
    description_place VARCHAR(100),
    number_rooms INTEGER,
    number_bathrooms INTEGER,
    max_guest INTEGER,
    price_by_night INTEGER,
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE review (
    id_review VARCHAR (20),
    updated_at DATE,
    created_at DATE,
    user_id VARCHAR(20),
    place_id VARCHAR(20),
    text_review VARCHAR(100)
);

CREATE TABLE users_airbnb (
    id_user VARCHAR (20),
    updated_at DATE,
    created_at DATE,
    email VARCHAR(30),
    pass VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE amenity (
    id_amenity VARCHAR (20),
    updated_at DATE,
    created_at DATE,
    name_amenity VARCHAR(30)
);

CREATE TABLE place_amenity (
    amenity_id VARCHAR (20),
    place_id VARCHAR(20)
);

CREATE TABLE state_airbnb (
    id_state VARCHAR (20),
    updated_at DATE,
    created_at DATE,
    name_state VARCHAR(30)
);

CREATE TABLE city (
    id_city VARCHAR (20),
    updated_at DATE,
    created_at DATE,
    state_id VARCHAR (20), 
    name_city VARCHAR(30)
);


--PRIMARY KEY

ALTER TABLE review
ADD CONSTRAINT PK_REVIEW
PRIMARY KEY (id_review);

ALTER TABLE users_airbnb
ADD CONSTRAINT PK_USERS
PRIMARY KEY (id_user);

ALTER TABLE place
ADD CONSTRAINT PK_PLACE
PRIMARY KEY (id_place);

ALTER TABLE amenity
ADD CONSTRAINT PK_AMENITY
PRIMARY KEY (id_amenity);

ALTER TABLE state_airbnb
ADD CONSTRAINT PK_STATE
PRIMARY KEY (id_state);

ALTER TABLE city
ADD CONSTRAINT PK_CITY
PRIMARY KEY (id_city);

--ALTER

ALTER TABLE review
ADD CONSTRAINT FK_REVIEW_USER
FOREIGN KEY (user_id)
REFERENCES users_airbnb (id_user);

ALTER TABLE review
ADD CONSTRAINT FK_REVIEW_PLACE
FOREIGN KEY (place_id)
REFERENCES place (id_place);

ALTER TABLE place
ADD CONSTRAINT FK_PLACE_USER
FOREIGN KEY (user_id)
REFERENCES users_airbnb (id_user);

ALTER TABLE place
ADD CONSTRAINT FK_PLACE_CITY
FOREIGN KEY (city_id)
REFERENCES city (id_city);

ALTER TABLE city
ADD CONSTRAINT FK_CITY_STATE
FOREIGN KEY (state_id)
REFERENCES state_airbnb (id_state);

ALTER TABLE place_amenity
ADD CONSTRAINT FK_PLACEAMENITY_AMENITY
FOREIGN KEY (amenity_id)
REFERENCES amenity (id_amenity);

ALTER TABLE place_amenity
ADD CONSTRAINT FK_PLACEAMENITY_PLACE
FOREIGN KEY (place_id)
REFERENCES place (id_place);
