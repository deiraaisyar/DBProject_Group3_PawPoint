
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(300) NOT NULL,
    role ENUM('superadmin', 'admin', 'vet', 'pet_owner') NOT NULL,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PetOwner (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(300),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE RESTRICT,
    CHECK (phone REGEXP '^[0-9+-]{8,15}$')
);

CREATE TABLE Veterinarian (
    vet_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    schedule VARCHAR(300),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE RESTRICT,
    CHECK (phone REGEXP '^[0-9+-]{8,15}$')
);

CREATE TABLE Clinic (
    clinic_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(300) NOT NULL,
    phone VARCHAR(20)
    CHECK (phone REGEXP '^[0-9+-]{8,15}$')
);

ALTER TABLE PetOwner ADD UNIQUE (user_id);
ALTER TABLE Veterinarian ADD UNIQUE (user_id);


