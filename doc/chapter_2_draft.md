# Chapter 2: Database Design

## 2.1 Entity Identification

The first step in designing the Hospital Management System database is identifying the key entities involved in the system. Entities represent real-world objects that have independent existence and store relevant data.

The identification process is based on analyzing hospital operations such as patient management, doctor assignments, appointment scheduling, medical records, billing, and emergency handling.

### 2.1.1 Core Entities

The following core entities form the foundation of the system:

- Patient: Represents individuals receiving medical services.
- Doctor: Represents healthcare professionals providing treatment.
- Appointment: Represents scheduled interactions between patients and doctors.
- Department: Represents hospital units such as Cardiology, Emergency, etc.

  ### 2.1.2 Functional Entities

These entities support key hospital operations:

- Medical_Record: Stores diagnosis, treatment, and patient history.
- Prescription: Contains medication details prescribed to patients.
- Billing: Represents financial charges for services provided.
- Payment: Stores payment transactions related to billing.

  ### 2.1.3 Advanced Feature Entities

To enhance system functionality and make it more realistic, the following entities are included:

- Queue: Manages patient waiting order and priority levels.
- Emergency_Case: Represents urgent patient cases requiring immediate attention.

  ### 2.1.4 Justification of Entity Selection

Each entity has been selected based on its independent existence, ability to store multiple records, and importance in hospital operations. These entities ensure that the system captures all essential aspects of hospital data while supporting efficient data organization and retrieval.

## 2.2 Attribute Definition

In this section, attributes for each identified entity are defined. Attributes represent the properties of entities and are carefully selected to ensure data integrity, avoid redundancy, and support normalization up to Boyce-Codd Normal Form (BCNF).

Each entity includes a primary key (PK) to uniquely identify records and foreign keys (FK) where relationships exist between entities.

### Patient

| Attribute        | Description                         | Key |
|------------------|-------------------------------------|-----|
| patient_id       | Unique identifier for each patient  | PK  |
| full_name        | Patient's full name                 |     |
| gender           | Gender of the patient               |     |
| date_of_birth    | Date of birth                       |     |
| phone            | Contact number                      |     |
| address          | Residential address                 |     |
| blood_group      | Blood type                          |     |

### Doctor

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| doctor_id        | Unique identifier for each doctor    | PK  |
| full_name        | Doctor's full name                   |     |
| specialization   | Medical specialization               |     |
| phone            | Contact number                       |     |
| department_id    | Associated department                | FK  |

### Department

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| department_id    | Unique identifier for department     | PK  |
| department_name  | Name of department                   |     |
| location         | Department location                  |     |

### Appointment

| Attribute           | Description                         | Key |
|---------------------|-------------------------------------|-----|
| appointment_id      | Unique appointment ID               | PK  |
| patient_id          | Associated patient                  | FK  |
| doctor_id           | Assigned doctor                     | FK  |
| appointment_date    | Date of appointment                 |     |
| appointment_time    | Time of appointment                 |     |
| status              | Status of appointment               |     |

### Medical_Record

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| record_id        | Unique medical record ID             | PK  |
| patient_id       | Associated patient                   | FK  |
| diagnosis        | Diagnosed condition                  |     |
| treatment        | Treatment details                    |     |
| record_date      | Date of record                       |     |

### Prescription

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| prescription_id  | Unique prescription ID               | PK  |
| record_id        | Linked medical record                | FK  |
| medicine_name    | Name of medicine                     |     |
| dosage           | Dosage instructions                  |     |
| duration         | Duration of medication               |     |

### Billing

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| bill_id          | Unique billing ID                    | PK  |
| patient_id       | Associated patient                   | FK  |
| total_amount     | Total bill amount                    |     |
| bill_date        | Date of billing                      |     |

### Payment

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| payment_id       | Unique payment ID                    | PK  |
| bill_id          | Related billing record               | FK  |
| payment_method   | Method of payment                    |     |
| payment_date     | Date of payment                      |     |
| amount_paid      | Amount paid                          |     |

### Queue

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| queue_id         | Unique queue ID                      | PK  |
| appointment_id   | Related appointment                  | FK  |
| queue_number     | Position in queue                    |     |
| priority_level   | Priority level (normal/emergency)    |     |
| estimated_time   | Estimated waiting time               |     |

### Emergency_Case

| Attribute        | Description                          | Key |
|------------------|--------------------------------------|-----|
| emergency_id     | Unique emergency case ID             | PK  |
| patient_id       | Associated patient                   | FK  |
| severity_level   | Level of urgency                     |     |
| arrival_time     | Time of arrival                      |     |


### 2.2.1 Attribute Design Considerations

The attributes are carefully selected to ensure:
- Atomic values (1NF compliance)
- No redundant or duplicate data
- Proper use of foreign keys to maintain relationships
- Avoidance of derived attributes such as calculated totals where unnecessary

This design supports efficient querying and smooth normalization in subsequent steps.


## 2.3 Relationship Modeling

This section defines the relationships between the identified entities in the Hospital Management System. Relationships describe how entities are associated with each other and are essential for constructing the ER diagram and ensuring data integrity.

Each relationship is analyzed based on its cardinality (one-to-one, one-to-many, or many-to-many) and business logic within the hospital environment.

### Core Relationships

1. Patient – Appointment  
A patient can book multiple appointments, but each appointment is associated with one patient.  
Cardinality: 1:M

2. Doctor – Appointment  
A doctor can handle multiple appointments, but each appointment is assigned to one doctor.  
Cardinality: 1:M

3. Doctor – Department  
Each doctor belongs to one department, while a department can have multiple doctors.  
Cardinality: M:1

### Medical Relationships

4. Patient – Medical_Record  
A patient can have multiple medical records, but each record belongs to one patient.  
Cardinality: 1:M

5. Medical_Record – Prescription  
Each medical record can include multiple prescriptions, but each prescription is linked to one medical record.  
Cardinality: 1:M

### Financial Relationships

6. Patient – Billing  
A patient can generate multiple billing records, but each bill is associated with one patient.  
Cardinality: 1:M

7. Billing – Payment  
A billing record can have multiple payments (e.g., partial payments), but each payment is linked to one bill.  
Cardinality: 1:M

### Advanced Feature Relationships

8. Appointment – Queue  
Each appointment is assigned one queue record for managing waiting order, and each queue entry corresponds to one appointment.  
Cardinality: 1:1

9. Patient – Emergency_Case  
A patient may have multiple emergency cases over time, but each emergency case is associated with one patient.  
Cardinality: 1:M


### 2.3.5 Relationship Design Considerations

The relationships are defined based on real-world hospital workflows to ensure logical consistency and efficient data representation. One-to-many relationships are used where entities naturally have multiple associated records, while one-to-one relationships are applied where strict pairing is required, such as in queue management.

These relationships are designed to minimize redundancy and support normalization up to BCNF.