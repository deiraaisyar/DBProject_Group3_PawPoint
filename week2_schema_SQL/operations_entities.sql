CREATE TABLE Pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    gender ENUM('Male', 'Female', 'Unknown') DEFAULT 'Unknown'
);

CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT,
    vet_id INT,
    clinic_id INT,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled', 'Follow-up Needed') DEFAULT 'Scheduled'
);

CREATE TABLE TreatmentRecord (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    diagnosis TEXT,
    treatment TEXT,
    prescription TEXT,
    treatment_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);


