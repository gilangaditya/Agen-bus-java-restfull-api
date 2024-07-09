use AgenBusDb;

SHOW TABLES;

CREATE TABLE users(
  id int(20) UNSIGNED NOT NULL,
  username varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  email varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  avatar varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  email_verified_at timestamp NULL DEFAULT NULL,
  password varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  no_telp int(20) NOT NULL,
  alamat VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  remember_token varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESC users;

CREATE TABLE bookings(
  id_booking bigint(20) UNSIGNED NOT NULL,
  bus_id bigint(20) UNSIGNED DEFAULT NULL,
  user_id bigint(20) UNSIGNED DEFAULT NULL,
  username varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  email varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  no_telp bigint(20) NOT NULL,
  img_bus varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  type_bus varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  no_bus varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  harga varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  keberangkatan varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  tujuan varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  id_kursi bigint(20) UNSIGNED NOT NULL,
  dept_date datetime NOT NULL,
  metode_pembayaran bigint(20) UNSIGNED NOT NULL,
  account_bank varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  bank_name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  no_rek_user varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  bukti_transfer varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  verify_booking int(11) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

desc bookings;

drop table bookings;

drop table users;

show tables;

CREATE TABLE users(
    username VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    token VARCHAR(100),
    token_expired_at BIGINT,
    PRIMARY KEY (username),
    UNIQUE (token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE users DROP COLUMN email;

CREATE TABLE contacts (
    id VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    avatars VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY fk_username_contacts (username) REFERENCES users (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE users CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE contacts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE address (
    id VARCHAR(100) NOT NULL,
    contact_id VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100) NOT NULL,
    province VARCHAR(100),
    postal_code VARCHAR(10),
    PRIMARY KEY (id),
    FOREIGN KEY fk_contact_address (contact_id) REFERENCES contacts(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DESC users;

DESC contacts;

DESC bookings;

DESC address;

CREATE TABLE routing_bus (
    id INTEGER(10),
    origin_route VARCHAR(150),
    dest_route VARCHAR(150),
    est_journey_time TIME,
    created_at DATETIME,
    updated_at DATETIME,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE busses (
    id_bus INTEGER(10) NOT NULL,
    bus_route_id VARCHAR(255) NOT NULL,
    bus_image VARCHAR(255),
    class_bus  VARCHAR(100) NOT NULL,
    no_body VARCHAR(100),
    capacity_bus INTEGER(20) NOT NULL,
    origin_bus VARCHAR(100),
    dest_bus VARCHAR(100),
    time_of_dept TIME,
    arrive_time TIME,
    price VARCHAR(100),
    created_at DATETIME,
    updated_at DATETIME,

    PRIMARY KEY (id_bus),
    FOREIGN KEY fk_bus_routes (bus_route_id) REFERENCES routing_bus(id)
)ENGINE InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

alter table contacts drop column username;

show tables;

alter TABLE address RENAME addresses;

