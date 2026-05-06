// queries.js - Hospital Management System MongoDB Queries

// ====================== 1. CREATE ======================
db.patients.insertMany([ /* paste patients data */ ]);
db.doctors.insertMany([ /* paste doctors */ ]);

// ====================== 2. READ ======================
// Find all appointments for a doctor
db.appointments.find({ doctorId: "D001" });

// Find patient's all appointments
db.appointments.find({ patientId: "P001" }).sort({ appointmentDate: -1 });

// Get doctor details with appointments
db.appointments.aggregate([
  { $match: { doctorId: "D001" } },
  { $lookup: {
      from: "patients",
      localField: "patientId",
      foreignField: "_id",
      as: "patient"
  }},
  { $unwind: "$patient" }
]);

// ====================== 3. UPDATE ======================
db.appointments.updateOne(
  { _id: "A001" },
  { $set: { status: "Completed" } }
);

// ====================== 4. AGGREGATION ======================
// Total revenue by month
db.bills.aggregate([
  { $group: {
      _id: { $dateToString: { format: "%Y-%m", date: "$paymentDate" } },
      totalRevenue: { $sum: "$amount" }
  }},
  { $sort: { _id: -1 } }
]);

// Number of appointments per doctor
db.appointments.aggregate([
  { $group: { _id: "$doctorId", appointmentCount: { $sum: 1 } } },
  { $lookup: { from: "doctors", localField: "_id", foreignField: "_id", as: "doctor" } },
  { $unwind: "$doctor" }
]);

// Patients by age group
db.patients.aggregate([
  { $bucket: {
      groupBy: "$age",
      boundaries: [0, 18, 30, 45, 60, 100],
      default: "60+",
      output: { count: { $sum: 1 } }
  }}
]);
