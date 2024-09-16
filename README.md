
---

# Hospital Management System

## Project Overview

The **Hospital Management System** is a console-based application built using the Dart programming language. The system is designed to manage essential hospital operations, including the admission of patients, management of doctors, and keeping track of medical records. It provides an interface for creating, managing, and retrieving information about patients, doctors, and their associated records.

### Key Features

- **Patient Management**: Admit patients to the hospital, store and display their personal information such as diagnosis, address, and ID.
- **Doctor Management**: Add doctors to the hospital, store their qualifications, salary, and ID, and display their details.
- **Medical Record Tracking**: An abstract class (`MedicalRecord`) allows for the creation of medical records linked to patients. It supports fetching medical solutions based on predefined health problems.
- **Inheritance and Polymorphism**: The system uses object-oriented programming concepts like inheritance and polymorphism to extend functionality through classes such as `PatientWithRecord` and `Doctor`.
- **Solution Retrieval**: The system can retrieve medical solutions based on the problem described in a patient’s medical record.

### Project Structure

- `Person`: A base class representing basic information for people (both doctors and patients).
- `Patient`: Inherits from `Person`, storing additional patient-specific data like diagnosis and address.
- `Doctor`: Inherits from `Person`, adding attributes such as qualifications and salary.
- `Hospital`: Manages a list of patients and doctors, supports admitting patients and adding doctors.
- `MedicalRecord`: An abstract class used to track a patient’s medical examination details and provide solutions to health problems.
- `PatientWithRecord`: Inherits from both `Patient` and `MedicalRecord` to link patients with their medical records.
---