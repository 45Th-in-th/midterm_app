// component/employee.dart
//Midterm for weekebd
class Employee {
  final String EmpId;
  final String firstName;
  final String familyName;
  final String position;
  final String department;
  final String nickName;
  final String password;
  final String imagePath;

  Employee({
    required this.EmpId,
    required this.firstName,
    required this.familyName,
    required this.position,
    required this.department,
    required this.nickName,
    required this.password,
    required this.imagePath,
  });
}

List<Employee> employees = [
  Employee(
    EmpId: '0001',
    firstName: 'Nirut',
    familyName: 'Thongsook',
    position: 'Manager',
    department: 'IT',
    nickName: '9rut',
    password: '1234',
    imagePath: 'assets/images/nirut.png',
  ),
  Employee(
    EmpId: '0002',
    firstName: 'Taechin',
    familyName: 'Tae',
    position: 'CEO',
    department: 'Management',
    nickName: 'tae',
    password: '1234',
    imagePath: 'assets/images/taechin.png',
  ),
  Employee(
    EmpId: '0003',
    firstName: 'Yhom',
    familyName: 'Phu',
    position: 'Vice President',
    department: 'Management',
    nickName: 'Yhom',
    password: '1234',
    imagePath: 'assets/images/yhom.png',
  ),
];
