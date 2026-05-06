Relationship Modeling
This section describes the relationships between entities in the Hospital Management System. Each relationship is defined based on real-world hospital operations and includes its cardinality.

Core Relationships

1.	Patient – Appointment

A patient can book multiple appointments, but each appointment is associated with one patient.

Cardinality: 1:M

2.	Doctor – Appointment

A doctor can handle multiple appointments, but each appointment is assigned to one doctor.

Cardinality: 1:M

3.	Doctor – Department

Each doctor belongs to one department, while a department can have multiple doctors.

Cardinality: M:1

Medical Relationships

4.	Patient – Medical_Record

A patient can have multiple medical records, but each record belongs to one patient.

Cardinality: 1:M

5.	Medical_Record – Prescription

Each medical record can include multiple prescriptions, but each prescription is linked to one medical record.

Cardinality: 1:M

Financial Relationships

6.	Patient – Billing

A patient can generate multiple billing records, but each bill is associated with one patient.

Cardinality: 1:M

7.	Billing – Payment

A billing record may have multiple payments, but each payment is linked to one billing record.

Cardinality: 1:M

Operational Relationships

8.	Appointment – Queue

Each appointment may have one queue entry associated with it.

Cardinality: 1:0..1

9.	Patient – Emergency_Case

A patient may have multiple emergency cases over time, but each emergency case is associated with one patient.

Cardinality: 1:M

Additional Insight

The relationship between Patient and Doctor is many-to-many and is resolved through the Appointment entity.

