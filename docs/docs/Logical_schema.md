Logical Schema

The logical schema represents the transformation of the ER diagram into relational tables. Each entity is represented as a table with a primary key, and relationships are implemented using foreign keys.

The relational schema of the Hospital Management System is defined as follows:

Patient(PatientID, FullName, Gender, DateOfBirth, Phone, Address)

Doctor(DoctorID, FullName, Specialization, Phone, DepartmentID)

Department(DepartmentID, DepartmentName, Location)

Appointment(AppointmentID, PatientID, DoctorID, AppointmentDate, Status)

Medical_Record(RecordID, RecordDate, Diagnosis, Treatment, PatientID)

Prescription(PrescriptionID, Medication, Dosage, Instructions, RecordID)

Billing(Bill_ID, TotalAmount, Status, BillDate, PatientID)

Payment(PaymentID, AmountPaid, PaymentDate, Method, Bill_ID)

Emergency_Case(CaseID, SeverityLevel, ArrivalTime, TreatmentGiven, PatientID)

Queue(QueueID, QueueNumber, Status, AppointmentID)

Each table includes a primary key to uniquely identify records, and foreign keys are used to maintain relationships between tables.

