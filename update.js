db.patients.updateOne(
  { _id: "P001", "medical_records.record_id": "R001" },
  {
    $push: {
      "medical_records.$.prescriptions": {
        prescription_id: "PR002",
        medicine_name: "Paracetamol",
        dosage: "1 tablet",
        duration: "5 days"
      }
    }
  }
);

db.appointments.updateOne(
  { _id: "A001" },
  { $set: { status: "Completed" } }
);