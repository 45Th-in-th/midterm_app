// pages/02-profilepage.dart
//commit for midterm
import 'package:flutter/material.dart';
import 'package:midterm_app/component/employee.dart';
import 'package:midterm_app/pages/02-1-emplist.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/component/provider.dart';
import 'package:midterm_app/component/namecard.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ใช้ DateFormat ในการจัดรูปแบบวันที่และเวลา
    String formattedDateTime =
        DateFormat('dd-MM-yyyy - HH:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, '/6');
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<EmployeeProvider>(
          // จากโจทย์ข้อ 3 (d)
          builder: (context, employeeProvider, child) {
            final employee = employeeProvider.selectedEmployee;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start, // จัดให้อยู่ด้านบน
              crossAxisAlignment:
                  CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลางในแนวนอน
              children: [
                employee != null
                    ? NameCard(
                        data: NameCardData(
                          empId: employee.EmpId,
                          firstName: employee.firstName,
                          familyName: employee.familyName,
                          position: employee.position,
                          department: employee.department,
                          nickName: employee.nickName,
                          imagePath: employee.imagePath,
                          imageUrl:
                              employee.imagePath, // ใช้ภาพจากข้อมูลพนักงาน
                        ),
                      )
                    : Text('ไม่พบข้อมูลพนักงาน'),
                SizedBox(height: 40), // เพิ่มช่องว่างระหว่าง NameCard และปุ่ม
                ElevatedButton(
                  onPressed: () {
                    // ไปยังหน้าที่แสดง NameCard ของพนักงานทั้งหมด
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeSelectionPage(),
                      ),
                    );
                  },
                  child: Text('เลือกพนักงาน'),
                ),
                SizedBox(height: 20), // เพิ่มช่องว่างระหว่างปุ่ม
                ElevatedButton(
                  onPressed: () {
                    // ตรวจสอบว่ามีข้อมูลพนักงานหรือไม่ก่อนนำไปยังหน้า TimeAttendancePage
                    if (employee != null) {
                      Navigator.pushNamed(context, '/3');
                    }
                  },
                  child: Text('ลงเวลาเข้างาน/ออกงาน'),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(192, 41, 56, 85),
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.summarize),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/5');
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              iconSize: 45,
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/1');
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/0');
              },
            ),
          ],
        ),
      ),
    );
  }
}
