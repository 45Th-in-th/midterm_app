// pages/02-1-emplist.dart
//commit for midterm
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/component/provider.dart';
import 'package:midterm_app/component/namecard.dart';
import 'package:midterm_app/component/employee.dart'; // นำเข้ารายชื่อพนักงานจาก employee.dart

class EmployeeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกพนักงาน'),
      ),
      body: ListView.builder(
        itemCount: employees.length, // ใช้จำนวนพนักงานทั้งหมด
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Column(
            children: [
              NameCard(
                data: NameCardData(
                  empId: employee.EmpId,
                  firstName: employee.firstName,
                  familyName: employee.familyName,
                  position: employee.position,
                  department: employee.department,
                  nickName: employee.nickName,
                  imagePath: employee.imagePath,
                  imageUrl: employee.imagePath,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // เลือกพนักงานและอัปเดตใน Provider
                  Provider.of<EmployeeProvider>(context, listen: false)
                      .selectEmployee(employee);
                  Navigator.pop(
                      context); // ปิดหน้าปัจจุบันและกลับไปหน้า ProfilePage
                },
                child: Text('เลือกพนักงาน'),
              ),
              SizedBox(height: 10), // เพิ่มช่องว่างระหว่างพนักงานแต่ละคน
            ],
          );
        },
      ),
    );
  }
}
