Normalization

Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. The Hospital Management System database is normalized up to Boyce-Codd Normal Form (BCNF).

First Normal Form (1NF)

All attributes are atomic, and repeating groups are eliminated. Each table contains only single-valued attributes.

Second Normal Form (2NF)

All tables are in 1NF and contain no partial dependencies, as each table has a single primary key.

Third Normal Form (3NF)

There are no transitive dependencies. Non-key attributes depend only on the primary key.

Boyce-Codd Normal Form (BCNF)

All functional dependencies in the database satisfy the condition that the determinant is a candidate key. Each table is structured such that only primary keys determine other attributes.

Conclusion

All relations in the Hospital Management System are fully normalized and satisfy the requirements of BCNF, ensuring minimal redundancy and high data consistency.

