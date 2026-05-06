db.patients.find();

db.patients.find({ _id: "P001" });

db.appointments.find({ doctor_id: "D001" });

db.billing.find({ patient_id: "P001" });