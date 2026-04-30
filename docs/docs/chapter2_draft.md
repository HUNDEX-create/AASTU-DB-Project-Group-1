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

