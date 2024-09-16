class Person {
  String? _name;
  int? _id;

  Person(this._name, this._id);

  set setName(String value) => _name = value;
  String getName() => _name!;

  set setId(int value) => _id = value;
  int getId() => _id!;
}

////////////////////////////////////////////////////////////////////////////////

class Patient extends Person {
  String? _diagnosis;
  String? _address;

  Patient(super._name, super._id, this._diagnosis, this._address);

  set setDiagnosis(String value) => _diagnosis = value;
  String getDiagnosis() => _diagnosis!;

  set setAddress(String value) => _address = value;
  String getAddress() => _address!;

  void displayAllPatient() {
    print('Patient Name: $_name');
    print('Patient Id: $_id');
    print('Patient Diagnosis: $_diagnosis');
    print('Patient Address: $_address');
  }
}

////////////////////////////////////////////////////////////////////////////////

class Doctor extends Person {
  String? _qualifications;
  double? _salary;

  Doctor(super.name, super.id, this._qualifications, this._salary);

  set setQualifications(String value) => _qualifications = value;
  String getQualifications() => _qualifications!;

  set setSalary(double value) => _salary = value;
  double getSalary() => _salary!;

  void displayAllDoctors() {
    print('Doctor Name: $_name');
    print('Doctor Id: $_id');
    print('Doctor Qualifications: $_qualifications');
    print('Doctor Salary: $_salary');
  }
}

////////////////////////////////////////////////////////////////////////////////

class Hospital extends Person {
  String? _address;
  String? _city;
  List<Patient> patients = [];
  List<Doctor> doctors = [];

  Hospital(super.name, super.id, this._address, this._city);

  set setAddress(String value) => _address = value;
  String getAddress() => _address!;

  set setCity(String value) => _city = value;
  String getCity() => _city!;

  void admitPatient(Patient newPatient) {
    patients.add(newPatient);
    print('Patient ${newPatient.getName()} admitted.');
  }

  void addDoctor(Doctor newDoctor) {
    doctors.add(newDoctor);
    print('Doctor ${newDoctor.getName()} added to the hospital.');
  }

  void showAllPatients() {
    print('\n--- Patients in Hospital ---');
    for (var patient in patients) {
      patient.displayAllPatient();
      print('---');
    }
  }

  void showAllDoctors() {
    print('\n--- Doctors in Hospital ---');
    for (var doctor in doctors) {
      doctor.displayAllDoctors();
      print('---');
    }
  }
}

////////////////////////////////////////////////////////////////////////////////

abstract class MedicalRecord {
  String? _processId;
  String? _dateOfExamination;
  String? _problem;

  set processId(String value) => _processId = value;
  String get processId => _processId!;

  set dateOfExamination(String value) => _dateOfExamination = value;
  String get dateOfExamination => _dateOfExamination!;

  set problem(String value) => _problem = value;
  String get problem => _problem!;

  void fetchSolution();
}

////////////////////////////////////////////////////////////////////////////////

class PatientWithRecord extends Patient implements MedicalRecord {
  PatientWithRecord(String name, int id, String diagnosis, String address)
      : super(name, id, diagnosis, address);

  @override
  String? _processId;

  @override
  String? _dateOfExamination;

  @override
  String? _problem;

  @override
  set processId(String value) => _processId = value;

  @override
  String get processId => _processId!;

  @override
  set dateOfExamination(String value) => _dateOfExamination = value;

  @override
  String get dateOfExamination => _dateOfExamination!;

  @override
  set problem(String value) => _problem = value;

  @override
  String get problem => _problem!;

  List<Map<String, String>> solutions = [
    {'problem': 'Headache', 'solution': 'Take rest and drink plenty of water.'},
    {'problem': 'Fever', 'solution': 'Take paracetamol and rest.'},
    {'problem': 'Cold', 'solution': 'Drink hot fluids and rest.'},
    {'problem': 'Back Pain', 'solution': 'Apply a hot compress and avoid heavy lifting.'},
  ];

  @override
  void fetchSolution() {
    print("Fetching solution for the problem: $_problem");
    bool solutionFound = false;
    for (var solutionEntry in solutions) {
      if (solutionEntry['problem'] == _problem) {
        print("Solution: ${solutionEntry['solution']}");
        solutionFound = true;
        break;
      }
    }

    if (!solutionFound) {
      print("No solution found for the problem: $_problem");
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
void main() {
  // Create Hospital
  Hospital hospital = Hospital('City Hospital', 1, '123 Main St', 'CityVille');

  // Create Patients
  Patient patient1 = Patient('Ali', 101, 'Fever', '123 Elm St');
  Patient patient2 = Patient('ِAhmed', 102, 'Headache', '456 Oak St');

  // Admit Patients
  hospital.admitPatient(patient1);
  hospital.admitPatient(patient2);

  // Create Doctors
  Doctor doctor1 = Doctor('Dr. Sameh', 201, 'Cardiology', 100000);
  Doctor doctor2 = Doctor('Dr. Amr', 202, 'Neurology', 120000);

  // Add Doctors to Hospital
  hospital.addDoctor(doctor1);
  hospital.addDoctor(doctor2);

  // Show all Patients and Doctors
  hospital.showAllPatients();
  hospital.showAllDoctors();

  // Create a PatientWithRecord
  PatientWithRecord patientWithRecord = PatientWithRecord('Khaled', 103, 'Back Pain', '789 Pine St');
  patientWithRecord.problem = 'Back Pain';

  // Fetch solution for the problem
  patientWithRecord.fetchSolution();
}

/////////////////////////////////////////////////////////////////////////////////////