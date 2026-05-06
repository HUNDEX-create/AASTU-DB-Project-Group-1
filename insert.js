db.patients.insertOne({
  _id: "P002",
  full_name: "Sara Ali",
  gender: "Female",
  date_of_birth: "2000-01-01",
  phone: "0911111111",
  address: "Addis Ababa",
  blood_group: "A+"
});

db.doctors.insertOne({
  _id: "D002",
  full_name: "Dr. Samuel Kebede",
  specialization: "Neurology",
  phone: "0922222222",
  department_id: "DEP01"
});

db.appointments.insertOne({
  _id: "A002",
  patient_id: "P002",
  doctor_id: "D002",
  appointment_date: "2026-05-12",
  appointment_time: "2:00 PM",
  status: "Scheduled",
  queue: {
    queue_id: "Q002",
    queue_number: 2,
    priority_level: "Emergency",
    estimated_time: "10 mins"
  }
});