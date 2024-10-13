// pages/03-timeattendanc.dart

//commit for midterm
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/component/provider.dart';

class TimeAttendancePage extends StatefulWidget {
  TimeAttendancePage({Key? key}) : super(key: key);

  @override
  _TimeAttendancePageState createState() => _TimeAttendancePageState();
}

class _TimeAttendancePageState extends State<TimeAttendancePage> {
  final _formKey = GlobalKey<FormState>();
  String? _inputCode;
  String? _randomCode;
  bool _isCodeVerified = false;
  List<String> timeAttend = []; // เก็บเวลาลงเวลา

  // ฟังก์ชันสำหรับการสุ่มตัวเลข 4 หลัก
  String _generateRandomCode() {
    var rng = Random();
    return (rng.nextInt(9000) + 1000).toString(); // สุ่มเลข 4 หลัก
  }

  // ฟังก์ชันตรวจสอบรหัส
  String? _validateRandomCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณาใส่รหัส 4 หลัก';
    }
    if (value != _randomCode) {
      return 'รหัสไม่ถูกต้อง';
    }
    return null;
  }

  // ฟังก์ชันยืนยันรหัส
  void _verifyCode(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isCodeVerified = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ยืนยันรหัสสำเร็จ')),
      );
    }
  }

  // ฟังก์ชันลงเวลาเข้า
  void _checkIn(BuildContext context) {
    if (_isCodeVerified) {
      String currentTime =
          DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
      setState(() {
        timeAttend.add('Check-in: $currentTime');
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ลงเวลาเข้างาน : $currentTime')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณายืนยันรหัส 4 หลักก่อน')),
      );
    }
  }

  // ฟังก์ชันลงเวลาออก
  void _checkOut(BuildContext context) {
    String currentTime =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    setState(() {
      timeAttend.add('Check-out: $currentTime');
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ลงเวลาออกงาน : $currentTime')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // รับข้อมูลพนักงานจาก Provider
    final employee = Provider.of<EmployeeProvider>(context).selectedEmployee;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
            'ลงเวลาเข้า-ออก (${employee?.firstName ?? 'ยังไม่ได้ login'})'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ใส่รหัส 4 หลัก',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: _validateRandomCode,
                    onSaved: (newValue) => _inputCode = newValue,
                  ),
                  SizedBox(height: 20),
                  if (_randomCode != null)
                    Text(
                      'รหัสที่สร้างคือ: $_randomCode', // แสดงรหัสด้านล่าง
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _randomCode = _generateRandomCode(); // สร้างรหัสใหม่
                      });
                    },
                    child: Text('สร้างรหัสใหม่'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _verifyCode(context), // ปุ่มยืนยันรหัส
                    child: Text('ยืนยันรหัส'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkIn(context),
              child: Text('ลงเวลาเข้า'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkOut(context),
              child: Text('ลงเวลาออก'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: timeAttend.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(timeAttend[index]),
                  );
                },
              ),
            ),
          ],
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
