// component/provider.dart
// Midterm for weekebd
import 'package:flutter/material.dart';
import 'package:midterm_app/component/employee.dart';

class EmployeeProvider with ChangeNotifier {
  Employee? _selectedEmployee;

  Employee? get selectedEmployee => _selectedEmployee;

  void selectEmployee(Employee employee) {
    _selectedEmployee = employee;
    notifyListeners();
  }
}
