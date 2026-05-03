-- HMS MySQL Analytical Queries

-- 1. Financial report: Aggregate total payments received for each payment method
SELECT payment_method, SUM(amount_paid) AS total_revenue
FROM Payment
GROUP BY payment_method;

-- 2. Retrieve all appointments for a specific date (Today)
SELECT p.full_name AS patient_name, a.appointment_time, d.full_name AS doctor_name, a.status
FROM Appointment a
JOIN Patient p ON a.patient_id = p.patient_id
JOIN Doctor d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date = CURDATE();

-- 3. Calculate average billing amount per patient
SELECT p.full_name, AVG(b.total_amount) AS avg_bill
FROM Patient p
JOIN Billing b ON p.patient_id = b.patient_id
GROUP BY p.patient_id;

-- 4. Find most popular doctors based on completed appointments
SELECT d.full_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctor d
JOIN Appointment a ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_id
ORDER BY total_appointments DESC;

-- 5. List patients with specific blood group (e.g., O+)
SELECT full_name, phone, address
FROM Patient
WHERE blood_group = 'O+';
