

CREATE TABLE IF NOT EXISTS Department(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50),
    location VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Patient(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    gender ENUM('M', 'F'), 
    date_of_birth DATE,
    phone VARCHAR(20), 
    address VARCHAR(100),
    blood_group VARCHAR(3) 
);


CREATE TABLE IF NOT EXISTS Doctor(
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    specialization VARCHAR(50),
    phone VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);


CREATE TABLE IF NOT EXISTS Appointment(
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_date DATE,
    appointment_time DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    patient_id INT, 
    doctor_id INT,  
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);


CREATE TABLE IF NOT EXISTS Medical_Record(
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    diagnosis TEXT,
    treatment TEXT,
    record_date DATE NOT NULL, 
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);


CREATE TABLE IF NOT EXISTS Billing(
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    total_amount DECIMAL(10, 2),
    bill_date DATE,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);


CREATE TABLE IF NOT EXISTS Payment(
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_method VARCHAR(50),
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    bill_id INT, 
    FOREIGN KEY (bill_id) REFERENCES Billing(bill_id) 
);




INSERT INTO Department(department_name, location)

VALUES 
        ('Cardiology', 'Building A, 3rd Floor'),
        ('Neurology', 'Building B, 2nd Floor'),
        ('Pediatrics', 'Building C, 1st Floor'),
        ('Orthopedics', 'Building A, 4th Floor'),
        ('Dermatology', 'Building B, 1st Floor'),
        ('Oncology', 'Building D, 2nd Floor'),
        ('Gastroenterology', 'Building C, 3rd Floor'),
        ('Psychiatry', 'Building E, 1st Floor'),
        ('Urology', 'Building D, 1st Floor'),
        ('Ophthalmology', 'Building B, 3rd Floor'),
        ('Endocrinology', 'Building C, 2nd Floor'),
        ('Emergency Medicine', 'Building F, Ground Floor'),
        ('Radiology', 'Building F, 1st Floor'),
        ('Anesthesiology', 'Building F, 2nd Floor'),
        ('Internal Medicine', 'Building A, 2nd Floor'),
        ('Nephrology', 'Building D, 3rd Floor'),
        ('Pulmonology', 'Building C, 4th Floor'),
        ('Hematology', 'Building D, 4th Floor'),
        ('Gynecology', 'Building B, 4th Floor'),
        ('General Surgery', 'Building A, 1st Floor');


INSERT INTO Patient (full_name, gender, date_of_birth, phone, address, blood_group)
VALUES
        ('Diribsa Melka', 'M', '2000-03-14', '9887666', 'gerji Addis Abeba', 'AB'),
        ('Tolera Bekele', 'M', '1998-05-12', '0911223344', 'Adama, Oromia', 'O+'),
        ('Lidetu Ayele', 'M', '1985-10-20', '0922334455', 'Bole, Addis Ababa', 'A+'),
        ('Fatuma Ahmed', 'F', '1992-01-15', '0933445566', 'Semera, Afar', 'B-'),
        ('Hodan Abdi', 'F', '1995-03-22', '0955667788', 'Jijiga, Somali', 'O-'),
        ('Desta Markos', 'F', '2001-11-05', '0966778899', 'Hosanna, Hadiya', 'A-'),
        ('Tamirat Tadesse', 'M', '1988-12-12', '0912345678', 'Hawassa, Sidama', 'B+'),
        ('Chaltu Gebre', 'F', '1999-08-18', '0911001122', 'Jimma, Oromia', 'O+'),
        ('Samuel Johnson', 'M', '1993-06-25', '0922998877', 'Old Airport, Addis Ababa', 'AB-'),
        ('Genet Belay', 'F', '1987-04-09', '0933887766', 'Bahir Dar, Amhara', 'A+'),
        ('Kiya Gemechu', 'F', '2002-02-14', '0944776655', 'Ambo, Oromia', 'B+'),
        ('Haile Selassie', 'M', '1991-09-21', '0955443322', 'Gondar, Amhara', 'O+'),
        ('Zenebech Tolosa', 'F', '1996-05-27', '0966332211', 'Arba Minch, SNNP', 'A-'),
        ('Ahmed Mohammed', 'M', '1989-12-01', '0977221100', 'Dire Dawa', 'B-'),
        ('Worknesh Alemu', 'F', '1994-11-11', '0911882233', 'Dessie, Amhara', 'O+'),
        ('Abdi Ismael', 'M', '2000-07-07', '0922773344', 'Gode, Somali', 'AB+'),
        ('Aster Aweke', 'F', '1986-02-28', '0933664455', 'Kazanchis, Addis Ababa', 'A+'),
        ('Fikadu Tsegaye', 'M', '1997-10-10', '0944559900', 'Shashemene, Oromia', 'B+'),
        ('Mihret Gebru', 'F', '1993-08-04', '0955112233', 'Adigrat, Tigray', 'O-'),
        ('Bekele Molla', 'M', '1984-01-01', '0966223344', 'Debre Markos, Amhara', 'A+');


INSERT INTO Doctor (full_name, specialization, phone, department_id) 

VALUES
        ('Dr. Gutema Bikila', 'Cardiologist', '0911556677', 9),
        ('Dr. Lemlem Hailu', 'Neurologist', '0922667788', 2),
        ('Dr. Tolassa Feyisa', 'Pediatrician', '0933778899', 3),
        ('Dr. Hiwot Tadesse', 'Orthopedic Surgeon', '0944889900', 6),
        ('Dr. Kedir Ahmed', 'Dermatologist', '0955990011', 5),
        ('Dr. Martha Gebru', 'Oncologist', '0966001122', 4),
        ('Dr. Solomon Tekle', 'Gastroenterologist', '0977112233', 7),
        ('Dr. Bethlehem Dessie', 'Psychiatrist', '0988223344', 8),
        ('Dr. Elias Ambo', 'Urologist', '0999334455', 1),
        ('Dr. Tigist Walelign', 'Ophthalmologist', '0912445566', 10);


INSERT INTO Appointment (appointment_date, appointment_time, status, patient_id, doctor_id) VALUES
        ('2025-11-01', '2025-11-01 09:00:00', 'Completed', 5, 2),
        ('2025-11-01', '2025-12-01 10:30:00', 'Completed', 12, 5),
        ('2025-11-02', '2025-11-02 14:00:00', 'Scheduled', 1, 8),
        ('2025-11-02', '2025-11-02 15:30:00', 'Cancelled', 18, 1),
        ('2025-11-03', '2025-11-03 08:45:00', 'Scheduled', 7, 10),
        ('2025-11-03', '2025-11-03 11:00:00', 'Scheduled', 3, 3),
        ('2025-11-04', '2025-11-04 09:30:00', 'Scheduled', 15, 7),
        ('2025-11-04', '2025-11-04 16:00:00', 'Scheduled', 9, 4),
        ('2025-11-05', '2025-11-05 10:00:00', 'Scheduled', 20, 6),
        ('2025-11-05', '2025-11-05 13:30:00', 'Cancelled', 2, 9),
        ('2025-11-06', '2025-11-06 09:00:00', 'Scheduled', 11, 2),
        ('2025-11-06', '2025-11-06 11:30:00', 'Scheduled', 6, 5);

INSERT INTO Medical_Record (diagnosis, treatment, record_date, patient_id) 
VALUES
        ('Hypertension', 'Lisinopril 10mg once daily, low salt diet', '2023-11-01', 5),
        ('Common Cold', 'Rest, fluids, and Paracetamol 500mg as needed', '2023-11-01', 12),
        ('Type 2 Diabetes', 'Metformin 500mg twice daily, glucose monitoring', '2023-11-02', 1),
        ('Migraine', 'Ibuprofen 400mg, dark room rest', '2023-11-03', 7),
        ('Acute Bronchitis', 'Amoxicillin 500mg, cough syrup', '2023-11-03', 3),
        ('Contact Dermatitis', 'Hydrocortisone cream 1%, avoid irritants', '2023-11-04', 15),
        ('Asthma Flare-up', 'Salbutamol inhaler as needed', '2023-11-04', 9),
        ('Lower Back Pain', 'Physical therapy exercises and Naproxen', '2023-11-05', 20),
        ('Gastroenteritis', 'Oral rehydration salts and bland diet', '2023-11-06', 11),
        ('Iron Deficiency Anemia', 'Ferrous Sulfate 325mg daily with Vitamin C', '2023-11-06', 6),
        ('Allergic Rhinitis', 'Cetirizine 10mg daily', '2023-11-07', 14),
        ('Urinary Tract Infection', 'Ciprofloxacin 500mg for 5 days', '2023-11-07', 4),
        ('Rheumatoid Arthritis', 'Methotrexate and follow-up in 4 weeks', '2023-11-08', 19),
        ('Peptic Ulcer', 'Omeprazole 20mg daily before breakfast', '2023-11-08', 8),
        ('Hyperlipidemia', 'Atorvastatin 20mg at bedtime', '2023-11-09', 13),
        ('Vitamin D Deficiency', 'Cholecalciferol 50000 IU weekly', '2023-11-09', 17),
        ('Generalized Anxiety', 'Counseling referral and SSRI trial', '2023-11-10', 10),
        ('Tonsillitis', 'Salt water gargle and Penicillin V', '2023-11-10', 16),
        ('Knee Osteoarthritis', 'Weight management and topical Diclofenac', '2023-11-11', 2),
        ('Insomnia', 'Sleep hygiene education and Melatonin', '2023-11-12', 18);



INSERT INTO Billing (total_amount, bill_date, patient_id) VALUES
        (1200.50, '2023-11-01', 5),
        (450.00, '2023-11-01', 12),
        (3200.00, '2023-11-02', 1),
        (850.75, '2023-11-03', 7),
        (1500.00, '2023-11-03', 3),
        (600.00, '2023-11-04', 15),
        (2100.25, '2023-11-04', 9),
        (300.00, '2023-11-05', 20),
        (550.00, '2023-11-06', 11),
        (1100.00, '2023-11-06', 6),
        (900.50, '2023-11-07', 14),
        (1350.00, '2023-11-07', 4),
        (4000.00, '2023-11-08', 19),
        (750.00, '2023-11-08', 8),
        (1800.00, '2023-11-09', 13),
        (250.00, '2023-11-09', 17),
        (2200.00, '2023-11-10', 10),
        (650.00, '2023-11-10', 16),
        (5000.00, '2023-11-11', 2),
        (1250.00, '2023-11-12', 18);


INSERT INTO Payment (payment_method, payment_date, amount_paid, bill_id) VALUES
            ('Telebirr', '2023-11-01', 1200.50, 1),
            ('CBE Birr', '2023-11-01', 450.00, 2),
            ('Awash Bank', '2023-11-02', 3200.00, 3),
            ('M-Pesa Safaricom', '2023-11-03', 850.75, 4),
            ('Coopbank (COOP)', '2023-11-03', 1500.00, 5),
            ('Telebirr', '2023-11-04', 600.00, 6),
            ('Awash Pro', '2023-11-04', 2100.25, 7),
            ('Cash', '2023-11-05', 300.00, 8),
            ('CBE Online', '2023-11-06', 550.00, 9),
            ('Telebirr', '2023-11-06', 1100.00, 10),
            ('Amoole (Dashen)', '2023-11-07', 900.50, 11),
            ('M-Pesa Safaricom', '2023-11-07', 1350.00, 12),
            ('Awash Bank', '2023-11-08', 4000.00, 13),
            ('Coopbank (COOP)', '2023-11-08', 750.00, 14),
            ('Telebirr', '2023-11-09', 1800.00, 15),
            ('CBE Birr', '2023-11-09', 250.00, 16),
            ('Awash Pro', '2023-11-10', 2200.00, 17),
            ('Telebirr', '2023-11-10', 650.00, 18),
            ('Commercial Bank of Ethiopia', '2023-11-11', 5000.00, 19),
            ('M-Pesa Safaricom', '2023-11-12', 1250.00, 20);




--- Financial report: The following SQL query aggregates total payments received for each payment method. This provides a summary of revenue generated through each payment channel and is useful for financial reporting and analysis. ---

SELECT payment_method, SUM(amount_paid) AS total_revenue
FROM Payment
GROUP BY payment_method;
